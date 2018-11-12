package ru.itis.music.services;

import lombok.SneakyThrows;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import ru.itis.music.forms.ProfileForm;
import ru.itis.music.forms.SignInForm;
import ru.itis.music.forms.SignUpForm;
import ru.itis.music.models.Auth;
import ru.itis.music.models.Song;
import ru.itis.music.models.User;
import ru.itis.music.repositories.AuthRepository;
import ru.itis.music.repositories.UserRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class UserServiceImpl implements UserService {
    private AuthRepository authRepository;
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository, AuthRepository authRepository) {
        this.authRepository = authRepository;
        this.userRepository = userRepository;
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    @Override
    public void signUp(SignUpForm form) {
        User user = User.builder()
                .firstName(form.getFirstName())
                .lastName(form.getLastName())
                .email(form.getEmail())
                .password(passwordEncoder.encode(form.getPassword()))
                .build();
        userRepository.save(user);
    }

    @Override
    public Optional<String> signIn(SignInForm form) {
        Optional<User> candidate = userRepository.findOneByEmail(form.getEmail());

        if (candidate.isPresent()) {
            User user = candidate.get();
            if (passwordEncoder.matches(form.getPassword(), user.getPassword())) {
                String cookieValue = UUID.randomUUID().toString();
                Auth auth = Auth.builder()
                        .cookieValue(cookieValue)
                        .user(user)
                        .build();
                authRepository.save(auth);

                return Optional.of(cookieValue);
            }
        }
        return Optional.empty();
    }

    @Override
    public Optional<User> getUserByCookie(String cookieValue) {
        Auth auth;
        Optional<Auth> candidate = authRepository.findByCookieValue(cookieValue);
        if(candidate.isPresent()) {
            auth = candidate.get();
            Optional<User> user = userRepository.findOne(auth.getUser().getId());
            if (user.isPresent()) {
                return user;
            }
        }
        return Optional.empty();
    }

    @Override
    public boolean isExistByCookie(String cookieValue) {
        return authRepository.findByCookieValue(cookieValue) != null;
    }

    @Override
    public List<Song> getSongsByUserId(Long id) {
        return userRepository.getSongsById(id);
    }

    @Override
    public void updateProfile(ProfileForm form) {
        User user = User.builder()
                .firstName(form.getFirstName())
                .lastName(form.getLastName())
                .password(passwordEncoder.encode(form.getPassword()))
                .id(form.getUserId())
                .email(form.getEmail())
                .status(form.getStatus())
                .build();
        userRepository.update(user);
    }

    @Override
    public void addSong(Long userId, Long songId) {
        userRepository.saveSong(userId,songId);
    }
}
