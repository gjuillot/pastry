class HtmlSnippetsController < ApplicationController
  
  layout "admin"
  
  def create
    @html_snippet = HtmlSnippet.new(params[:html_snippet])
    @html_snippet.save
    redirect_to "/admin/html_snippets"
  end

  def update
    @html_snippet = HtmlSnippet.find(params[:id])
    @html_snippet.update_attributes(params[:html_snippet])
    redirect_to "/admin/html_snippets"
  end

  def destroy
    @html_snippet = HtmlSnippet.find(params[:id])
    @html_snippet.destroy
    redirect_to "/admin/html_snippets"
  end
end
