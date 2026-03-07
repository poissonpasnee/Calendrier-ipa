import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CalendarView()
                .navigationTitle("Planning SNCF")
        }
    }
}