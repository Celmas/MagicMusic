package ru.itis.music.servlets;

import org.springframework.jdbc.datasource.DriverManagerDataSource;
import ru.itis.music.forms.SignUpForm;
import ru.itis.music.models.Auth;
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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {

    private UserService userService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("jsp/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");

        SignUpForm form = SignUpForm.builder()
                .email(email)
                .firstName(firstName)
                .lastName(lastName)
                .password(password)
                .build();
        userService.signUp(form);

        resp.sendRedirect("/home");

    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        ServletContext context = config.getServletContext();
        this.userService = (UserService)context.getAttribute("userService");    }

}
