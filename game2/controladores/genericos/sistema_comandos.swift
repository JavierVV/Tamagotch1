//
//  sistema_comandos.swift
//  game2
//
//  Created by alumno on 9/21/26.
//

protocol Comando {}

protocol ProcesarComandos{
    func procesar_comando(_ comando: Comando) -> Bool
}
