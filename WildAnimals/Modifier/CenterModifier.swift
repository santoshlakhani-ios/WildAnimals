//
//  CenterModifier.swift
//  WildAnimals
//
//  Created by Santosh Lakhani on 09/03/24.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
