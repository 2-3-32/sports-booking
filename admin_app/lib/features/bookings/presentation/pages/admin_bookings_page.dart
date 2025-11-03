import 'package:flutter/material.dart';

import '../../../../config/theme/admin_colors.dart';
import '../../../shared/widgets/admin_drawer.dart';

class AdminBookingsPage extends StatelessWidget {
  const AdminBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings Management'),
      ),
      drawer: const AdminDrawer(),
      body: Column(
        children: [
          // Filter Tabs
          Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All', true),
                  const SizedBox(width: 8),
                  _buildFilterChip('Pending', false),
                  const SizedBox(width: 8),
                  _buildFilterChip('Confirmed', false),
                  const SizedBox(width: 8),
                  _buildFilterChip('In Progress', false),
                  const SizedBox(width: 8),
                  _buildFilterChip('Completed', false),
                  const SizedBox(width: 8),
                  _buildFilterChip('Cancelled', false),
                ],
              ),
            ),
          ),
          
          // Bookings List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AdminColors.primary.withOpacity(0.1),
                      child: Text('#${index + 1}'),
                    ),
                    title: Text('Booking #${1000 + index}'),
                    subtitle: const Text('Customer Name • Service Name\nOct 25, 2025 • 10:00 AM'),
                    isThreeLine: true,
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AdminColors.confirmed.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Confirmed',
                        style: TextStyle(
                          color: AdminColors.confirmed,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    onTap: () {
                      // Navigate to detail
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {},
      selectedColor: AdminColors.primary.withOpacity(0.2),
      checkmarkColor: AdminColors.primary,
    );
  }
}

