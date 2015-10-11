# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    def index
      # Add code for when the index view is loaded
    end

    def about
      # Add code for when the about view is loaded
    end

    def banner
      puts "MAIN1"
      self.model = store.signups.buffer
      puts "SIGNUPS"
    end
    
    def banner_ready
      if RUBY_PLATFORM == 'opal'
        `$('.parallax').parallax();`
      end
    end

    def signup
      model.save!.then do
        flash._notices << 'You have been signed up, we\'ll send you an e-mail the day before.  See you there!'
        banner
      end
    end

    private

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
