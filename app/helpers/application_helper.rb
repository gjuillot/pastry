module ApplicationHelper
  def delete_icon(object, text="")
    raw "<a href='#{url_for(object)}' data-method='delete' data-confirm='Etes-vous sur ?' rel='nofollow'><span class='glyphicon glyphicon-trash'></span>#{text}</a>"
  end
  
  def edit_icon(object, text="")
    raw "<a href='#{url_for([:edit, object])}' rel='nofollow'><span class='glyphicon glyphicon-edit'></span>#{text}</a>"
  end
end
