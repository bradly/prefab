module Prefab::Controller
  extend ActiveSupport::Concern

  included do
    before_action :collection, only: :index
    before_action :resource,   only: [:show, :new, :create, :edit, :update, :destroy]
    before_action :parent
  end

  def index; end
  def  show; end
  def   new; end
  def  edit; end

  def create
    if resource.save
      redirect_to resource, notice: save_success_message
    else
      render :new, alert: save_failed_message
    end
  end

  def update
    if resource.update(resource_params)
      redirect_to resource, notice: save_success_message
    else
      render :edit, alert: save_failed_message
    end
  end

  def destroy
    resource.destroy!
    redirect_back(fallback_location: root_path)
  end

  private

  def resource_name
    self.class.instance_variable_get(:"@resource_name")
  end

  def parent_name
    self.class.instance_variable_get(:"@parent_name")
  end

  def permitted_params
    self.class.instance_variable_get(:"@permitted_params")
  end

  def collection_name
    resource_name.pluralize
  end

  def collection
    @collection ||= instance_variable_set("@#{collection_name}", resource_scope.all)
  end

  def parent_class
    @parent_class ||= parent_name.to_s.camelize.constantize
  end

  def parent
    return unless has_parent?

    @parent ||= begin
      @parent = parent_class.find(params["#{parent_name}_id"])
      instance_variable_set("@#{parent_name}", @parent)
      @parent
    end
  end

  def has_parent?
    parent_name.present?
  end

  def resource_scope
    if has_parent?
      parent.public_send(resource_name.pluralize)
    else
      resource_name.to_s.camelize.constantize
    end
  end

  def resource
    @resource ||= begin
      @resource = case action_name
                  when 'new'
                    resource_scope.new
                  when 'create'
                    resource_scope.new(resource_params)
                  else
                    resource_scope.find(params[:id])
                  end

      instance_variable_set("@#{resource_name}", @resource)

      @resource
    end
  end

  def resource_params
    params.require(resource_name).permit(*permitted_params)
  end

  def save_success_message
    "#{resource_name} saved"
  end

  def save_failed_message
    "There was a problem saving this #{resource_name}"
  end
end
