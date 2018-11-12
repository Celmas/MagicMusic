package ru.itis.music.repositories;

import lombok.SneakyThrows;
import ru.itis.music.mapper.RowMapper;
import ru.itis.music.models.Album;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class AlbumRepositoryConnectionImpl implements AlbumRepository {
    private Connection connection;

    public AlbumRepositoryConnectionImpl(Connection connection) {
        this.connection = connection;
    }

    //language=SQL
    private static final String SQL_INSERT_QUERY = "INSERT INTO album(name, singer_id, year, quantity, age_rating)" +
            "VALUES (?, ?, ?, ?, ?);";
    //language=SQL
    private static final String SQL_DELETE_QUERY = "DELETE FROM album WHERE id = ?";

    private RowMapper<Album> albumRowMapper = new RowMapper<Album>() {
        @SneakyThrows
        public Album rowMap(ResultSet resultSet) {
            return Album.builder()
                    .name(resultSet.getString("name"))
                    .singerId(resultSet.getLong("singer_id"))
                    .ageRating(resultSet.getInt("ageRating"))
                    .quantity(resultSet.getInt("quantity"))
                    .year(resultSet.getInt("year"))
                    .build();
        }
    };

    public Optional<Album> findOne(Long id) {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet =
                    statement.executeQuery("SELECT * FROM album WHERE id = " + id);
            resultSet.next();
            return Optional.of(albumRowMapper.rowMap(resultSet));
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        }
    }

    @SneakyThrows
    public void save(Album model) {
        PreparedStatement statement = connection.prepareStatement(SQL_INSERT_QUERY, PreparedStatement.RETURN_GENERATED_KEYS);
        statement.setString(1, model.getName());
        statement.setLong(2, model.getSingerId());
        statement.setInt(3, model.getYear());
        statement.setInt(4, model.getQuantity());
        statement.setInt(2, model.getAgeRating());
        ResultSet resultSet = statement.getGeneratedKeys();
        while (resultSet.next()) {
            model.setId(resultSet.getLong("id"));
        }
    }

    public void delete(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(SQL_DELETE_QUERY);
            statement.setLong(1, id);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Album> findAll() {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet =
                    statement.executeQuery("SELECT * FROM album");
            List<Album> albums = new ArrayList<>();
            while (resultSet.next()) {
                Album newAlbum = albumRowMapper.rowMap(resultSet);
                albums.add(newAlbum);

            }
            return albums;
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        }
    }
}
