    //
    //  PointsView.swift
    //  Bullseye
    //
    //  Created by Lucas on 19/08/22.
    //


import SwiftUI

struct PointsView: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game

  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)

    VStack(spacing: 10) {
      InstructionText(text: "O valor do alvo foi")
      BigNumberText(text: String(roundedValue))
      BodyText(text: "Você marcou \(points) pontos\n🎉🎉🎉")
      Button(action: {
        withAnimation {
          alertIsVisible = false
        }
        game.startNewRound(points: points)
      }) {
        ButtonText(text: "Começar nova rodada")
      }
    }
      .padding()
      .frame(maxWidth: 300)
      .background(Color("BackgroundColor"))
      .cornerRadius(Constants.General.roundRectCornerRadius)
      .shadow(radius: 10, x: 5, y: 5)
  }
}

struct PointsView_Previews: PreviewProvider {

  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())

  static var previews: some View {
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .previewLayout(.fixed(width: 568, height: 320))
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}
