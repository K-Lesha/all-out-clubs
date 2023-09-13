import SwiftUI

public struct ClubImage: View {
    @ObservedObject private var loader = ImageLoader()
    private let url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    public var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 100, maxHeight: 100)
                    .padding(.bottom)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            loader.load(from: url)
        }
        .onDisappear {
            loader.cancel()
        }
    }
}
