part of 'theme_manager_cubit.dart';

@immutable
sealed class ThemeManagerState {}

final class ThemeManagerInitial extends ThemeManagerState {}

final class DarkTheme extends ThemeManagerState {}

final class LightTheme extends ThemeManagerState {}

final class DrawerMoved extends ThemeManagerState {}
