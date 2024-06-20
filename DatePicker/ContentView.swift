import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    @State private var originalDate = Date() // Pour stocker la date d'origine en cas d'annulation

    var body: some View {
        VStack {
            Text("Sélectionnez une date :")
                .font(.headline)
                .padding()

            DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .accentColor(.orange) // Changer la couleur de la date sélectionnée
                .padding()

            Text("Date sélectionnée : \(selectedDate, formatter: dateFormatter)")
                .font(.headline)
                .foregroundColor(.orange) // Changer la couleur du texte de la date sélectionnée
                .padding()

            CustomButton(title: "Confirmer", action: {
                // Confirmer : enregistrer la date sélectionnée
                originalDate = selectedDate
                // Vous pouvez ajouter ici le code pour enregistrer la date dans votre modèle de données ou effectuer d'autres actions nécessaires
            }, isFilled: true)
            
            CustomButton(title: "Annuler", action: {
                // Annuler : réinitialiser la date à sa valeur d'origine
                selectedDate = originalDate
            }, isFilled: false)

            Spacer()
        }
        .padding()
        .environment(\.locale, Locale(identifier: "fr_FR")) // Définir la langue française par défaut
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}

struct CustomButton: View {
    let title: String
    let action: () -> Void
    let isFilled: Bool

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(isFilled ? .white : .orange)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isFilled ? Color.orange : Color.clear)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: isFilled ? 0 : 2)
                )
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
