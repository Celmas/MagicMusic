package ru.itis.music.services;

import ru.itis.music.forms.ProfileForm;
import ru.itis.music.forms.SignInForm;
import ru.itis.music.forms.SignUpForm;
import ru.itis.music.models.Song;
import ru.itis.music.models.User;

import java.util.List;
import java.util.Optional;

public interface UserService {
    void signUp(SignUpForm form);
    Optional<String> signIn(SignInForm form);
    Optional<User> getUserByCookie(String cookieValue);
    boolean isExistByCookie(String cookieValue);
    List<Song> getSongsByUserId(Long id);

    void addSong(Long userId, Long songId);

    void updateProfile(ProfileForm form);
}
