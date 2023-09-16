package com.example.lab5.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "viajes")
public class Viajes {
    @Id
    @Column(name = "idViajes", nullable = false)
    private Integer idViajes;

    @Column(name = "punto_recojo", length = 45)
    private String puntoRecojo;

    @Column(name = "cant_personas", length = 45)
    private String cantPersonas;

    @Column(name = "cant_perros", length = 45)
    private String cantPerros;

    @ManyToOne
    @JoinColumn(name = "Persona_idPersona", nullable = false)
    private Persona persona;

    @ManyToOne
    @JoinColumn(name = "Lugares_idLugares", nullable = false)
    private Lugares lugares;

}