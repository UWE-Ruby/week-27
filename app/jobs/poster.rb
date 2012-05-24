require 'logger'

class Poster
  @queue = :poster

  class << self

    def perform(options = {})

      log.info "Performing work #{Time.now}"
      sleep 2

    end

    def log
      @@logger ||= Logger.new(File.join(File.dirname(__FILE__), "..","..","poster.log"))
    end

  end


end