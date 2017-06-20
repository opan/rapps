PadApp::App.controllers :registration do
  
  get :new, map: '/sign_up' do
    render 'registration/new', layout: false
  end

  post :create, map: '/sign_up', params: [
    :email,
    :username,
    :password,
    :password_confirmation
  ] do

  end

end
