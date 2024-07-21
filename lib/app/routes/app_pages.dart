import 'package:get/get.dart';

import '../modules/artists/bindings/artists_binding.dart';
import '../modules/artists/views/artists_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search_music/bindings/search_music_binding.dart';
import '../modules/search_music/views/search_music_view.dart';
import '../modules/song_lists/bindings/song_lists_binding.dart';
import '../modules/song_lists/views/song_lists_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SONG_LISTS,
      page: () => SongListsView(),
      binding: SongListsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_MUSIC,
      page: () => const SearchMusicView(),
      binding: SearchMusicBinding(),
    ),
    GetPage(
      name: _Paths.ARTISTS,
      page: () => const ArtistsView(),
      binding: ArtistsBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
  ];
}
