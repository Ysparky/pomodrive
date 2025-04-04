import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodrive/core/theme/providers/theme_provider.dart';

import 'core/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(appThemeProvider);

    return themeState.when(
      data: (isLight) {
        if (Platform.isIOS) {
          return CupertinoApp(
            title: 'Pomodrive',
            theme: isLight ? lightCupertinoTheme : darkCupertinoTheme,
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        }
        return MaterialApp(
          title: 'Pomodrive',
          theme: isLight ? lightMaterialTheme : darkMaterialTheme,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
      loading:
          () =>
              Platform.isIOS
                  ? const CupertinoApp(
                    home: Scaffold(
                      body: Center(child: CupertinoActivityIndicator()),
                    ),
                  )
                  : const MaterialApp(
                    home: Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    ),
                  ),
      error:
          (error, stackTrace) =>
              Platform.isIOS
                  ? CupertinoApp(
                    home: Scaffold(body: Center(child: Text('Error: $error'))),
                  )
                  : MaterialApp(
                    home: Scaffold(body: Center(child: Text('Error: $error'))),
                  ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(appThemeProvider);

    return themeState.when(
      data: (isLight) {
        if (Platform.isIOS) {
          return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('PomoDrive'),
            ),
            child: Stack(
              children: [
                const Center(child: Text('Hello World')),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: CupertinoButton(
                    onPressed:
                        () => ref.read(appThemeProvider.notifier).toggleTheme(),
                    child: Icon(
                      isLight ? CupertinoIcons.moon : CupertinoIcons.sun_max,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text('PomoDrive')),
          body: const Center(child: Text('Hello World')),
          floatingActionButton: FloatingActionButton(
            onPressed: () => ref.read(appThemeProvider.notifier).toggleTheme(),
            child: Icon(isLight ? Icons.dark_mode : Icons.light_mode),
          ),
        );
      },
      loading:
          () => Center(
            child:
                Platform.isIOS
                    ? CupertinoActivityIndicator()
                    : CircularProgressIndicator(),
          ),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
