import SwiftUI

/// App-specific theme manager
public class AppThemeManager: ObservableObject, ThemeConfigurable {
    @Published public var primaryButtonStyle: ThemeManager.ButtonStyle
    @Published public var secondaryButtonStyle: ThemeManager.ButtonStyle
    @Published public var cancelButtonStyle: ThemeManager.ButtonStyle
    @Published public var titleConfig: ThemeManager.TextConfig
    @Published public var descriptionConfig: ThemeManager.TextConfig
    @Published public var backgroundConfig: ThemeManager.BackgroundConfig

    public init(
        primaryButtonStyle: ThemeManager.ButtonStyle = ThemeManager.ButtonStyle.primary,
        secondaryButtonStyle: ThemeManager.ButtonStyle = ThemeManager.ButtonStyle.secondary,
        cancelButtonStyle: ThemeManager.ButtonStyle = ThemeManager.ButtonStyle.cancel,
        titleConfig: ThemeManager.TextConfig = ThemeManager.TextConfig.titleConfig,
        descriptionConfig: ThemeManager.TextConfig = ThemeManager.TextConfig.descriptionConfig,
        backgroundConfig: ThemeManager.BackgroundConfig = ThemeManager.defaultBackground
    ) {
        self.primaryButtonStyle = primaryButtonStyle
        self.secondaryButtonStyle = secondaryButtonStyle
        self.cancelButtonStyle = cancelButtonStyle
        self.titleConfig = titleConfig
        self.descriptionConfig = descriptionConfig
        self.backgroundConfig = backgroundConfig
    }

    public func backgroundStyle(for colorScheme: ColorScheme) -> AnyView {
        backgroundConfig.solidBackground(for: colorScheme)
    }
}
