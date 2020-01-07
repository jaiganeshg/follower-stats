class ApiClient

  def is_success(response_code)
    [200, 201, 202].contains(response_code)
  end
end
