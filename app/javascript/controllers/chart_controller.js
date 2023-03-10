import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';

// Connects to data-controller="chart"
export default class extends Controller {

  static values = {
    infodata: Array
  }

  static targets = ["acquisitions"]

  connect() {
    // this.infodata = [ { year: 2010, count: 10 },
    //   { year: 2011, count: 20 },
    //   { year: 2012, count: 15 },
    //   { year: 2013, count: 25 },
    //   { year: 2014, count: 22 },
    //   { year: 2015, count: 30 },
    //   { year: 2016, count: 28 }]

    this.createChart()
  }

  createChart() {
    console.log("I have been created")
    console.log(this.infodataValue);

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
                      size: 10
                  }
              }
          }
      }
    }

    }
    )

  }
}
