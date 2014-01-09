require 'person_add'

class DataController < ActionController::Base
    
    def show
      render(:index)
    end
    
    def addPerson
      flash[:notice]=""
      user=params[:person][:site]
      if user === "" then
        flash[:notice]="User Field is Empty"
        render(:index)
        return 
      end
      api=params[:person][:api]
      if api === "" then
        flash[:notice]="Api token is Empty"
        render(:index)
        return 
      end
      @p=PersonAdd::Person.add(user,api,params[:person][:name],params[:person][:last],
            params[:person][:email],params[:person][:company],
            params[:person][:job],params[:person][:phone],params[:person][:website])
      session[:message]=@p.to_s
      render(:done)
    end
    
    def back
      flash[:notice]=""
      session[:message]=""
      render(:index)
    end
end
