//
//  game2App.swift
//  game2
//
//  Created by alumno on 9/7/26.
//

import SwiftUI

@main
struct MaquinaDeEstadosApp: App {
    @State var control: ControladorGeneral = ControladorGeneral()
    
    var body: some Scene {
        WindowGroup {
           PantallaInicial()
                .environment(control)
        }
    }
}
