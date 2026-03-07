import SwiftUI

struct CalendarView: View {

    @StateObject var vm = CalendarViewModel()

    let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {

        VStack {

            HStack {
                Button("<") { vm.previousMonth() }
                Spacer()
                Text(vm.monthTitle)
                    .font(.headline)
                Spacer()
                Button(">") { vm.nextMonth() }
            }
            .padding()

            LazyVGrid(columns: columns) {

                ForEach(vm.days) { day in

                    NavigationLink(destination: DayDetailView(day: day)) {

                        Text("\(day.number)")
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(vm.color(for: day.type))
                            .cornerRadius(10)
                    }

                }
            }

            Spacer()

        }
        .padding()

    }
}