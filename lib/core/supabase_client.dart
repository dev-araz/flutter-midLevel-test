import 'package:supabase_flutter/supabase_flutter.dart';

// راه‌اندازی و پیکربندی سوپابیس

class SupabaseConfig {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://oygbyelyewtiapmoywmi.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im95Z2J5ZWx5ZXd0aWFwbW95d21pIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDkwMzE3MDAsImV4cCI6MjA2NDYwNzcwMH0.vebmnu1dIpLUPthEOJfPsJGy4Vi-a4OXlFpbMppVJ3A',
    );
  }
}

final supabase = Supabase.instance.client;
