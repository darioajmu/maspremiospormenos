class Usuarios::RegistrationsController < Devise::RegistrationsController
    # Override the action you want here.

    @tiposdocumentos=Tiposdocumento.all
end
