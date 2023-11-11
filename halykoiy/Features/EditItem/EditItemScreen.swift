import SwiftUI

struct EditItemScreen: View {
    @EnvironmentObject
    private var router: Router<Route>
    
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
        TextField(icon: "a.square.fill", color: .red, title: "Название товара", placeholder: "ABC")
    }
    
    var barcodeField: some View {
        TextField(icon: "barcode.viewfinder", color: .black, title: "SKU", placeholder: "73323234")
    }
    
    var priceField: some View {
        TextField(icon: "dollarsign.square.fill", color: Color(.accent), title: "Цена", placeholder: "2500")
    }
    
    var quantityField: some View {
        TextField(icon: "number.square.fill", color: .purple, title: "Количество", placeholder: "42")
    }
    
    var addButton: some View {
        Button {
            router.pop(animated: true)
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
            
            SwiftUI.TextField(placeholder, text: .constant(""))
                .fixedSize()
        }
        .padding(.horizontal, 8)
    }
}

struct EditItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditItemScreen()
    }
}
