package ru.itis.music.repositories;

import lombok.SneakyThrows;
import ru.itis.music.mapper.RowMapper;
import ru.itis.music.models.Genre;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class GenreRepositoryConnectionImpl implements GenreRepository {
    private Connection connection;

    public GenreRepositoryConnectionImpl(Connection connection) {
        this.connection = connection;
    }

    //language=SQL
    private static final String SQL_INSERT_QUERY = "INSERT INTO genre(name, equalizer_type)" +
            "VALUES (?, ?);";
    //language=SQL
    private static final String SQL_DELETE_QUERY = "DELETE FROM genre WHERE id = ?";

    private RowMapper<Genre> genreRowMapper = new RowMapper<Genre>() {
        @SneakyThrows
        public Genre rowMap(ResultSet resultSet) {
            return Genre.builder()
                    .name(resultSet.getString("name"))
                    .equalizerType(resultSet.getString("equalizer_type"))
                    .build();
        }
    };

    public Optional<Genre> findOne(Long id) {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet =
                    statement.executeQuery("SELECT * FROM genre WHERE id = " + id);
            resultSet.next();
            return Optional.of(genreRowMapper.rowMap(resultSet));
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        }
    }

    @SneakyThrows
    public void save(Genre model) {
        PreparedStatement statement = connection.prepareStatement(SQL_INSERT_QUERY, PreparedStatement.RETURN_GENERATED_KEYS);
        statement.setString(1, model.getName());
        statement.setString(2, model.getEqualizerType());
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

    public List<Genre> findAll() {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet =
                    statement.executeQuery("SELECT * FROM genre");
            List<Genre> users = new ArrayList<>();
            while (resultSet.next()) {
                Genre newGenre = genreRowMapper.rowMap(resultSet);
                users.add(newGenre);
            }
            return users;
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        }
    }
}
