class Producto < ActiveRecord::Base
	validates :nombre, :descripcion, :presence => true
end
