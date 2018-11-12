package ru.itis.music.repositories;

import ru.itis.music.models.Song;

import java.util.List;

public interface SongRepository extends CrudRepository<Song> {
    void deleteFromTrackList(Long user_id, Long song_id);
}
