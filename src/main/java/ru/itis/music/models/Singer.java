package ru.itis.music.models;

import lombok.*;

import java.util.ArrayList;

@Builder
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class Singer {
    private Long id;
    private String name;
    private Integer rating;
    private Integer moneyEarned;
    private Integer producerId;

    private ArrayList<Album> albums;
}
