PadApp::App.controllers :session do
  
  get :new, map: '/sign_in' do
    render 'session/new'
  end

  post :create, map: '/sign_in', params: [:email, :password] do
    user = User.authenticate(params[:email], params[:password])
    debugger
    if user
      session[:current_user] = user.id
    else
      flash[:error] = "Email or password is incorrect."
      render :new
    end
  end

  delete :destroy, map: '/sign_out' do

  end

end
