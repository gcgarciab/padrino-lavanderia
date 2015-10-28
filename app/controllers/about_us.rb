Lavanderia::App.controllers :about_us do
  layout :about_us

  get :terms do
    render :terms
  end

  get :prices do
    render :prices
  end

end
