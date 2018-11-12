package ru.itis.music.models;

import lombok.*;

@Getter
@Setter
@EqualsAndHashCode
@ToString
@Builder
public class Genre {
    private Long id;
    private String name;
    private String equalizerType;
}
