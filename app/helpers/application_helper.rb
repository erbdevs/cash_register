module ApplicationHelper
  def current_basket
    session_basket = Basket.find_by_id(session[:basket_id]) 
    return session_basket if session_basket

    Basket.new
  end
end
