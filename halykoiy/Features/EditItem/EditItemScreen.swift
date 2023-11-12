import SwiftUI

struct EditItemScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
    @ObservedObject
    var viewModel: EditItemViewModel
    
    @Binding
    var nameValue: String
    
    @Binding
    var qrValue: String

    @Binding
    var priceValue: String
    
    @Binding
    var quantityValue: String
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    nameField
                    barcodeField
                    priceField
                    quantityField
                }
                
                Spacer()
            }
            .navigationTitle("Редактировать товар")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
                trailing: addButton
            )
        }
    }
    
    var nameField: some View {
        TextField(icon: "a.square.fill", color: .red, title: "Название товара", placeholder: "ABC", fieldText: $viewModel.state.nameValue)
    }
    
    var barcodeField: some View {
        TextField(icon: "barcode.viewfinder", color: .black, title: "SKU", placeholder: "73323234", fieldText: $viewModel.state.qrValue)
    }
    
    var priceField: some View {
        TextField(icon: "dollarsign.square.fill", color: Color(.accent), title: "Цена", placeholder: "2500", fieldText: $viewModel.state.priceValue)
    }
    
    var quantityField: some View {
        TextField(icon: "number.square.fill", color: .purple, title: "Количество", placeholder: "42", fieldText: $viewModel.state.quantityValue)
    }
    
    var addButton: some View {
        Button {
            viewModel.send(event: .addItem) {
                router.pop()
            }
        } label: {
            Text("Добавить")
        }
        .foregroundColor(Color(.accent))
    }
}

struct TextField: View {
    let icon: String
    let color: Color
    let title: String
    let placeholder: String
    
    @Binding
    var fieldText: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(color)
            
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .medium, design: .default))
            
            Spacer()
            
            SwiftUI.TextField(placeholder, text: $fieldText)
                .fixedSize()
        }
        .padding(.horizontal, 8)
    }
}
