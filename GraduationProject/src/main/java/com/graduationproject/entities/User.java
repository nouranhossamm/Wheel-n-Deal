package com.graduationproject.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.testcontainers.shaded.org.checkerframework.common.aliasing.qual.Unique;

import javax.validation.constraints.NotNull;
import java.util.Collection;
import java.util.List;

@Data
@Entity
@Table(name="app_user")
public class User implements UserDetails {
    @Id
    @NotNull
    @Unique
    private String phoneNumber;
    private String userName;
    private String stripeId;
    private Long amount;

    private String fullName;
    private Gender gender;
    private String city;
    private String profilePictureUrl;
    private String nationalId;
    private String username;
    private String password;
    @Enumerated(EnumType.STRING)
    private Role role;
    @OneToMany(mappedBy = "user",cascade = CascadeType.REMOVE)
    private List<Token> tokens;
    @OneToMany(mappedBy = "user",cascade = CascadeType.REMOVE)
    private List<Order> orders;
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority(role.name()));
    }
    @Override
    public String getUsername() {
        return username;
    }
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
    @Override
    public boolean isEnabled() {
        return true;
    }
}
