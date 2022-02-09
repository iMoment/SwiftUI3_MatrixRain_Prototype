//
//  MatrixRainView.swift
//  MatrixRain
//
//  Created by Stanley Pan on 2022/02/09.
//

import SwiftUI

struct MatrixRainView: View {
    
    // MARK: Animation Property
    @State var startAnimation: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            HStack(spacing: 15) {
                
                VStack {
                    // MARK: Iterating String
                    ForEach(0..<letters.count, id: \.self) { index in
                        // Retrieving Character at String
                        let character = Array(letters)[index]
                        
                        Text(String(character))
                            .font(.custom("matrixCode", size: 25))
                            .foregroundColor(Color("matrixGreen"))
                    }
                }
                .offset(y: startAnimation ? 0 : -size.height)
            }
            .padding(.horizontal)
        }
        .onAppear {
            // Move slowly down with linear animation
            withAnimation(.linear(duration: 12)) {
                startAnimation = true
            }
        }
    }
}

struct MatrixRainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: Random Characters
let letters = "abcdefghijklmnopqrstuvwxyzabcquepaje123jdj09"
