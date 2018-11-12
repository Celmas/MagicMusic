package ru.itis.music.forms;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProfileForm {
    private Long userId;
    private String email;
    private String firstName;
    private String lastName;
    private String password;
    private String status;
}
