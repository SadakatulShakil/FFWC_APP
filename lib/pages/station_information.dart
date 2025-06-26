import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utills/widgets/station_info_graphical_view.dart';
import '../utills/widgets/station_info_list_view.dart';

class StationInformation extends StatefulWidget {
  final int tabIndex;
  final String title;
  final String value;
  final String label;

  StationInformation({super.key, this.tabIndex = 0,
    required this.title,
    required this.value,
    required this.label});
  @override
  State<StationInformation> createState() => _StationInformationState();
}

class _StationInformationState extends State<StationInformation> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.tabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              ///Background gradiant for appbar
              Container(
                padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1B8CBE), Color(0xFF09228F)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding:  EdgeInsets.all(12.0),
                        child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18,),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'স্টেশনের বর্তমান অবস্থা',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text( widget.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00E5CA),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 12.0, right: 8.0),
                      child: Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF00E5CA), size: 18,),
                    ),
                  ],
                ),
              ),

              /// Curved section and List of content
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Add TabBar
                        SizedBox(height: 8),
                        Text('সর্বশেষ আপডেট: রবিবার ২৪ জুন, ২০২৪ রাত ৯.০০ টা',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFF5AAFE5), Color(0xFF3B8DD2)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                              )
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white70,
                              tabs: [
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.map),
                                      SizedBox(width: 8),
                                      Text("মানচিত্র দেখুন"),
                                    ],
                                  ),
                                ),
                                Tab(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.format_list_bulleted),
                                      SizedBox(width: 8),
                                      Text("তালিকা দেখুন"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // TabBarView
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Center(child: StationInfoGraphicalView()),
                              Center(child: StationInfoListView()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
