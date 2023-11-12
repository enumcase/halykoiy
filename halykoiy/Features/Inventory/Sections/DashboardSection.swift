import SwiftUI

struct DashboardSection: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    var inventory: Inventory?
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                DashboardCard(
                    icon: "dollarsign.circle",
                    title: "Сумма инвентаря",
                    description: inventory == nil ? "-" : "\(inventory!.price)"
                )
                .foregroundColor(Color(.accent))
                
                DashboardCard(
                    icon: "tray.full.fill",
                    title: "Всего кол-во",
                    description: inventory == nil ? "-" : "\(inventory!.total)"
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
                    description: inventory == nil ? "-" : "\(inventory!.lowStock)"
                )
                .foregroundColor(.yellow)
                .button {
                    router.push(.items(navTitle: "Малое кол-во"))
                }
                
                DashboardCard(
                    icon: "exclamationmark.circle.fill",
                    title: "Закончилось",
                    description: inventory == nil ? "-" : "\(inventory!.outOfStock)"
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
