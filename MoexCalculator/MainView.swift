import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: CalculatorViewModel
    
    var body: some View {
        
        switch viewModel.state {
            
        case .loading:
            ProgressView()
            
        // Экран, который отображается при ошибке: эмоджи и текст
        case .error:
            VStack {
                Text("🤷‍♂️")
                    .font(.system(size: 100))
                    .padding()
                Text("Что-то пошло не так.\n Пожалуйста, попробуйте позже.")
                    .font(.body)
            }
            .multilineTextAlignment(.center)
        
        case .content:
            CalculatorView()
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(CalculatorViewModel())
    }
}
