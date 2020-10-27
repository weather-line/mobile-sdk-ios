// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Crowdin",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "CrowdinSDK", targets: ["CrowdinCore", "CrowdinProvider"]),
        .library(name: "CrowdinSDKScreenshots", targets: ["CrowdinScreenshots"]),
        .library(name: "CrowdinSDKRealtimeUpdate", targets: ["CrowdinRealtimeUpdate"]),
        .library(name: "CrowdinSDKRefreshLocalization", targets: ["CrowdinRefreshLocalization"]),
        .library(name: "CrowdinSDKLoginFeature", targets: ["CrowdinLoginFeature"]),
        .library(name: "CrowdinSDKIntervalUpdate", targets: ["CrowdinIntervalUpdate"]),
        .library(name: "CrowdinSDKSettings", targets: ["CrowdinSettings"])
    ],
    dependencies: [
        .package(name: "Starscream", url: "https://github.com/daltoniam/Starscream.git", from: "3.1.0"),
        .package(name: "BaseAPI", url: "https://github.com/serhii-londar/BaseAPI.git", from: "0.1.7")
    ],
    targets: [
        .target(
            name: "CrowdinCore",
            path: "CrowdinSDK/Classes/CrowdinSDK/",
            linkerSettings: [
                .linkedFramework("UIKit")
            ]
        ),
        .target(
            name: "CrowdinAPI",
            dependencies: [
                "Starscream",
                "BaseAPI"
            ],
            path: "CrowdinSDK/Classes/CrowdinAPI/"
        ),
        .target(
            name: "CrowdinProvider",
            dependencies: [
                "CrowdinCore",
                "CrowdinAPI"
            ],
            path: "CrowdinSDK/Classes/Providers/Crowdin/"
        ),
        .target(
            name: "CrowdinScreenshots",
            dependencies: [
                "CrowdinCore",
                "CrowdinAPI",
                "CrowdinProvider",
                "CrowdinLoginFeature"
            ],
            path: "CrowdinSDK/Classes/Features/ScreenshotFeature/"
        ),
        .target(
            name: "CrowdinRealtimeUpdate",
            dependencies: [
                "CrowdinCore",
                "CrowdinAPI",
                "CrowdinProvider",
                "CrowdinLoginFeature"
            ],
            path: "CrowdinSDK/Classes/Features/RealtimeUpdateFeature/"
        ),
        .target(
            name: "CrowdinRefreshLocalization",
            dependencies: [
                "CrowdinCore",
                "CrowdinAPI",
                "CrowdinProvider"
            ],
            path: "CrowdinSDK/Classes/Features/RefreshLocalizationFeature/"
        ),
        .target(
            name: "CrowdinLoginFeature",
            dependencies: [
                "CrowdinCore",
                "CrowdinAPI",
                "CrowdinProvider",
                "BaseAPI"
            ],
            path: "CrowdinSDK/Classes/Features/LoginFeature/"
        ),
        .target(
            name: "CrowdinIntervalUpdate",
            dependencies: [
                "CrowdinCore",
                "CrowdinAPI",
                "CrowdinProvider"
            ],
            path: "CrowdinSDK/Classes/Features/IntervalUpdateFeature/"
        ),
        .target(
            name: "CrowdinSettings",
            dependencies: [
                "CrowdinCore",
                "CrowdinAPI",
                "CrowdinProvider",
                "CrowdinScreenshots",
                "CrowdinRealtimeUpdate",
                "CrowdinRefreshLocalization",
                "CrowdinIntervalUpdate",
                "CrowdinLoginFeature"
            ],
            path: "CrowdinSDK/Classes/Settings/"
        )
    ]
)