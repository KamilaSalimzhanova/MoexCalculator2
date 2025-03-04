import SwiftUI

struct AffirmationView: View {
    var body: some View {
        VStack {
            Text("You got this! Keep pushing forward! 💪")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct AffirmationView_Previews: PreviewProvider {
    static var previews: some View {
        AffirmationView()
    }
}
