module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, artist)
    if !artist.nil? && song.artist == artist
      hidden_field_tag "song[artist_id]", song.artist_id
    else
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)    
    end
  end

  def display_name(song, artist)
    if !artist.nil? && song.artist == artist 
      artist.name
    end
  end

end
