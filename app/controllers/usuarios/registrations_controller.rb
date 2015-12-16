class Usuarios::RegistrationsController < Devise::RegistrationsController
    # Override the action you want here.


      before_action :objeto_find, only: [:edit, :show, :update, :destroy]
    	before_action :listas, only: [:edit, :show, :update, :destroy, :index, :new, :create]

    	def create
    		@usuario = Usuario.new(objeto_parametros)
    		if @usuario.save
    			redirect_to :back
    		else
    			render 'new'
    		end
    	end

    	def edit
    	end

    	def index
    		@dataResul = @search.result.paginate(page: params[:page]).order(:email)
    	end

    	def new
    		@usuario = Usuario.new
    	end

    	def show
    	end

    	def update
    		if @usuario.update(objeto_parametros)
    			redirect_to @usuario
    		else
    			render 'edit'
    		end
    	end


    private

    def listas
    	@tiposdocumentos = Tiposdocumento.where(fechadebaja: nil).order(:nombre)
    end

    def objeto_find
    	@usuario = Usuario.find(params[:id])
    end

    def objeto_parametros
    	params.require(:usuario).permit(:username, :email, :encrypted_password, :password, :tiposdocumento_id, :documento)
    end

end
