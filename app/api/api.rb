class API < Grape::API
  # http://localhost:3000/api/
  prefix 'api'
  format :json

  mount API::Ver1::Root
  #mount API::Ver2::Root
end
