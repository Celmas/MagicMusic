package ru.itis.music.servlets;

import com.fasterxml.jackson.databind.ObjectMapper;
import ru.itis.music.models.Song;
import ru.itis.music.models.User;
import ru.itis.music.repositories.SongRepository;
import ru.itis.music.repositories.UserRepository;
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
import java.util.Optional;

@WebServlet("/addsong")
public class AddSongServlet extends HttpServlet {
    private UserService service;
    private ObjectMapper mapper = new ObjectMapper();
    private SongRepository songRepository;

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
        Long id = Long.parseLong(req.getParameter("songId"));
        User user = currentUser(req);
        service.addSong(user.getId(), id);
        Optional<Song> song = songRepository.findOne(id);
        String resultJson = mapper.writeValueAsString(song.get());
        resp.setStatus(200);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter writer = resp.getWriter();
        writer.write(resultJson);
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        ServletContext context = config.getServletContext();
        this.songRepository = (SongRepository)context.getAttribute("songRepository");
        this.service = (UserService)context.getAttribute("userService");
    }

}
