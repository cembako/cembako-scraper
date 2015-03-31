// Chart.defaults.global = {
//     scaleOverride: false,
//     scaleSteps: 1,
// }

var data = {
    labels: [2, 5, 6, 9, 10, 11, 12, 13, 16, 17, 18, 20, 23, 24, 25, 26, 27],
    datasets: [
        {
            label: "Minyak Goreng Kemasan",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [33253,30584,30356,29284,28674,28535,28263,28851,28073,27322,27281,27222,25948,25674,24639,24485,24587]
        },
                {
            label: "Minyak Goreng Kemasan",
            fillColor: "rgba(220,0,0,0.2)",
            strokeColor: "rgba(220,0,0,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [30000,null,null,null,null,28035,28263,28851,28073,27322,27281,27222,25948,25674,24639,24485,24587]
        },
    ]
};

var ctx = document.getElementById("myChart").getContext("2d");
var myLineChart = new Chart(ctx).Line(data);