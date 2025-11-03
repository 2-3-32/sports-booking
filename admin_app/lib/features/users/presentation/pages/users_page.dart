import 'package:flutter/material.dart';

import '../../../../config/theme/admin_colors.dart';
import '../../../shared/widgets/admin_drawer.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const AdminDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 50,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AdminColors.primary.withOpacity(0.1),
                child: Text(
                  'U${index + 1}',
                  style: const TextStyle(
                    color: AdminColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text('User Name $index'),
              subtitle: Text('user$index@example.com'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AdminColors.success.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Active',
                      style: TextStyle(
                        color: AdminColors.success,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.chevron_right),
                ],
              ),
              onTap: () {
                // Navigate to user detail
              },
            ),
          );
        },
      ),
    );
  }
}

