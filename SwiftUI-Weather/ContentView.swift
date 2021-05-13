//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Frantisek Varadzin on 13/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
                           
            VStack {
                CityTextView(cityName: "Hannover")
              
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 20 : 35)
              
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 34)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 38)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind.snow", temperature: 25)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sunset.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "snow", temperature: 4)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", backgroundColor: .white, textColor: .blue)
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

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text("Hannover")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
    VStack(spacing: 8) {
        
    Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 180, height: 180)
    Text("\(temperature)°")
        .font(.system(size: 70, weight: .medium))
        .foregroundColor(.white)
}
    .padding(.bottom, 40)
}

}


