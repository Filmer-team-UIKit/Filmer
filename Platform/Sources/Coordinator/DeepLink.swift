//
//  DeepLink.swift
//  Platform
//
//  Created by Иван Карплюк on 20.02.2025.
//

/// Перечисление, описывающее возможные deep link'и в приложении.
///
/// Расширяйте кейсы по мере добавления новых модулей.
public enum DeepLink {
    case onboarding
    case auth
    case mainFlow(screen: MainFlowScreen)
    
    /// Перечисление экранов внутри основного потока (например, в TabBar).
    public enum MainFlowScreen {
        case home
        case settings
        // Добавьте другие экраны при необходимости.
    }
}
