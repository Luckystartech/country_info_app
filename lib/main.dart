import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // Enabled Riverpod for the entire application
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
