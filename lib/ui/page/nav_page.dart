import 'package:flutter/material.dart';
import 'package:flutter_consume/ui/page/all_page.dart';
import 'package:flutter_consume/ui/page/bill_page.dart';
import 'package:flutter_consume/ui/page/my_page.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;
  var _controller = PageController(initialPage: 0);
  DateTime _lastPressedAt;

  List<Widget> pageView = [
    BillPage(),
    AllPage(),
    MyPage(),
  ];

  List navItem = [
    {'icon':Icons.table_chart,'title':'本月'},
    {'icon':Icons.payment,'title':'账单'},
    {'icon':Icons.person,'title':'我的'},
  ];


  @override
  void initState() {
    // TODOx: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(child: Scaffold(
      body: PageView(
        controller: _controller,
        children: pageView,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        items: navItem.map((e)=>BottomNavigationBarItem(icon: Icon(e['icon']),label: e['title'])).toList(),
        currentIndex: _currentIndex,
        onTap: (int index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[400],
        unselectedItemColor: Colors.black26,
      ),
    ), onWillPop: ()async{
      if (_lastPressedAt == null ||
          DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
        //两次点击间隔超过1秒则重新计时
        _lastPressedAt = DateTime.now();
        return false;
      }
      return true;
    });
  }
}
