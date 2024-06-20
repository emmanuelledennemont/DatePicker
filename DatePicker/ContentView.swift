import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()

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
                .foregroundStyle(.orange) // Changer la couleur du texte de la date sélectionnée
                .padding()

            Spacer()
        }
        .padding()
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}

#Preview {
ContentView()
}
