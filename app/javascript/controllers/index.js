import { application } from "./application";

import MapController from "./map_controller";
application.register("map", MapController);

import MapDisplayController from "./map_display_controller";
application.register("map-display", MapDisplayController);
