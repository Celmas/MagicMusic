package ru.itis.music.models;

import lombok.*;

import java.util.ArrayList;

@Builder
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class Album {
    private Long id;
    private String name;
    private Integer year;
    private Long singerId;
    private Integer quantity;
    private Integer ageRating;

    private ArrayList<Song> songs;
}
