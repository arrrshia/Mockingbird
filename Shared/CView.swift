import SwiftUI

struct CView: View {
    var body: some View {
   
        
        GeometryReader{proxy in
            
            let topEdge = proxy.safeAreaInsets.top
            
            Home(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
        }
        
    }
}

struct CView_Previews: PreviewProvider {
    static var previews: some View {
        CView()
    }
}
