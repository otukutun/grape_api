class API < Grape::API
  # http://localhost:3000/api/
  prefix 'api'
  format :json

  mount Ver1::Root
  #mount Ver2::Root
end
