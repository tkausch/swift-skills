import SwiftUI

enum ZoneID: String, CaseIterable, Codable {
    case ruhig
    case erhoeht
    case hoch
    case krise
}

struct TensionZone: Identifiable, Equatable {
    let id: ZoneID
    let range: ClosedRange<Int>
    let name: String
    let subtitle: String
    let color: Color

    static let all: [TensionZone] = [
        TensionZone(
            id: .ruhig,
            range: 0...3,
            name: "Ruhig",
            subtitle: "Stabil – Raum für Alltag & Aufbau",
            color: .green
        ),
        TensionZone(
            id: .erhoeht,
            range: 4...6,
            name: "Erhöht",
            subtitle: "Angespannt – Zeit gegenzusteuern",
            color: .yellow
        ),
        TensionZone(
            id: .hoch,
            range: 7...8,
            name: "Hoch",
            subtitle: "Starker Drang – schnell wirksame Skills",
            color: .orange
        ),
        TensionZone(
            id: .krise,
            range: 9...10,
            name: "Krise",
            subtitle: "Notfall – Sicherheit hat Vorrang",
            color: .red
        )
    ]

    static func zone(for level: Int) -> TensionZone {
        all.first { $0.range.contains(level) } ?? all[0]
    }

    static func zone(for id: ZoneID) -> TensionZone {
        all.first { $0.id == id } ?? all[0]
    }
}
