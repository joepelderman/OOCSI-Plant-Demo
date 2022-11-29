import nl.tue.id.oocsi.*;
import java.util.Timer;
import java.util.TimerTask;

agentType myIdentity = agentType.PLANT;
Plant myPlant;
OOCSI oocsi;
void setup() {
  size(500, 500);
  noStroke();
  oocsi = new OOCSI(this, myIdentity.name(), "oocsi.id.tue.nl");
  myPlant = new Plant();
}

void draw() {
  background(255);
  myPlant.draw();
}

void handleOOCSIEvent(OOCSIEvent event) {
  println();
  println("----------------------");
  println("Received message from: " + event.getSender() );
  printArray(event.keys());
  println("----------------------");
  println();
  myPlant.handleMessages(event);
}

void keyPressed() {
  oocsi
    .channel("PLANT")
    .data("LIGHT", random(1,5))
    .data("WATER",  random(1,5))
    .data("FOOD",  random(1,5))
    .data("AIR",  random(1,5))
    .send();
}
