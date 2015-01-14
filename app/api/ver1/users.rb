module Ver1
  class Users < Grape::API
    include Sorcery
    resource :users do

      # GET /api/v1/users
      desc 'Return all users.'
      get do
        User.all
      end

      # GET /api/v1/users/{:id}
      desc 'Return a user.'
      params do
        requires :id, type: Integer, desc: 'User id.'
      end
      get ':id' do
        User.find(params[:id])
      end

      # POST /api/v1/users
      desc 'Create user'
      params do
        requires :email, :password, :password_confirmation
      end

      post do
        User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      end

      desc 'Authenticate user'
      params do
        requires :email, :password
      end

      post :login do
        if @user = login(params[:email], params[:password])
          render json: '{ message: success }'
        else
          render json: '{ message: failure }'
        end
        #redirect_back_or_to(:users, notice: 'Login successful')
      end
    end
  end
end
