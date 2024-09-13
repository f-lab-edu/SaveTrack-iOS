import ProjectDescription

let infoPlist: [String : Plist.Value] = [
    "NSAppTransportSecurity": [
        "NSAllowsArbitraryLoads": true
    ],
    "UILaunchScreen": [
        "UIColorName": "",
        "UIImageName": "",
    ],
    "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"],
    "LSApplicationQueriesSchemes": [
        "kakaokompassauth",
        "kakaolink",
        "kakaoplus"
    ],
    "CFBundleURLTypes": [[
        "CFBundleTypeRole": "Editor",
        "CFBundleURLSchemes": ["kakaof729aa4e6a2aa28d3f8dee50109387b8"],
    ]],
    "KAKAO_APP_KEY": "$(KAKAO_APP_KEY)",
    "PROJECT_API_URL": "$(PROJECT_API_URL)"
]

enum SaveTrackSettings {
    static let projectName = "SaveTrack"
    static let configPath = Path.relativeToRoot("SaveTrack/Sources/Secrets/Secrets.xcconfig")
    static let settings = Settings.settings(configurations: [
        .debug(name: .init(stringLiteral: "\(projectName)Debug"), xcconfig: configPath),
        .release(name: .init(stringLiteral: "\(projectName)Release"), xcconfig: configPath)
    ])
}

let project = Project(
    name: SaveTrackSettings.projectName,
    settings: SaveTrackSettings.settings,
    targets: [
        .target(
            name: "SaveTrack",
            destinations: .iOS,
            product: .app,
            bundleId: "com.SaveTrackTeam.SaveTrack",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["SaveTrack/Sources/**"],
            resources: ["SaveTrack/Resources/**"],
            entitlements: .file(path: .relativeToRoot("SaveTrack/SaveTrack.entitlements")),
            dependencies: [
                .external(name: "Alamofire"),
                .external(name: "KakaoSDKCommon"),
                .external(name: "KakaoSDKAuth"),
                .external(name: "KakaoSDKUser")
            ]
        ),
        .target(
            name: "SaveTrackTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.SaveTrackTeam.SaveTrackTests",
            infoPlist: .default,
            sources: ["SaveTrack/Tests/**"],
            resources: [],
            dependencies: [.target(name: "SaveTrack")]
        ),
    ]
)
