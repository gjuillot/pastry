module ApplicationHelper
  def delete_icon(object)
    raw "<a href='#{url_for(object)}' data-method='delete' data-confirm='Etes-vous sur ?' rel='nofollow'><span class='glyphicon glyphicon-trash'></span></a>"
  end
end
