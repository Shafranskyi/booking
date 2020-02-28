import 'package:cupertino_range_slider/cupertino_range_slider.dart';
import 'package:flutter/material.dart';

import 'filterItemHolder/filterItemHolder.dart';

import 'package:booking/setting/styling.dart';

class RangeSliderItem extends StatefulWidget {
  final int initialMinValue;
  final int initialMaxValue;
  final ValueChanged<int> onMinValueChanged;
  final ValueChanged<int> onMaxValueChanged;

  const RangeSliderItem({Key key, this.initialMinValue, this.initialMaxValue, this.onMinValueChanged, this.onMaxValueChanged}) : super(key: key);

  @override
  _RangeSliderItemState createState() => _RangeSliderItemState();
}

class _RangeSliderItemState extends State<RangeSliderItem> {
  int minValue;
  int maxValue;


  @override
  void initState() {
    super.initState();
    minValue = widget.initialMinValue;
    maxValue = widget.initialMaxValue;
  }

  @override
  Widget build(BuildContext context) {
    return FilterItemHolder(
      value: '\$$minValue - \$$maxValue',
      child: CupertinoRangeSlider(
        activeColor: AppTheme.selectedTabBackgroundColor,
        minValue: minValue.roundToDouble(),
        maxValue: maxValue.roundToDouble(),
        min: 1.0,
        max: 50000.0,
        onMinChanged: (minVal){
          setState(() {
            minValue = minVal.round();
            if(widget.onMinValueChanged != null) {
              widget.onMinValueChanged(minValue);
            }
          });
        },
        onMaxChanged: (maxVal){
          setState(() {
            maxValue = maxVal.round();
            if(widget.onMaxValueChanged != null) {
              widget.onMaxValueChanged(maxValue);
            }
          });
        },
      ),
    );
  }
}

