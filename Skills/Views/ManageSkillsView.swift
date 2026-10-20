import SwiftUI
import SwiftData

struct ManageSkillsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \CustomSkill.createdAt) private var customSkills: [CustomSkill]

    @State private var showingAddSheet = false
    @State private var editingSkill: CustomSkill?
    @State private var selectedZone: ZoneID = .ruhig
    private let preferences = StandardSkillsPreferences.shared

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Picker("Stufe", selection: $selectedZone) {
                        ForEach(TensionZone.all) { zone in
                            Text(zone.name).tag(zone.id)
                        }
                    }
                    .pickerStyle(.segmented)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical, 4)

                    ForEach(StandardSkillsData.skills(for: selectedZone)) { skill in
                        Toggle(isOn: Binding(
                            get: { preferences.isEnabled(skill, in: selectedZone) },
                            set: { preferences.setEnabled($0, for: skill, in: selectedZone) }
                        )) {
                            HStack(spacing: 10) {
                                Image(systemName: skill.icon)
                                    .foregroundStyle(Color.accentColor)
                                    .frame(width: 24)
                                Text(skill.title)
                                    .font(.subheadline)
                            }
                        }
                    }
                } header: {
                    Text("Vorschläge für diese Stufe")
                } footer: {
                    Text("Wähle aus, welche Vorschläge dir bei dieser Stufe angezeigt werden.")
                }

                Section {
                    if customSkills.isEmpty {
                        Text("Noch keine eigenen Skills.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(customSkills) { skill in
                            Button {
                                editingSkill = skill
                            } label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack(spacing: 10) {
                                        Image(systemName: skill.icon)
                                            .foregroundStyle(Color.accentColor)
                                            .frame(width: 24)
                                        Text(skill.title)
                                            .font(.subheadline.weight(.medium))
                                    }
                                    Text("Stufe \(skill.minLevel)–\(skill.maxLevel)")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                        .padding(.leading, 34)
                                }
                            }
                            .tint(.primary)
                        }
                        .onDelete(perform: deleteSkills)
                    }
                } header: {
                    Text("Eigene Skills")
                }
            }
            .navigationTitle("Skills anpassen")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Fertig") { dismiss() }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddSheet = true
                    } label: {
                        Label("Skill hinzufügen", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddEditCustomSkillView(skill: nil)
            }
            .sheet(item: $editingSkill) { skill in
                AddEditCustomSkillView(skill: skill)
            }
        }
    }

    private func deleteSkills(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(customSkills[index])
        }
    }
}

#Preview {
    ManageSkillsView()
        .modelContainer(for: CustomSkill.self, inMemory: true)
}
