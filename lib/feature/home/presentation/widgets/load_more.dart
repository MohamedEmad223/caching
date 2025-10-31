import 'package:flutter/material.dart';

class LoadMore extends StatelessWidget {
  const LoadMore({super.key, required this.isDarkMode});
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Text(
                        'Load More Movies',
                        style: TextStyle(
                          color: isDarkMode
                              ? Colors.white70
                              : Colors.grey.shade700,
                        ),
                      );
  }
}