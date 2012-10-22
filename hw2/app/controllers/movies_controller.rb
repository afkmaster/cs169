class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.setRatings
    if params[:ratings] == nil and params[:sortBy] == nil
      if session[:r] != nil and session[:sortBy] != nil
        flash.keep
        redirect_to movies_path :sortBy => session[:sortBy], :ratings => session[:r]
      elsif session[:sortBy] != nil
        flash.keep
        redirect_to movies_path :sortBy => session[:sortBy]
      elsif session[:r] != nil
        flash.keep
        redirect_to movies_path :ratings=> session[:r]
      end
    end
    
    if params[:ratings] != nil
      if params[:ratings].is_a? Hash
        session[:r] = params[:ratings].keys
      else
        session[:r] = params[:ratings]
      end
    elsif session[:r] == nil
      session[:r] = Movie.setRatings
    end
    
    if params[:sortBy] != nil
      session[:sortBy] = params[:sortBy]
    end
    
    if session[:sortBy] == 'title'
      @movies = Movie.find(:all, :conditions => {:rating => session[:r]}, :order => :title)
    elsif session[:sortBy] == 'release_date'
      @movies = Movie.find(:all, :conditions => {:rating => session[:r]}, :order => :release_date)
    else
      @movies = Movie.find(:all, :conditions => {:rating => session[:r]})
    end
    
  end


  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end