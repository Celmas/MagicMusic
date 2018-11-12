package ru.itis.music.repositories;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import ru.itis.music.models.Singer;
import ru.itis.music.models.Song;
import ru.itis.music.models.User;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class UserRepositoryJDBCTemplateImpl implements UserRepository {
    //language=SQL
    private static final String SQL_INSERT = "INSERT INTO service_user(first_name, last_name, email, password) VALUES (?,?,?,?)";
    //language=SQL
    private static final String SQL_SELECT_BY_EMAIL = "select * from service_user where email = ?";
    //language=SQL
    private static final String SQL_INSERT_INTO_TRACKLIST = "INSERT INTO track_list(user_id, song_id) VALUES (?,?)";

    //language=SQL
    private static final String SQL_SELECT_BY_ID = "select * from service_user where id = ?";
    //language=SQL
    private static final String SQL_UPDATE_USER = "UPDATE service_user SET first_name = ?,last_name = ?, email = ?, status = ?, password = ? WHERE id = ?";
    //language=SQL
    private static final String SQL_SELECT_SONGS = "SELECT song_id, song_name, text, singer_id, name as singer_name, link  FROM (SELECT song_id, name as song_name, singer_id, text, link FROM (SELECT * FROM service_user JOIN track_list list2 ON service_user.id = list2.user_id WHERE user_id = ?) AS foo JOIN song ON song_id = song.id) as foo JOIN singer ON id = foo.singer_id ;";

    private JdbcTemplate jdbcTemplate;

    public UserRepositoryJDBCTemplateImpl(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    private RowMapper<User> userRowMapper = (resultSet, i) -> User.builder()
            .id(resultSet.getLong("id"))
            .firstName(resultSet.getString("first_name"))
            .lastName(resultSet.getString("last_name"))
            .email(resultSet.getString("email"))
            .password(resultSet.getString("password"))
            .balance(resultSet.getInt("balance"))
            .status(resultSet.getString("status"))
            .build();

    @Override
    public void saveSong(Long userId, Long songId) {
        jdbcTemplate.update(SQL_INSERT_INTO_TRACKLIST, userId, songId);
    }

    private RowMapper<Song> songRowMapper = (resultSet, i) -> Song.builder()
            .id(resultSet.getLong("song_id"))
            .singer(Singer.builder()
                    .id(resultSet.getLong("singer_id"))
                    .name(resultSet.getString("singer_name"))
                    .build())
            .text(resultSet.getString("text"))
            .name(resultSet.getString("song_name"))
            .url(resultSet.getString("link"))
            .build();

    @Override
    public void update(User user) {
        jdbcTemplate.update(SQL_UPDATE_USER, user.getFirstName(), user.getLastName(), user.getEmail(), user.getStatus(), user.getPassword(), user.getId());
    }

    @Override
    public Optional<User> findOneByEmail(String email) {
        try {
            return Optional.of(jdbcTemplate.queryForObject(SQL_SELECT_BY_EMAIL, userRowMapper, email));
        } catch (EmptyResultDataAccessException e) {
            return Optional.empty();
        }
    }

    @Override
    public List<Song> getSongsById(Long id) {
        return jdbcTemplate.query(SQL_SELECT_SONGS, songRowMapper, id);
    }

    @Override
    public Optional<User> findOne(Long id) {
        try {
            return Optional.of(jdbcTemplate.queryForObject(SQL_SELECT_BY_ID, userRowMapper, id));
        } catch (EmptyResultDataAccessException e) {
            return Optional.empty();
        }
    }

    @Override
    public void save(User model) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbcTemplate.update(
                connection -> {
                    PreparedStatement ps =
                            connection.prepareStatement(SQL_INSERT, new String[] {"id"});
                    ps.setString(1, model.getFirstName());
                    ps.setString(2, model.getLastName());
                    ps.setString(3, model.getEmail());
                    ps.setString(4, model.getPassword());
                    return ps;
                }, keyHolder);

        model.setId(keyHolder.getKey().longValue());
    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public List<User> findAll() {
        return null;
    }
}
