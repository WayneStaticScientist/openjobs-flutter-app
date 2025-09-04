import 'package:supabase_flutter/supabase_flutter.dart';

class UserAuth {
  Future<void> signIn({required String email, required String password}) async {
    final supabaseClient = Supabase.instance.client;
    try {
      await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String dateOfBirth,
    required String password,
  }) async {
    try {
      final supabaseClient = Supabase.instance.client;
      final AuthResponse response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "dob": dateOfBirth,
          "role": "user",
          "phone": "",
          "location": "",
          "purpose": "",
        },
      );
      if (response.user != null) {
        return "Account creation was succesfull check email for verification";
      }
      return "Account creation was  successfull";
    } on AuthException catch (e) {
      throw 'Error: ${e.message}';
    } catch (e) {
      throw 'An unexpected error occurred: $e';
    }
  }

  String? get firstName {
    final user = Supabase.instance.client.auth.currentUser;
    return user?.userMetadata?['firstName'];
  }

  String? get email {
    final user = Supabase.instance.client.auth.currentUser;
    return user?.userMetadata?['email'];
  }

  String? get lastName {
    final user = Supabase.instance.client.auth.currentUser;
    return user?.userMetadata?['lastName'];
  }

  String? get role {
    final user = Supabase.instance.client.auth.currentUser;
    return user?.userMetadata?['role'];
  }

  String? get phone {
    final user = Supabase.instance.client.auth.currentUser;
    return user?.userMetadata?['phone'];
  }

  String? get location {
    final user = Supabase.instance.client.auth.currentUser;
    return user?.userMetadata?['location'];
  }

  String? get purpose {
    final user = Supabase.instance.client.auth.currentUser;
    return user?.userMetadata?['purpose'];
  }
}
