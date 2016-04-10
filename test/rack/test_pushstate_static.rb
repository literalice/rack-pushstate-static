require 'helper'

class TestRackPushstateStatic < Test::Unit::TestCase

  sub_test_case 'no options' do
    setup { mock_app }

    test 'load public directory item' do
      get 'http://www.example.org/index.html'
      assert_equal 200, last_response.status
      assert_equal File.open('public/index.html').read, last_response.body
    end

    test 'all url that get no content should load the public directory index' do
      get 'http://www.example.org/my/page'
      assert_equal 200, last_response.status
      assert_equal File.open('public/index.html').read, last_response.body
    end

    test 'all url that get some content should load from the public directory' do
      get 'http://www.example.org/index.js'
      assert_equal 200, last_response.status
      assert_equal File.open('public/index.js').read, last_response.body
    end
  end

  sub_test_case 'excludes options' do
    setup { mock_app excludes: ['/v1/api'] }

    test 'load public directory item' do
      get 'http://www.example.org/v1/api/hello.json'
      assert_equal 200, last_response.status
      assert_equal 'Hello world!', last_response.body
    end
  end
end
