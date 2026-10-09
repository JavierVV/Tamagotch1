//
//  generico.swift
//  game2
//
//  Created by alumno on 9/21/26.
//

protocol Comandos { }

enum ComandosUI: Comandos{
    case abrir
    case cerrar
}

enum ComandosBarra: Comandos{
    case otra_cosa
    case mas_cosas
}


enum ComandosTamagotchi: Comandos{
    case matar
    case alimentar(cantidad: Int)
    case divertir(cantidad: Int)
}

let comando = ComandosTamagotchi.alimentar(cantidad: 100)
