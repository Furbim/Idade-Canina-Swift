
import SwiftUI

struct ContentView: View {
    @State private var idadeHumana: String = ""
    @State private var idadeCachorro: String = ""
    
    func calcularIdadeCachorro() {
        guard let idadeHumanaInt = Int(idadeHumana), idadeHumanaInt > 0 else {
            idadeCachorro = "Digite uma idade válida!"
            return
        }
        
        
        let idadeCanina: Int
        if idadeHumanaInt <= 2 {
            idadeCanina = idadeHumanaInt * 10
        } else {
            idadeCanina = 21 + (idadeHumanaInt - 2) * 4
        }
        
        idadeCachorro = "\(idadeCanina) anos caninos"
    }
    
    var body: some View {
        VStack {
            Text("Calcule a idade do seu cão")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 50)
                .padding(.bottom, 20)
                .padding(.horizontal, 40)
            
            Image("images")
                .frame(width: 300, height: 200)
                
            
            TextField(
                "Digite a idade humana",
                text: $idadeHumana
            )
            .keyboardType(.numberPad)
            .padding()
            .background(Color.white)
            .cornerRadius(5)
            .shadow(radius: 5)
            .padding(.horizontal, 50)
            
            Button(action: calcularIdadeCachorro) {
                Text("Calcular Idade Canina")
                    
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding()
            
            if !idadeCachorro.isEmpty {
                Text(idadeCachorro)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
            }
            
            Spacer()
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
