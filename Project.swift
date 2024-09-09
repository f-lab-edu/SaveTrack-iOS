import ProjectDescription

let project = Project(
    name: "SaveTrack",
    targets: [
        .target(
            name: "SaveTrack",
            destinations: .iOS,
            product: .app,
            bundleId: "com.SaveTrackTeam.SaveTrack",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["SaveTrack/Sources/**"],
            resources: ["SaveTrack/Resources/**"],
            dependencies: [
                .external(name: "Alamofire")
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
