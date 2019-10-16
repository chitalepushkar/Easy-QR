class HomeController < ApplicationController
  def index
  end

  def new
    path = "#{Rails.root}/app/assets/images/qr_image.svg"
    File.delete(path) if File.exist?(path)
  end

  def create
  	if params[:home][:text]
  		qrcode = RQRCode::QRCode.new(create_params[:text])

  		# NOTE: showing with default options specified explicitly
  		qr_svg = qrcode.as_svg(
  		  offset: 0,
  		  color: '000',
  		  shape_rendering: 'crispEdges',
  		  module_size: 6,
  		  standalone: true
  		)

      @path = "#{Rails.root}/app/assets/images/qr_image.svg"
      File.open(@path, "w+") do |f|
        f.write(qr_svg)
      end
    end

    respond_to do |format|
      format.js
      #format.json { render json: @path, status: :ok }
    end
  end

  def new_upload
  end

  def upload
    uploaded_io = params[:home][:picture]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    path = "#{Rails.root}/public/uploads/#{uploaded_io.original_filename}"
    @qr_output = ZXing.decode(path)

    respond_to do |format|
      format.js
    end
  end

  def create_params
  	params.require(:home).permit(:text)
  end
end
