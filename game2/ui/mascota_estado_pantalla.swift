//
//  mascota_estado_pantalla.swift
//  game2
//
//  Created by alumno on 9/11/26.
//

import SwiftUI

struct MascotaEstado: View {

    @Environment(ControladorGeneral.self) var mascota

    var body: some View {

        VStack(spacing: 15) {

            switch mascota.estado {

            case .Neutro:
                vistaEstado(
                    emoji: "😊",
                    titulo: "Estoy feliz",
                    mensaje: "¡Todo está tranquilo!",
                    color: .green
                )

            case .Hambriento:
                vistaEstado(
                    emoji: "🥺",
                    titulo: "Tengo hambre",
                    mensaje: "¿Me das algo de comer?",
                    color: .orange
                )

            case .Inanición:
                vistaEstado(
                    emoji: "😵",
                    titulo: "¡Tengo mucha hambre!",
                    mensaje: "Necesito comida urgentemente",
                    color: .red
                )

            case .Adormilado:
                vistaEstado(
                    emoji: "😴",
                    titulo: "Tengo sueño",
                    mensaje: "Quiero dormir un ratito",
                    color: .purple
                )

            case .Muerte:
                vistaEstado(
                    emoji: "💀",
                    titulo: "Estoy muerto",
                    mensaje: "¡Se acabó la aventura!",
                    color: .gray
                )

            default:
                vistaEstado(
                    emoji: "❓",
                    titulo: "Estado desconocido",
                    mensaje: "No sé qué pasó",
                    color: .blue
                )
            }
        }
        .padding()
    }

    func vistaEstado(
        emoji: String,
        titulo: String,
        mensaje: String,
        color: Color
    ) -> some View {

        VStack(spacing: 12) {

            // Tu Digimon de Assets
            Image("Imagen1")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)

            // El emoji cambia según el estado
            Text(emoji)
                .font(.system(size: 45))

            Text(titulo)
                .font(.title2.bold())
                .foregroundStyle(color)

            Text(mensaje)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 25)
        .padding(.horizontal, 15)
        .background(color.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .overlay {
            RoundedRectangle(cornerRadius: 25)
                .stroke(color.opacity(0.5), lineWidth: 2)
        }
    }
}

#Preview {
    MascotaEstado()
        .environment(ControladorGeneral())
}
