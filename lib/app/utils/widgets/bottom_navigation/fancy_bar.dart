import 'package:arre_demo/app/themes/app_theme_colors.dart';
import 'package:flutter/material.dart';

class FancyBottomBar extends StatefulWidget {
  final List<FancyItem>? items;
  final selectedIndex;
  final ValueChanged<FancyItem>? onItemSelected;

  FancyBottomBar({
    this.items,
    this.selectedIndex = 0,
    @required this.onItemSelected,
  }) {
    assert(items != null);
    assert(onItemSelected != null);
  }

  @override
  _FancyBottomBarState createState() => _FancyBottomBarState();
}

class _FancyBottomBarState extends State<FancyBottomBar> {
  int pos = 0;

  void setItem(int _pos) {
    setState(() {
      pos = _pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.items!.map((_item) {
        FancyItem item = _item;
        var index = widget.items!.indexOf(_item);
        return InkWell(
          onTap: () {

            if (item.needAnimation) {
              setItem(index);
            }
            widget.onItemSelected!(_item);
          },
          child: _item.needAnimation ? _ItemVWidget(
            item: item,
            isSelected: index == pos,
            length: widget.items!.length,
          ) : Container(
            color: AppColors.black.withOpacity(0.7),
            width: MediaQuery.of(context).size.width / widget.items!.length,
            height: kBottomNavigationBarHeight,
            alignment: Alignment.center,
            child: item.unSelectedWidget,
          ),
        );
      }).toList(),
    );
  }
}

class _ItemVWidget extends StatelessWidget {
  final FancyItem? item;
  final bool? isSelected;
  final int? length;

  const _ItemVWidget({Key? key, this.item, this.isSelected, this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / length!,
      height: kBottomNavigationBarHeight,
      color: AppColors.black.withOpacity(0.7),
      child: AnimatedContainer(
        height: 0,
        duration: Duration(milliseconds: 300),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: item!.unSelectedWidget,
            ),
            AnimatedOpacity(
              opacity: isSelected! ? 1.0 : 0.0,
              // Change opacity based on selection
              duration: Duration(milliseconds: 300),
              child: AnimatedContainer(
                alignment: Alignment.center,
                duration: Duration(milliseconds: 300),
                height: isSelected! ? kToolbarHeight : 24,
                child: item!.selectedWidget ?? item!.unSelectedWidget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FancyItem {
  int index;
  Widget unSelectedWidget;
  Widget? selectedWidget;
  bool needAnimation = true;

  FancyItem(this.index, this.unSelectedWidget,
      { this.selectedWidget, this.needAnimation = true});
}
