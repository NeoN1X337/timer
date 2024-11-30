//
//  SecondViewController.swift
//  Timer
//
//  Created by Алдияр Женисулы on 20.11.2024.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var finalLabel: UILabel! // Для отображения обратного отсчёта времени

    var startDate: Date?
    var endDate: Date?
    var timer = Timer()
    var isTimerRunning: Bool = false
    var currentAnimatingDate: Date? // Текущая анимируемая дата

    override func viewDidLoad() {
        super.viewDidLoad()

        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy, EEE HH:mm"

        if let startDate = startDate {
            startDateLabel.text = (formatter.string(from: startDate))
            currentAnimatingDate = startDate
        }

        if let endDate = endDate {
            endDateLabel.text = (formatter.string(from: endDate))
        }
        if let finalLabel = finalLabel {
            finalLabel.text = startDateLabel.text
        }
    }

    @objc func updateTime() {
        guard let startDate = startDate, let endDate = endDate, let currentAnimatingDate = currentAnimatingDate else { return }

        // Если достигли конечной даты, останавливаем таймер
        if currentAnimatingDate >= endDate {
            timer.invalidate()
            isTimerRunning = false
            finalLabel.text = "Timer Finished"
            return
        }

        let nextAnimatingDate = currentAnimatingDate.addingTimeInterval(3600) // Добавляем 1 час
        self.currentAnimatingDate = nextAnimatingDate

        // Обновляем текст лейбла
        finalLabel.text = formatDate(date: nextAnimatingDate)
    }

    @IBAction func startTimer(_ sender: Any) {
        guard !isTimerRunning else { return }

        timer = Timer.scheduledTimer(timeInterval: 0.1,target: self,selector: #selector(updateTime),userInfo: nil,repeats: true)
        isTimerRunning = true
    }

    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }

    @IBAction func restartTimer(_ sender: Any) {
        guard let startDate = startDate else { return }

        timer.invalidate()
        isTimerRunning = false
        currentAnimatingDate = startDate
        finalLabel.text = formatDate(date: startDate)
    }

    // Форматирование даты в "24 November 2024, Sun 13:50"
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy, EEE HH:mm"
        return formatter.string(from: date)
    }
}



