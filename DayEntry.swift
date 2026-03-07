import Foundation

enum DayType: String, Codable {
    case jour
    case nuit
    case repos
    case conges
    case autre
}

struct DayEntry: Codable, Identifiable {

    var id: UUID?
    var date: Date
    var type: DayType
    var note: String?
}