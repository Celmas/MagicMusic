package ru.itis.music.repositories;

import lombok.SneakyThrows;
import ru.itis.music.mapper.RowMapper;
import ru.itis.music.models.Composer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ComposerRepositoryConnectionImpl implements ComposerRepository {
    private Connection connection;

    public ComposerRepositoryConnectionImpl(Connection connection) {
        this.connection = connection;
    }

    //language=SQL
    private static final String SQL_INSERT_QUERY = "INSERT INTO composer(first_name, last_name, age, phone, lvl, educated)" +
            "VALUES (?, ?, ?, ?, ?, ?);";
    //language=SQL
    private static final String SQL_DELETE_QUERY = "DELETE FROM composer WHERE id = ?";

    private RowMapper<Composer> composerRowMapper = new RowMapper<Composer>() {
        @SneakyThrows
        public Composer rowMap(ResultSet resultSet) {
            return Composer.builder()
                    .firstName(resultSet.getString("firstName"))
                    .lastName(resultSet.getString("lastName"))
                    .age(resultSet.getInt("age"))
                    .phone(resultSet.getInt("phone"))
                    .lvl(resultSet.getInt("lvl"))
                    .educated(resultSet.getBoolean("educated"))
                    .build();
        }
    };

    public Optional<Composer> findOne(Long id) {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet =
                    statement.executeQuery("SELECT * FROM composer WHERE id = " + id);
            resultSet.next();
            return Optional.of(composerRowMapper.rowMap(resultSet));
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        }
    }

    @SneakyThrows
    public void save(Composer model) {
        PreparedStatement statement = connection.prepareStatement(SQL_INSERT_QUERY, PreparedStatement.RETURN_GENERATED_KEYS);
        statement.setString(1, model.getFirstName());
        statement.setString(2, model.getLastName());
        statement.setInt(3, model.getAge());
        statement.setInt(4, model.getPhone());
        statement.setInt(5, model.getLvl());
        statement.setBoolean(6, model.getEducated());
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

    public List<Composer> findAll() {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet =
                    statement.executeQuery("SELECT * FROM composer");
            List<Composer> composers = new ArrayList<>();
            while (resultSet.next()) {
                Composer newComposer = composerRowMapper.rowMap(resultSet);
                composers.add(newComposer);

            }
            return composers;
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        }
    }
}
