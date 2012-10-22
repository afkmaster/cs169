require 'spec_helper'

describe MoviesController do
  describe 'edit page for appropriate Movie' do
    it 'has to return list of hardcoded ratings' do
      r = Movie.all_ratings
      r.length.should == 5
    end
    it 'should be possible to create movie' do
      movie = mock('Movie')
      movie.stub!(:title)
      
      Movie.should_receive(:create!).and_return(movie)
      post :create, {:movie => movie}
      response.should redirect_to(movies_path)
    end
    it 'should be possible to destroy movie' do
      movie = mock('Movie')
      movie.stub!(:title)
      
      Movie.should_receive(:find).with('1').and_return(movie)
      movie.should_receive(:destroy)
      post :destroy, {:id => '1'}
      response.should redirect_to(movies_path)
    end
  end

  describe "GET 'similar'" do
    before(:each) do
      @fake_results = [mock('movie1'), mock('movie2')]
      @movie = Movie.create!(:title => "Title", :rating => "Rating", :director => "Director", :release_date => Time.now)
    end
    
    it "should call the model method that finds similar movies" do
      Movie.should_receive(:find_similar_movies).with(@movie)
      get :similar, :id => @movie.id
    end
    
    describe "with a valid director" do
      before(:each) do
        Movie.stub(:find_similar_movies).and_return(@fake_results)
        get :similar, :id => @movie.id
      end
      
      it "should render the correct template" do
        response.should render_template('similar')
      end
      
      it "should make results available to the template" do
        assigns(:similar).should == @fake_results
      end
    end
  end
end