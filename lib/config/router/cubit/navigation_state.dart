enum NavigationTab { inicio, nuevo, perfil}

class NavigationState {
  final NavigationTab currentTab;

  NavigationState({this.currentTab = NavigationTab.inicio});

  NavigationState copyWith({NavigationTab? currentTab}) {
    return NavigationState(currentTab: currentTab ?? this.currentTab);
  }
}