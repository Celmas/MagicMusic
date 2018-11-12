package ru.itis.music.models;

import lombok.*;

import java.util.ArrayList;

@Builder
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class User {
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String status;
    private String password;
    private Integer balance;

    private ArrayList<Song> trackList;
}
