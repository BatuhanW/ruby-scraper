require 'test_helper'

module V1
  class IndexesControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get v1_indexes_url
      assert_response :ok
    end

    test 'should post create' do
      post v1_indexes_url(url: 'https://www.google.com')
      assert_response :created
    end

    test 'should not create without params' do
      post v1_indexes_url
      assert_response :unprocessable_entity
    end
  end
end
