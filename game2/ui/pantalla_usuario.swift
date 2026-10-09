//
//  pantalla_usuario.swift
//  game2
//
//  Created by alumno on 9/7/26.
//

import SwiftUI

struct PantallaInicial: View {

    @Environment(ControladorGeneral.self)
    var controlador_tamagotchi

    @State var nombre_nuevo = ""

    var body: some View {

        ZStack {
            Color(red: 0.04, green: 0.06, blue: 0.14)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 18) {

                    // Titulo
                    VStack(spacing: 5) {
                        Text("DIGITAL MONSTER")
                            .font(.system(size: 25, weight: .black))
                            .foregroundStyle(.cyan)

                        Text("TU DIGIMON")
                            .font(.system(size: 11, weight: .bold))
                            .tracking(3)
                            .foregroundStyle(.white.opacity(0.7))
                    }
                    .padding(.top, 15)

                    // Estado de la mascota
                    VStack(spacing: 12) {

                        Text("ESTADO DEL DIGIMON")
                            .font(.caption.bold())
                            .tracking(2)
                            .foregroundStyle(.cyan)

                        MascotaEstado()

                        Text("Estado: \(controlador_tamagotchi.estado)")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.08, green: 0.13, blue: 0.25))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.cyan.opacity(0.8), lineWidth: 2)
                    }

                    // Nombre
                    VStack(spacing: 12) {

                        Text("IDENTIFICACIÓN")
                            .font(.caption.bold())
                            .tracking(2)
                            .foregroundStyle(.cyan)

                        TextField(
                            "Nombre de tu Digimon",
                            text: $nombre_nuevo
                        )
                        .padding()
                        .background(Color.black.opacity(0.35))
                        .foregroundStyle(.white)
                        .tint(.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.blue.opacity(0.7), lineWidth: 1)
                        }

                        Button {
                            controlador_tamagotchi.cambiar_nombre(
                                nombre_nuevo
                            )
                        } label: {
                            Text("GUARDAR NOMBRE")
                                .font(.headline.bold())
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .buttonStyle(.plain)
                    }
                    .padding()
                    .background(Color(red: 0.07, green: 0.10, blue: 0.20))
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                    // Acciones
                    Text("COMANDOS")
                        .font(.headline.bold())
                        .tracking(3)
                        .foregroundStyle(.cyan)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(spacing: 12) {

                        botonDigimon("ACTUALIZAR ESTADO", icono: "arrow.clockwise") {
                            controlador_tamagotchi.actualizar_medidores()
                        }

                        botonDigimon("ALIMENTAR", icono: "fork.knife") {
                            controlador_tamagotchi.alimentar()
                        }

                        botonDigimon("ENTRETENER", icono: "gamecontroller") {
                            controlador_tamagotchi.entretener()
                        }

                        botonDigimon("DORMIR", icono: "moon.fill") {
                            controlador_tamagotchi.adormilar()
                        }

                        botonDigimon("DAR UN SAPE", icono: "hand.raised.fill") {
                            let comando = ComandoTamagotchi.darle_un_sape
                            controlador_tamagotchi.procesar_comando(comando)
                        }

                        botonDigimon("ELIMINAR DIGIMON", icono: "exclamationmark.triangle.fill") {
                            controlador_tamagotchi.matar()
                        }
                    }

                    Text("DIGITAL WORLD • CONNECTION ACTIVE")
                        .font(.system(size: 9, weight: .bold))
                        .tracking(2)
                        .foregroundStyle(.white.opacity(0.45))
                        .padding(.vertical, 10)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
            }
        }
        .preferredColorScheme(.dark)
    }

    func botonDigimon(
        _ titulo: String,
        icono: String,
        accion: @escaping () -> Void
    ) -> some View {

        Button(action: accion) {
            HStack(spacing: 12) {

                Image(systemName: icono)
                    .font(.title3.bold())
                    .foregroundStyle(.cyan)
                    .frame(width: 30)

                Text(titulo)
                    .font(.system(size: 14, weight: .bold))
                    .tracking(1)
                    .foregroundStyle(.white)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(.cyan)
                    .font(.caption.bold())
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 0.10, green: 0.18, blue: 0.34),
                        Color(red: 0.06, green: 0.10, blue: 0.22)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.cyan.opacity(0.55), lineWidth: 1)
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    PantallaInicial()
        .environment(ControladorGeneral())
}
