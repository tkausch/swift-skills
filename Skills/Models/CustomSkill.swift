import Foundation
import SwiftData

@Model
final class CustomSkill {
    var title: String
    var detail: String
    var icon: String
    var minLevel: Int
    var maxLevel: Int
    var createdAt: Date

    init(
        title: String,
        detail: String = "",
        icon: String = "star.fill",
        minLevel: Int = 0,
        maxLevel: Int = 10,
        createdAt: Date = .now
    ) {
        self.title = title
        self.detail = detail
        self.icon = icon
        self.minLevel = minLevel
        self.maxLevel = maxLevel
        self.createdAt = createdAt
    }

    func applies(toLevel level: Int) -> Bool {
        (minLevel...maxLevel).contains(level)
    }
}

enum CustomSkillIcons {
    static let choices = [
        "star.fill", "heart.fill", "leaf.fill", "flame.fill", "drop.fill",
        "moon.stars.fill", "sun.max.fill", "figure.walk", "figure.run",
        "music.note", "book.fill", "pencil", "cup.and.saucer.fill",
        "pawprint.fill", "gamecontroller.fill", "phone.fill", "message.fill",
        "bicycle", "gift.fill", "sparkles"
    ]
}
