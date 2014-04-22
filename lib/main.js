(function() {
  var HIGH_NUM, RackInfoConstructor, backDis, bounds, clearAllSelected, colorFunc, data, display, frontDis, gridSetup, optionSetup, scene, sideDis, toggleCamera, toggleColor, topDis, x3d;

  RackInfoConstructor = function(floorPlanID, componentID, name, rackUnitHeight, rackWidth, rackDepth, rackOrientation, xPos, yPos, numberingOrigin, overlappingAllowed, coolingMax, weightMax, powerMax, largestUnitLocation, largestUnitSize, usedUnitsCurrent, usedUnitsPlanned, weightCurrent, weightPlanned, heatDissipationCurrent, heatDissipationPlanned, powerCurrent, powerPlanned, powerActual, powerActualDerivation, floorPlanWidth, floorPlanHeight) {
    var obj;
    obj = {};
    obj.FloorPlanID = floorPlanID;
    obj.ComponentID = componentID;
    obj.Name = name;
    obj.RackUnitHeight = rackUnitHeight * 44.5 / 1000;
    obj.Width = rackWidth;
    obj.Depth = rackDepth;
    obj.RackOrientation = rackOrientation;
    obj.XPos = (xPos - floorPlanWidth / 2) / 1000;
    obj.YPos = (yPos - floorPlanHeight / 2) / 1000;
    obj.NumberingOrigin = numberingOrigin;
    obj.OverlappingAllowed = overlappingAllowed;
    obj.CoolingMax = coolingMax;
    obj.WeightMax = weightMax;
    obj.PowerMax = powerMax;
    obj.LargestUnitLocation = largestUnitLocation;
    obj.LargestUnitSize = largestUnitSize;
    obj.UsedUnitsCurrent = usedUnitsCurrent;
    obj.UsedUnitsPlanned = usedUnitsPlanned;
    obj.WeightCurrent = weightCurrent;
    obj.WeightPlanned = weightPlanned;
    obj.HeatDissipationCurrent = heatDissipationCurrent;
    obj.HeatDissipationPlanned = heatDissipationPlanned;
    obj.PowerCurrent = powerCurrent;
    obj.PowerPlanned = powerPlanned;
    obj.PowerActual = powerActual;
    obj.PowerActualDerivation = powerActualDerivation;
    obj.FloorPlanWidth = floorPlanWidth / 1000;
    obj.FloorPlanHeight = floorPlanHeight / 1000;
    return obj;
  };

  data = [];

  data.push(RackInfoConstructor(1, 1470, "50M", 42, 483, 0, 0, 4250, 3650, 0, 1, 35000, 500, 300, 1, 41, 1, 0, 16, 0, 102, 0, 115, 0, 115, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1471, "50N", 42, 483, 0, 0, 4250, 2950, 0, 1, 35000, 500, 300, 1, 35, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1472, "50O", 42, 483, 0, 0, 4250, 2250, 0, 1, 35000, 500, 10000, 16, 27, 15, 0, 172.8, 0, 12700, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1473, "50P", 42, 483, 0, 0, 4250, 1550, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1500, "50Q", 42, 483, 0, 0, 4250, 150, 1, 1, 35000, 500, 10000, 11, 22, 10, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1501, "50R", 42, 483, 0, 0, 4250, -550, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1502, "50S", 42, 483, 0, 0, 4250, -1250, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1503, "50T", 42, 483, 0, 0, 4250, -1950, 0, 1, 35000, 500, 10000, 1, 31, 11, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1504, "50U", 42, 483, 0, 0, 4250, -2650, 0, 1, 35000, 500, 10000, 1, 32, 10, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1474, "51M", 42, 483, 0, 0, 1450, 3650, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1475, "51N", 42, 483, 0, 0, 1450, 2950, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 86, 0, 5457, 0, 1300, 0, 1300, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1476, "51O", 42, 483, 0, 0, 1450, 2250, 0, 1, 35000, 500, 10000, 1, 38, 4, 0, 86, 0, 5457, 0, 1300, 0, 1300, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1477, "51P", 42, 483, 0, 0, 1450, 1550, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 86, 0, 5457, 0, 1300, 0, 1300, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1478, "51Q", 42, 483, 0, 0, 1450, 850, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 86, 0, 5457, 0, 1300, 0, 1300, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1479, "51R", 42, 483, 0, 0, 1450, 150, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 86, 0, 5457, 0, 1300, 0, 1300, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1480, "51S", 42, 483, 0, 0, 1450, -550, 0, 1, 35000, 500, 10000, 1, 38, 4, 0, 86, 0, 5457, 0, 1300, 0, 1300, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1481, "51T", 42, 483, 0, 0, 1450, -1250, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 86, 0, 5457, 0, 1300, 0, 1300, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1482, "51U", 42, 483, 0, 0, 1450, -1950, 0, 1, 35000, 500, 10000, 1, 36, 6, 0, 136, 0, 9832, 0, 1900, 0, 1900, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1483, "51V", 42, 483, 0, 0, 1450, -2650, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 136, 0, 9832, 0, 1900, 0, 1900, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1484, "51W", 42, 483, 0, 0, 1450, -3350, 1, 1, 35000, 500, 10000, 1, 37, 3, 0, 136, 0, 9832, 0, 1900, 0, 1900, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1510, "51X", 42, 483, 0, 0, 1450, -4050, 0, 1, 35000, 500, 10000, 1, 15, 16, 0, 422, 0, 32789, 0, 5600, 0, 5600, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1485, "52L", 42, 483, 0, 0, -1350, 4350, 0, 1, 35000, 500, 10000, 1, 36, 2, 0, 68, 0, 9832, 0, 1900, 0, 1900, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1486, "52M", 42, 483, 0, 0, -1350, 3650, 0, 1, 35000, 500, 10000, 1, 36, 6, 0, 68, 0, 9832, 0, 1900, 0, 1900, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1487, "52N", 42, 483, 0, 0, -1350, 2950, 0, 1, 35000, 500, 10000, 1, 36, 2, 0, 68, 0, 9832, 0, 1900, 0, 1900, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1488, "52O", 42, 483, 0, 0, -1350, 2250, 0, 1, 35000, 500, 10000, 1, 28, 14, 0, 154, 0, 20746, 0, 4500, 0, 4500, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1489, "52P", 42, 483, 0, 0, -1350, 1550, 0, 1, 35000, 500, 10000, 1, 24, 14, 0, 204, 0, 29496, 0, 5700, 0, 5700, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1490, "52Q", 42, 483, 0, 0, -1350, 850, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1491, "52R", 42, 483, 0, 0, -1350, 150, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1492, "52S", 42, 483, 0, 0, -1350, -550, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1493, "52T", 42, 483, 0, 0, -1350, -1250, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1511, "52U", 42, 483, 0, 0, -1350, -1950, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1512, "52V", 42, 483, 0, 0, -1350, -2650, 0, 1, 35000, 500, 10000, 1, 28, 10, 0, 161, 0, 24039, 0, 4400, 0, 4400, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1494, "52W", 42, 483, 0, 0, -1350, -3350, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1495, "52X", 42, 483, 0, 0, -1350, -4050, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1496, "53M", 42, 483, 0, 0, -4150, 3650, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1497, "53N", 42, 483, 0, 0, -4150, 2950, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1498, "53O", 42, 483, 0, 0, -4150, 2250, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1499, "53P", 42, 483, 0, 0, -4150, 1550, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1505, "53Q", 42, 483, 0, 0, -4150, 150, 0, 1, 35000, 500, 10000, 1, 32, 10, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1506, "53R", 42, 483, 0, 0, -4150, -550, 0, 1, 35000, 500, 10000, 1, 26, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1507, "53S", 42, 483, 0, 0, -4150, -1250, 0, 1, 35000, 500, 10000, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1508, "53T", 42, 483, 0, 0, -4150, -1950, 0, 1, 35000, 500, 10000, 1, 30, 12, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  data.push(RackInfoConstructor(1, 1509, "53U", 42, 483, 0, 0, -4150, -2650, 0, 1, 35000, 500, 10000, 1, 32, 10, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1500, 700));

  Math.roundTo = function(num, amount) {
    if (amount == null) {
      amount = 0;
    }
    return Math.round(num * Math.pow(10, amount)) / Math.pow(10, amount);
  };

  console.logDate = function() {
    var timestamp;
    if (arguments.length) {
      timestamp = '[' + new Date().toUTCString() + '] ';
      return console.log(timestamp, arguments);
    }
  };

  Function.prototype.debounce = function(threshold, execAsap) {
    var func, timeout;
    func = this;
    timeout = 0;
    return function() {
      var args, delayed, obj;
      obj = this;
      args = arguments;
      delayed = function() {
        if (!execAsap) {
          func.apply(obj, args);
        }
        timeout = null;
      };
      if (timeout) {
        clearTimeout(timeout);
      } else if (execAsap) {
        func.apply(obj, args);
      }
      timeout = setTimeout(delayed, threshold || 100);
    };
  };

  bounds = {
    boundBox: {
      minX: HIGH_NUM,
      maxX: -HIGH_NUM,
      minY: HIGH_NUM,
      maxY: -HIGH_NUM
    },
    boundWthHgt: {
      maxWidth: -HIGH_NUM,
      maxHeight: -HIGH_NUM
    },
    avgInterval: 100,
    resetBounds: function() {
      this.boundBox.minX = HIGH_NUM;
      this.boundBox.maxX = -HIGH_NUM;
      this.boundBox.minY = HIGH_NUM;
      this.boundBox.maxY = -HIGH_NUM;
      this.boundWthHgt.minWidth = HIGH_NUM;
      this.boundWthHgt.maxWidth = -HIGH_NUM;
      this.boundWthHgt.minHeight = HIGH_NUM;
      this.boundWthHgt.maxHeight = -HIGH_NUM;
    },
    calculateBounds: function(fpID) {
      this.resetBounds();
      this.boundBox.minX = Math.roundTo(d3.min(data, function(d) {
        return d.XPos;
      }), 2);
      this.boundBox.maxX = Math.roundTo(d3.max(data, function(d) {
        return d.XPos;
      }), 2);
      this.boundBox.minY = Math.roundTo(d3.min(data, function(d) {
        return d.YPos;
      }), 2);
      this.boundBox.maxY = Math.roundTo(d3.max(data, function(d) {
        return d.YPos;
      }), 2);
      this.boundWthHgt.maxWidth = Math.roundTo(d3.max(data, function(d) {
        return d.FloorPlanWidth;
      }), 2);
      this.boundWthHgt.maxHeight = Math.roundTo(d3.max(data, function(d) {
        return d.FloorPlanHeight;
      }), 2);
    }
  };

  bounds.calculateBounds();

  frontDis = bounds.boundBox.minY - bounds.boundWthHgt.maxHeight - (bounds.boundBox.maxX - bounds.boundBox.minX);

  backDis = -frontDis;

  sideDis = bounds.boundBox.maxX + bounds.boundWthHgt.maxWidth + (bounds.boundBox.maxY - bounds.boundBox.minY);

  topDis = (bounds.boundBox.maxX - bounds.boundBox.minY) + (bounds.boundBox.maxY - bounds.boundBox.minY);

  x3d = d3.select("body").append("x3d").attr("height", "400px").attr("width", "700px").attr('id', 'x3dElement');

  scene = x3d.append("scene");

  scene.append("viewpoint").attr("id", "Top View").attr("centerOfRotation", "0 0 0").attr("position", "0 0 " + topDis).attr("orientation", "0.0 0.0 0.0 0.0").attr("fieldOfView", '0.75');

  scene.append("viewpoint").attr("id", "Front View").attr("centerOfRotation", "0 0 0").attr("position", "0 " + frontDis + " 0").attr("orientation", "1.0 0.0 0.0 1.570").attr("fieldOfView", '0.95');

  scene.append("viewpoint").attr("id", "Side View").attr("centerOfRotation", "0 0 0").attr("position", "" + sideDis + " 0 0.25").attr("orientation", "0.50 0.50 0.50 2.093").attr("fieldOfView", '0.95');

  scene.append("viewpoint").attr("id", "Back View").attr("centerOfRotation", "0 0 0").attr("position", "0.0 " + backDis + " -.50").attr("orientation", "0.0 0.75 0.65 3.14").attr("fieldOfView", '0.95');

  scene.append("viewpoint").attr("id", "Perspective").attr("centerOfRotation", "0 0 0").attr("position", "" + (backDis / 3) + " " + (-sideDis) + " " + (topDis / 3)).attr("orientation", "1.0 0.25 0.25 1.25").attr("fieldOfView", '0.95');

  HIGH_NUM = 9007199254740992;

  display = function(data) {
    var shapes, shapesEnter;
    shapes = scene.selectAll("transform").data(data);
    shapesEnter = shapes.enter().append("transform").append("shape");
    shapes.transition().attr("translation", function(d, i) {
      return d.XPos + " " + d.YPos + " 0.0";
    });
    shapesEnter.append("appearance").append("material");
    scene.selectAll("material").data(data).transition().duration(1000).delay(500).attr("diffuseColor", function(d) {
      return colorFunc(d);
    });
    shapesEnter.append("box").data(data).attr("size", function(d) {
      return d.FloorPlanWidth + " " + (d.FloorPlanHeight - 0.05) + " " + d.RackUnitHeight;
    });
  };

  display(data);

  setInterval((function() {
    return display(data);
  }), 10000);

  colorFunc = function(data) {
    var g, r, value;
    switch (document.getElementsByClassName('selectedColor')[0].value) {
      case "Power":
        value = data.PowerCurrent / data.PowerMax;
        break;
      case "Weight":
        value = data.WeightCurrent / data.WeightMax;
        break;
      case "Temperature":
        value = data.HeatDissipationCurrent / data.CoolingMax;
    }
    if (value < 0.5) {
      r = Math.floor(value * 255);
      g = 200;
    } else {
      r = 255;
      g = Math.floor((1 - value) * 255);
    }
    return "#" + (r < 16 ? "0" : "") + r.toString(16) + (g < 16 ? "0" : "") + g.toString(16) + "00";
  };

  toggleCamera = function() {
    clearAllSelected('selectedView');
    this.className += " selectedView";
    document.getElementById(this.value).setAttribute('set_bind', 'true');
  };

  toggleColor = function() {
    clearAllSelected('selectedColor');
    this.className += " selectedColor";
    return display(data);
  };

  clearAllSelected = function(str) {
    var allSelected;
    allSelected = document.getElementsByClassName(str);
    while (allSelected.length) {
      allSelected[0].className = "button";
    }
  };

  optionSetup = function() {
    var childCamera, childColor, i;
    childColor = document.getElementsByClassName('colorOption')[0].children;
    childCamera = document.getElementsByClassName('cameraOption')[0].children;
    i = 0;
    while (i < childColor.length || i < childCamera.length) {
      if (i < childColor.length) {
        childColor[i].onmouseover = toggleColor;
      }
      if (i < childCamera.length) {
        childCamera[i].onmouseover = toggleCamera;
      }
      i++;
    }
  };

  gridSetup = function(bounds) {
    var coodStr, grid, gridInterval, lineset, pointStr, set, shape;
    shape = scene.append('Transform').append('Shape').attr('id', 'grid');
    shape.append('Appearance').append('Material').attr('id', 'gridMaterial').attr('diffuseColor', '.8, .8, .8').attr('transparency', '.65');
    pointStr = "";
    coodStr = "";
    lineset = 0;
    grid = Math.roundTo(bounds.boundBox.minX - bounds.boundWthHgt.maxWidth, 2);
    gridInterval = Math.roundTo((bounds.boundBox.maxX + bounds.boundWthHgt.maxWidth + Math.abs(grid)) / 12, 2);
    while (grid <= Math.roundTo(bounds.boundBox.maxX + bounds.boundWthHgt.maxWidth)) {
      pointStr += "" + grid + " " + (Math.roundTo(bounds.boundBox.minY - bounds.boundWthHgt.maxHeight, 2)) + " -1 " + grid + " " + (Math.roundTo(bounds.boundBox.maxY + bounds.boundWthHgt.maxHeight, 2)) + " -1 ";
      coodStr += "" + lineset + " " + (lineset + 1) + " -1 ";
      grid = Math.roundTo(grid + .6, 2);
      lineset += 2;
    }
    grid = Math.roundTo(bounds.boundBox.minY - bounds.boundWthHgt.maxHeight, 2);
    gridInterval = Math.roundTo((bounds.boundBox.maxY + bounds.boundWthHgt.maxHeight + Math.abs(grid)) / 12, 2);
    while (grid <= Math.roundTo(bounds.boundBox.maxY + bounds.boundWthHgt.maxHeight)) {
      pointStr += "" + (Math.roundTo(bounds.boundBox.minX - bounds.boundWthHgt.maxWidth, 2)) + " " + grid + " -1 " + (Math.roundTo(bounds.boundBox.maxX + bounds.boundWthHgt.maxWidth, 2)) + " " + grid + " -1 ";
      coodStr += "" + lineset + " " + (lineset + 1) + " -1 ";
      grid = Math.roundTo(grid + .6, 2);
      lineset += 2;
    }
    set = shape.append('IndexedLineSet').attr('coordIndex', '#{coodStr}');
    return set.append('Coordinate').attr('point', "" + pointStr);
  };

  gridSetup(bounds);

  window.onload = function() {
    optionSetup();
    document.getElementById('gridToggle').onclick = function() {
      if (document.getElementById('gridMaterial').transparency === "1.0") {
        document.getElementById('gridMaterial').transparency = ".65";
      } else {
        document.getElementById('gridMaterial').transparency = "1.0";
      }
    };
  };

}).call(this);
