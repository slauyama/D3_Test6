RackInfoConstructor = (floorPlanID, componentID, name, rackUnitHeight, rackWidth, rackDepth, rackOrientation, xPos, yPos, numberingOrigin, overlappingAllowed, coolingMax, weightMax, powerMax, largestUnitLocation, largestUnitSize, usedUnitsCurrent, usedUnitsPlanned, weightCurrent, weightPlanned, heatDissipationCurrent, heatDissipationPlanned, powerCurrent, powerPlanned, powerActual, powerActualDerivation, floorPlanWidth, floorPlanHeight) ->
                  #floorPlanId ComponentID  Name  RackUnitHeight  RackWidth  RackDepth  RackOrientation  rackX rackY NumberingOrigin  OverlappingAllowed  CoolingMax  WeightMax  PowerMax  LargestUnitLocation  LargestUnitSize  UsedUnitsCurrent  UsedUnitsPlanned  WeightCurrent  WeightPlanned  HeatDissipationCurrent  HeatDissipationPlanned  PowerCurrent  PowerPlanned  PowerActual  PowerActualDerivation  FloorPlanWidth  FloorPlanHeight
   obj = new Object()
   obj.FloorPlanID = floorPlanID
   obj.ComponentID = componentID
   obj.Name = name
   obj.RackUnitHeight = rackUnitHeight * 44.5 / 1000
   obj.Width = rackWidth
   obj.Depth = rackDepth
   obj.RackOrientation = rackOrientation
   obj.XPos = (xPos - floorPlanWidth / 2) / 1000
   obj.YPos = (yPos - floorPlanHeight/ 2) / 1000
   obj.NumberingOrigin = numberingOrigin
   obj.OverlappingAllowed = overlappingAllowed
   obj.CoolingMax = coolingMax
   obj.WeightMax = weightMax 
   obj.PowerMax = powerMax
   obj.LargestUnitLocation = largestUnitLocation
   obj.LargestUnitSize = largestUnitSize
   obj.UsedUnitsCurrent = usedUnitsCurrent
   obj.UsedUnitsPlanned = usedUnitsPlanned
   obj.WeightCurrent = weightCurrent
   obj.WeightPlanned = weightPlanned
   obj.HeatDissipationCurrent = heatDissipationCurrent
   obj.HeatDissipationPlanned = heatDissipationPlanned
   obj.PowerCurrent = powerCurrent
   obj.PowerPlanned = powerPlanned
   obj.PowerActual = powerActual
   obj.PowerActualDerivation = powerActualDerivation
   obj.FloorPlanWidth = floorPlanWidth / 1000
   obj.FloorPlanHeight = floorPlanHeight / 1000
   obj 

data = []
#floorPlanId ComponentID Name RackUnitHeight RackWidth RackDepth RackOrientation RackLocationX RackLocationY NumberingOrigin OverlappingAllowed CoolingMax WeightMax PowerMax LargestUnitLocation LargestUnitSize UsedUnitsCurrent UsedUnitsPlanned WeightCurrent WeightPlanned HeatDissipationCurrent HeatDissipationPlanned PowerCurrent PowerPlanned PowerActual PowerActualDerivation FloorPlanWidth FloorPlanHeight
                               #Id CmpId Name   RkHt RkWh RkDh RkOrn RkX RkY #O OA ColMx WtMx PwrMx   L   LS  U   UP WtCurt WPln HtCurt HP PwrCrt PP PwrAt P  Width Height
