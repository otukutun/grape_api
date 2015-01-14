module Ver1
  class Users < Grape::API
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

      desc 'Create user'
      params do
        requires :email, :password, :password_confirmation
      end

      post do
        User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      end
    end
  end
end
