import 'package:flutter/material.dart';

import '../config/config_export.dart';
import '../constants/constants_export.dart';
import '../widgets/common/export.dart';
import '../widgets/movie_detail/export.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const Background(),
            Container(
              height: size.height / 3.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                GradientPalette.black1,
                GradientPalette.black2,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            const ArrowBack(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24, top: size.height / 4.5),
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width / 2.5,
                        child: Image.asset(
                          AssetPath.posterRalph,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const MovieInfo(),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height - 120,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        alignment: Alignment.center,
                        width: size.width,
                        child: TabBar(
                          tabs: const [
                            Tab(text: "About Movie"),
                            Tab(text: "Review"),
                          ],
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: TxtStyle.heading3,
                          unselectedLabelStyle: TxtStyle.heading3,
                          indicatorColor: DarkTheme.white,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Topic(title: 'Synopsis',),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 24),
                                    child: Text(
                                      AppConstant.exampleContent,
                                      style: TxtStyle.heading4Light,
                                    ),
                                  ),
                                  Topic(title: "Cast & Crew"),
                                  const CastBar(),
                                  Topic(title: "Trailer and song"),
                                  const TrailerBar()
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: const Text("Review Page"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  
}
