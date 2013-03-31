class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if cookies[:user_id]
      user_id = cookies.signed[:user_id]
      User.find_by_id(user_id)
    end
  end
  helper_method :current_user

  def sign_in(user)
    cookies.signed[:user_id] = user.id
  end

  def authenticate
    if !signed_in?
      redirect_to new_session_path
    # If user goes to /decks page and they are not signed it
    # goes to the sign in/new_session page
    end
  end

  def signed_in?
    current_user
    # Returning current_user. Either nil or some instance of a user
    # If nil, then not signed in and returned false
  end
  helper_method :signed_in?
  # Declares this a helper method
end
