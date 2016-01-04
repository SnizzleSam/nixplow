class ShovelJobsController < ApplicationController
    before_action :logged_in_user
    def new
        if current_user.type = "ShovelUser"
            @owner_user_shovel_job = ShovelJob.new
        else
            flash.now[:danger] = "You are currently signed in as a home owner and not a shoveler"
            redirect_to root_path
        end
    end
    def create
        @owner_user_shovel_job = current_user.shovel_jobs.new
        @owner_user_shovel_job.owner_user_id, @owner_user_shovel_job.shovel_user_id = params[:owner_user_id], current_user.id
        if @owner_user_shovel_job.save
            flash.now[:success] = "You will plow #{@owner_user_shovel_job.owner_user.username} on #{@owner_user_shovel_job.start_date}"
            redirect_to @owner_user_shovel_job.owner_user
        else
           render 'new' 
        end
    end

    def edit
        @shovel_job = ShovelJob.find(params[:id])
    end
    
    def update
        @shovel_job = ShovelJob.find(params[:id])
        if @shovel_job.update_attributes(update_params)
            flash.now[:success] = "You confirmed that the shoveler shoveled your driveway!"
            redirect_to @shovel_job 
        else
           render 'edit'
        end
    end
    private
    def shovel_params
       params.require(:shovel_job).permit(:start_date) 
    end
    def update_params
      params.require(:shovel_job).permit(:confirmation)
    end

end
