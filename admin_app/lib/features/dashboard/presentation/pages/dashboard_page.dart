import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/theme/admin_colors.dart';
import '../../../shared/widgets/admin_drawer.dart';
import '../widgets/stat_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const AdminDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: const [
                StatCard(
                  title: 'Total Bookings',
                  value: '1,234',
                  icon: Icons.calendar_today,
                  color: AdminColors.chart1,
                  trend: '+12.5%',
                ),
                StatCard(
                  title: 'Active Users',
                  value: '856',
                  icon: Icons.people,
                  color: AdminColors.chart2,
                  trend: '+8.3%',
                ),
                StatCard(
                  title: 'Revenue',
                  value: '\$45.2K',
                  icon: Icons.attach_money,
                  color: AdminColors.chart3,
                  trend: '+15.2%',
                ),
                StatCard(
                  title: 'Pending',
                  value: '23',
                  icon: Icons.pending_actions,
                  color: AdminColors.pending,
                  trend: '-5.1%',
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Recent Bookings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Bookings',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => context.go('/bookings'),
                  child: const Text('View All'),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AdminColors.primary.withOpacity(0.1),
                      child: const Icon(
                        Icons.person,
                        color: AdminColors.primary,
                      ),
                    ),
                    title: Text('Customer Name $index'),
                    subtitle: const Text('Service • Oct 25, 2025'),
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
                    onTap: () {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

