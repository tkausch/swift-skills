import Foundation

struct StandardSkill: Identifiable, Hashable {
    var id: String { title }
    let title: String
    let detail: String
    let icon: String
}