data.push(RackInfoConstructor(1, 1470, "50M", 42, 483, 0, 0, 4250,   3650, 0, 1, 35000, 500, 300,   1,  41, 1,  0, 16,    0,   102,   0, 115,   0, 115,  1, 1500, 700))
data.push(RackInfoConstructor(1, 1471, "50N", 42, 483, 0, 0, 4250,   2950, 0, 1, 35000, 500, 300,   1,  35, 5,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1472, "50O", 42, 483, 0, 0, 4250,   2250, 0, 1, 35000, 500, 10000, 16, 27, 15, 0, 172.8, 0,   12700, 0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1473, "50P", 42, 483, 0, 0, 4250,   1550, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1500, "50Q", 42, 483, 0, 0, 4250,   150,  1, 1, 35000, 500, 10000, 11, 22, 10, 0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1501, "50R", 42, 483, 0, 0, 4250,  -550,  0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1502, "50S", 42, 483, 0, 0, 4250,  -1250, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1503, "50T", 42, 483, 0, 0, 4250,  -1950, 0, 1, 35000, 500, 10000, 1,  31, 11, 0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1504, "50U", 42, 483, 0, 0, 4250,  -2650, 0, 1, 35000, 500, 10000, 1,  32, 10, 0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1474, "51M", 42, 483, 0, 0, 1450,   3650, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1475, "51N", 42, 483, 0, 0, 1450,   2950, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 86,    0,   5457,  0, 1300,  0, 1300, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1476, "51O", 42, 483, 0, 0, 1450,   2250, 0, 1, 35000, 500, 10000, 1,  38, 4,  0, 86,    0,   5457,  0, 1300,  0, 1300, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1477, "51P", 42, 483, 0, 0, 1450,   1550, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 86,    0,   5457,  0, 1300,  0, 1300, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1478, "51Q", 42, 483, 0, 0, 1450,   850,  0, 1, 35000, 500, 10000, 1,  42, 0,  0, 86,    0,   5457,  0, 1300,  0, 1300, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1479, "51R", 42, 483, 0, 0, 1450,   150,  0, 1, 35000, 500, 10000, 1,  42, 0,  0, 86,    0,   5457,  0, 1300,  0, 1300, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1480, "51S", 42, 483, 0, 0, 1450,  -550,  0, 1, 35000, 500, 10000, 1,  38, 4,  0, 86,    0,   5457,  0, 1300,  0, 1300, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1481, "51T", 42, 483, 0, 0, 1450,  -1250, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 86,    0,   5457,  0, 1300,  0, 1300, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1482, "51U", 42, 483, 0, 0, 1450,  -1950, 0, 1, 35000, 500, 10000, 1,  36, 6,  0, 136,   0,   9832,  0, 1900,  0, 1900, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1483, "51V", 42, 483, 0, 0, 1450,  -2650, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 136,   0,   9832,  0, 1900,  0, 1900, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1484, "51W", 42, 483, 0, 0, 1450,  -3350, 1, 1, 35000, 500, 10000, 1,  37, 3,  0, 136,   0,   9832,  0, 1900,  0, 1900, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1510, "51X", 42, 483, 0, 0, 1450,  -4050, 0, 1, 35000, 500, 10000, 1,  15, 16, 0, 422,   0,   32789, 0, 5600,  0, 5600, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1485, "52L", 42, 483, 0, 0, -1350,  4350, 0, 1, 35000, 500, 10000, 1,  36, 2,  0, 68,    0,   9832,  0, 1900,  0, 1900, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1486, "52M", 42, 483, 0, 0, -1350,  3650, 0, 1, 35000, 500, 10000, 1,  36, 6,  0, 68,    0,   9832,  0, 1900,  0, 1900, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1487, "52N", 42, 483, 0, 0, -1350,  2950, 0, 1, 35000, 500, 10000, 1,  36, 2,  0, 68,    0,   9832,  0, 1900,  0, 1900, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1488, "52O", 42, 483, 0, 0, -1350,  2250, 0, 1, 35000, 500, 10000, 1,  28, 14, 0, 154,   0,   20746, 0, 4500,  0, 4500, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1489, "52P", 42, 483, 0, 0, -1350,  1550, 0, 1, 35000, 500, 10000, 1,  24, 14, 0, 204,   0,   29496, 0, 5700,  0, 5700, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1490, "52Q", 42, 483, 0, 0, -1350,  850,  0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1491, "52R", 42, 483, 0, 0, -1350,  150,  0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1492, "52S", 42, 483, 0, 0, -1350, -550,  0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1493, "52T", 42, 483, 0, 0, -1350, -1250, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1511, "52U", 42, 483, 0, 0, -1350, -1950, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1512, "52V", 42, 483, 0, 0, -1350, -2650, 0, 1, 35000, 500, 10000, 1,  28, 10, 0, 161,   0,   24039, 0, 4400,  0, 4400, 1, 1500, 700))
data.push(RackInfoConstructor(1, 1494, "52W", 42, 483, 0, 0, -1350, -3350, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1495, "52X", 42, 483, 0, 0, -1350, -4050, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1496, "53M", 42, 483, 0, 0, -4150,  3650, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1497, "53N", 42, 483, 0, 0, -4150,  2950, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1498, "53O", 42, 483, 0, 0, -4150,  2250, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1499, "53P", 42, 483, 0, 0, -4150,  1550, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1505, "53Q", 42, 483, 0, 0, -4150,  150,  0, 1, 35000, 500, 10000, 1,  32, 10, 0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1506, "53R", 42, 483, 0, 0, -4150, -550,  0, 1, 35000, 500, 10000, 1,  26, 16, 0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1507, "53S", 42, 483, 0, 0, -4150, -1250, 0, 1, 35000, 500, 10000, 1,  42, 0,  0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1508, "53T", 42, 483, 0, 0, -4150, -1950, 0, 1, 35000, 500, 10000, 1,  30, 12, 0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
data.push(RackInfoConstructor(1, 1509, "53U", 42, 483, 0, 0, -4150, -2650, 0, 1, 35000, 500, 10000, 1,  32, 10, 0, 0,     0,   0,     0, 0,     0, 0,    1, 1500, 700))
