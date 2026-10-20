import SwiftUI

struct TensionSliderView: View {
    @Binding var level: Int

    private var zone: TensionZone { TensionZone.zone(for: level) }

    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 28, style: .continuous)
                    .fill(zone.color.gradient)

                VStack(spacing: 4) {
                    Text("\(level)")
                        .font(.system(size: 56, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    Text(zone.name)
                        .font(.title3.weight(.semibold))
                        .foregroundStyle(.white.opacity(0.9))
                    Text(zone.subtitle)
                        .font(.footnote)
                        .foregroundStyle(.white.opacity(0.85))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.vertical, 24)
            }
            .frame(maxWidth: .infinity)
            .animation(.easeInOut(duration: 0.2), value: level)

            Slider(
                value: Binding(
                    get: { Double(level) },
                    set: { level = Int($0.rounded()) }
                ),
                in: 0...10,
                step: 1
            )
            .tint(zone.color)
            .padding(.horizontal)
            .accessibilityLabel("Anspannungsgrad")
            .accessibilityValue("\(level) von 10, Zone \(zone.name)")

            HStack(spacing: 8) {
                ForEach(TensionZone.all) { z in
                    VStack(spacing: 4) {
                        Capsule()
                            .fill(z.color)
                            .frame(height: 4)
                        Text("\(z.range.lowerBound)–\(z.range.upperBound)")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TensionSliderView(level: .constant(6))
        .padding()
}
