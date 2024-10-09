//
//  ReelView.swift
//  KothaApp
//
//  Created by Sanak Ghosh on 10/7/24.
//

import SwiftUI

struct ReelView: View {
    
    @State var top = 0
    
    var body: some View {
        
        SwipeableView(urls: [
            URL(string: "https://videos.pexels.com/video-files/8468212/8468212-hd_1080_1920_30fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/9046240/9046240-uhd_1440_2560_24fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/9969035/9969035-hd_1080_1920_25fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/27871292/12250709_1080_1920_60fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/8959051/8959051-hd_1080_1920_25fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/27798120/12227662_1080_1920_30fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/18103913/18103913-hd_1080_1920_60fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/28186719/12322264_1440_2560_60fps.mp4")!,
            URL(string: "https://videos.pexels.com/video-files/27684480/12204362_1080_1920_60fps.mp4")!

        ])
            .overlay{
                ZStack{
                    
                    VStack{
                        
                        HStack(spacing: 15){
                            Button {
                                self.top = 0
                            } label: {
                                Text("Following")
                                    .foregroundColor(self.top == 0 ? .white : Color.white.opacity(0.45))
                                    .fontWeight(self.top == 0 ? .bold : .none)
                                    .padding(.vertical)
                            }
                            
                            Button {
                                self.top = 1
                            } label: {
                                Text("For You")
                                    .foregroundColor(self.top == 1 ? .white : Color.white.opacity(0.45))
                                    .fontWeight(self.top == 1 ? .bold : .none)
                                    .padding(.vertical)
                            }
                            
                        }
                        
                        Spacer()
                        HStack{
                            Spacer()
                            
                            VStack(spacing: 35){
                                Button {
                                    
                                } label: {
                                    Image("me")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                        .clipShape(Circle())
                                }
                                
                                Button {
                                    
                                } label: {
                                    VStack(spacing: 8){
                                        Image(systemName: "heart.fill")
                                            .font(.title)
                                            .foregroundColor(.primary)
                                        
                                        Text("22k")
                                            .foregroundColor(.primary)
                                    }
                                    
                                }
                                
                                Button {
                                    
                                } label: {
                                    VStack(spacing: 8){
                                        Image(systemName: "message.fill")
                                            .font(.title)
                                            .foregroundColor(.primary)
                                        
                                        Text("1021")
                                            .foregroundColor(.primary)
                                    }
                                    
                                }
                                
                                Button {
                                    
                                } label: {
                                    VStack(spacing: 8){
                                        Image(systemName: "arrowshape.turn.up.right.fill")
                                            .font(.title)
                                            .foregroundColor(.white)
                                        
                                        Text("Share")
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                                
                                
                            }
                            .padding(.bottom, 55)
                            .padding(.trailing)
                        }
                    }
                }
            }

        
//        ZStack{
//
//            VStack{
//
//                HStack(spacing: 15){
//                    Button {
//                        self.top = 0
//                    } label: {
//                        Text("Following")
//                            .foregroundColor(self.top == 0 ? .white : Color.white.opacity(0.45))
//                            .fontWeight(self.top == 0 ? .bold : .none)
//                            .padding(.vertical)
//                    }
//
//                    Button {
//                        self.top = 1
//                    } label: {
//                        Text("For You")
//                            .foregroundColor(self.top == 1 ? .white : Color.white.opacity(0.45))
//                            .fontWeight(self.top == 1 ? .bold : .none)
//                            .padding(.vertical)
//                    }
//
//                }
//
//                Spacer()
//                HStack{
//                    Spacer()
//
//                    VStack(spacing: 35){
//                        Button {
//
//                        } label: {
//                            Image("me")
//                                .renderingMode(.original)
//                                .resizable()
//                                .frame(width: 45, height: 45)
//                                .clipShape(Circle())
//                        }
//
//                        Button {
//
//                        } label: {
//                            VStack(spacing: 8){
//                                Image(systemName: "heart.fill")
//                                    .font(.title)
//                                    .foregroundColor(.primary)
//
//                                Text("22k")
//                                    .foregroundColor(.primary)
//                            }
//
//                        }
//
//                        Button {
//
//                        } label: {
//                            VStack(spacing: 8){
//                                Image(systemName: "message.fill")
//                                    .font(.title)
//                                    .foregroundColor(.primary)
//
//                                Text("1021")
//                                    .foregroundColor(.primary)
//                            }
//
//                        }
//
//                        Button {
//
//                        } label: {
//                            VStack(spacing: 8){
//                                Image(systemName: "arrowshape.turn.up.right.fill")
//                                    .font(.title)
//                                    .foregroundColor(.white)
//
//                                Text("Share")
//                                    .foregroundColor(.white)
//                            }
//
//                        }
//
//
//                    }
//                    .padding(.bottom, 55)
//                           .padding(.trailing)
//                }
//            }
//        }
    }
}

//struct VideosViewControllerRepresentable: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> VideosViewController {
//        return VideosViewController()
//    }
//
//    func updateUIViewController(_ uiViewController: VideosViewController, context: Context) {
//        // Update your view controller if needed
//    }
//}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

