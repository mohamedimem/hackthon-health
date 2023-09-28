import 'package:flutter/material.dart';
import 'package:hackthon/historic/historic.dart';
import 'package:hackthon/library/library_pae.dart';
import 'package:hackthon/profile/profile_page.dart';
import 'package:hackthon/scan/scanPage.dart';
import 'package:hackthon/shared/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(pageProvider);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int newPage) {
          // Call changePage method to update the index
          ref.read(pageProvider.notifier).changePage(newPage);
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'Scan'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Pause'),
        ],
      ),
      body: pages[index],
    );
  }
}

List<Widget> pages = [ScanPage(), SearchBarApp(), ProfilePage()];
