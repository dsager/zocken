module NoAuthTest
  def not_authenticated(_, action)
    not_authenticated_get_html(action)
    not_authenticated_get_json(action)
  end

  def not_authenticated_get_html(action)
    sign_out(:player)
    get action, format: :html
    assert_response :redirect
  end

  def not_authenticated_get_json(action)
    sign_out(:player)
    get action, format: :json
    assert_response :unauthorized
  end
end
