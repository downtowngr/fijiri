// *********************************************************************
// MAPBOX STREETS
// *********************************************************************

// =====================================================================
// FONTS
// =====================================================================

Map { font-directory: url('fonts'); }

// Language
@name: '[name]';

// set up font sets for various weights and styles
@sans_lt:           "Verlag Light", "Lato Light", "Open Sans Regular","Arial Unicode MS Regular";
@sans_lt_italic:    "Verlag Light Italic", "Lato Light Italic", "Open Sans Italic","Arial Unicode MS Regular";
@sans:              "Verlag Book", "Lato Regular", "Open Sans Semibold","Arial Unicode MS Regular";
@sans_bold:         "Verlag Bold", "Lato Bold", "Open Sans Bold","Arial Unicode MS Regular";
@sans_italic:       "Verlag Book Italic", "Lato Italic", "Open Sans Semibold Italic","Arial Unicode MS Regular";
@sans_bold_italic:  "Verlag Bold Italic", "Lato Bold Italic", "Open Sans Bold Italic","Arial Unicode MS Regular";

// =====================================================================
// LANDUSE & LANDCOVER COLORS
// =====================================================================

@land:              #F4F2ED;
@water:             #8FD1E9;
@grass:             #D4E4AB;
@sand:              #F1EDE6;
@rock:              #D7D7D2;
@park:              #BBCE8C;
@cemetery:          #C9C9B9;
@wooded:            #829E3D;
@industrial:        #CCCCCB;
@agriculture:       #DCD7CF;
@snow:              #FBF9F3;

@building:          darken(@land, 8);
@hospital:          #F9F7F2;
@school:            #F9F7F2;
@pitch:             #E1F5AE;
@sports:            @park;

@parking:           fadeout(@road_fill, 75%);

// =====================================================================
// ROAD COLORS
// =====================================================================

// For each class of road there are three color variables:
// - line: for lower zoomlevels when the road is represented by a
//         single solid line.
// - case: for higher zoomlevels, this color is for the road's
//         casing (outline).
// - fill: for higher zoomlevels, this color is for the road's
//         inner fill (inline).

@motorway_line:     #fff;
@motorway_fill:     #fff;
@motorway_case:     #000;

@main_line:     #fff;
@main_fill:     #fff;
@main_case:     #000;

@road_line:     #fff;
@road_fill:     #fff;
@road_case:     #000;

@pedestrian_line:   #fff;
@pedestrian_fill:   @pedestrian_line;
@pedestrian_case:   @road_case;

@path_line:     #fff;
@path_fill:     #fff;
@path_case:     @land;

@rail_line:     #aaa;
@rail_fill:     #fff;
@rail_case:     @land;

@bridge_case:   #999;

@aeroway:       lighten(@industrial,5);

// =====================================================================
// BOUNDARY COLORS
// =====================================================================

@admin_2:           #234;
@admin_3:           #345;
@admin_4:           #345;

// =====================================================================
// LABEL COLORS
// =====================================================================

// We set up a default halo color for places so you can edit them all
// at once or override each individually.
@place_halo:        #fff;

@country_text:      @land * 0.2;
@country_halo:      @place_halo;

@state_text:        #666;
@state_halo:        @place_halo;

@city_text:         @land * 0.1;
@city_halo:         @place_halo;

@town_text:         @land * 0.2;
@town_halo:         @place_halo;

@poi_text:          @poi_text;  

@road_text:         #666;
@road_halo:         #fff;

@other_text:        darken(@land,50)*0.8;
@other_halo:        @place_halo;

@locality_text:     #aaa;
@locality_halo:     @land;

// Also used for other small places: hamlets, suburbs, localities
@village_text:      #888;
@village_halo:      @place_halo;

@transport_text:    #445;

/**/