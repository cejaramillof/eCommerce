class LinksController < ApplicationController
  before_action :find_link
  before_action :validate_link
  def download
    @link.update_downloads
    @product = @link.product
  end
  
  def download_attachment
  end
  
  private
    def find_link
      @link = Link.find_by(custom_id:params[:id])
    end
    def validate_link
      if @link.nil? || @link.is_invalid?
        redirect_to invalid_path, notice: "El link de descarga no es válido o ha expirado."
      else
      end
    end
end