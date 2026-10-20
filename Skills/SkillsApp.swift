import SwiftUI
import SwiftData

@main
struct SkillsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: CustomSkill.self)
    }
}
