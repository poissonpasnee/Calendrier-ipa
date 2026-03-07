import SwiftUI

@MainActor
class CalendarViewModel: ObservableObject {

    @Published var days: [DayEntry] = []

    func load() async {

        do {
            days = try await SupabaseService.shared.fetchDays()
        } catch {
            print(error)
        }
    }

    func color(for type: DayType) -> Color {

        switch type {

        case .jour:
            return Color.orange.opacity(0.4)

        case .nuit:
            return Color.purple.opacity(0.5)

        case .repos:
            return Color.gray.opacity(0.2)

        case .conges:
            return Color.green.opacity(0.4)

        case .autre:
            return Color.blue.opacity(0.4)
        }
    }

    func dayNumber(_ day: DayEntry) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: day.date)
    }
}