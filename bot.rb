class Bot
  def self.start
    new.start
  end

  def start
    Telegram::Bot::UpdatesPoller.new(client, WebhooksController, logger: logger).start
  end

  private

  def client
    Telegram::Bot::Client.new(token)
  end

  def token
    ENV.fetch('KEY_TOKEN')
  end

  def logger
    Logger.new(STDOUT)
  end
end
