package ru.itis.music.repositories;


import ru.itis.music.models.Song;
import ru.itis.music.models.User;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends CrudRepository<User> {
    Optional<User> findOneByEmail(String email);

    List<Song> getSongsById(Long id);

    void saveSong(Long userId, Long songId);

    void update(User user);
}
