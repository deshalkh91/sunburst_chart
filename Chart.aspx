﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chart.aspx.cs" Inherits="Chart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/plugins/sunburst.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <style>
#chartdiv {
  height: 650px;
}
</style>

    <div id="chartdiv">
        </div>

<!-- Chart code -->
<script>
am4core.ready(function() {

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

// create chart
var chart = am4core.create("chartdiv", am4plugins_sunburst.Sunburst);
chart.padding(0,0,0,0);
chart.radius = am4core.percent(98);

chart.data = [{
  name: "First",
  children: [
    { name: "A1", value: 100 },
    { name: "A2", value: 60 }
  ]
},
{
  name: "Second",
  children: [
    { name: "B1", value: 135 },
    { name: "B2", value: 98 }
  ]
},
{
  name: "Third",
  children: [
    {
      name: "C1",
      children: [
        { name: "EE1", value: 130 },
        { name: "EE2", value: 87 },
        { name: "EE3", value: 55 }
      ]
    },
    { name: "C2", value: 148 },
    {
      name: "C3", children: [
        { name: "CC1", value: 53 },
        { name: "CC2", value: 30 }
      ]
    },
    { name: "C4", value: 26 }
  ]
},
{
  name: "Fourth",
  children: [
    { name: "D1", value: 415 },
    { name: "D2", value: 148 },
    { name: "D3", value: 89 }
  ]
},
{
  name: "Fifth",
  children: [
    {
      name: "E1",
      children: [
        { name: "EE1", value: 33 },
        { name: "EE2", value: 40 },
        { name: "EE3", value: 89 }
      ]
    },
    {
      name: "E2",
      value: 148
    }
  ]
}];

chart.colors.step = 2;
chart.fontSize = 11;
chart.innerRadius = am4core.percent(10);

// define data fields
chart.dataFields.value = "value";
chart.dataFields.name = "name";
chart.dataFields.children = "children";


var level0SeriesTemplate = new am4plugins_sunburst.SunburstSeries();
level0SeriesTemplate.hiddenInLegend = false;
chart.seriesTemplates.setKey("0", level0SeriesTemplate)

// this makes labels to be hidden if they don't fit
level0SeriesTemplate.labels.template.truncate = true;
level0SeriesTemplate.labels.template.hideOversized = true;

level0SeriesTemplate.labels.template.adapter.add("rotation", function(rotation, target) {
  target.maxWidth = target.dataItem.slice.radius - target.dataItem.slice.innerRadius - 10;
  target.maxHeight = Math.abs(target.dataItem.slice.arc * (target.dataItem.slice.innerRadius + target.dataItem.slice.radius) / 2 * am4core.math.RADIANS);

  return rotation;
})


var level1SeriesTemplate = level0SeriesTemplate.clone();
chart.seriesTemplates.setKey("1", level1SeriesTemplate)
level1SeriesTemplate.fillOpacity = 0.75;
level1SeriesTemplate.hiddenInLegend = true;

var level2SeriesTemplate = level0SeriesTemplate.clone();
chart.seriesTemplates.setKey("2", level2SeriesTemplate)
level2SeriesTemplate.fillOpacity = 0.5;
level2SeriesTemplate.hiddenInLegend = true;

chart.legend = new am4charts.Legend();

}); // end am4core.ready()
</script>

        </div>
    </form>
</body>
</html>
