class LinkMailer < ActionMailer::Base
  default from: "andresecommercetest@gmail.com"
  
  def download_link(link)  
    @link = link
    @product = link.product
    mail(to: link.email,subject:"Descarga los productos que adquiriste.")
  end
end