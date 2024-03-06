//
//  LohabTile.swift
//  Lohabi
//
//  Created by Stefan de Gier on 03/03/2024.
//

import SwiftUI

struct LohabiSectionTile <Content: View>: View {
    let content: Content
    var title: LocalizedStringKey?
    var titleDynamic: String?
    
    init(title: LocalizedStringKey? = nil, titleDynamic: String? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.titleDynamic = titleDynamic
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 16, content: {
            if let actualTitle = actualTitle {
                Text(actualTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                    .bold()
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            content
        })
        .padding(16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .edgesIgnoringSafeArea(.all)
    }
    
    private var actualTitle: LocalizedStringKey? {
        if let title = title {
            return title
        } else if let titleDynamic = titleDynamic {
            return LocalizedStringKey(titleDynamic)
        } else {
            return nil
        }
    }
    
}
