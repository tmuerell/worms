module ApplicationHelper
  def show_current(controller)
    if params[:controller] == controller
      "current"
    end
  end
  def attribute_table(model, *attrs)
    content = '<div class="attributes_table">'
    content << '<table cellspacing="0" cellpadding="0" border="0"><tbody>'
    attrs.each do |a|
      v = model.send(a)
      content << "<tr><th>#{a.to_s}</th><td>#{v}</td><tr>"
    end
    content << '</tbody></table></div>'
    content.html_safe
  end

  def breadcrump(link)
    @breadcrumps ||= []
    @breadcrumps << link
  end
  
  def breadcrumps
    @breadcrumps
  end
  
  def breadcrumps?
    @breadcrumps && @breadcrumps.size > 0
  end
  
  def action_item(action_item)
    @show_action_item = true
    content_for(:action_item) { action_item.to_s }
  end
  
  def show_action_item?
    @show_action_item
  end
  
  def title(page_title, show_title = true)
    @show_title = show_title
    content_for(:title) { page_title.to_s }
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
end
