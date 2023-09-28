import 'package:hooks_riverpod/hooks_riverpod.dart';

class pageNotifier extends StateNotifier<int> {
  pageNotifier() : super(0);

  void changePage(int index) {
    state = index;
  }
}

final pageProvider = StateNotifierProvider<pageNotifier, int>((ref) {
  return pageNotifier();
});
