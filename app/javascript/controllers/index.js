// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ChartController from "./chart_controller"
application.register("chart", ChartController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import TwilioController from "./twilio_controller"
application.register("twilio", TwilioController)

import VideocardController from "./videocard_controller"
application.register("videocard", VideocardController)
