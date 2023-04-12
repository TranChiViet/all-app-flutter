import 'package:flutter/material.dart';

import '../widgets/main_stats.dart';
import '../widgets/report_time.dart';

class AccessIndexScreen extends StatelessWidget {
  const AccessIndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉ số lượt truy cập'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Container(
        height: device.height,
        width: device.width,
        // padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ReportTime(),
              SizedBox(height: device.height * 0.02),
              MainStats(),
            ],
          ),
        ),
      ),
    );
  }
}
