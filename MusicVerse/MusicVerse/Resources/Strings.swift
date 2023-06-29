// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// Localizable.strings
  ///   MusicVerse
  /// 
  ///   Created by Bogdan Petkanitch on 29.06.2023.
  public static let `continue` = L10n.tr("Localizable", "Continue", fallback: "Continue")
  /// Skip
  public static let skip = L10n.tr("Localizable", "Skip", fallback: "Skip")
  public enum OnboardingPage {
    public enum FirstPage {
      /// You can personalize the sound music for you
      public static let subtitle = L10n.tr("Localizable", "OnboardingPage.firstPage.subtitle", fallback: "You can personalize the sound music for you")
      /// Powerfull equlizer
      public static let title = L10n.tr("Localizable", "OnboardingPage.firstPage.title", fallback: "Powerfull equlizer")
    }
    public enum FourthPage {
      /// Audio will be rendered in various waveforms
      public static let subtitle = L10n.tr("Localizable", "OnboardingPage.fourthPage.subtitle", fallback: "Audio will be rendered in various waveforms")
      /// Audio Visualizer
      public static let title = L10n.tr("Localizable", "OnboardingPage.fourthPage.title", fallback: "Audio Visualizer")
    }
    public enum SecondPage {
      /// You could download music to local storage from download folder
      public static let subtitle = L10n.tr("Localizable", "OnboardingPage.secondPage.subtitle", fallback: "You could download music to local storage from download folder")
      /// Play music without connection
      public static let title = L10n.tr("Localizable", "OnboardingPage.secondPage.title", fallback: "Play music without connection")
    }
    public enum ThirdPage {
      /// You could group music by playlist
      public static let subtitle = L10n.tr("Localizable", "OnboardingPage.thirdPage.subtitle", fallback: "You could group music by playlist")
      /// Grouping music
      public static let title = L10n.tr("Localizable", "OnboardingPage.thirdPage.title", fallback: "Grouping music")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
