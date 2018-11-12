package ru.itis.music.servlets;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import ru.itis.music.forms.SignInForm;
import ru.itis.music.repositories.AuthRepository;
import ru.itis.music.repositories.AuthRepositoryJDBCTemplateImpl;
import ru.itis.music.repositories.UserRepository;
import ru.itis.music.repositories.UserRepositoryJDBCTemplateImpl;
import ru.itis.music.services.UserService;
import ru.itis.music.services.UserServiceImpl;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/home")
public class HomeServlet extends HttpServlet{
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "qwerty007";
    private static final String URL = "jdbc:postgresql://localhost:5432/Music_db";

    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("jsp/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SignInForm form = SignInForm.builder()
                .email(req.getParameter("email"))
                .password(req.getParameter("password"))
                .build();

        Optional<String> cookieValueCandidate = userService.signIn(form);
        if (cookieValueCandidate.isPresent()) {
            Cookie auth = new Cookie("auth", cookieValueCandidate.get());
            resp.addCookie(auth);
            resp.sendRedirect("/main");
        } else {
            resp.sendRedirect("/signIn");
        };
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        ServletContext context = config.getServletContext();
        this.userService = (UserService)context.getAttribute("userService");
    }

}
