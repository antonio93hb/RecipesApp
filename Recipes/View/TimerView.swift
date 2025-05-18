//
//  TimerView.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 14/5/25.
//


import SwiftUI

struct TimerView: View {
    
    @Environment(TimerViewModel.self) private var timerViewModel
    
    var body: some View {
        
        
        VStack(spacing: 30) {
            Text("⏱️ Cooking Timer")
                .font(.title)
                .bold()
                .padding(.top, 40)
            
            Text(timerViewModel.timeString(from: timerViewModel.timeRemaining))
                .monospaced()
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .bold()
                .foregroundStyle(.primary)
            
            HStack{
                Text("Minutes \(Int(timerViewModel.timerDataModel.totalMinutes))")
                    .font(.title2)
                Spacer()
                
                TimerControlButton(systemName: "minus") {
                    if timerViewModel.timerDataModel.totalMinutes > 1 {
                        timerViewModel.timerDataModel.totalMinutes -= 1
                        timerViewModel.timeRemaining = timerViewModel.timerDataModel.totalMinutes * 60
                    }
                }
                .disabled(!timerViewModel.timerDataModel.isPaused)
                
                TimerControlButton(systemName: "plus") {
                    timerViewModel.timerDataModel.totalMinutes += 1
                    timerViewModel.timeRemaining = timerViewModel.timerDataModel.totalMinutes * 60

                }
                .disabled(!timerViewModel.timerDataModel.isPaused)
                
            }
            .padding(.vertical, 30)
            .padding(.horizontal, 50)
            
            HStack{

                ActionCircleButton(systemName: timerViewModel.timerDataModel.isPaused ? "play" : "pause", color: timerViewModel.timerDataModel.isPaused ? .green : .gray) {
                    timerViewModel.toggleTimer()
                }
                
                ActionCircleButton(systemName: "arrow.trianglehead.clockwise", color: .red) {
                    timerViewModel.resetTimer()
                }
            }
        }
    }
}

// MARK: - Botones reutilizables
struct TimerControlButton: View {
    let systemName : String
    let action : () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .padding()
                .background(.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct ActionCircleButton: View {
    let systemName : String
    let color: Color
    let action : () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()
                .foregroundStyle(.white)
                .background(color)
                .clipShape(Circle())
        }
        .shadow(color: .black, radius: 10, x: 0, y: 10)
    }
}

#Preview {
    TimerView()
        .environment(TimerViewModel())
}
