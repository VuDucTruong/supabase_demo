import 'package:flutter/material.dart';
import 'package:supabase_demo/dependency_injections.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSupabase();
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

const SUPABASE_URL = 'https://txpiyujoxmbyhijfazaq.supabase.co';
const SUPABASE_ANON_KEY =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR4cGl5dWpveG1ieWhpamZhemFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI2MDY1MTEsImV4cCI6MjAwODE4MjUxMX0.O6L5MY7UoyNqv2iXyt7d-oGAnjz_NzLdYnLk4-R3IHY';

Future<void> initSupabase() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.info,
    ),
    storageOptions: const StorageClientOptions(
      retryAttempts: 10,
    ),
  );
}
