RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.main_app_name = ['HRMSupProgramm', 'Страничка администратора']

   config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app


    config.model 'User' do
      list do
        field :id
        field :email
        field :name
        field :surname
        field :admin
      end

      show do
        field :id
        field :email
        field :name
        field :surname
        field :admin
      end

      edit do
        field :email
        field :password
        field :password_confirmation
        field :name
        field :surname
        field :admin
      end
    end


    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
