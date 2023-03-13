import { Controller } from "@hotwired/stimulus"
import { end } from "@popperjs/core";
import Chart from 'chart.js/auto';

// Connects to data-controller="chart"
export default class extends Controller {
  static values = {
    infodata: Array,
    feedback: Array,
    // currentfeedback: Array
  }

  static targets = ["acquisitions", "radar"]

  connect() {

    if (this.hasAcquisitionsTarget){
    this.createChart()
    }

    if (this.hasRadarTarget){

    this.createChartTwo()
    }
  }

  createChart() {
    console.log("I have been created yo")

    new Chart(this.acquisitionsTarget, {
      type: 'bar',
      data: {
        labels: ["overall impression", "eye contact" ,"background presentation", "problem solving", "verbal communication", "body language", "enthusiasm", "professional appearance", "hireability", "confidence"],
        datasets: [
          {
            label: 'Your points on average',
            data: this.infodataValue,
            borderColor: 'red',
            backgroundColor: '#C0B0D6',

          }
        ]
      },
      options: {
        layout: {
            padding: 20
        },
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
}
