module ApplicationHelper
    def title_format title
       if title == "OwnerUser"
           return "Owner"
        else
           return "Shoveler" 
        end
    end
    include SessionsHelper
end
