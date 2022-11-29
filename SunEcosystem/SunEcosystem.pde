import nl.tue.id.oocsi.*;

agentType myIdentity = agentType.SUN;
float powerOfTheSun = 5;
OOCSI oocsi;

void setup() {
  size(500, 500);
  oocsi = new OOCSI(this, myIdentity.name(), "oocsi.id.tue.nl");
}

void draw() {
  background(255);
}

void handleOOCSIEvent(OOCSIEvent event) {
  if (event.getSender().equals(agentType.CLOUD.name())) {
    float cloudTransparency = event.getFloat(messageType.LIGHT.name(), 0);
    float newPowerOfTheSun = powerOfTheSun + cloudTransparency;
    println("got data from cloud new sun power is:" + newPowerOfTheSun);
    oocsi
      .channel(agentType.PLANT.name())
      .data(messageType.LIGHT.name(), newPowerOfTheSun)
      .send();
  }
}
