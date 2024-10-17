import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
  child: Column(
    children: <Widget>[
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
            ),
            SizedBox(width: 10), // Added spacing between avatar and text
            Text("Dr. Praveen Ramachandra"),
          ],
        ),
      ),
      Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Text("My Services"),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.receipt), // Changed icon
              title: Text('BILLs & Invoices'),
              trailing: Icon(Icons.arrow_forward_ios), // Last icon added
              onTap: () {
                // Handle navigation to Bills & Invoices
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.medical_services), // Changed icon
              title: Text('Consultations'),
              trailing: Icon(Icons.arrow_forward_ios), // Last icon added
              onTap: () {
                // Handle navigation to Consultations
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.assessment), // Changed icon
              title: Text('Diagnostics'),
              trailing: Icon(Icons.arrow_forward_ios), // Last icon added
              onTap: () {
                // Handle navigation to Diagnostics
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.article), // Changed icon
              title: Text('EMR'),
              trailing: Icon(Icons.arrow_forward_ios), // Last icon added
              onTap: () {
                // Handle navigation to EMR
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.dashboard), // Changed icon
              title: Text('MIS Dashboard'),
              trailing: Icon(Icons.arrow_forward_ios), // Last icon added
              onTap: () {
                // Handle navigation to MIS Dashboard
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.insert_drive_file), // Changed icon
              title: Text('Reports'),
              trailing: Icon(Icons.arrow_forward_ios), // Last icon added
              onTap: () {
                // Handle navigation to Reports
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.app_registration), // Changed icon
              title: Text('Registration'),
              trailing: Icon(Icons.arrow_forward_ios), // Last icon added
              onTap: () {
                // Handle navigation to Registration
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.store), // Changed icon
              title: Text('Warehouse'),
              trailing: Icon(Icons.arrow_forward_ios), // Last icon added
              onTap: () {
                // Handle navigation to Warehouse
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.settings), // Changed icon for settings
        title: Text('Settings'),
        trailing: Icon(Icons.arrow_forward_ios), // Last icon added
        onTap: () {
          // Handle navigation to Settings
          Navigator.pop(context);
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.logout), // Changed icon for logout
        title: Text('Log out'),
        trailing: Icon(Icons.arrow_forward_ios), // Last icon added
        onTap: () {
          // Handle logout
          Navigator.pop(context);
        },
      ),
    ],
  ),
),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // My Consultations Section
              Text(
                'My Consultations (14)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ConsultationSummary(),
              SizedBox(height: 20),

              // Today's Stats Section
              Text(
                "Today's Stats",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child:
                          StatCard('Surgeries', Icons.medical_services, '01')),
                  SizedBox(width: 10),
                  Expanded(
                      child: StatCard('Meetings', Icons.meeting_room, '01')),
                ],
              ),
              SizedBox(height: 20),

              // Patients Visit Details Section
              _buildPatientsVisitSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Patients Visit Details Section
  Widget _buildPatientsVisitSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Patients Visit Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: '4 months',
              icon: Icon(Icons.arrow_drop_down),
              underline: SizedBox(),
              onChanged: (String? newValue) {},
              items: <String>['4 months', '6 months', '1 year']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          height: 250,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 400,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: _bottomTitles,
                    reservedSize: 30,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 100,
                    // getTitlesWidget: _leftTitles,
                    reservedSize: 42,
                  ),
                ),
              ),
              barGroups: _buildBarGroups(),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ],
    );
  }

  // Bar group builder
  List<BarChartGroupData> _buildBarGroups() {
    return [
      _buildBarGroup(0, 260), // February
      _buildBarGroup(1, 200), // March
      _buildBarGroup(2, 250), // April
      _buildBarGroup(3, 180), // May
    ];
  }

// Individual bar group
  BarChartGroupData _buildBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Color(0xFF29B6F6), // Light blue color for the bars
          width: 30,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }
}

Widget _bottomTitles(double value, TitleMeta meta) {
  switch (value.toInt()) {
    case 0:
      return const Text('Feb');
    case 1:
      return const Text('Mar');
    case 2:
      return const Text('Apr');
    case 3:
      return const Text('May');
    default:
      return const Text('');
  }
}

// Custom Widget for Consultation Summary
class ConsultationSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ConsultationDetail('Pending', '04'),
              ConsultationDetail('Completed', '08'),
              ConsultationDetail('On Hold', '02'),
            ],
          ),
          Divider(color: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              PatientDetail('New Patients', '09', '+12%'),
              PatientDetail('Old Patients', '03', '-08%'),
            ],
          ),
        ],
      ),
    );
  }

  Widget PatientDetail(String title, String count, String percentage) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: Colors.white)),
        Row(
          children: [
            Text(count, style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(width: 5),
            Text(percentage,
                style: TextStyle(
                    color:
                        percentage.contains('-') ? Colors.red : Colors.green)),
          ],
        ),
      ],
    );
  }

  Widget ConsultationDetail(String title, String count) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(count, style: TextStyle(color: Colors.white, fontSize: 20)),
      ],
    );
  }
}

// Custom Widget for Stats Cards
class StatCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String count;

  StatCard(this.title, this.icon, this.count);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.blue, size: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(count, style: TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
