package ru.itis.music.repositories;

import lombok.SneakyThrows;
import ru.itis.music.mapper.RowMapper;
import ru.itis.music.models.Singer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class SingerRepositoryConnectionImpl implements SingerRepository{
    private Connection connection;

    public SingerRepositoryConnectionImpl(Connection connection) {
        this.connection = connection;
    }

    //language=SQL
    private static final String SQL_INSERT_QUERY = "INSERT INTO singer(name, producer_id, rating, money_earned)" +
            "VALUES (?, ?, ?, ?, ?);";
    //language=SQL
    private static final String SQL_DELETE_QUERY = "DELETE FROM singer WHERE id = ?";

    private RowMapper<Singer> singerRowMapper = new RowMapper<Singer>() {
        @Override
        @SneakyThrows
        public Singer rowMap(ResultSet resultSet) {
            return Singer.builder()
                    .name(resultSet.getString("name"))
                    .rating(resultSet.getInt("rating"))
                    .moneyEarned(resultSet.getInt("moneyEarned"))
                    .build();
        }
    };

    @Override
    public Optional<Singer> findOne(Long id) {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet =
                    statement.executeQuery("SELECT * FROM singer WHERE id = " + id);
            resultSet.next();
            return Optional.of(singerRowMapper.rowMap(resultSet));
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        }    }

    @Override
    @SneakyThrows
    public void save(Singer model) {
        PreparedStatement statement = connection.prepareStatement(SQL_INSERT_QUERY, PreparedStatement.RETURN_GENERATED_KEYS);
        statement.setString(1, model.getName());
        statement.setInt(2, model.getProducerId());
        statement.setInt(3, model.getRating());
        statement.setInt(4, model.getMoneyEarned());
        ResultSet resultSet = statement.getGeneratedKeys();
        while (resultSet.next()) {
            model.setId(resultSet.getLong("id"));
        }
    }

    @Override
    public void delete(Long id) {
        try {
            PreparedStatement statement = connection.prepareStatement(SQL_DELETE_QUERY);
            statement.setLong(1, id);
            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Singer> findAll() {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet =
                    statement.executeQuery("SELECT * FROM singer");
            List<Singer> singers = new ArrayList<>();
            while (resultSet.next()) {
                Singer newSinger = singerRowMapper.rowMap(resultSet);
                singers.add(newSinger);
            }
            return singers;
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        }    }
}
