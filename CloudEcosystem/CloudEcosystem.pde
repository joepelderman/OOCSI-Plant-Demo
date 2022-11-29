import nl.tue.id.oocsi.*;

agentType myIdentity = agentType.CLOUD;
OOCSI oocsi;

void setup() {
  size(500, 500);
  oocsi = new OOCSI(this, myIdentity.name(), "oocsi.id.tue.nl");
}

void draw() {
  background(255);
}

void keyPressed() {
  float sunModifier = -1.0 * random(1, 3);
  oocsi
    .channel(agentType.SUN.name())
    .data(messageType.LIGHT.name(),sunModifier )
    .send();
    println("SUN modifier: " + sunModifier);
}
