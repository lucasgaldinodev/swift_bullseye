//
//  ContentView.swift
//  Bullseye
//
//  Created by Lucas on 09/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()

    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                Slider(value: self.$sliderValue, in: 1.0 ... 100.0)
                Text("100")
                    .bold()
            }
            Button("Hit me") {
                print("Hello, SwiftUI!")
                self.alertIsVisible = true
            }
            .alert("Hello there!", isPresented: $alertIsVisible) {
                Button("Awesome!") {}
            } message: {
                let roundedValue: Int = Int(self.sliderValue.rounded())
                Text("The slider's value is \(roundedValue).\n" + "You scored \(self.game.points(sliderValue: roundedValue)) points this round.")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 812, height: 375))
    }
}
