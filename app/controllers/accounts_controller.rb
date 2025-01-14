class AccountsController < ApplicationController
  def create
    @client = set_client

    if @client.nil?
      return nil
    else
      if @client.account
        return render json: { error: "Client already has an account" }, status: :unprocessable_entity
      end
    end
    
    @account = @client.build_account(account_params)
    @account.user = @user

    if @account.save
      render json: @account, status: :created
    else
      render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def account_types
    render json: AccountType.all
  end

  private

  def account_params
    params.require(:account).permit(:balance, :account_type_id)
  end

  def client_params
    params.require(:client).permit(:phone_number, :first_name, :last_name, :date_of_birth)
  end

  def set_client
    @client = Client.find_by(phone_number: client_params[:phone_number])
    
    if @client.nil?
      @client = Client.create(client_params)
      @client.user = @user

      unless @client.save
        render json: { "Client": {errors: @client.errors.full_messages }}, status: :unprocessable_entity
        return nil
      end
    end
    @client
  end
end