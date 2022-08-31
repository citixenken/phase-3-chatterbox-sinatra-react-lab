class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  #GET
  get '/messages' do
    messages = Message.all.order(:created_at)
    messages.to_json
  end

  #POST
  post '/messages' do
    message = Message.create(
      username: params[:username],
      body: params[:body]
    )
    message.to_json
  end

  #PATCH
  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  #DELETE
  delete '/messages/:id' do 
    message = Message.find(params[:id])

    message.destroy

    message.to_json
  end
end
