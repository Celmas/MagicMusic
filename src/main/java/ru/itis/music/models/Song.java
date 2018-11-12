package ru.itis.music.models;

import lombok.*;

import java.net.URL;

@Builder
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class Song {
    private Long id;
    private String name;
    private Singer singer;
    private Integer rating;
    private Integer duration;
    private String url;
    private Integer moneyEarned;
    private String text;
}
