module API
  module Ver1
    class Products < Grape::API
      resource :products do

        # GET /api/v1/products
        desc 'Return all products.'
        get do
          Product.all
        end

        # GET /api/v1/products/{:id}
        desc 'Return a product.'
        params do
          requires :id, type: Integer, desc: 'Product id.'
        end
        get ':id' do
          Product.find(params[:id])
        end
      end
    end
  end
end