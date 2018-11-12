package ru.itis.music.repositories;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import ru.itis.music.models.Auth;
import ru.itis.music.models.User;

import javax.sql.DataSource;
import java.util.List;
import java.util.Optional;

public class AuthRepositoryJDBCTemplateImpl implements AuthRepository {
    //language=SQL
    private static final String SQL_INSERT =
            "insert into auth(user_id, cookie_value) values (?, ?)";

    //language=SQL
    private static final String SQL_SELECT_BY_COOKIE_VALUE =
            "select * from auth where cookie_value = ?";

    private JdbcTemplate template;

    public AuthRepositoryJDBCTemplateImpl(DataSource dataSource) {
        this.template = new JdbcTemplate(dataSource);
    }

    private RowMapper<Auth> authRowMapper = (rs, rowNum) -> Auth.builder()
            .id(rs.getLong("id"))
            .user(User.builder()
                    .id(rs.getLong("user_id"))
                    .build())
            .cookieValue(rs.getString("cookie_value"))
            .build();

    @Override
    public List<Auth> findAll() {
        return null;
    }

    @Override
    public Optional<Auth> findOne(Long id) {
        return Optional.empty();
    }

    @Override
    public void save(Auth model) {
        template.update(SQL_INSERT, model.getUser().getId(), model.getCookieValue());
    }

    @Override
    public void delete(Long id) {

    }


    @Override
    public Optional<Auth> findByCookieValue(String cookieValue) {
        try {
            return Optional.of(template.queryForObject(SQL_SELECT_BY_COOKIE_VALUE, authRowMapper, cookieValue));
        } catch (EmptyResultDataAccessException e) {
            return Optional.empty();
        }
    }
}
