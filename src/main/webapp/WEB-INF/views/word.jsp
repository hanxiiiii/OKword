<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



 <script src="https://d3js.org/d3.v5.min.js"></script>
 <body>
<script>
var list1 = "Fruit,Amount,key\n";
<c:forEach var="kdto" items="${Klist}">
list1 = list1 + "${kdto.keyword}" +','+"${kdto.keyword_set_number }"+','+"${kdto.keyword_id}" +"\n"
</c:forEach>
console.log(list1);
var diameter = 500, //max size of the bubbles
    format   = d3.format(",d"),
    color    = d3.scaleOrdinal(d3.schemeCategory10);
    //more color options: https://github.com/d3/d3-scale-chromatic

var bubble = d3.pack()
    .size([diameter, diameter])
    .padding(1.5);

var svg = d3.select(".word")  
    .append("svg")
    .attr("width", diameter)
    .attr("height", diameter)
    .attr("class", "bubble")
 
    ;
   
var text ="text";
var lee ="hi im king";
var red= "black";
svg.append("div")
.attr("width", diameter)
.attr("height", diameter)
.append("input")
.attr("type" ,text)
.attr("value",lee)
.attr("class", "test")
.style("color",red)


;


 
var list2 = 'Fruit,Amount\nBanana,21\nGrapes,29\n'
function a(){
   data = d3.csvParse(list1);
   console.log(data);
   alert(list1);   
}


d3.csv("resources/fruit2.csv").then(function(data){
//d3.csvParse('Fruit,Amount\nBanana,21\nGrapes,29\n').then(function(data){
//d3.json("getdata.php", function(error, data){
   data = d3.csvParse(list1);
   console.log('tst');
   console.log(data);
    //convert numerical values from strings to numbers
    data = data.map(function(d){ d.value = +d["Amount"]; return d; });
   
    //Sets up a hierarchy of data object
    var root = d3.hierarchy({children:data})
      .sum(function(d) { return d.value; })
      .sort(function(a, b) { return b.value - a.value; });

    //Once we have hierarchal data, run bubble generator
    bubble(root);

    //setup the chart
    var bubbles = svg.selectAll(".bubble")
        .data(root.children)
        .enter();
    
    
    //create the bubbles
    var link = document.location.href;
    link = link.replace(/\&key=([0-9]+)/ig,'');
    var k_link =function(d){ return link+"&key="+d.data["key"]; }
    if(link.indexOf("?") == -1){    	
    	k_link =function(d){ return link+"?&key="+d.data["key"]; }
    } 
    bubbles.append("a").attr("href", k_link).append("circle")      
        .attr("class", "circle")
        .attr("r", function(d){ return d.r; })
        .attr("cx", function(d){ return d.x; })
        .attr("cy", function(d){ return d.y; })
        .style("fill", function(d) { return color(d.value); });
    
    //format the text for each bubble
    bubbles.append("a").attr("href", k_link).append("text")
        .attr("x", function(d){ return d.x; })
        .attr("y", function(d){ return d.y + 5; })
        .attr("text-anchor", "middle")
        .text(function(d){ return d.data["Fruit"]; })
        .style("fill","white")
        .style("font-family", "Helvetica Neue, Helvetica, Arial, san-serif")
        .style("font-size", "20px");
    
    
});
</script>
</body>
 