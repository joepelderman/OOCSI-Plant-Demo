enum agentType {
  PLANT,
    WINDOW,
    SUN,
    CLOUD,
    WATERING_CAN,
    PLANT_FOOD
}

enum messageType {
  LIGHT,
    WATER,
    FOOD,
    AIR,
    STATUS
}

class Plant {
  float lightLevel = 10;
  float waterLevel = 10;
  float foodLevel = 10;
  float airLevel= 10;
  private Timer timer;

  Plant() {
    println("A new plant was born!");
    timer = new Timer("PlantTimer", true);
    timer.scheduleAtFixedRate(new LiveThePlantLife(), 0, 1000);
  }
  void draw() {
    fill(200, 200, 30, 50);
    rect (0, height  - lightLevel*50, width/4, lightLevel*50, 10);
    fill(30, 200, 200, 50);
    rect (width*1/4, height  - waterLevel*50, width/4, waterLevel*50, 10);
    fill(200, 30, 200, 50);
    rect (width*2/4, height  - foodLevel*50, width/4, foodLevel*50, 10);
    fill(200, 200, 200, 50);
    rect (width*3/4, height  - airLevel*50, width/4, airLevel*50, 10);
    textSize(30);
    textAlign(CENTER);
    fill(0, 0, 0);
    text("Light", 0 + width*1/8, height - 25);
    text(lightLevel, 0 + width*1/8, height - 60);
    text("Water", 0 + width*3/8, height - 25);
    text(waterLevel, 0 + width*3/8, height - 60);
    text("Food", 0 + width*5/8, height - 25);
    text(foodLevel, 0 + width*5/8, height - 60);
    text("Air", 0 + width*7/8, height - 25);
    text(airLevel, 0 + width*7/8, height - 60);
  }
  void handleMessages(OOCSIEvent event) {

    for (messageType type : messageType.values()) {
      if (event.has(type.name()))
      {
        switch(type) {
        case LIGHT:
          lightLevel += event.getFloat(type.name(), 0);
          println("new light level: " + lightLevel);
          break;
        case WATER:
          waterLevel += event.getFloat(type.name(), 0);
          println("new water level: " + waterLevel);
          break;
        case FOOD:
          foodLevel += event.getFloat(type.name(), 0);
          println("new food level: " + foodLevel);
          break;
        case AIR:
          airLevel += event.getFloat(type.name(), 0);
          println("new air level: " + airLevel);
          break;
        case STATUS:

          break;
        }
      }
    }
  }
  class LiveThePlantLife extends TimerTask {
    public void run() {
      lightLevel -= 0.1;
      waterLevel -= 0.1;
      foodLevel -= 0.1;
      airLevel -= 0.1;
    }
  }
}
