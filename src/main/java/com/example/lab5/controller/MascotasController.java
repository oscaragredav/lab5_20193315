package com.example.lab5.controller;


import com.example.lab5.entity.Mascotas;
import com.example.lab5.entity.Viajes;
import com.example.lab5.repository.LugaresRepository;
import com.example.lab5.repository.MascotaRepository;
import com.example.lab5.repository.PersonaRepository;
import com.example.lab5.repository.ViajesRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/mascotas")
public class MascotasController {
    private final ViajesRepository viajesRepository;
    private final PersonaRepository personaRepository;
    private final LugaresRepository lugaresRepository;
    private final MascotaRepository mascotaRepository;

    public MascotasController(ViajesRepository viajesRepository, PersonaRepository personaRepository, LugaresRepository lugaresRepository, MascotaRepository mascotaRepository) {
        this.viajesRepository = viajesRepository;
        this.personaRepository = personaRepository;
        this.lugaresRepository = lugaresRepository;
        this.mascotaRepository = mascotaRepository;

    }
//    -------------------------------------------------
@GetMapping({"/listaMascotas"})
public String listaMascotas(Model model){
    List<Mascotas> listaMascotas = mascotaRepository.findAll();
    model.addAttribute("listaPersona",personaRepository.findAll());
    model.addAttribute("listaMascotas", listaMascotas);
    return "mascotas/listaMascotas";
}
    @GetMapping("/borrarMascotas")
    public String borrarMascota(Model model,
                              @RequestParam("id") int id,
                              RedirectAttributes attr) {

        Optional<Mascotas> optionalMascotas = mascotaRepository.findById(id);

        if (optionalMascotas.isPresent()) {
            mascotaRepository.deleteById(id);
        }
        return "redirect:/mascotas/listaMascotas";

    }

    @GetMapping({"/nuevoMascotas",})
    public String nuevoMascotas(Model model){
        model.addAttribute("listaPersona",personaRepository.findAll());
        return "viajes/nuevoViajes";
    }






}
