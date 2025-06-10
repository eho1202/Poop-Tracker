import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentPageIndex;
  final Function(int) onPageChanged;

  const BottomNav(
      {super.key, required this.currentPageIndex, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.blue[400],
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            index: 0,
            icon: Icons.home,
            label: 'Home',
            isSelected: currentPageIndex == 0,
          ),
          _buildNavItem(
            index: 1,
            icon: Icons.people,
            label: 'Friends',
            isSelected: currentPageIndex == 1,
          ),
          _buildNavItem(
            index: 2,
            icon: Icons.settings,
            label: 'Settings',
            isSelected: currentPageIndex == 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onPageChanged(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                color: isSelected ? Colors.white : Colors.white70, size: 24),
            SizedBox(height: 4),
            Text(label,
                style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white : Colors.white70,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}
