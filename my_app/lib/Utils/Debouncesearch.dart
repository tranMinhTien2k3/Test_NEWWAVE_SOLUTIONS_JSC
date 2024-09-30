import 'dart:async';

Future<void> debounceSearch(Function(String) onSearch, String query,
    {Duration delay = const Duration(seconds: 1)}) async {
  Timer? timer;

  if (timer?.isActive ?? false) timer!.cancel();

  timer = Timer(delay, () {
    onSearch(query);
  });
}
