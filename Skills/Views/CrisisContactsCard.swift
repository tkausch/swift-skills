import SwiftUI

struct CrisisContactsCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Bei akuter Gefahr", systemImage: "exclamationmark.triangle.fill")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.red)

            Text("Wenn du in Sicherheit bist, aber Hilfe brauchst, sind diese Anlaufstellen rund um die Uhr erreichbar.")
                .font(.caption)
                .foregroundStyle(.secondary)

            VStack(spacing: 8) {
                contactLink(title: "Die Dargebotene Hand", subtitle: "kostenlos & anonym, 24/7", number: "143")
                contactLink(title: "Notruf", subtitle: "akute Notfälle", number: "112")
            }
        }
        .padding()
        .background(Color.red.opacity(0.1), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Color.red.opacity(0.25), lineWidth: 1)
        )
    }

    private func contactLink(title: String, subtitle: String, number: String) -> some View {
        let digits = number.filter(\.isNumber)
        return Link(destination: URL(string: "tel:\(digits)")!) {
            HStack {
                VStack(alignment: .leading, spacing: 1) {
                    Text(title).font(.footnote.weight(.medium))
                    Text(subtitle).font(.caption2).foregroundStyle(.secondary)
                }
                Spacer()
                Text(number)
                    .font(.footnote.weight(.semibold))
                Image(systemName: "phone.circle.fill")
                    .foregroundStyle(.red)
            }
            .padding(10)
            .background(Color(.systemBackground), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CrisisContactsCard()
        .padding()
}
