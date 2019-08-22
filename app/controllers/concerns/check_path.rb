module CheckPath
  extend ActiveSupport::Concern

  def before_path(method, ctrl, act)
    path = take_path(method)
    if not path[:controller] == ctrl && path[:action] == act
      redirect_to users_index_path
    end
  end

  private
  def take_path(method)
    before_uri = request.referer.force_encoding("utf-8")
    path = Rails.application.routes.recognize_path(before_uri, method: method)
  end
end