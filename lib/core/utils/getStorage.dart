import 'package:get_storage/get_storage.dart';

import '../../presentation/bloc/appUser/bloc.dart';

/// app storage
class AppGetXStorage {
  const AppGetXStorage._();
/// user profile
  static const userData = 'user_data';
  

  /// Sets the user profile in the app storage.
  ///
  /// Parameters:
  /// - [user]: The [AppUser] object representing the user profile.
  ///
  /// Returns: None.
  static void setUserProfile(AppUser user) {
    if (user.userID == '') {
      return;
    }
    final box = GetStorage();
    box.write(userData, user.toJson);
  }

  /// Gets the user profile from the app storage.
  ///
  /// Returns: The [AppUser] object representing the user profile or `null` if the user profile is not found.
  ///
  static AppUser get getUser {
    final box = GetStorage();
    final data = box.read(userData);
    if (data != null) {
      return AppUser.fromJson(data);
    } else {
      return AppUser.notFound;
    }
  }
/// Removes the user data from the storage.
///
/// This function removes the user data from the storage, effectively logging the user out.
///
/// No parameters are required.
///
/// No return value.
  static void logout() {
    final box = GetStorage();
    box.remove(userData);
  }


}
