part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {}

final class SearchFailure extends SearchState {
  final String errorMassage;

  SearchFailure({required this.errorMassage});
}

final class TabChanged extends SearchState {}
