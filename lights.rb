var LightHandler = pc.createScript('lightHandler');

// initialize code called once per entity
LightHandler.prototype.initialize = function() {
    var app = this.app;

    this.spot = app.root.findByName("SpotLight");
    this.point = app.root.findByName("PointLight");
    this.directional = app.root.findByName("DirectionalLight");
    this.pivot1 = app.root.findByName("Pivot1");
    this.pivot2 = app.root.findByName("Pivot2");
    this.timer = 0;
    this.color1 = new pc.Color(1, 1, 1);
    this.color2 = new pc.Color(1, 1, 1);
    this.color3 = new pc.Color(1, 1, 1);
};

// update code called every frame
LightHandler.prototype.update = function(dt) {
    var app = this.app;

    this.pivot();

    if (app.keyboard.wasPressed(pc.KEY_1)) {
        this.spot.light.enabled = !this.spot.light.enabled;
    }
    if (app.keyboard.wasPressed(pc.KEY_2)) {
        this.point.light.enabled = !this.point.light.enabled;
    }
    if (app.keyboard.wasPressed(pc.KEY_3)) {
        this.directional.light.enabled = !this.directional.light.enabled;
    }

    // a counter that is used as input to sin the functions determining light properties for all lights.
    this.timer += dt;

    //these 3 code blocks assign color and intensity values that vary according to a sin function
    //all sin inputs are in radians
    var s = Math.abs(Math.sin(1 + this.timer));
    var r = 1-s/2;
    var g = s-0.2;
    var b = 0.55+s/2;
    this.color1.set(r, g, b);
    this.spot.light.color = this.color1;
    this.spot.light.intensity = 10*s;

    s = Math.abs(Math.sin(2 + this.timer));
    r = s/2;
    g = 0.25+s/2;
    b = 1.0-s;
    this.color2.set(r, g, b);
    this.point.light.color = this.color2;
    this.point.light.intensity = 10*s;

    s = Math.abs(Math.sin(3 + this.timer));
    r = 0.25+s/2;
    g = 0.75-s/2;
    b = 0.25+s/2;
    this.color3.set(r, g, b);
    this.directional.light.color = this.color3;
    this.directional.light.intensity = 3*(1-s);
};

// this function rotates all three lights about their parent entities (all at the centre of the scene) to easily create circular motion.
LightHandler.prototype.pivot = function () {
    this.pivot1.rotate(0, 2, 0);
    this.pivot2.rotate(0, -3, 0);
};