require 'cinch'
require 'imgur'

class Aww
    include Cinch::Plugin

    match /aww/
    timer 3500, method: :refresh_token

    def initialize(*args)
        super
        @client = Imgur::Client.new
    end

    def execute(m)
        images = @client.images.all(resource: "gallery/r/aww", page: 0)
        image = images[Random.rand(0..images.length)]
        m.reply image.link
    end

    def refresh_token
       @client.refresh_token
    end
end
