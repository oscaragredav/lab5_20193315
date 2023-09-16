package com.example.lab5.controller;

import com.example.lab5.entity.Viajes;
import com.example.lab5.repository.LugaresRepository;
import com.example.lab5.repository.PersonaRepository;
import com.example.lab5.repository.ViajesRepository;
import org.antlr.v4.runtime.LexerNoViableAltException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/viajes")
public class ViajesController {
    private final ViajesRepository viajesRepository;
    private final PersonaRepository personaRepository;
    private final LugaresRepository lugaresRepository;

    public ViajesController(ViajesRepository viajesRepository,
                            PersonaRepository personaRepository,
                            LugaresRepository lugaresRepository) {
        this.viajesRepository = viajesRepository;
        this.personaRepository = personaRepository;
        this.lugaresRepository = lugaresRepository;
    }
//--------------------------------------------------------
    @GetMapping({"/listaViajes","/listaViaje"})
    public String listaViajes(Model model){
        List<Viajes> listaViajes = viajesRepository.findAll();
        model.addAttribute("listaViajes", listaViajes);
        return "viajes/listaViajes";
    }
    @GetMapping({"/nuevoViajes","/nuevoViajes"})
    public String nievoViaje(Model model){
        model.addAttribute("listaPersona",personaRepository.findAll());
        model.addAttribute("listaLugares",lugaresRepository.findAll());
        return "viajes/nuevoViajes";
    }
    @PostMapping("/guardarViajes")
    public String guardarNuevoViaje(Viajes viajes, RedirectAttributes attr) {
        viajesRepository.save(viajes);
        return "redirect:/viajes/listaViajes";
    }

    @GetMapping("/borrarViajes")
    public String borrarViaje(Model model,
                                      @RequestParam("id") int id,
                                      RedirectAttributes attr) {

        Optional<Viajes> optionalViajes = viajesRepository.findById(id);

        if (optionalViajes.isPresent()) {
            viajesRepository.deleteById(id);
        }
        return "redirect:/viajes/listaViajes";

    }

    @GetMapping("/editarViajes")
    public String editarViaje(Model model, @RequestParam("id") int id) {

        Optional<Viajes> optProduct = viajesRepository.findById(id);

        if (optProduct.isPresent()) {
            Viajes viajes = optProduct.get();
            model.addAttribute("viajes", viajes);
            model.addAttribute("listaPersona",personaRepository.findAll());
            model.addAttribute("listaLugares",lugaresRepository.findAll());
            return "viajes/editarViajes";
        } else {
            return "redirect:/viajes";
        }
    }
    @GetMapping({"/verViajes","/verviajes"})
    public String verViajes(Model model, @RequestParam("id") int id){
        Optional<Viajes> optionalViajes = viajesRepository.findById(id);

        if(optionalViajes.isPresent()){
            Viajes viajes = optionalViajes.get();
            model.addAttribute("viajes", viajes);
            return "viajes/vistaViajes";
        }else {
            return "redirect:/viajes/listaViajes";
        }

    }

}
