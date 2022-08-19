  //
  //  RoundedViews.swift
  //  Bullseye
  //
  //  Created by Lucas on 15/08/22.
  //

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .stroke(Color("ButtonStrokeColor"), lineWidth: Constants.General.stokeWidth)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
      .background(
      Circle()
        .fill(Color("ButtonFilledBackgroundColor"))
      )
  }
}

struct RoundRectTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(-0.2)
      .bold()
      .font(.title3)
      .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
      .foregroundColor(Color("TextColor"))
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
          .stroke(lineWidth: Constants.General.stokeWidth)
          .foregroundColor(Color("ButtonStrokeColor"))
      )
  }
}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      RoundedImageViewFilled(systemName: "list.dash")
      RoundRectTextView(text: "100")
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
