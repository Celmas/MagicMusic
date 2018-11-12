package ru.itis.music.servlets;

import ru.itis.music.models.User;
import ru.itis.music.repositories.SongRepository;
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

@WebServlet("/removesong")
public class RemoveSongServlet extends HttpServlet{
    private SongRepository songRepository;
    private UserService service;

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
        Long songId = Long.parseLong(req.getParameter("songId"));
        songRepository.deleteFromTrackList(currentUser(req).getId(), songId);
        resp.setStatus(200);
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        ServletContext context = config.getServletContext();
        this.songRepository = (SongRepository)context.getAttribute("songRepository");
        this.service = (UserService)context.getAttribute("userService");
    }
}
