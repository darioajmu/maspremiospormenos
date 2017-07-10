class RealizarSorteoWorker
  include Shoryuken::Worker

  def perform(sqs_msg, data)
    begin

    rescue => error

    end
  end
end
