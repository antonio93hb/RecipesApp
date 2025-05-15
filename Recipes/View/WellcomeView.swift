//
//  SpliceView.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 13/5/25.
//

import SwiftUI

struct WellcomeView: View {
    
    @State private var showContentView = false
    @State private var angle: Angle = .degrees(0)
    
    var body: some View {
        if showContentView {
            ContentView()
        } else {
            VStack {
                Text("Hi, Chef!")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text("Looking for new recipes?\nYou're in the right place!")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(
                            AngularGradient(
                                gradient: Gradient(colors: [
                                    .blue, .red, .blue
                                ]),
                                center: .center,
                                angle: angle
                            ),
                            lineWidth: 10
                        )
                        .blur(radius: 7)
                        .frame(width: 220, height: 55)
                        .onAppear{
                            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                                angle = .degrees(360)
                            }
                        }
                    Button {
                        showContentView = true
                    } label: {
                        Text("Press to continue")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .bold()
                            .frame(width: 220, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                    }
                    .padding()
                }
            }
            .padding()
        }
    }
}

#Preview {
    WellcomeView()
        .preview
}
