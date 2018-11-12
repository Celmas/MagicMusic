package ru.itis.music.repositories;

import ru.itis.music.models.Auth;

import java.util.Optional;

public interface AuthRepository extends CrudRepository<Auth>{
    Optional<Auth> findByCookieValue(String cookieValue);
}
