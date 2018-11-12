package ru.itis.music.servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import ru.itis.music.models.Song;
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
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/main")
public class MainServlet extends HttpServlet {
    private UserService service;
    private ObjectMapper mapper = new ObjectMapper();

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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("jsp/main.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Song> songs = service.getSongsByUserId(currentUser(req).getId());
        String resultJson = mapper.writeValueAsString(songs);
        resp.setStatus(200);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter writer = resp.getWriter();
        writer.write(resultJson);
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        ServletContext context = config.getServletContext();
        this.service = (UserService)context.getAttribute("userService");    }

}
