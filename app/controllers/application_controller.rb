class ApplicationController < ActionController::Base
	def hello
		render html: "Hello, salut!"
	end

	def alta_ruta
		# render html: "Ai intrat pe alta ruta!"
	end
end
