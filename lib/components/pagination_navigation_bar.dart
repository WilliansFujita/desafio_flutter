import 'package:desafio_flutter_hero/theme/custom_color.dart';
import 'package:flutter/material.dart';

class PaginationNavigationBar extends StatefulWidget {
  final int page;
  final int finalPage;
  final Function onChange;

  const PaginationNavigationBar(this.page, this.finalPage, this.onChange,
      {super.key});

  @override
  State<PaginationNavigationBar> createState() =>
      _PaginationNavigationBarState();
}

class _PaginationNavigationBarState extends State<PaginationNavigationBar> {
  late int page1;

  late int page2;

  late int page3;

  @override
  Widget build(BuildContext context) {
    setPages();

    return SizedBox(
      height: 90,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 78,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    widget.onChange(widget.page - 1);
                  },
                  child: const Icon(
                    Icons.arrow_left_outlined,
                    color: CustomColorTheme.customRed,
                    size: 58,
                  ),
                ),

                PageButton(
                    onChange: widget.onChange,
                    selected: page1 == widget.page,
                    page: page1),
                PageButton(
                    onChange: widget.onChange,
                    selected: page2 == widget.page,
                    page: page2),
                PageButton(
                    onChange: widget.onChange,
                    selected: page3 == widget.page,
                    page: page3),

                TextButton(
                  onPressed: () {
                    widget.onChange(widget.page + 1);
                  },
                  child: const Icon(Icons.arrow_right_outlined,
                      color: CustomColorTheme.customRed,
                      size: 58),
                ),
              ],
            ),
          ),
          Container(
            color: CustomColorTheme.customRed,
            height: 12,
          ),
        ],
      ),
    );
  }

  void setPages() {
    if (widget.page == 1) {
      page1 = widget.page;
      page2 = widget.page + 1;
      page3 = widget.page + 2;
    } else if (widget.page >= widget.finalPage) {
      page1 = widget.page - 2;
      page2 = widget.page - 1;
      page3 = widget.page;
    } else {
      page1 = widget.page - 1;
      page2 = widget.page;
      page3 = widget.page + 1;
    }
  }
}

class PageButton extends StatelessWidget {
  const PageButton({
    super.key,
    required this.onChange,
    required this.selected,
    required this.page,
  });

  final Function onChange;
  final bool selected;
  final int page;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onChange(page);
      },
      style: ButtonStyle(
          backgroundColor: selected
              ? MaterialStateProperty.all(CustomColorTheme.customRed)
              : MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: CustomColorTheme.customRed)))),
      child: Text(
        page.toString(),
        style: TextStyle(color: selected ? Colors.white : CustomColorTheme.customRed),
      ),
    );
  }
}
