import SwiftUI

struct Home: View {
    // state objects
    @State var showingDetail = false
    @State private var isPlaying = false
    @State private var hasTimeElapsed = false
    @State private var type = "Brother"
    @State private var sound = "Brother.mp3"
    
    @State var offset: CGFloat = 0
    var topEdge: CGFloat
    
    var body: some View {
        
        ZStack{
            
            // Geometry Reader for getting height and width...
            GeometryReader{proxy in
                
                Image("sky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            // Blur Material...
            .overlay(.ultraThinMaterial)
            
            // Main View....
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    // Weather Data...
                    VStack(alignment: .center, spacing: 5) {
                        
                        Text("San Jose")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                        
                        
                        Text(" 98˚")
                            .font(.system(size: 45))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                        
                        Text("Cloudy")
                            .foregroundStyle(.secondary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                        
                        Text("H:103˚L:105˚")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                    }
                    .offset(y: -offset)
                    // For Bototm Drag Effect...
                    .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: getTitleOffset())
                    
                    // Custom Data View...
                    VStack(spacing: 8){
                        
                        // Custom Stack....
                        CustomStackView {
                            
                            // Label Here....
                            Label {
                                
                                Text("Hourly Forecast")
                                
                            } icon: {
                                
                                Image(systemName: "clock")
                            }

                            
                        } contentView: {
                         
                            // Content...
  
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack(spacing: 15){
                                    
                                    Button {
                                        self.showingDetail.toggle()
                                        self.isPlaying.toggle()
                                        type = "Brother"
                                        sound = "Brother.mp3"
                                    } label: {
                                        ForecastView(time: "12 PM",celcius: 94,image: "sun.min")
                                    }
                                    Button {
                                        self.showingDetail.toggle()
                                        self.isPlaying.toggle()
                                        type = "Father"
                                        sound = "Father.mp3"
                                    } label: {
                                    ForecastView(time: "1 PM",celcius: 95,image: "sun.min")
                                    }
                                    Button {
                                        self.showingDetail.toggle()
                                        self.isPlaying.toggle()
                                        type = "BF"
                                        sound = "bf.mp3"
                                    } label: {
                                    ForecastView(time: "2 PM",celcius: 96,image: "sun.min")
                                    }
                                    ForecastView(time: "3 PM",celcius: 97,image: "cloud.sun")
                                    
                                    ForecastView(time: "4 PM",celcius: 99,image: "sun.haze")
                                }
                            }
                        }
                        
                        WeatherDataView()

                    }
                    .padding(.top,20)
                }
                .padding(.top,25)
                .padding(.top,topEdge)
                .padding([.horizontal,.bottom])
                // getting Offset....
                .overlay(
                
                    // Using Geometry Reader....
                    GeometryReader{proxy -> Color in
                    
                    let minY = proxy.frame(in: .global).minY
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    return Color.clear
                    
                    }
                )
            }
            
            
            
            
            // if to track
            if (showingDetail) {
                MyDesign(person: type, sound: sound)
            }
        }
    }
    
    func getTitleOpactiy()->CGFloat{
        
        let titleOffset = -getTitleOffset()
        
        let progress = titleOffset / 20
        
        let opacity = 1 - progress
        
        return opacity
    }
    
    func getTitleOffset()->CGFloat{
        
        // setting one max height for whole title...
        // consider max as 120....
        if offset < 0{
            let progress = -offset / 120
            
            // since top padding is 25....
            let newOffset = (progress <= 1.0 ? progress : 1) * 20
            
            return -newOffset
        }
        
        return 0
    }
}



struct ForecastView: View {
    var time: String
    var celcius: CGFloat
    var image: String
    
    var body: some View {
        VStack(spacing: 15){
            
            Text(time)
                .font(.callout.bold())
                .foregroundStyle(.white)
            
            
            Image(systemName: image)
                .font(.title2)
            // MultiColor...
                .symbolVariant(.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow, .white)
            // max Frame...
                .frame(height: 30)
            
            Text("\(Int(celcius))˚")
                .font(.callout.bold())
                .foregroundStyle(.white)
        }
        .padding(.horizontal,10)
    }
}
