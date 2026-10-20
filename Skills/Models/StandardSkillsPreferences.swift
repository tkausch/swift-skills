import Foundation

// Merkt sich pro Zone, welche Standard-Skill-Vorschläge angezeigt werden.
// Ohne gespeicherte Auswahl werden je Zone die ersten 4 Vorschläge aktiviert.
@Observable
final class StandardSkillsPreferences {
    static let shared = StandardSkillsPreferences()

    private static let defaultsKey = "enabledStandardSkillsByZone"
    private static let defaultEnabledCount = 4

    private(set) var enabledTitles: [ZoneID: Set<String>]

    private init() {
        enabledTitles = Self.loadFromDefaults() ?? Self.defaultEnabledTitles()
    }

    func isEnabled(_ skill: StandardSkill, in zone: ZoneID) -> Bool {
        enabledTitles[zone]?.contains(skill.title) ?? false
    }

    func setEnabled(_ isEnabled: Bool, for skill: StandardSkill, in zone: ZoneID) {
        var titles = enabledTitles[zone] ?? []
        if isEnabled {
            titles.insert(skill.title)
        } else {
            titles.remove(skill.title)
        }
        enabledTitles[zone] = titles
        persist()
    }

    private static func defaultEnabledTitles() -> [ZoneID: Set<String>] {
        var result: [ZoneID: Set<String>] = [:]
        for zone in ZoneID.allCases {
            let titles = StandardSkillsData.skills(for: zone).prefix(defaultEnabledCount).map(\.title)
            result[zone] = Set(titles)
        }
        return result
    }

    private static func loadFromDefaults() -> [ZoneID: Set<String>]? {
        guard let data = UserDefaults.standard.data(forKey: defaultsKey),
              let decoded = try? JSONDecoder().decode([String: [String]].self, from: data) else {
            return nil
        }
        var result: [ZoneID: Set<String>] = [:]
        for (rawZone, titles) in decoded {
            guard let zone = ZoneID(rawValue: rawZone) else { continue }
            result[zone] = Set(titles)
        }
        return result
    }

    private func persist() {
        let encodable = Dictionary(uniqueKeysWithValues: enabledTitles.map { ($0.key.rawValue, Array($0.value)) })
        guard let data = try? JSONEncoder().encode(encodable) else { return }
        UserDefaults.standard.set(data, forKey: Self.defaultsKey)
    }
}
