import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(2010, 35),
      SalesData(2011, 28),
      SalesData(2012, 34),
      SalesData(2013, 32),
      SalesData(2014, 40)
    ];
    final List<ChartData> chartDataCircle = [
      ChartData('David', 25, Colors.lightBlue),
      ChartData('Steve', 60, Color(0xFF0066A8)),
      ChartData('Jack', 5, Color(0XFF004875)),
      ChartData('Joe', 5, Color(0XFF9BDFFF)),
      ChartData('Others', 5, Color(0XFF4DC1FF)),
    ];

    final List<ChartDataLebel> chartDataLebel = [
      ChartDataLebel('2010', 65, 0),
      ChartDataLebel('2011', 32, 0),
//      ChartDataLebel('2012', 34, 14),
//      ChartDataLebel('2014', 40, 13)
    ];
    final List<SalesDataBar> chartDataBar = [
      SalesDataBar(2010, 25),
      SalesDataBar(2011, 35),
      SalesDataBar(2012, 75),
//      SalesDataBar(2013, 33),
//      SalesDataBar(2014, 30)
    ];

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Icon(Icons.close),
            backgroundColor: Colors.black,
            title: Text(
              'Live Stream Report',
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return;
                },
              )
            ],
          ),
          body: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: (MediaQuery.of(context).size.height) * 0.2,
                        width: (MediaQuery.of(context).size.width) * 0.5,
                        color: Color(0xFFEFF3F4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SfCartesianChart(
                              primaryXAxis: NumericAxis(
                                //Hide the gridlines of x-axis
                                majorGridLines: MajorGridLines(width: 0),
                                //Hide the axis line of x-axis
                                axisLine: AxisLine(width: 0),
                              ),
                              /*primaryYAxis: NumericAxis(
                                //Hide the gridlines of y-axis
                                  majorGridLines: MajorGridLines(width: 0),
                                  //Hide the axis line of y-axis
                                  axisLine: AxisLine(width: 0)
                              ),*/

                              title: ChartTitle(
                                text: 'Area Chart',
                                alignment: ChartAlignment.near,
                                textStyle: ChartTextStyle(fontSize: 12.0),
                              ),
                              series: <ChartSeries>[
                                // Renders area chart
                                AreaSeries<SalesData, double>(
                                    legendItemText: '18',
                                    isVisibleInLegend: false,
                                    color: Color(0xFFAFE2FD),
                                    dataSource: chartData,
                                    xValueMapper: (SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesData sales, _) =>
                                        sales.sales)
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.2,
                        width: 6.0,
                      ),
                      Expanded(
                        child: Container(
                          color: Color(0xFFEFF3F4),
                          height: (MediaQuery.of(context).size.height) * 0.2,
                          width: (MediaQuery.of(context).size.width) * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SfCartesianChart(
                                primaryXAxis: NumericAxis(
                                  //Hide the gridlines of x-axis
                                  majorGridLines: MajorGridLines(width: 0),
                                  //Hide the axis line of x-axis
                                  axisLine: AxisLine(width: 0),
                                ),
                                /*primaryYAxis: NumericAxis(
                                  //Hide the gridlines of y-axis
                                    majorGridLines: MajorGridLines(width: 0),
                                    //Hide the axis line of y-axis
                                    axisLine: AxisLine(width: 0)
                                ),*/

                                title: ChartTitle(
                                    text: 'Line Chart',
                                    alignment: ChartAlignment.near,
                                    textStyle: ChartTextStyle(fontSize: 12.0)),
                                series: <ChartSeries>[
                                  // Renders fast line chart
                                  FastLineSeries<SalesData, double>(
                                      color: Color(0xFFAFE2FD),
                                      dataSource: chartData,
                                      xValueMapper: (SalesData sales, _) =>
                                          sales.year,
                                      yValueMapper: (SalesData sales, _) =>
                                          sales.sales)
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 32.0, left: 2.0),
                            color: Color(0xFFEFF3F4),
                            height: (MediaQuery.of(context).size.height) * 0.2,
                            width: (MediaQuery.of(context).size.width) * 0.35,
                            child: SfCircularChart(
                                title: ChartTitle(
                                    text: 'pie Chart',
                                    alignment: ChartAlignment.near,
                                    textStyle: ChartTextStyle(fontSize: 12.0)),
                                series: <CircularSeries>[
                                  // Render pie chart
                                  PieSeries<ChartData, String>(
                                      dataSource: chartDataCircle,
                                      pointColorMapper: (ChartData data, _) =>
                                          data.color,
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y)
                                ]),
                          ),
                          Container(
                            color: Color(0xFFEFF3F4),
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        color: Colors.lightBlue,
                                      ),
                                      Text('20.4%'),
                                      Text('ABC'),
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        color: Color(0xFF4DC1FF),
                                      ),
                                      Text('26.4%'),
                                      Text('ABC'),
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        color: Color(0xFF0066A8),
                                      ),
                                      Text('30.5%'),
                                      Text('ABC'),
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        color: Color(0xFF004875),
                                      ),
                                      Text('36.4%'),
                                      Text('ABC'),
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        color: Color(0xFF9BDFFF),
                                      ),
                                      Text('39.5%'),
                                      Text('ABC'),
                                    ]),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 10.0,
                                        width: 10.0,
                                        color: Color(0xFF4DC1FF),
                                      ),
                                      Text('40.5%'),
                                      Text('ABC'),
                                    ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.2,
                        width: 6.0,
                      ),
                      Expanded(
                        child: Container(
                          color: Color(0xFFEFF3F4),
                          height: (MediaQuery.of(context).size.height) * 0.2,
                          width: (MediaQuery.of(context).size.width) * 0.5,
                          child: SfCartesianChart(
                              primaryYAxis: NumericAxis(
                                  //Hide the gridlines of y-axis
                                  majorGridLines: MajorGridLines(width: 0),
                                  //Hide the axis line of y-axis
                                  axisLine: AxisLine(width: 0)),
                              primaryXAxis: CategoryAxis(isVisible: false),
                              title: ChartTitle(
                                  text: 'Data lebel Chart',
                                  alignment: ChartAlignment.near,
                                  textStyle: ChartTextStyle(fontSize: 12.0)),
                              series: <ChartSeries>[
                                RangeColumnSeries<ChartDataLebel, String>(
                                  color: Colors.blue,
                                  dataSource: chartDataLebel,
                                  xValueMapper: (ChartDataLebel sales, _) =>
                                      sales.x,
                                  lowValueMapper: (ChartDataLebel sales, _) =>
                                      sales.low,
                                  highValueMapper: (ChartDataLebel sales, _) =>
                                      sales.high,
                                  dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
//                              position: CartesianLabelPosition.top
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        color: Color(0xFFEFF3F4),
                        width: MediaQuery.of(context).size.width * 0.33,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SfCartesianChart(
                              /*primaryYAxis: NumericAxis(
                                //Hide the gridlines of y-axis
                                  majorGridLines: MajorGridLines(width: 0),
                                  //Hide the axis line of y-axis
                                  axisLine: AxisLine(width: 0)
                              ),
                              primaryXAxis: CategoryAxis(
                                  isVisible: false
                              ),*/
                              primaryXAxis: NumericAxis(
                                  //Hide the gridlines of y-axis
                                  majorGridLines: MajorGridLines(width: 0),
                                  //Hide the axis line of y-axis
                                  axisLine: AxisLine(width: 0)),

                              title: ChartTitle(
                                  text: 'Bar Chart',
                                  alignment: ChartAlignment.near,
                                  textStyle: ChartTextStyle(fontSize: 12.0)),
                              series: <ChartSeries>[
                                // Renders bar chart
                                BarSeries<SalesDataBar, double>(
                                    dataSource: chartDataBar,
//                                  color: Color(0xFFAFE2FD),
                                    xValueMapper: (SalesDataBar sales, _) =>
                                        sales.year,
                                    yValueMapper: (SalesDataBar sales, _) =>
                                        sales.sales)
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: 6.0,
                      ),
                      Expanded(
                        child: Container(
                          color: Color(0xFFEFF3F4),
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SfCartesianChart(
                                primaryXAxis: NumericAxis(
                                    //Hide the gridlines of y-axis
                                    majorGridLines: MajorGridLines(width: 0),
                                    //Hide the axis line of y-axis
                                    axisLine: AxisLine(width: 0)),
                                title: ChartTitle(
                                    text: 'Bar Chart',
                                    alignment: ChartAlignment.near,
                                    textStyle: ChartTextStyle(fontSize: 12.0)),
                                series: <ChartSeries>[
                                  // Renders bar chart
                                  BarSeries<SalesDataBar, double>(
                                      dataSource: chartDataBar,
                                      xValueMapper: (SalesDataBar sales, _) =>
                                          sales.year,
                                      yValueMapper: (SalesDataBar sales, _) =>
                                          sales.sales)
                                ]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: 6.0,
                      ),
                      Expanded(
                        child: Container(
                          color: Color(0xFFEFF3F4),
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SfCartesianChart(
                                primaryXAxis: NumericAxis(
                                    //Hide the gridlines of y-axis
                                    majorGridLines: MajorGridLines(width: 0),
                                    //Hide the axis line of y-axis
                                    axisLine: AxisLine(width: 0)),
                                title: ChartTitle(
                                    text: 'Bar Chart',
                                    alignment: ChartAlignment.near,
                                    textStyle: ChartTextStyle(fontSize: 12.0)),
                                series: <ChartSeries>[
                                  // Renders bar chart
                                  BarSeries<SalesDataBar, double>(
                                      dataSource: chartDataBar,
                                      xValueMapper: (SalesDataBar sales, _) =>
                                          sales.year,
                                      yValueMapper: (SalesDataBar sales, _) =>
                                          sales.sales)
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final double year;
  final double sales;
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color color;
}

class ChartDataLebel {
  ChartDataLebel(this.x, this.high, this.low);

  final String x;
  final double high;
  final double low;
}

class SalesDataBar {
  SalesDataBar(this.year, this.sales);

  final double year;
  final double sales;
}
