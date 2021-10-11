import 'package:flutter_sample02/components/importer.dart';

/// DebugLog common to all apps.
void debugLog(String message, String name) {
  if (kDebugMode) {
    print('[$name] $message');
  }
}
