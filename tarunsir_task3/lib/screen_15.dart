import 'package:flutter/material.dart';

void main() {
  runApp(NotificationUI());
}

class NotificationUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: Icon(Icons.arrow_back),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Mark all as read',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'General (2)'),
            Tab(text: 'Replies (1)'),
            Tab(text: 'Archived'),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                buildFilterChip('All', true),
                SizedBox(width: 8),
                buildFilterChip('Not seen', false),
                SizedBox(width: 8),
                buildFilterChip('Seen', false),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.filter_list, color: Colors.grey),
                  onPressed: () {},
                ),
                
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildNotificationCard(
                  title: 'EMR',
                  message:
                      'Hello, this is to notify you that your first EMR has been received by us and we will keep updating you about it.',
                  time: '2h ago',
                  isUnread: true,
                  hasActions: false,
                ),
                buildNotificationCard(
                  title: 'IMG',
                  message:
                      'Hello, this is to notify you that your first EMR has been received by us and we will keep updating you about it.',
                  time: '5h ago',
                  isUnread: true,
                  hasActions: true,
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Previous notifications',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                buildNotificationCard(
                  title: 'IMG',
                  message:
                      'Hello, this is to notify you that your first EMR has been received by us and we will keep updating you about it.',
                  time: '1d ago',
                  isUnread: false,
                  hasActions: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Priorities:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                buildPriorityIndicator(Colors.red, 'High'),
                buildPriorityIndicator(Colors.orange, 'Medium'),
                buildPriorityIndicator(Colors.green, 'Low'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFilterChip(String label, bool isSelected) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool value) {},
      selectedColor: Colors.blue.shade100,
      labelStyle: TextStyle(color: isSelected ? Colors.blue : Colors.black),
      backgroundColor: Colors.grey.shade200,
    );
  }

  Widget buildNotificationCard({
    required String title,
    required String message,
    required String time,
    required bool isUnread,
    required bool hasActions,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: isUnread ? Colors.blue.shade50 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.red,
                  size: 12,
                ),
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Spacer(),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(color: Colors.black87),
            ),
            SizedBox(height: 8),
            hasActions
                ? Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Reason*',
                          hintText: 'Enter the reason here',
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              // primary: Colors.red,
                            ),
                            child: Text('Reject'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              // primary: Colors.green,
                            ),
                            child: Text('Approve'),
                          ),
                        ],
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          isUnread ? 'Unread' : 'Read',
                          style: TextStyle(
                            color: isUnread ? Colors.red : Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildPriorityIndicator(Color color, String label) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 12),
        SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
