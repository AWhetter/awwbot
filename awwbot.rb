require 'cinch'
require_relative 'aww'

bot = Cinch::Bot.new do
    configure do |c|
        c.server = "irc.freenode.org"
        c.channels = ["#cinch-bots"]
        c.nick = "awwbot"
        c.port = 7000
        c.ssl.use = true
        c.user = "awwbot"
        c.plugins.plugins = [Aww]
    end

    on :message, "!help" do |m|
        m.reply "Current plugins: Aww"
        m.reply "aww help: !aww"
    end
end

bot.start
