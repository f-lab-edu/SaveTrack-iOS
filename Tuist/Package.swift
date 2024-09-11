// swift-tools-version: 5.9
import PackageDescription

enum SaveTrackSettings {
    static let projectName = "SaveTrack"
    static let configPath = Path.relativeToRoot("SaveTrack/Sources/Secrets.xcconfig")
    static let settings = Settings.settings(configurations: [
        .debug(name: .init(stringLiteral: "\(projectName)Debug"), xcconfig: configPath),
        .release(name: .init(stringLiteral: "\(projectName)Release"), xcconfig: configPath)
    ])
}

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,] 
        productTypes: [:],
        baseSettings: SaveTrackSettings.settings
    )
#endif


let package = Package(
    name: "SaveTrack",
    dependencies: [
        // Add your own dependencies here:
        // .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.9.1"),
        .package(url: "https://github.com/kakao/kakao-ios-sdk", branch: "master"),
    ]
)
