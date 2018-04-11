require_relative('models/artist.rb')
require_relative('models/albums.rb')
require('pry-byebug')
Album.delete_all()
Artist.delete_all()

artist_array = [
  artist1 = Artist.new(
    {
      "name" => "the beta band"
      }),
      artist2 = Artist.new(
        {
          "name" => "americian football"
          }),
          artist3 = Artist.new(
            {
              "name" => "anchorsong"
              }),
              artist4 = Artist.new(
                {
                  "name" => "artic monkeys"
                  }),
                  artist5 = Artist.new(
                    {
                      "name" => "a perfect circle"
                      })]

                      artist_array.each {|artist| artist.save()}
                      binding.pry

                      album_array = [
                        album1 = Album.new({
                          "name" => "yellow",
                          "genre" => "blue",
                          "artist_id" => artist1.id
                          }),
                          album2 = Album.new({
                            "name" => "red",
                            "genre" => "dub step",
                            "artist_id" => artist2.id
                            }),
                            album3 = Album.new({
                              "name" => "green",
                              "genre" => "indie",
                              "artist_id" => artist3.id
                              }),
                              album4 = Album.new({
                                "name" => "black",
                                "genre" => "indie",
                                "artist_id" => artist3.id
                                })]
                                album_array.each {|album| album.save()}

                                binding.pry

                                nil
