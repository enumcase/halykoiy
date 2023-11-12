import SwiftUI
import CodeScanner

struct InventoryScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @ObservedObject
    var viewModel: InventoryViewModel
    
    @State private var isPresentingScanner = false
    @State private var isPresentingEditItem = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                InventorySection(title: "Статистика", environment: viewModel.environment) {
                    DashboardSection(inventory: viewModel.state.inventory)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
                qrButton
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                
                InventorySection(title: "Недавние", environment: viewModel.environment, shouldShowButton: true) {
                    RecentSection(viewModel: viewModel)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .navigationTitle("Инвентарь")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(
                leading: VStack{
                    backButton
                }
            )
            .background(Color(.screenBackground))
            .sheet(isPresented: $isPresentingScanner) {
                CodeScannerView(codeTypes: [.qr, .codabar, .code128, .code39, .ean13, .ean8]) { response in
                    if case let .success(result) = response {
                        viewModel.qrValue = result.string
                        isPresentingScanner = false
                        isPresentingEditItem = true
                    }
                }
            }
            .sheet(isPresented: $isPresentingEditItem) {
                EditItemScreen(viewModel: .init(environment: viewModel.environment, nameValue: viewModel.nameValue, qrValue: viewModel.qrValue, priceValue: viewModel.priceValue, quantityValue: viewModel.quantityValue))
                    .environmentObject(router)
            }
            .onAppear {
                viewModel.send(event: .load)
            }
        }
    }
    
    var backButton: some View {
        Button {
            router.pop(animated: true)
        } label: {
            Image(systemName: "arrow.backward")
                .frame(width: 12, height: 12)
                .foregroundColor(Color(.accent))
        }

    }
    
    var qrButton: some View {
        Button {
            isPresentingScanner = true
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Добавляйте товары с одного клика")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium, design: .default))
                    
                    Text("Отсканировать c QR")
                        .foregroundColor(Color(.accent))
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .cornerRadius(8)
                }
                
                Spacer()
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(Color(.accent))
            .cornerRadius(8)
        }
    }
}

struct InventoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        InventoryScreen(viewModel: .init(environment: Env()))
    }
}

