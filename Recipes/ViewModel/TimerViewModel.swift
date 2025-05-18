//
//  TimerViewModel.swift
//  Recipes
//
//  Created by Antonio Hernández Barbadilla on 17/5/25.
//

import Foundation
import SwiftUI

@Observable
final class TimerViewModel {

    var timerDataModel: TimerDataModel
    var timeRemaining: TimeInterval = 0
    var timer: Timer?
    
    init(totalMinutes: Double = 10) {
        self.timerDataModel = TimerDataModel(totalMinutes: totalMinutes, isPaused: true, startDate: nil)
        timeRemaining = timerDataModel.totalMinutes * 60
    }
    
    func timeString(from time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func startTimer() {
        guard timer == nil else { return }
        
        timerDataModel.isPaused = false
        timerDataModel.startDate = Date()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            
            guard let self = self else { return }
            
            self.timeRemaining -= 1
            
            if self.timeRemaining <= 0 {
                self.pauseTimer()
            }
        }
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
        timerDataModel.isPaused = true
    }
    
    func resetTimer() {
        pauseTimer()
        timeRemaining = timerDataModel.totalMinutes * 60
    }
    
    func stopTimer() {
        
    }
    
    func toggleTimer() {
        timerDataModel.isPaused ? startTimer() : pauseTimer()
    }
}
