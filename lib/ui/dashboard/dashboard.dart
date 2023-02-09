import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:cliko_web/ui/dashboard/users.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  static const String tag = "dashboard";

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  var textController = TextEditingController();
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png"),
        backgroundColor: Colors.white,
        actions: [
          AnimSearchBar(
            width: 400,
            textController: textController,
            color: Colors.transparent,
            boxShadow: false,
            helpText: "Search Cliko",
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
            onSubmitted: (String) {},
          ),
          Container(
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
            color: Colors.grey,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            child: Text(
              "Z",
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
            decoration: BoxDecoration(
                color: Color.fromRGBO(101, 8, 8, 1.0), shape: BoxShape.circle),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(

            controller: sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Color.fromRGBO(10, 8, 8, 0.4),
              unselectedIconColor:  Colors.white,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              unselectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              backgroundColor: Color.fromRGBO(37, 56, 89, 1.0)
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Cliko',
                style: TextStyle(fontSize: 15,color: Colors.white),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Dashboard',

                onTap: (page, _) {
                  sideMenu.changePage(page);
                },

                trailing: Container(
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 3),
                      child: Text(
                        '3',
                        style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                      ),
                    )),

                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                priority: 1,
                title: 'Customers',
                onTap: (page, _) {
                  sideMenu.changePage(page);
              },
                trailing: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 3),
                      child: Text(
                        'New',
                        style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                      ),
                    )),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Suppliers',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },

              ),
              SideMenuItem(
                priority: 4,
                title: 'Users',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                 ),
              SideMenuItem(
                priority: 3,
                title: 'Orders',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                ),
              SideMenuItem(
                priority: 5,
                title: 'Settings',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                  ),

            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Customers',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Suppliers',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Orders',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                UsersSection(),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Seetings',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
