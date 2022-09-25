import SwiftUI
import Subsonic

 
class Timers: ObservableObject {
    @Published var times = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @Published var time = 0
}


struct MyDesign: View {
    var person: String
    var sound: String
    
    @State var call = false
    @State var xmark = false
    
    @Namespace var ani
    
    @StateObject var time = Timers()
    
    var body: some View {
        ZStack {
            if self.call == false {
        VStack {
            
                withAnimation(.easeInOut) {
                    
            HStack(spacing: 12) {
            Image("phone")
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                
               
                
                
            
            VStack(alignment: .leading) {
        Text(person)
            .bold()
            .font(.title2)
            .foregroundColor(Color.white)
            
                
                Text("FaceTime Video")
                    .foregroundColor(.secondary)
                    
                   
            }
            
            Spacer()
            
            Button(action: {
                
            }) {
            Image(systemName: "phone.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .clipShape(Circle())
                .rotationEffect(.init(degrees: 135))
                
                
            }
            Button(action: {
                withAnimation(.default) {
                play(sound: sound)
                self.call.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    if self.time.time == Int(0) {
                    self.time.time += 1
                    } else {
                        self.time.time = 0
                    }
                    }
                }
            }) {
                Image(systemName: "phone.fill")
                .resizable()
                .frame(width: 20, height: 20)
                    .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .clipShape(Circle())
                
                
            }
        }.padding()
        .foregroundColor(.white)
        .background(Color.black.opacity(0.8))
        .fixedSize()
        .cornerRadius(20)
        .shadow(radius: 5)
            
            
            .offset(y: self.call ? 0:20)
                }.animation(.default)
              
            Spacer()
        }.matchedGeometryEffect(id: "ID", in: ani)
        .padding()
        
        
            
         }
            
            else {
                
                Rectangle()
                    .fill(Color.black.opacity(0.95))
                    .edgesIgnoringSafeArea(.all)
                withAnimation(.default) {
            VStack(spacing: 20) {
                
                   Text(person)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                    
                
                Text("00.\(self.time.time)").padding()
                    .font(.system(size: 25))
                    .foregroundColor(.gray)
                    .frame(width: UIScreen.main.bounds.width - 32)
                    
                
                Spacer()
                HStack(spacing: 35) {
                    Button(action: {}) {
                    VStack {
                        Image(systemName: "mic.slash.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.08))
                            .clipShape(Circle())
                            
                        Text("mute")
                            .underline()
                            .foregroundColor(.white)
                            
                    }
                    } //btn
                    
                    Button(action: {}) {
                    VStack {
                        Image(systemName: "circle.grid.3x3.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.08))
                            .clipShape(Circle())
                            
                        Text("keypad")
                            .underline()
                            .foregroundColor(.white)
                            
                    }
                    } //btn
                    
                    Button(action: {}) {
                    VStack {
                        Image(systemName: "speaker.1.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.white.opacity(0.98))
                            .clipShape(Circle())
                            
                        Text("audio")
                            .underline()
                            .foregroundColor(.white)
                            
                    }
                    } //btn
                    
                    
                } //HStack
                HStack(spacing: 35) {
                Button(action: {}) {
                VStack {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.08))
                        .clipShape(Circle())
                        
                    
                    Text("add call").underline()
                        .foregroundColor(.white)
                        
                }
                } //btn
                
                Button(action: {}) {
                VStack {
                    Image(systemName: "questionmark.video.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.08))
                        .clipShape(Circle())
                        
                    
                    Text("FaceTime").underline()
                        .foregroundColor(.white)
                        
                }
                }//btn
                 
                    Button(action: {}) {
                    VStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.08))
                            .clipShape(Circle())
                            
                        
                        Text("contacts").underline()
                            .foregroundColor(.white)
                            
                    }
                    }//btn
                }
                Spacer()
                
                Button(action: {
                    withAnimation(.default) {
                        stop(sound: sound)
                        self.call.toggle()
                        
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        if self.time.time == Int(20) {
                        self.time.time += 1
                        } else {
                            self.time.time = 0
                        }
                        }
                    }
                }) {
                VStack {
                    Image(systemName: "phone.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red.opacity(0.98))
                        .clipShape(Circle())
                        
                        
                        .rotationEffect(.init(degrees: 135))
                    
                }
                }//btn
                }.matchedGeometryEffect(id: "ID", in: ani)
                }.animation(.easeIn)
                .colorScheme(.dark)
            }//if
        }//zstack
        .onReceive(self.time.times){ _ in
            if self.call {
                
                if self.time.time != Int(0.20) {
                    self.time.time += 1
                } else {
                    self.time.time = 0
                }
            }
        }
    }
}
