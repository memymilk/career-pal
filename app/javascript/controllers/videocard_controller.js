import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="videocard"
export default class extends Controller {
  // static targets = ["header","header2", "content", "content2","navlink"]
  // connect() {
  //   console.log("Hello my friends");
  // }

  // collapse1(){
  //   this.contentTarget.classList.toggle("collapsible-content");
  //   this.headerTarget.classList.toggle("active-link");
  //   if (this.contentTarget.style.maxHeight){
  //     this.contentTarget.style.maxHeight = null;
  //   } else {
  //     this.contentTarget.style.maxHeight = this.contentTarget.scrollHeight + "px";
  //   }
  // }

  // collapse2(){
  //   this.content2Target.classList.toggle("collapsible-content");
  //   this.header2Target.classList.toggle("active-link");
  //   if (this.content2Target.style.maxHeight){
  //     this.content2Target.style.maxHeight = null;
  //   } else {
  //     this.content2Target.style.maxHeight = this.contentTarget.scrollHeight + "px";
  //   }
  // }

}
