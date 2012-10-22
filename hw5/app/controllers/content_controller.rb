class ContentController < ApplicationController
  class ExpiryFilter
    def before(controller)
      @request_time = Time.now
    end

    def after(controller)
       future_article =
         Article.find(:first,
                      :conditions => ['published = ? AND published_at > ?', true, @request_time],
                      :order =>  "published_at ASC" )
       if future_article
         delta = future_article.published_at - Time.now
         controller.response.lifetime = (delta <= 0) ? 0 : delta
       end
    end
  end

  include LoginSystem
  before_filter :setup_themer
  helper :theme

  def merge_articles
    if current_user.admin?
      if (Article.find_by_id(params[:id]).merge_with(params[:merge_id]))
        flash[:notice] = "Article number #{params[:merge_id]} merged with current article (#{params[:id]})"
      else
        flash[:error] = "Article number #{params[:merge_id]} failed to merge with current article (#{params[:id]})"
      end
      redirect_to :action => "edit", :id => params[:id]
    end
  end

  protected

  # TODO: Make this work for all content.
  def auto_discovery_feed(options = { })
    with_options(options.reverse_merge(:only_path => true)) do |opts|
      @auto_discovery_url_rss = opts.url_for(:format => 'rss', :only_path => false)
      @auto_discovery_url_atom = opts.url_for(:format => 'atom', :only_path => false)
    end
  end

  def theme_layout
    this_blog.current_theme.layout(self.action_name)
  end
end
