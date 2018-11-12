package ru.itis.music.listeners;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import ru.itis.music.repositories.*;
import ru.itis.music.services.UserService;
import ru.itis.music.services.UserServiceImpl;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ComponentListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setUsername("postgres");
        dataSource.setPassword("qwerty007");
        dataSource.setUrl("jdbc:postgresql://localhost:5432/Music_db");
        UserRepository usersRepository = new UserRepositoryJDBCTemplateImpl(dataSource);
        servletContextEvent.getServletContext().setAttribute("userRepository", usersRepository);
        AuthRepository authRepository = new AuthRepositoryJDBCTemplateImpl(dataSource);
        servletContextEvent.getServletContext().setAttribute("authRepository", authRepository);
        SongRepository songRepository = new SongRepositoryJDBCTemplateImpl(dataSource);
        servletContextEvent.getServletContext().setAttribute("songRepository", songRepository);
        UserService userService = new UserServiceImpl(usersRepository, authRepository);
        servletContextEvent.getServletContext().setAttribute("userService", userService);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
