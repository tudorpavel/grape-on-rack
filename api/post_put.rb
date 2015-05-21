module Acme
  class PostPut < Grape::API
    class << self
      attr_accessor :rang
    end
    format :json
    desc 'Returns pong.'
    get :ring do
      { rang: PostPut.rang }
    end
    post :ring do
      result = (PostPut.rang += 1)
      { rang: result }
    end
    params do
      requires :count, type: Integer, desc: 'The number of additional rings.'
    end
    put :ring do
      result = (PostPut.rang += params[:count].to_i)
      { rang: result }
    end
  end
end

Acme::PostPut.rang = 0
