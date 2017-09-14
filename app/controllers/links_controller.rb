class LinksController < ApplicationController
  before_action :find_link
  before_action :find_attachment_link, only: :download_attachment
  before_action :set_attachment, only: [:download_attachment]  
  before_action :validate_link
  before_action :validate_attachment_link, only: :download_attachment
  
  def download
    @link.update_downloads
    @product = @link.product
    @link.create_attachment_links
    @link_attachments = @link.links
  end
  
  def download_attachment  
    send_file(@attachment.archivo.path)
  end
  
  def destroy
  end
  
  private
    def find_attachment_link
      @link_attachment = LinkAttachment.find(params[:attachment_id])
    end
    def set_attachment
      @attachment = Attachment.find(@link_attachment.attachment_id)
    end    
    def validate_attachment_link
      if @link_attachment.is_invalid?
        redirect_to invalid_path, notice:"Expiró el tiempo para descargar este archivo."
      end
    end
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