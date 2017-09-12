class LinkMailer < ActionMailer::Base
  default from: "Downloads@test.com"
  
  def download_link(link)  
    @link = link
    mail(to: link.email,subject:"Descarga los productos que adquiriste.")
  end
end