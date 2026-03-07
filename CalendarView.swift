import SwiftUI

struct CalendarView: View {

    @StateObject var vm = CalendarViewModel()

    let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {

        VStack {

            MonthHeaderView(vm: vm)

            LazyVGrid(columns: columns, spacing: 10) {

                ForEach(vm.days) { day in

                    NavigationLink(destination: DayDetailView(day: day)) {

                        Text(vm.dayNumber(day))
                            .frame(height: 42)
                            .frame(maxWidth: .infinity)
                            .background(vm.color(for: day.type))
                            .cornerRadius(12)
                    }
                }
            }

            Spacer()
        }
        .padding()
        .task {
            await vm.load()
        }
    }
}