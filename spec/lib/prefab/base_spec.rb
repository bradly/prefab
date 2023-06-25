require 'spec_helper'

RSpec.describe Prefab::Base, type: :controller do
  class MyController < ActionController::Base
    include Prefab::Base
  end

  subject(:controller) { MyController.new }

  it 'should not include Prefab::Controller by default' do
    expect(controller.class.included_modules).not_to include(Prefab::Controller)
  end

  describe '.prefab' do
    before do
      controller.class.prefab :projects, permitted_params: [:name, :description]
    end

    it 'includes Prefab::Controller' do
      expect(controller.class.included_modules).to include(Prefab::Controller)
    end

    it 'sets @resource_name' do
      expect(controller.class.instance_variable_get('@resource_name')).to eq('project')
    end

    it 'sets @permitted_params' do
      expect(controller.class.instance_variable_get('@permitted_params')).to eq([:name, :description])
    end
  end
end
