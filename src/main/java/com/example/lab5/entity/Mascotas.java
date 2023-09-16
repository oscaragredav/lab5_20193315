package com.example.lab5.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "mascotas")
public class Mascotas {
    @Id
    @Column(name = "idMascotas", nullable = false)
    private Integer idMascotas;

    @Column(name = "nombre_mascota", length = 45)
    private String nombreMascota;

    @Column(name = "genero", length = 45)
    private String genero;

    @Column(name = "edad", length = 45)
    private String edad;

    @Column(name = "fecha_nacimiento", length = 45)
    private String fechaNacimiento;

    @Column(name = "Vacunado", length = 45)
    private String vacunado;

    @Column(name = "Desparasitado", length = 45)
    private String desparasitado;

    @ManyToOne
    @JoinColumn(name = "Persona_idPersona", nullable = false)
    private Persona persona;

}