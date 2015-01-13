module Ver1
  class People < Grape::API
    resource :people do

      # GET /api/v1/people
      desc 'Return all people.'
      get do
        Person.all
      end

      # GET /api/v1/people/{:id}
      desc 'Return a person.'
      params do
        requires :id, type: Integer, desc: 'Person id.'
      end
      get ':id' do
        Person.find(params[:id])
      end
    end
  end
end
