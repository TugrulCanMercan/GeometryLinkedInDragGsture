//
//  ContentView.swift
//  GeometryPaging
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 26.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    
    @GestureState var gestureOffset:CGFloat = .zero
    @State var sideBarWidth = UIScreen.main.bounds.width / 1.5
    @State var offset:CGFloat = .zero
    @State var currentPosition:CGFloat = .zero
    @State var currentIndex:Double = 0
    @State var index:Double = 0
    @State var lastStoredOffset:CGFloat = 0
    var fullWidth = UIScreen.main.bounds.width
    
    @State var val = 1
    
    var body: some View {
        ZStack{
            GeometryReader { proxy in
                let width = proxy.size.width
                let height = proxy.size.height
                
                HStack(spacing:0) {
                    LinkedInSideBar()
                        .frame(width: width/1.5, height: height)
                    LinkedInHomePage()
                        .frame(width: width, height: height)
                    MessageViewPage()
                        .frame(width: width, height: height)
                }
                
                
                
                
                
                .offset(x: (offset - sideBarWidth) <= 0 ? offset - sideBarWidth : 0)
                
                .gesture(
                    DragGesture()
                        .updating($gestureOffset, body: { value, out, _ in
                            
                            out = value.translation.width
                        })
                        .onChanged({ value in
                            print("-----")
                            print("onChanged trans\(value.translation.width)")
                            print("gesture state\(gestureOffset)")
                            print("last stored onchange\(lastStoredOffset)")
                            print("-----")
                            print("offset\(offset)")
                            
                            if gestureOffset != 0 {
                                if gestureOffset + lastStoredOffset <= 1.5 * sideBarWidth && gestureOffset + lastStoredOffset >= -1.5 * sideBarWidth{
                                    offset =  gestureOffset + lastStoredOffset
                                } else {
                                    offset = lastStoredOffset
                                }
                            }else {
                                offset = offset
                            }
                            print("offset\(offset) ---")
                            
                        })
                        .onEnded({ value in
                            let trans = value.translation.width
                            print("trans\(trans)")
                            if trans > 0 {
                                if trans > (sideBarWidth / 1.5) && -lastStoredOffset != sideBarWidth * 1.5{
                                    withAnimation(.easeInOut.speed(2)) {
                                        offset = sideBarWidth
                                    }
                                } else {
                                    if offset == sideBarWidth {
                                        return
                                    }
                                    withAnimation(.easeInOut.speed(2)) {
                                        offset = 0
                                    }
                                }
                            } else {
                                print("lastStoredOffset\(lastStoredOffset)")
                                if -trans < (sideBarWidth) && (lastStoredOffset == sideBarWidth){
                                    withAnimation(.easeInOut.speed(2)) {
                                        offset = 0
                                    }
                                }else {
                                    if -lastStoredOffset + trans < -sideBarWidth * 2 {
                                        withAnimation(.easeInOut.speed(2)) {
                                            offset = 0
                                        }
                                    } else {
                                        withAnimation(.easeInOut.speed(2)) {
                                            offset = -sideBarWidth * 1.5
                                        }
                                    }
                                }
                            }
                            lastStoredOffset = offset
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
