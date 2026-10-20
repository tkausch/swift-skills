// Standard-Skills, ergänzt um Skills aus der „Konkreten Skillsammlung“ der Fachklinik Allgäu.
// Zuordnung der Stufen 0–10 zu den Zonen:
//   .ruhig   = 0–3
//   .erhoeht = 4–6
//   .hoch    = 7–8
//   .krise   = 9–10
// Icons: SF Symbols, mindestens iOS 16.

enum StandardSkillsData {
    static let skills: [ZoneID: [StandardSkill]] = [

        // MARK: - Ruhig (0–3): vorbeugen, üben, ordnen
        .ruhig: [
            StandardSkill(title: "Kurzer Spaziergang", detail: "Frische Luft und Bewegung stabilisieren.", icon: "figure.walk"),
            StandardSkill(title: "Tagebuch schreiben", detail: "Gedanken sortieren, bevor sie sich stauen.", icon: "pencil.and.outline"),
            StandardSkill(title: "Musik hören", detail: "Bewusst einen Song auswählen, der guttut.", icon: "music.note"),
            StandardSkill(title: "Dankbarkeitsliste", detail: "Drei Dinge notieren, die heute gut liefen.", icon: "list.bullet.clipboard"),
            StandardSkill(title: "Aufräumen", detail: "Ein kleiner Bereich, ein klarerer Kopf.", icon: "house"),
            StandardSkill(title: "Kreatives Hobby", detail: "Zeichnen, Basteln, Musizieren oder ein Mandala ausmalen.", icon: "paintpalette"),
            StandardSkill(title: "Geräusche wahrnehmen", detail: "Eine Minute nur hinhören: Was ist gerade um mich herum?", icon: "ear"),
            StandardSkill(title: "Achtsam Tee trinken", detail: "Wärme, Duft und Geschmack bewusst wahrnehmen.", icon: "cup.and.saucer"),
            StandardSkill(title: "Gefühlsprotokoll", detail: "Gefühl, Auslöser und Körperreaktion kurz notieren.", icon: "heart.text.square"),
            StandardSkill(title: "Pro-und-Contra-Liste", detail: "Eine Entscheidung auf Papier bringen statt im Kopf wälzen.", icon: "list.bullet"),
            StandardSkill(title: "Etwas Schönes planen", detail: "Einen Ausflug oder eine Stunde nur für dich.", icon: "calendar"),
            StandardSkill(title: "Um etwas bitten oder Nein sagen", detail: "Ein Anliegen klar in Ich-Botschaften formulieren.", icon: "person.2"),
            StandardSkill(title: "Entspannung trainieren", detail: "Muskelentspannung üben, solange es ruhig ist. So wirkt sie später besser.", icon: "figure.mind.and.body"),
            StandardSkill(title: "Bad oder Fussbad", detail: "Warmes Wasser und Zeit für dich.", icon: "bathtub"),
            StandardSkill(title: "Meditieren", detail: "Hinsetzen, eine Kerze anzünden und versuchen, an nichts zu denken.", icon: "sparkles"),
            StandardSkill(title: "Notfallkoffer packen", detail: "Kleine Hilfsmittel für schwierige Momente zusammenstellen.", icon: "cross.case")
        ],

        // MARK: - Erhöht (4–6): Sinne, Ablenkung, Kopf beschäftigen
        .erhoeht: [
            StandardSkill(title: "Atemübung 4-7-8", detail: "4 Sek. einatmen, 7 halten, 8 ausatmen.", icon: "wind"),
            StandardSkill(title: "Kurze Bewegungseinheit", detail: "5 Minuten zügig gehen oder Treppen steigen.", icon: "figure.run"),
            StandardSkill(title: "Mit jemandem sprechen", detail: "Anruf oder Nachricht an eine vertraute Person.", icon: "bubble.left.and.bubble.right"),
            StandardSkill(title: "Progressive Muskelentspannung", detail: "Muskelgruppen nacheinander anspannen und lösen.", icon: "figure.mind.and.body"),
            StandardSkill(title: "Ablenkung durch Rätsel", detail: "Sudoku, Kreuzworträtsel oder ein Buch.", icon: "puzzlepiece"),
            StandardSkill(title: "Warme Hände", detail: "Hände an eine Tasse oder Wärmflasche legen und die Wärme spüren.", icon: "hand.raised"),
            StandardSkill(title: "Etwas Schönes anschauen", detail: "Fotos, Blumen, Wolken, ein Aquarium oder ein Bildband.", icon: "eye"),
            StandardSkill(title: "Beruhigende Klänge", detail: "Wellenrauschen, Vogelgezwitscher oder Meditationsmusik.", icon: "ear"),
            StandardSkill(title: "Lieblingsduft", detail: "Parfum, Duftkerze oder frische Bettwäsche bewusst riechen.", icon: "nose"),
            StandardSkill(title: "Etwas Weiches fühlen", detail: "Flauschdecke, Stofftier oder ein Haustier streicheln.", icon: "pawprint"),
            StandardSkill(title: "Kochen", detail: "Schritt für Schritt ein einfaches Rezept umsetzen.", icon: "fork.knife"),
            StandardSkill(title: "Stadt-Land-Fluss", detail: "Allein im Kopf durchs Alphabet spielen.", icon: "textformat.abc"),
            StandardSkill(title: "Rückwärts zählen", detail: "Von 100 in 7er-Schritten rückwärts zählen.", icon: "number"),
            StandardSkill(title: "Mit der anderen Hand schreiben", detail: "Einen kurzen Text mit der ungewohnten Hand abschreiben.", icon: "pencil"),
            StandardSkill(title: "Sicherer Ort", detail: "Einen Ort vorstellen, an dem du dich geborgen fühlst, mit allen Sinnen.", icon: "leaf"),
            StandardSkill(title: "Gedankenstopp", detail: "Innerlich Stopp sagen und die Aufmerksamkeit bewusst wechseln.", icon: "stop.circle"),
            StandardSkill(title: "Entgegengesetzt handeln", detail: "Tun, was das Gefühl gerade nicht will, zum Beispiel rausgehen statt zurückziehen.", icon: "arrow.uturn.backward"),
            StandardSkill(title: "Leichtes Lächeln", detail: "Gesicht entspannen und die Mundwinkel leicht anheben.", icon: "face.smiling")
        ],

        // MARK: - Hoch (7–8): Bewegung und Körper kraftvoll spüren
        .hoch: [
            StandardSkill(title: "Intensive Bewegung", detail: "Hampelmänner, Treppen steigen oder ein kurzer Sprint.", icon: "figure.strengthtraining.traditional"),
            StandardSkill(title: "Igelball fest drücken", detail: "Einen Igelball, Knetgummi oder Wutball kraftvoll drücken und kneten.", icon: "hand.raised.fill"),
            StandardSkill(title: "Laute Musik", detail: "Bewusst einen intensiven Sound wählen, gern über Kopfhörer.", icon: "speaker.wave.3"),
            StandardSkill(title: "Muskeln anspannen und loslassen", detail: "Fäuste ballen, Arme anspannen, 5 Sekunden halten, dann lösen.", icon: "figure.cooldown"),
            StandardSkill(title: "Wandsitz", detail: "Rücken an die Wand, Knie im 90°-Winkel, so lange halten wie möglich.", icon: "figure.core.training"),
            StandardSkill(title: "Etwas Schweres tragen", detail: "Wasserkiste, Rucksack oder Einkäufe schleppen.", icon: "scalemass"),
            StandardSkill(title: "Rennen oder Velo fahren", detail: "Raus und in Bewegung bleiben, bis es nachlässt.", icon: "bicycle"),
            StandardSkill(title: "Tanzen", detail: "Ein lautes Lied und freie Bewegung.", icon: "figure.dance"),
            StandardSkill(title: "Jonglieren", detail: "Braucht volle Konzentration und beide Hände.", icon: "circle.circle"),
            StandardSkill(title: "Gewicht auf den Bauch", detail: "Ein Sandsack oder eine schwere Decke gibt Halt.", icon: "bed.double"),
            StandardSkill(title: "Barfuss laufen", detail: "Den Boden unter den Füssen bewusst spüren.", icon: "shoeprints.fill"),
            StandardSkill(title: "Trommeln", detail: "Auf Tisch, Kissen oder Trommel einen Rhythmus schlagen.", icon: "music.quarternote.3"),
            StandardSkill(title: "Atemzüge zählen", detail: "Einatmen, auf 4 zählen, ganz langsam ausatmen. Bis 10 zählen, dann neu beginnen.", icon: "lungs")
        ],

        // MARK: - Krise (9–10): Druck ablassen, Halt holen, Sicherheit
        .krise: [
            StandardSkill(title: "Kurzer, intensiver Sport", detail: "1–2 Minuten alles geben, dann bewusst abbrechen.", icon: "figure.run.circle"),
            StandardSkill(title: "Paced Breathing", detail: "Länger ausatmen als einatmen, mehrere Minuten lang.", icon: "lungs.fill"),
            StandardSkill(title: "Notfallkontakt anrufen", detail: "Eine vertraute Person oder Die Dargebotene Hand (143) anrufen.", icon: "phone.fill"),
            StandardSkill(title: "Sicherheit priorisieren", detail: "Gefährliche Gegenstände ausser Reichweite bringen.", icon: "shield.fill"),
            StandardSkill(title: "Papier zerreissen", detail: "Zeitung oder altes Papier zerknüllen und zerreissen.", icon: "scissors"),
            StandardSkill(title: "Handtuch aufs Bett schlagen", detail: "Einen Knoten ins Handtuch machen und kräftig aufs Bett oder ein Kissen schlagen.", icon: "bed.double.fill"),
            StandardSkill(title: "Laut schreien", detail: "An einem sicheren Ort, zum Beispiel im Wald oder in ein Kissen.", icon: "megaphone"),
            StandardSkill(title: "Boxen", detail: "Gegen einen Boxsack oder ein Kissen.", icon: "figure.boxing"),
            StandardSkill(title: "Elefanten-Atmung", detail: "Beim Ausatmen den Oberkörper langsam nach vorne sinken lassen.", icon: "arrow.down"),
            StandardSkill(title: "Umarmung", detail: "Jemanden um eine feste Umarmung bitten oder dich selbst umarmen.", icon: "heart.fill"),
            StandardSkill(title: "Notfallkoffer öffnen", detail: "Spruch, Foto oder einen Gegenstand von einem Lieblingsmenschen in die Hand nehmen.", icon: "cross.case.fill"),
            StandardSkill(title: "Step-by-Step", detail: "Nur an den allernächsten Schritt denken, nicht weiter.", icon: "list.number")
        ]
    ]

    static func skills(for zone: ZoneID) -> [StandardSkill] {
        skills[zone] ?? []
    }
}

