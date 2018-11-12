package ru.itis.music.repositories;

import lombok.SneakyThrows;
import ru.itis.music.mapper.RowMapper;
import ru.itis.music.models.Producer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProducerRepositoryConnectionImpl implements ProducerRepository{
    private Connection connection;

    public ProducerRepositoryConnectionImpl(Connection connection) {
        this.connection = connection;
    }

    //language=SQL
    private static final String SQL_INSERT_QUERY = "INSERT INTO producer(first_name, last_name, company, age, commercial_phone, budget)" +
            "VALUES (?, ?, ?, ?, ?, ?);";
    //language=SQL
    private static final String SQL_DELETE_QUERY = "DELETE FROM producer WHERE id = ?";

    private RowMapper<Producer> producerRowMapper = new RowMapper<Producer>() {
        @SneakyThrows
        public Producer rowMap(ResultSet resultSet) {
            return Producer.builder()
                    .firstName(resultSet.getString("firstName"))
                    .lastName(resultSet.getString("lastName"))
                    .age(resultSet.getInt("age"))
                    .commercialPhone(resultSet.getInt("comercial_phone"))
                    .budget(resultSet.getInt("budget"))
                    .company(resultSet.getString("company"))
                    .build();
        }
    };

    public Optional<Producer> findOne(Long id) {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet =
                    statement.executeQuery("SELECT * FROM producer WHERE id = " + id);
            resultSet.next();
            return Optional.of(producerRowMapper.rowMap(resultSet));
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        }
    }

    @SneakyThrows
    public void save(Producer model) {
        PreparedStatement statement = connection.prepareStatement(SQL_INSERT_QUERY, PreparedStatement.RETURN_GENERATED_KEYS);
        statement.setString(1, model.getFirstName());
        statement.setString(2, model.getLastName());
        statement.setString(3, model.getCompany());
        statement.setInt(4, model.getAge());
        statement.setInt(5, model.getCommercialPhone());
        statement.setInt(6, model.getBudget());
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

    public List<Producer> findAll() {
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet =
                    statement.executeQuery("SELECT * FROM composer");
            List<Producer> producers = new ArrayList<>();
            while (resultSet.next()) {
                Producer producer = producerRowMapper.rowMap(resultSet);
                producers.add(producer);

            }
            return producers;
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        }
    }
}
