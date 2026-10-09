//
//  vista_jeep.swift
//  game2
//
//  Created by alumno on 9/21/26.
//
import SwiftUI

struct VistaJeep: View {

    var texto: String

    var body: some View {

        HStack(spacing: 12) {

            Image(systemName: "bolt.fill")
                .foregroundStyle(.cyan)
                .font(.title3)

            Spacer()

            Text(texto.uppercased())
                .font(.headline.bold())
                .tracking(1)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.cyan)
                .font(.headline.bold())
        }
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.10, green: 0.20, blue: 0.40),
                    Color(red: 0.03, green: 0.07, blue: 0.18)
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.cyan, lineWidth: 1.5)
        }
        .shadow(
            color: .cyan.opacity(0.25),
            radius: 5,
            x: 0,
            y: 0
        )
        .padding(.horizontal, 4)
    }
}

#Preview {
    ZStack {
        Color(red: 0.03, green: 0.05, blue: 0.12)
            .ignoresSafeArea()

        VStack(spacing: 15) {
            VistaJeep(texto: "Cambiar nombre")
            VistaJeep(texto: "Alimentar mascota")
            VistaJeep(texto: "Actualizar Digimon")
            VistaJeep(texto: "Jugar")
        }
        .padding()
    }
    .preferredColorScheme(.dark)
}
