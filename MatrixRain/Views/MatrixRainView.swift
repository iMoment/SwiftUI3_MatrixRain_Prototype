//
//  MatrixRainView.swift
//  MatrixRain
//
//  Created by Stanley Pan on 2022/02/09.
//

import SwiftUI

struct MatrixRainView: View {
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            HStack(spacing: 15) {
                MatrixRainCharacters(size: size)
            }
            .padding(.horizontal)
        }
        
    }
}

struct MatrixRainCharacters: View {
    var size: CGSize
    // MARK: Animation Properties
    @State var startAnimation: Bool = false
    @State var randomCharacterIndex: Int = 0
    
    var body: some View {
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
        // Fade animation using mask
        .mask(alignment: .top) {
            Rectangle()
                .fill(
                    LinearGradient(colors: [
                        .clear,
                        .black.opacity(0.1),
                        .black.opacity(0.2),
                        .black.opacity(0.3),
                        .black.opacity(0.5),
                        .black.opacity(0.7),
                        .black
                    ], startPoint: .top, endPoint: .bottom)
                )
                .frame(height: size.height / 2)
            // Animating (to look like its coming from top)
                .offset(y: startAnimation ? size.height : -(size.height / 2))
        }
        .onAppear {
            // Move slowly down with linear animation
            // Endless loop without reversal
            withAnimation(.linear(duration: 12).repeatForever(autoreverses: false)) {
                startAnimation = true
            }
        }
    }
    
    // MARK: Change characters randomly using timer
    func getRandomIndex(index: Int) -> Int {
        return 0
    }
}

struct MatrixRainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: Random Characters
let letters = "ㅂㅈㄷㄱ쇼ㅕㅑㅐㅔㅁㄴㅇㄹ호ㅓㅏㅣㅋㅌㅊ퓨ㅜㅡㅂㅈㄷㄱ쇼ㅕㅑㅐㅔㅁㄴㅇㄹ호ㅓㅏㅣ"
