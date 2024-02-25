//
//  LocationRow.swift
//  Lohabi
//
//  Created by Stefan de Gier on 25/02/2024.
//

import SwiftUI

struct LocationRow: View {
    var location: LocationInfo
    var isSelected: Bool
    var onTapped: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(BackgroundStyle())
                .shadow(radius: 0.5)
            HStack {
                Text("\(location.streetName), \(location.city)")
                    .padding()
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundColor(.blue)
                    .padding()
                    .opacity(isSelected ? 1 : 0)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: onTapped)
    }
}
