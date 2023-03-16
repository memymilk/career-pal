import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core";
import Chart from 'chart.js/auto';

// Connects to data-controller="chart"
export default class extends Controller {
  static values = {
    infodata: Array,
    feedback: Array,
    scatter: Object
    // currentfeedback: Array
  }

  static targets = ["acquisitions", "radar", "scatter"]

  connect() {

    if (this.hasAcquisitionsTarget){
    this.createChart()
    this.createChartThree()
    }

    if (this.hasRadarTarget){

    this.createChartTwo()
    }


  }

  createChart() {
    console.log("I am here yoyoyo")

    new Chart(this.acquisitionsTarget, {
      type: 'bar',
      data: {
        labels: ["overall impression", "eye contact" ,"background presentation", "problem solving", "verbal communication", "body language", "enthusiasm", "professional appearance", "hireability", "confidence"],
        datasets: [
          {
            label: 'Your points on average',
            data: this.infodataValue,
            borderColor: 'rgb(162, 136, 198)',
            backgroundColor: '#C0B0D6',

          }
        ]
      },
      options: {
        scales: {
          x: {
            min: 0,
            max: 5,
          }},


        layout: {
            padding: 20
        },

        indexAxis: 'y',
        plugins: {
          legend: {
              labels: {
                  // This more specific font property overrides the global property
                  font: {
                      size: 14
                  }
              }
          }
      }
    }

    }
    )

  }

  // second chart

  createChartTwo() {
    console.log("I have also been created yoyo")
    console.log(this.feedbackValue)
    console.log(this.infodataValue)
    new Chart(this.radarTarget, {
      type: 'radar',
      data: {
         labels: ["overall impression", "eye contact" ,"background presentation", "problem solving", "verbal communication", "body language", "enthusiasm", "professional appearance", "hireability", "confidence"],
        datasets: [{
          label: 'This call',
          data: this.feedbackValue,
          fill: true,
          backgroundColor: 'rgba(32, 201, 151, 0.2)',
          borderColor: 'rgb(32, 201, 151)',
          pointBackgroundColor: 'rgb(26, 161, 121)',
          pointBorderColor: '#fff',
          pointHoverBackgroundColor: '#fff',
          pointHoverBorderColor: 'rgb(13, 121, 89)'
        }, {
          label: 'Your average',
          data: this.infodataValue,
          fill: true,
          backgroundColor: 'rgba(162, 136, 198, 0.2)',
          borderColor: 'rgb(162, 136, 198)',
          pointBackgroundColor: 'rgb(112, 42, 202)',
          pointBorderColor: '#fff',
          pointHoverBackgroundColor: '#fff',
          pointHoverBorderColor: 'rgb(33, 6, 91)'
        }],

        // datasets: [
        //   {
        //     label: 'Your points on average',
        //     data: [20, 10, 4, 2],
        //     borderColor: 'rgba(162, 136, 198, 0.5)',
        //     backgroundColor: 'rgba(162, 136, 198, 0.5)'

        //   }
        // ]
      },
      options: {
        layout: {
            padding: 20,
            fill: true,
        },
        scales: {
          r: {
              suggestedMin: 0,
              suggestedMax: 5
          }
        },
        plugins: {
          legend: {
              labels: {
                  // This more specific font property overrides the global property
                  font: {
                      size: 16
                  }
              }
          }
      }
    }

    }
    )

  }

  // third chart


  createChartThree() {
    console.log("Number three here yo")
    console.log(this.scatterValue)

    const scatterDatasets = Object.entries(this.scatterValue).map(([ key, value ]) => {
      return {
        label: key,
        data: value.map((data, index) => {
          return {
            y: data,
            x: index,
            r: data
          }
        })
      }
    })
    console.log(scatterDatasets)

    new Chart(this.scatterTarget, {
      type: 'bubble',
        options: {
          aspectRatio: 1,
        },
        data: {
          datasets: scatterDatasets
        },
    })
  }

}
