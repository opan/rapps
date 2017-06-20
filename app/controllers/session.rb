PadApp::App.controllers :session do
  
  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  get :new, map: '/sign_in' do
    render 'session/new', layout: false
  end

  post :create, map: '/sign_in', params: [:email, :password] do
    user = User.authenticate(params[:email], params[:password])
    debugger
  end

  delete :destroy, map: '/sign_out' do

  end


end
