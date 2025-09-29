import 'package:belanja/models/item.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page_gorouter.dart'; // Buat halaman detail versi go_router
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(), // Halaman utama tetap sama
    ),
    GoRoute(
      path: '/item',
      // Gunakan builder agar bisa menerima data 'extra'
      builder: (context, state) {
        // Ambil data yang dikirim melalui 'extra'
        final item = state.extra as Item;
        return ItemPageGoRouter(item: item);
      },
    ),
  ],
);
