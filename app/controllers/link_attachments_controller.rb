class LinkAttachmentsController < ApplicationController
  before_action :set_link_attachment, only: [:destroy]
  def destroy_all
    @linkattachment.destroy_all
  end
  private
    def set_link_attachment
      @linkattachment = LinkAttachment.where(params[:id])
    end  
end