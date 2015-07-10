Map { buffer-size: 128; }

#car_parking { 
  ::polygon {
    polygon-fill: @transport_text;
    polygon-opacity: 0.5;
  }
  polygon-fill: @transport_text;
  polygon-opacity: 0.5;
  text-name: "$"+[per_entry]+[half_hour];
  text-size: 16;
  text-face-name: @sans;  
}

#bike_parking {
  ::polygon {
      
  }
}

#dash_routes {
  ::line {
    line-width: 5;
    line-opacity: 0.8;
    line-color: [stroke];
  }
  text-name: [title];
  text-character-spacing: 0.25;
  text-placement: line;
  text-face-name: @sans;
  text-fill: [stroke];
  text-size: 16;
  text-halo-fill: @road_halo;
  text-halo-radius: 1.2;
  text-halo-rasterizer: fast;
  text-min-distance: 200; // only for labels w/ the same name
}