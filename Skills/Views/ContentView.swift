import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \CustomSkill.createdAt) private var customSkills: [CustomSkill]
    @State private var level: Int = 5
    @State private var showingManageSheet = false
    private let preferences = StandardSkillsPreferences.shared

    private var zone: TensionZone { TensionZone.zone(for: level) }

    private var matchingCustomSkills: [CustomSkill] {
        customSkills.filter { $0.applies(toLevel: level) }
    }

    private var enabledStandardSkills: [StandardSkill] {
        StandardSkillsData.skills(for: zone.id).filter { preferences.isEnabled($0, in: zone.id) }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    TensionSliderView(level: $level)
                        .padding(.horizontal)
                        .padding(.top, 8)

                    if zone.id == .krise {
                        CrisisContactsCard()
                            .padding(.horizontal)
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        sectionHeader("Vorschläge für diese Stufe")

                        if enabledStandardSkills.isEmpty {
                            Button {
                                showingManageSheet = true
                            } label: {
                                Text("Keine Vorschläge ausgewählt. Tippe hier, um Skills anzupassen.")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                            }
                            .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .padding(.horizontal)
                        } else {
                            VStack(spacing: 0) {
                                ForEach(enabledStandardSkills) { skill in
                                    SkillRowView(icon: skill.icon, title: skill.title, detail: skill.detail, tint: zone.color)
                                    if skill.id != enabledStandardSkills.last?.id {
                                        Divider().padding(.leading, 46)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .padding(.horizontal)
                        }
                    }

                    if !matchingCustomSkills.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            sectionHeader("Meine eigenen Skills")

                            VStack(spacing: 0) {
                                ForEach(matchingCustomSkills) { skill in
                                    SkillRowView(icon: skill.icon, title: skill.title, detail: skill.detail, tint: zone.color)
                                    if skill.id != matchingCustomSkills.last?.id {
                                        Divider().padding(.leading, 46)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.bottom, 24)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Skillen")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingManageSheet = true
                    } label: {
                        Label("Skills anpassen", systemImage: "slider.horizontal.3")
                    }
                }
            }
            .sheet(isPresented: $showingManageSheet) {
                ManageSkillsView()
            }
        }
    }

    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.headline)
            .padding(.horizontal)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: CustomSkill.self, inMemory: true)
}
