package ru.itis.music.servlets;

import ru.itis.music.forms.ProfileForm;
import ru.itis.music.models.User;
import ru.itis.music.services.UserService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private UserService service;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("jsp/profile.jsp").forward(req,resp);
    }
    private User currentUser(HttpServletRequest req) {
        Cookie[] cookies = req.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("auth")) {
                if (service.isExistByCookie(cookie.getValue())) {
                    return service.getUserByCookie(cookie.getValue()).get();
                }
            }
        }
        return User.builder().email("guest").build();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProfileForm form = ProfileForm.builder()
                .email(req.getParameter("email"))
                .firstName(req.getParameter("firstName"))
                .lastName(req.getParameter("lastName"))
                .password(req.getParameter("password"))
                .userId(currentUser(req).getId())
                .status(req.getParameter("status"))
                .build();
        service.updateProfile(form);
        resp.sendRedirect("/profile");
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        ServletContext context = config.getServletContext();
        this.service = (UserService)context.getAttribute("userService");
    }
}
