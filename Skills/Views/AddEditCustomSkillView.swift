import SwiftUI
import SwiftData

struct AddEditCustomSkillView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    let skill: CustomSkill?

    @State private var title: String
    @State private var detail: String
    @State private var icon: String
    @State private var minLevel: Int
    @State private var maxLevel: Int

    init(skill: CustomSkill?) {
        self.skill = skill
        _title = State(initialValue: skill?.title ?? "")
        _detail = State(initialValue: skill?.detail ?? "")
        _icon = State(initialValue: skill?.icon ?? "star.fill")
        _minLevel = State(initialValue: skill?.minLevel ?? 0)
        _maxLevel = State(initialValue: skill?.maxLevel ?? 10)
    }

    private var isValid: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && minLevel <= maxLevel
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Skill") {
                    TextField("Titel", text: $title)
                    TextField("Beschreibung (optional)", text: $detail, axis: .vertical)
                        .lineLimit(2...4)
                }

                Section("Symbol") {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), spacing: 12) {
                        ForEach(CustomSkillIcons.choices, id: \.self) { symbol in
                            Button {
                                icon = symbol
                            } label: {
                                Image(systemName: symbol)
                                    .font(.title3)
                                    .frame(width: 40, height: 40)
                                    .background(
                                        icon == symbol ? Color.accentColor.opacity(0.2) : Color(.tertiarySystemFill),
                                        in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    )
                                    .foregroundStyle(icon == symbol ? Color.accentColor : Color.primary)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.vertical, 4)
                }

                Section {
                    Stepper("Von Stufe \(minLevel)", value: $minLevel, in: 0...10)
                    Stepper("Bis Stufe \(maxLevel)", value: $maxLevel, in: 0...10)
                } header: {
                    Text("Gültig für Anspannungsgrad")
                } footer: {
                    if minLevel > maxLevel {
                        Text("Die untere Stufe darf nicht größer als die obere sein.")
                            .foregroundStyle(.red)
                    } else {
                        Text("Dieser Skill wird bei Stufe \(minLevel) bis \(maxLevel) vorgeschlagen.")
                    }
                }
            }
            .navigationTitle(skill == nil ? "Neuer Skill" : "Skill bearbeiten")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Abbrechen") { dismiss() }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Sichern") { save() }
                        .disabled(!isValid)
                }
            }
        }
    }

    private func save() {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedDetail = detail.trimmingCharacters(in: .whitespacesAndNewlines)

        if let skill {
            skill.title = trimmedTitle
            skill.detail = trimmedDetail
            skill.icon = icon
            skill.minLevel = minLevel
            skill.maxLevel = maxLevel
        } else {
            let newSkill = CustomSkill(
                title: trimmedTitle,
                detail: trimmedDetail,
                icon: icon,
                minLevel: minLevel,
                maxLevel: maxLevel
            )
            modelContext.insert(newSkill)
        }

        dismiss()
    }
}

#Preview {
    AddEditCustomSkillView(skill: nil)
        .modelContainer(for: CustomSkill.self, inMemory: true)
}
