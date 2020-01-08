class ApiClient

  def is_success(response_code)
    [200, 201, 202].include?(response_code)
  end
end
