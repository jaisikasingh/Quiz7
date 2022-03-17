

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            VStack{
                Text(task)
            }
            .frame(width: 270,  height: 100,alignment: .leading)
            .padding()
            .background(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
            .cornerRadius(20)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Do laundry",completed: true)
    }
}
