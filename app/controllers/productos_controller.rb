class ProductosController < ApplicationController

	before_filter :authenticate_usuario!
	load_and_authorize_resource

  # GET /productos
  # GET /productos.xml
  def index
    @productos = Producto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @productos }
    end
  end

  # GET /productos/1
  # GET /productos/1.xml
  def show
    @producto = Producto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @producto }
    end
  end

  # GET /productos/new
  # GET /productos/new.xml
  def new
    @producto = Producto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @producto }
    end
  end

  # GET /productos/1/edit
  def edit
    @producto = Producto.find(params[:id])
  end

  # POST /productos
  # POST /productos.xml
  def create
    @producto = Producto.new(params[:producto])
		imagen = params[:producto][:imagen]
		@producto.imagen = imagen.original_filename
		File.open('public/images/productos/'+imagen.original_filename,'wb') { |f| f.write(imagen.read) }

    respond_to do |format|
      if @producto.save
        format.html { redirect_to(@producto, :notice => 'Producto was successfully created.') }
        format.xml  { render :xml => @producto, :status => :created, :location => @producto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @producto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /productos/1
  # PUT /productos/1.xml
  def update
    @producto = Producto.find(params[:id])

    respond_to do |format|
      if @producto.update_attributes(params[:producto])
        format.html { redirect_to(@producto, :notice => 'Producto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @producto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.xml
  def destroy
    @producto = Producto.find(params[:id])
    @producto.destroy

    respond_to do |format|
      format.html { redirect_to(productos_url) }
      format.xml  { head :ok }
    end
  end
end
