//
//  ContentView.swift
//  GeometryPaging
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 26.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    
    @GestureState var gestureOffset:CGFloat = .zero
    @State var offset: CGFloat = .zero
    @State var lastStoredOffset:CGFloat = .zero
    @State var homeOpacity: Double = 0.1
    @State var storedHomeOpacity: Double = 0.1
    var sideBarWidth =  UIScreen.main.bounds.width / 1.5
    
    
    var body: some View {
        ZStack{
            GeometryReader { proxy in
                let width = proxy.size.width
                let height = proxy.size.height
                
                HStack(spacing:0) {
                    LinkedInSideBar()
                        .frame(width: width/1.5, height: height)
                    LinkedInHomePage()
                        
                        .overlay(content: {
                            Color.black
                                .ignoresSafeArea()
                                .opacity(homeOpacity)
                        })
                        .frame(width: width, height: height)
                        
                        
                        
                    MessageViewPage()
                        .frame(width: width, height: height)
                }
                
                
                .offset(x:offset - sideBarWidth)
                .gesture(
                    DragGesture()
                        .updating($gestureOffset, body: {value, out, _ in
                            out = value.translation.width
                        })
                        .onChanged({ value in
                            print(sideBarWidth)
                            let trans = value.translation.width
                            let lastOffset = trans + lastStoredOffset
                            if trans != 0 {
                                if lastOffset < sideBarWidth && -lastOffset < width {
                                    offset = lastOffset
                                    if lastOffset > 0 && lastOffset < sideBarWidth && trans > 0{
                                        print("lastOffset\(lastOffset)")
                                        homeOpacity = (lastOffset / width)
                                    } else if lastOffset > 0 && lastOffset < sideBarWidth && trans < 0 {
                                        homeOpacity = (lastOffset / width)
                                    }
                                }
                            } else {
                                offset = offset

                            }
                            print(offset)
                        })
                        .onEnded({ value in
                            let trans = value.translation.width
                            let sideBarTrans = sideBarWidth / 3
                            if trans > 0 {
                                if (lastStoredOffset + trans) < sideBarTrans {
                                    if -(lastStoredOffset + trans) > (width - sideBarTrans) {
                                        withAnimation {
                                            offset = lastStoredOffset
                                        }
                                    } else {
                                        withAnimation {
                                            offset = 0
                                        }
                                    }
                                  
                                }else {
                                    withAnimation {
                                        offset = sideBarWidth
                                    }
                                }
                               
                            } else {
                                if (lastStoredOffset + trans) < (sideBarWidth - sideBarTrans) {
                                    if -(lastStoredOffset + trans) > (sideBarWidth - sideBarTrans) {
                                        withAnimation {
                                            offset = -width
                                        }
                                    } else {
                                        withAnimation {
                                            offset = 0
                                        }
                                    }
                                  
                                }else {
                                    withAnimation {
                                        offset = sideBarWidth
                                    }
                                    
                                }
                            }
                            
                            lastStoredOffset = offset
                            withAnimation {
                                homeOpacity = (offset / width)
                            }
                        })
                )
                
                
                
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//
//  ContentView.swift
//  GeometryPaging
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 26.08.2022.
//

//import SwiftUI
//
//struct ContentView: View {
//    @GestureState var offset : CGFloat = 0
//    @State var index = 0
//    @State var currentIndex = 0
//    @State var xoffset:CGFloat = .zero
//    @State var roundedIndex: CGFloat = 0
//    @State var endVal:CGFloat = 0
//    @State var currentOffset:CGFloat = 0
//    var body: some View {
//        ZStack{
//
//            GeometryReader { proxy in
//                let width = proxy.size.width
//                let height = proxy.size.height
//                HStack {
//                    RoundedRectangle(cornerRadius: 8)
//                        .fill(Color.pink)
//                        .frame(width: width/2, height: height)
//                    RoundedRectangle(cornerRadius: 8)
//                        .fill(Color.red)
//                        .frame(width: width, height: height)
//                    RoundedRectangle(cornerRadius: 8)
//                        .fill(Color.blue)
//                        .frame(width: width, height: height)
//                }
//                .offset(x:-width/2)
//                .offset(x: (CGFloat(currentIndex) * -width) + offset + xoffset)
//                .gesture(
//                    DragGesture()
//                        .updating($offset, body: { value, out, _ in
//                            out = value.translation.width
//                        })
//                        .onChanged({ value in
//                            let offsetX = value.translation.width
//                            print(offsetX)
//                            let progress = -offsetX / width
//                            print(progress)
//                            let roundedIndex = progress.rounded()
//                            print(roundedIndex)
//                            index = max(min(currentIndex + Int(roundedIndex), 2 - 1),0)
//                        })
//                        .onEnded({ value in
//                            let offsetX = value.translation.width
//
//
//                            let progress = -offsetX / width
//
//
//                            let roundedIndex = progress.rounded()
//
//
//                            currentIndex = max(min(currentIndex + Int(roundedIndex), 2 - 1),0)
//                            print(currentIndex)
//                            currentIndex = index
//
//                            if index == 0 && value.location.x < -50 {
//                                xoffset = 100
//                            }else {
//                                xoffset = 0
//                            }
//
//                        })
//                )
//            }
//            VStack {
//                Text("index \(index)")
//                    .padding(.vertical,16)
//                Text("currentIndex \(currentIndex)")
//                Text("Roundedindex \(roundedIndex)")
//                Text("offset\(offset)")
//                Text("xoffset\(xoffset)")
//                Text("endVl\(endVal)")
//            }
//
//
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}



//.offset(x:offset - sideBarWidth)
//
//.gesture(
//    DragGesture()
//        .updating($getureOffset, body: { value, out, _ in
//            out = value.translation.width
//        })
//        .onChanged({ value in
//            let offsetX = currentOffset + value.translation.width
//            if offsetX < 165 && offsetX > -330 {
//                offset = offsetX
//            }
//
//        })
//        .onEnded({ value in
//            if offset < 165 && offset > -330 {
//                currentOffset = offset
//            }
//
//        })
//
//
//
//)
//}
//.onChange(of: offset) { newValue in
//
//
//}
