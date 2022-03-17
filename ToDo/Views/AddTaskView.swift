

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Add an item")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField(
                "title",
                text: $title
            )
                .textFieldStyle(.roundedBorder)
            

            Button {
                // Only adding a task if user added something in the TextField
                if title != ""{
                    realmManager.addTask(taskTitle: title)
                }
                dismiss()
            } label: {
                Text("Submit")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
                    .cornerRadius(30)
            }
            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
    
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
