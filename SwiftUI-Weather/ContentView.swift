//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Frantisek Varadzin on 13/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]),
                           startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Hannover")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
              
                
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("35°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 34)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 38)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind.snow", temperature: 25)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sunset.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "snow", temperature: 4)
                }
                Spacer()
                
              
                
                    
                
            }
          
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
    }
}
