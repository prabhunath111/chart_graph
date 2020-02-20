import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MaterialApp(
    showSemanticsDebugger: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
          primaryColor: Colors.blue
    ),
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
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('Others', 52)
    ];

    final List<ChartDataLebel> chartDataLebel = [
      ChartDataLebel('2010', 35, 0.32),
      ChartDataLebel('2011', 38, 0.21),
      ChartDataLebel('2012', 34, 0.38),
      ChartDataLebel('2014', 40, 0.34)
    ];
    final List<SalesDataBar> chartDataBar = [
      SalesDataBar(2010,  23),
      SalesDataBar(2011, 49),
      SalesDataBar(2012,  12),
      SalesDataBar(2013,  33),
      SalesDataBar(2014,  30)
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Icon(Icons.close),
            backgroundColor: Colors.black,
            title: Text('Live Stream Report',style: TextStyle(color: Colors.white),),
            actions: <Widget>[
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context){
                  return ;
                },
              )
            ],
          ),
          body:
          /*Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: (MediaQuery.of(context).size.width)*0.5,
                          height: (MediaQuery.of(context).size.height)*0.4,
                          color: Colors.grey,
                          child: SfCartesianChart(
                              title: ChartTitle(
                                text: 'Area Chart',
                                alignment: ChartAlignment.near,
                              ),
                              series: <ChartSeries>[
                                // Renders area chart
                                AreaSeries<SalesData, double>(
                                    dataSource: chartData,
                                    xValueMapper: (SalesData sales, _) => sales.year,
                                    yValueMapper: (SalesData sales, _) => sales.sales
                                )
                              ]
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                          width: (MediaQuery.of(context).size.width)*0.5,
                          height: (MediaQuery.of(context).size.height)*0.4,
                          color: Colors.grey,
                          child: SfCartesianChart(
                              title: ChartTitle(
                                text: 'Line Chart',
                                alignment: ChartAlignment.near,
                              ),
                              series: <ChartSeries>[
                                // Renders fast line chart
                                FastLineSeries<SalesData, double>(
                                    dataSource: chartData,
                                    xValueMapper: (SalesData sales, _) => sales.year,
                                    yValueMapper: (SalesData sales, _) => sales.sales
                                )
                              ]
                          )
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                          width: (MediaQuery.of(context).size.width)*0.7,
                          height: (MediaQuery.of(context).size.height)*0.4,
                          color: Colors.grey,
                          child: SfCircularChart(
                              title: ChartTitle(
                                text: 'pie Chart',
                                alignment: ChartAlignment.near,
                              ),
                              series: <CircularSeries>[
                                // Render pie chart
                                PieSeries<ChartData, String>(
                                    dataSource: chartDataCircle,
                                    pointColorMapper:(ChartData data,  _) => data.color,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y
                                )
                              ]
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child:  Container(
                          height: (MediaQuery.of(context).size.height)*0.4,

                          color: Colors.grey,
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              title: ChartTitle(
                                text: 'Data lebel Chart',
                                alignment: ChartAlignment.near,
                              ),
                              series: <ChartSeries>[
                                RangeColumnSeries<ChartDataLebel, String>(
                                  dataSource: chartDataLebel,
                                  xValueMapper: (ChartDataLebel sales, _) => sales.x,
                                  lowValueMapper: (ChartDataLebel sales, _) => sales.low,
                                  highValueMapper: (ChartDataLebel sales, _) => sales.high,
                                  dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
//                              position: CartesianLabelPosition.top
                                  ),
                                )
                              ]
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )*/
          SafeArea(
            child: OrientationBuilder(builder: (context, orientation) {
              return GridView.count(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                children: <Widget>[
                  Container(
                    color: Colors.grey,
                      child: SfCartesianChart(
                        title: ChartTitle(
                          text: 'Area Chart',
                          alignment: ChartAlignment.near,
                        ),
                          series: <ChartSeries>[
                            // Renders area chart
                            AreaSeries<SalesData, double>(
                                dataSource: chartData,
                                xValueMapper: (SalesData sales, _) => sales.year,
                                yValueMapper: (SalesData sales, _) => sales.sales
                            )
                          ]
                      )
                  ),
                  Container(
                      color: Colors.grey,
                      child: SfCartesianChart(
                          title: ChartTitle(
                            text: 'Line Chart',
                            alignment: ChartAlignment.near,
                          ),
                          series: <ChartSeries>[
                            // Renders fast line chart
                            FastLineSeries<SalesData, double>(
                                dataSource: chartData,
                                xValueMapper: (SalesData sales, _) => sales.year,
                                yValueMapper: (SalesData sales, _) => sales.sales
                            )
                          ]
                      )
                  ),

                       Container(
                            color: Colors.grey,
                            child: SfCircularChart(
                                title: ChartTitle(
                                  text: 'pie Chart',
                                  alignment: ChartAlignment.near,
                                ),
                                series: <CircularSeries>[
                              // Render pie chart
                              PieSeries<ChartData, String>(
                                  dataSource: chartDataCircle,
                                  pointColorMapper:(ChartData data,  _) => data.color,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y
                              )
                            ]
                            )
                        ),


                  Container(
                      color: Colors.grey,
                      child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          title: ChartTitle(
                            text: 'Data lebel Chart',
                            alignment: ChartAlignment.near,
                          ),
                          series: <ChartSeries>[
                            RangeColumnSeries<ChartDataLebel, String>(
                              dataSource: chartDataLebel,
                              xValueMapper: (ChartDataLebel sales, _) => sales.x,
                              lowValueMapper: (ChartDataLebel sales, _) => sales.low,
                              highValueMapper: (ChartDataLebel sales, _) => sales.high,
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
//                              position: CartesianLabelPosition.top
                              ),
                            )
                          ]
                      )
                  ),
                  Container(
                      color: Colors.grey,
                      child: SfCartesianChart(
                          title: ChartTitle(
                            text: 'Bar Chart',
                            alignment: ChartAlignment.near,
                          ),
                          series: <ChartSeries>[
                            // Renders bar chart
                            BarSeries<SalesDataBar, double>(
                                dataSource: chartDataBar,
                                xValueMapper: (SalesDataBar sales, _) => sales.year,
                                yValueMapper: (SalesDataBar sales, _) => sales.sales
                            )
                          ]
                      ),
                  ),
                  Container(
                      color: Colors.grey,
                      child: SfCartesianChart(
                          title: ChartTitle(
                            text: 'Bar Chart',
                            alignment: ChartAlignment.near,
                          ),
                          series: <ChartSeries>[
                            // Renders bar chart
                            BarSeries<SalesDataBar, double>(
                                dataSource: chartDataBar,
                                xValueMapper: (SalesDataBar sales, _) => sales.year,
                                yValueMapper: (SalesDataBar sales, _) => sales.sales
                            )
                          ]
                      )
                  ),

                ],
              );
            }),
          )


      ),
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