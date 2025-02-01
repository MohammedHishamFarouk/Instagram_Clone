import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insgram_clone/core/constants/fire_keys.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  int current = 0;
  List users = [];

  void searchUsersByUsername(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    try {
      emit(SearchLoading());
      final result = await _fireStore
          .collection('users')
          .where(FireKeys.userName, isGreaterThanOrEqualTo: query)
          .where(FireKeys.userName, isLessThan: query + 'z')
          .get();
      users = result.docs.map((doc) => doc.data()).toList();
      emit(SearchSuccess());
    } catch (e) {
      emit(SearchFailure(errorMassage: e.toString()));
    }
  }

  void changeTab(int index) {
    current = index;
    emit(TabChanged());
  }
}
