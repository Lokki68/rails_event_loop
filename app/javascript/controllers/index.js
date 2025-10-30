import { application } from "./application";

import MapController from "./map_controller";
application.register("map", MapController);

import MapDisplayController from "./map_display_controller";
application.register("map-display", MapDisplayController);

import RevealController from "./reveal_controller";
application.register("reveal", RevealController);

import TabController from "./tab_controller";
application.register("tabs", TabController);

