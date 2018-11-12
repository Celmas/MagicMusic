package ru.itis.music.models;

import lombok.*;

@Builder
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class Producer {
    private Long id;
    private String firstName;
    private String lastName;
    private String company;
    private Integer age;
    private Integer commercialPhone;
    private Integer budget;
}
