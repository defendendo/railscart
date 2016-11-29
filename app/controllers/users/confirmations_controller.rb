class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
  # POST /resource/confirmation
  def create
    # self.resource = resource_class.send_confirmation_instructions(resource_params)
    self.resource = resource_class.send_confirmation_instructions({email: current_user.email})
    if successfully_sent?(resource)
      respond_with({}, :location => after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  def after_resending_confirmation_instructions_path_for(resource_name)
    root_path
  end

  def after_confirmation_path_for(resource_name, resource)
    super(resource_name, resource)
  end
end
