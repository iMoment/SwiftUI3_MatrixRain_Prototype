//
//  ContentView.swift
//  MatrixRain
//
//  Created by Stanley Pan on 2022/02/09.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.black
            
            MatrixRainView()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
