import SwiftUI

struct DashboardSection: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                DashboardCard(
                    icon: "dollarsign.circle",
                    title: "Сумма инвентаря",
                    description: "1,212,121"
                )
                .foregroundColor(Color(.accent))
                
                DashboardCard(
                    icon: "tray.full.fill",
                    title: "Всего кол-во",
                    description: "12"
                )
                .foregroundColor(.purple)
                .button {
                    router.push(.items(navTitle: "Всего кол-во"))
                }
            }
            
            HStack(spacing: 8) {
                DashboardCard(
                    icon: "exclamationmark.circle.fill",
                    title: "Малое кол-во",
                    description: "2"
                )
                .foregroundColor(.yellow)
                .button {
                    router.push(.items(navTitle: "Малое кол-во"))
                }
                
                DashboardCard(
                    icon: "exclamationmark.circle.fill",
                    title: "Закончилось",
                    description: "3"
                )
                .foregroundColor(.red)
                .button {
                    router.push(.items(navTitle: "Закончилось"))
                }
            }
        }
    }
}

struct DashboardSection_Previews: PreviewProvider {
    static var previews: some View {
        DashboardSection()
    }
}
