package com.example.lab5.repository;

import com.example.lab5.entity.Mascotas;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MascotaRepository extends JpaRepository<Mascotas, Integer> {
}
