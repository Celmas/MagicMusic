package ru.itis.music.repositories;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import ru.itis.music.models.Singer;
import ru.itis.music.models.Song;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class SongRepositoryJDBCTemplateImpl implements SongRepository {
    //language=SQL
    private static final String SQL_SELECT_BY_ID = "SELECT foo.id, foo.name, singer.name as singer_name,link,singer_id FROM (SELECT * FROM song WHERE id = ?) AS foo JOIN singer ON singer.id = foo.singer_id;";
    //language=SQL
    private static final String SQL_DELETE_BY_ID = "DELETE FROM track_list WHERE user_id = ? AND song_id = ?";

    private JdbcTemplate jdbcTemplate;

    public SongRepositoryJDBCTemplateImpl(DataSource dataSource){
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    private RowMapper<Song> songRowMapper = (resultSet, i) -> Song.builder()
            .name(resultSet.getString("name"))
            .singer(Singer.builder()
                    .id(resultSet.getLong("singer_id"))
                    .name(resultSet.getString("singer_name")).build())
            .id(resultSet.getLong("id"))
            .url(resultSet.getString("link"))
            .build();

    @Override
    public Optional<Song> findOne(Long id) {
        try {
            return Optional.of(jdbcTemplate.queryForObject(SQL_SELECT_BY_ID,songRowMapper, id));
        } catch (EmptyResultDataAccessException e) {
            return Optional.empty();
        }
    }

    @Override
    public void save(Song model) {

    }

    @Override
    public void delete(Long id) {

    }
    @Override
    public void deleteFromTrackList(Long user_id, Long song_id) {
        jdbcTemplate.update(SQL_DELETE_BY_ID, user_id, song_id);
    }

    @Override
    public List<Song> findAll() {
        return null;
    }
}
