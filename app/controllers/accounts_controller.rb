class AccountsController < ApplicationController
  def index
   redirect_to action: 'new' 
  end
  def new
    @account = Account.new
  end
  def create
    @account = Account.new(account_params)
    if @account.save
     redirect_to @account 
    else  
      flash.now[:danger] = 'Registration failed, some inforamtion is missing!'  
      render 'new'
    end  
  end
  def show
    @account = Account.new
  end
    
  def account_params
   params.require(:account).permit(:email,:password, :password_confirmation,:first_name,:last_name,:introduction,:isstudent)
  end
  
end
