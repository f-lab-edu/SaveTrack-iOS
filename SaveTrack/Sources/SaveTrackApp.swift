import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth

@main
struct SaveTrackApp: App {
    init() {
        if let appKey = Secrets.KAKAO_APP_KEY {
            KakaoSDK.initSDK(appKey: appKey)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
