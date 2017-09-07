class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, to: :@template
  
  [:text_field,:text_area,:url_field,:email_field,:number_field].each do |metodo|
    define_method metodo do |name,*args|
      options = args.extract_options!
      if options.has_key?(:class)
        options[:class] += "form-control"
      else
        options[:class] = "form-control"
      end
      content_tag :div, class:"form-group" do
        content_tag(:label,name, name: name) + super(name,options)
      end 
    end
  end
  
  def submit(*args)
    content_tag :div do
      super(*args,class:"btn btn-success")
    end
  end
end