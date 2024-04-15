import 'package:flutter/material.dart';

class PaginationNavigationBar extends StatefulWidget {
  final int page;
  final Function onChange;


  const PaginationNavigationBar(this.page, this.onChange, {super.key});

  @override
  State<PaginationNavigationBar> createState() => _PaginationNavigationBarState();
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
                    color: Color.fromRGBO(212, 20, 26, 100),
                    size: 58,
                  ),
                ),

                PageButton(
                    onChange: widget.onChange, selected: page1 == widget.page, page: page1),
                PageButton(
                    onChange: widget.onChange, selected: page2 == widget.page, page: page2),
                PageButton(
                    onChange: widget.onChange, selected: page3 == widget.page, page: page3),

                TextButton(
                  onPressed: () {
                    widget.onChange(widget.page + 1);
                  },
                  child: const Icon(Icons.arrow_right_outlined,
                      color: Color.fromRGBO(
                        212,
                        20,
                        26,
                        100,
                      ),
                      size: 58),
                ),
                //Icon(Icons.arrow_right_outlined,color: Color.fromRGBO(212, 20, 26, 100, ),size:58)
              ],
            ),
          ),
          Container(
            color: const Color.fromRGBO(212, 20, 26, 100),
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
              ? MaterialStateProperty.all(Colors.red)
              : MaterialStateProperty.all(Colors.white),
              
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: Colors.red)))),
      child: Text(
        page.toString(),
        style: TextStyle(color: selected ? Colors.white : Colors.red),
      ),
    );
  }
}