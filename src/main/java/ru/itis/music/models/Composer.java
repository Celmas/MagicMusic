package ru.itis.music.models;

import lombok.*;

@Builder
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class Composer {
    private Long id;
    private String firstName;
    private String lastName;
    private Integer age;
    private Integer phone;
    private Integer lvl;
    private Boolean educated;
}
