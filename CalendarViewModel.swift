import SwiftUI

class CalendarViewModel: ObservableObject {

    @Published var days: [DayEntry] = []

    var monthTitle: String = "Mars 2026"

    init() {
        for i in 1...31 {
            days.append(DayEntry(number: i, type: .repos))
        }
    }

    func previousMonth() {}
    func nextMonth() {}

    func color(for type: DayType) -> Color {

        switch type {

        case .jour:
            return Color.orange.opacity(0.5)

        case .nuit:
            return Color.purple.opacity(0.5)

        case .repos:
            return Color.gray.opacity(0.2)

        case .conges:
            return Color.green.opacity(0.5)

        case .autre:
            return Color.blue.opacity(0.5)
        }
    }
}