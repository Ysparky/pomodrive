import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

/// Key for storing theme preference
const _themePreferenceKey = 'theme_mode';

/// Provider for SharedPreferences instance
@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return SharedPreferences.getInstance();
}

/// Theme mode provider to handle light/dark theme state
@Riverpod(keepAlive: true)
class AppTheme extends _$AppTheme {
  @override
  Future<bool> build() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    return prefs.getBool(_themePreferenceKey) ?? false;
  }

  /// Toggle between light and dark theme
  Future<void> toggleTheme() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final currentValue = state.value ?? false;
    final newValue = !currentValue;

    await prefs.setBool(_themePreferenceKey, newValue);
    state = AsyncValue.data(newValue);
  }
}
