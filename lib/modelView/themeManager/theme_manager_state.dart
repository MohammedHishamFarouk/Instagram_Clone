part of 'theme_manager_cubit.dart';

@immutable
sealed class ThemeManagerState {}

final class ThemeManagerInitial extends ThemeManagerState {}

final class ThemeChanged extends ThemeManagerState {}

final class LocaleChanged extends ThemeManagerState {}

final class DrawerMoved extends ThemeManagerState {}

final class TabChanged extends ThemeManagerState {}
