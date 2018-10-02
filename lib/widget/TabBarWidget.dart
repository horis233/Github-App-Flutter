import 'package:flutter/material.dart';


class TabBarWidget extends StatefulWidget {


  static const int BOTTOM_TAB = 1;

  static const int TOP_TAB = 2;

  final int type;

  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final Color backgroundColor;

  final Color indicatorColor;

  final String title;

  TabBarWidget(
      {Key key,
      this.type,
      this.tabItems,
      this.tabViews,
      this.backgroundColor,
      this.indicatorColor,
      this.title})
      : super(key: key);

  @override
  _TabBarState createState() => new _TabBarState(
      type, tabItems, tabViews, backgroundColor, indicatorColor, title);
}

class _TabBarState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  final int _type;

  final List<Widget> _tabItems;

  final List<Widget> _tabViews;

  final Color _backgroundColor;

  final Color _indicatorColor;

  final String _title;

  _TabBarState(this._type, this._tabItems, this._tabViews,
      this._backgroundColor, this._indicatorColor, this._title)
      : super();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    if (this._type == TabBarWidget.BOTTOM_TAB) {
      _tabController = new TabController(
          vsync: this,
          length: 3
          );
    }
  }

  @override
  void dispose() {
    if (this._type == TabBarWidget.BOTTOM_TAB) {
      _tabController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this._type == TabBarWidget.TOP_TAB) {
      ///top tab bar
      return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: _backgroundColor,
            title: new Text(_title),
            bottom: new TabBar(
              tabs: _tabItems,
              indicatorColor: _indicatorColor,
            ),
          ),
          body: new TabBarView(
            children: _tabViews,
          ),
        ),
      );
    }

    ///bottom tab bar
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: _backgroundColor,
          title: new Text(_title),
        ),
        body: new TabBarView(

            controller: _tabController,
            children: _tabViews),
        bottomNavigationBar: new Material(

          color: Colors.deepOrange,
          child: new TabBar(

            controller: _tabController,
            tabs: _tabItems,
            indicatorColor: _indicatorColor, 
          ),
        ));
  }
}
