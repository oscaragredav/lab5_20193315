package com.example.lab5.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "persona")
public class Persona {
    @Id
    @Column(name = "idPersona", nullable = false)
    private Integer idPersona;

    @Column(name = "nombre", length = 45)
    private String nombre;

    @Column(name = "dni", length = 45)
    private String dni;

    @Column(name = "celular", length = 45)
    private String celular;

    @Column(name = "tipo_persona", length = 45)
    private String tipoPersona;

}