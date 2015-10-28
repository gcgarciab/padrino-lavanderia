Lavanderia::App.controllers :auth do
  layout :session

  get :signin do
    render :sign_in
  end

  get :register do
    render :register
  end

end
