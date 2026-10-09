//
//  controlador_general.swift
//  game2
//
//  Created by alumno on 9/7/26.
//

import Foundation

@Observable ///
class ControladorGeneral{
    private var tamagotchi: Tamagotchi
    
    var estado: EstadosTamagotchi = .Neutro
    
    init(tamaogtchi_a_cargar: Tamagotchi? = nil) {
        if let tamaogtchi_a_cargar = tamaogtchi_a_cargar {
            self.tamagotchi = tamaogtchi_a_cargar
        }
        
        else {
            self.tamagotchi = Tamagotchi(
                nombre: "Ramiro", esta_vivo: true,
                edad: 0, hambre: 150, cansancio: 150,
                limpio: 50, aburrido: 50
            )
        }
    }
    
    func cambiar_nombre(_ nombre_nuevo: String) -> Bool{
        if tamagotchi.esta_vivo {
            tamagotchi.nombre = nombre_nuevo
        }
        
        return tamagotchi.esta_vivo
    }
    
    func matar() -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.esta_vivo = false
            return true
        }
        
        return false
    }
    
    func revivir() -> Bool{
        if !tamagotchi.esta_vivo {
            tamagotchi.esta_vivo = true
            return true
        }
        
        return false
    }
    
    func actualizar_medidores() -> Bool{
        tamagotchi.hambre += 1
        tamagotchi.aburrido += 1
        tamagotchi.cansancio += 1
        
        tamagotchi.limpio -= 1
        
        actualizar_estado()
        
        return true
    }
    
    private func actualizar_estado(){
        switch(estado){
            case .Neutro:
                if tamagotchi.hambre > 60{
                    estado = .Hambriento
                }
                
                else if tamagotchi.cansancio > 80{
                    estado = .Adormilado
                }
                
            case .Hambriento:
                if tamagotchi.hambre > 80{
                    estado = .Inanición
                }
                
                else if tamagotchi.hambre < 40{
                    estado = .Neutro
                }
                
            case .Inanición:
                if tamagotchi.hambre > 100{
                    estado = .Muerte
                }
                
            default:
                return
        }
    }
    
    func adormilar() -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.cansancio += 20
            return true
        }
        
        return false
    }
    
    func enojar() -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.enojado += 20
            return true
        }
        
        return false
    }
    
    
    
    func alimentar() -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.hambre -= 20
            return true
        }
        
        return false
    }
    
    func entretener() -> Bool{
        if tamagotchi.esta_vivo{
            tamagotchi.aburrido -= 20
            return true
        }
        
        return false
    }
    
    
}

    

