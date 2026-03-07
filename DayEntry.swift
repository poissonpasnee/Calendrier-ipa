import Foundation

enum DayType: String {
    case jour
    case nuit
    case repos
    case conges
    case autre
}

struct DayEntry: Identifiable {
    let id = UUID()
    let number: Int
    var type: DayType
}