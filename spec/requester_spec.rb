# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lecter::Requester do
  let(:specific_parameter) { { lecter_enabled: true } }
  let(:url) { 'localhost:3009/posts' }
  let(:payload) { { 'post' => { 'title' => 'New title', 'description' => 'New description' } } }
  let(:headers) { { content_type: 'text/html', accept: '*/*' } }
  let(:params) do
    { method: :anything, url: url, payload: payload, lecter_enabled: true, headers: headers }
  end
  let(:instance) { described_class.new(params) }

  subject { instance.call }

  context 'if all params are valid' do
    before do
      response = instance_double(
        RestClient::Response,
        body: "\
302/absolute_path_to_app/app/controllers/posts_controller.rb 26 PostsController create call;\
/absolute_path_to_app/app/controllers/posts_controller.rb 27 PostsController create line;\
/absolute_path_to_app/app/controllers/posts_controller.rb 71 PostsController post_params call;\
/absolute_path_to_app/app/controllers/posts_controller.rb 72 PostsController post_params line;/\
absolute_path_to_app/app/controllers/posts_controller.rb 73 PostsController post_params return;/\
absolute_path_to_app/app/controllers/posts_controller.rb 29 PostsController create line;\
/absolute_path_to_app/app/controllers/posts_controller.rb 30 PostsController create line;\
/absolute_path_to_app/app/controllers/posts_controller.rb 31 PostsController create line;\
/absolute_path_to_app/app/controllers/posts_controller.rb 32 PostsController create line;\
/absolute_path_to_app/app/controllers/posts_controller.rb 31 PostsController create line;\
/absolute_path_to_app/app/controllers/posts_controller.rb 38 PostsController create return;"
      )
      allow(RestClient::Request).to receive(:execute).and_return(response)
      subject
    end

    it 'generate lines as hash in right format' do
      expect(instance.lines).to eq(
        [
          {
            '/absolute_path_to_app/app/controllers/posts_controller.rb' =>
              [26, 27, 71, 72, 73, 29, 30, 31, 32, 31, 38]
          }
        ]
      )
    end
  end

  [RestClient::ExceptionWithResponse, URI::InvalidURIError].each do |error|
    context "if raise #{error}" do
      before do
        allow(RestClient::Request).to receive(:execute).and_raise(error)
      end

      it 'returns false' do
        is_expected.to be_falsey
      end

      it 'make :lines nil' do
        expect(instance.lines).to be_empty
      end
    end
  end
end
