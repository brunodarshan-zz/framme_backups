class LogService
  class << self
    class Write
      class << self
        def action(action, model, who)
          Log.new(:description => "#{who} #{action} #{model} at #{DateTime.now.to_s}.")
        end
      end
    end


  end
end
