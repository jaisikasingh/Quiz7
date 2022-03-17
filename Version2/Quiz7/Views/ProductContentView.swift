import SwiftUI

struct ProductContentView: View {
    
    @EnvironmentObject var productVM: ProductViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                ProductListView()
            }
        }
    }
}

struct ProductListView: View {

    @EnvironmentObject private var productVM: ProductViewModel
    
    var body: some View {
        
        VStack(alignment: .leading){
                
            ScrollView(.horizontal){
                HStack(spacing:10){
                    ForEach($productVM.products){ item in
                        CardView(card: Card(
                            prompt: item.title.wrappedValue, answer: String(item.price.wrappedValue)))
                    }
                }
            }
            Spacer()
        
            if $productVM.products.count > 0,
               let item = $productVM.products[0] {
                CardView(
                    card: Card(prompt: "Product of the day", answer: item.title.wrappedValue),
                    width: 340,
                    height: 150
                )
            }
            
            Spacer()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("StoreFront")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                NavigationLink (destination: AddProductView()){
                    Image(systemName: "plus")
                }
            }
        }
        .padding()
        .background()
        
    }
}

struct AddProductView: View {
    
    @State private var productTitle: String = ""
    @State private var productPrice: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject private var productVM: ProductViewModel
    
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                // text field to take task tile
                TextField("Title", text: $productTitle)

                TextField("Price", text: $productPrice)
            }
            
            AsyncButton {
                await productVM.addProduct(
                        title: productTitle,
                        price: Float(productPrice) ?? 0)
                
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Submit")
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1)
            }
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Add an item")
        .padding()
    }
}

struct AsyncButton<Label: View>: View {
    var action: () async -> Void
    @ViewBuilder var label: () -> Label

    @State private var isPerformingTask = false

    var body: some View {
        Button(
            action: {
                isPerformingTask = true
            
                Task {
                    await action()
                    isPerformingTask = false
                }
            },
            label: {
                ZStack {
                    label().opacity(isPerformingTask ? 0 : 1)

                    if isPerformingTask {
                        ProgressView()
                    }
                }
            }
        )
        .disabled(isPerformingTask)
    }
}

struct Card {
    let prompt: String
    let answer: String
}

struct CardView: View {
    let card: Card
    var width: CGFloat = 150.0
    var height: CGFloat = 150.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.blue)
            
            VStack {
                Text(card.prompt)
                    .font(.system(size: 16))
                
                Text(card.answer)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: width, height: height)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 0.5)
        )
    }
}


struct ProductContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductContentView()
    }
}
