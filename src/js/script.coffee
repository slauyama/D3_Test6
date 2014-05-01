bounds =
   boundingBox:
      minX: HIGH_NUM, maxX: -HIGH_NUM, minY: HIGH_NUM, maxY: -HIGH_NUM

   maxWidth: -HIGH_NUM
   maxHeight: -HIGH_NUM

   resetBounds: ->
      @boundingBox.minX = @boundingBox.minY = HIGH_NUM
      @boundingBox.maxX = @boundingBox.maxY = -HIGH_NUM

      @maxWidth = @maxHeight = -HIGH_NUM
      return

   calculateBounds: ->
      @resetBounds()
      @boundingBox.minX = Math.roundTo(d3.min(data, (d) -> d.xPosition), 2)
      @boundingBox.maxX = Math.roundTo(d3.max(data, (d) -> d.xPosition), 2)
      @boundingBox.minY = Math.roundTo(d3.min(data, (d) -> d.yPosition), 2)
      @boundingBox.maxY = Math.roundTo(d3.max(data, (d) -> d.yPosition), 2)
      @maxWidth = Math.roundTo(d3.max(data, (d) -> d.floorPlanWidth), 2)
      @maxHeight = Math.roundTo(d3.max(data, (d) -> d.floorPlanHeight), 2)
      return

bounds.calculateBounds()
frontDistance = bounds.boundingBox.minY - bounds.maxHeight - (bounds.boundingBox.maxX - bounds.boundingBox.minX)
backDistance = -frontDistance
sideDistance = bounds.boundingBox.maxX + bounds.maxWidth + (bounds.boundingBox.maxY - bounds.boundingBox.minY)
topDistance = (bounds.boundingBox.maxX - bounds.boundingBox.minY) + (bounds.boundingBox.maxY - bounds.boundingBox.minY)

x3d = d3.select("#x3dElement").attr( "height", "400px" ).attr( "width", "700px" )
scene = x3d.append("scene")

scene.append("viewpoint").attr("id", "Top View")
   .attr( "centerOfRotation", "0 0 0").attr( "position", "0 0 #{topDistance}" )
   .attr( "orientation", "0.0 0.0 0.0 0.0" ).attr( "fieldOfView", '0.75')
scene.append("viewpoint").attr("id", "Front View")
   .attr( "centerOfRotation", "0 0 0").attr( "position", "0 #{frontDistance} 0" )
   .attr( "orientation", "1.0 0.0 0.0 1.570").attr( "fieldOfView", '0.95')
scene.append("viewpoint").attr("id", "Side View")
   .attr( "centerOfRotation", "0 0 0").attr( "position", "#{sideDistance} 0 0.25" )
   .attr( "orientation", "0.50 0.50 0.50 2.093").attr( "fieldOfView", '0.95')
scene.append("viewpoint").attr("id", "Back View")
   .attr( "centerOfRotation", "0 0 0").attr( "position", "0.0 #{backDistance} -.50" )
   .attr( "orientation", "0.0 0.75 0.65 3.14").attr( "fieldOfView", '0.95')
scene.append("viewpoint").attr("id", "Perspective").attr( "centerOfRotation", "0 0 0")
   .attr( "position", "#{backDistance / 3} #{-sideDistance} #{topDistance / 3}" )
   .attr( "orientation", "1.0 0.25 0.25 1.25").attr( "fieldOfView", '0.95')
# Custom View Removed
# scene.append("viewpoint").attr("id", "Custom View").attr( "centerOfRotation", "0 0 0").attr( "position", "#{-backDistance / 3} #{-sideDis} #{topDistance / 3}"  ).attr( "orientation", "1.0 -0.2 -0.1 1.25" ).attr( "fieldOfView", '0.75')
scene.append("PointLight").attr("on", "TRUE").attr('intensity','1.0')
   .attr('color', '1.0 0.0 0.0').attr('attenuation', '1.0000 0.0000 0.0000')
   .attr('location',"#{sideDistance} 0 0").attr('radius','200.0')

HIGH_NUM = 9007199254740992

rackDataFunc = (data) ->
   # document.getElementById('ComponentID-Data').innerHTML = data.componentID
   # document.getElementById('Name-Data').innerHTML = data.name 
   # document.getElementById('Power-Data').innerHTML = data.powerCurrent+"/"+data.powerPlanned+"/"+data.powerMax
   # document.getElementById('Temperature-Data').innerHTML = data.temperatureCurrent+"/"+data.temperaturePlanned+"/"+data.coolingMax
   # document.getElementById('Weight-Data').innerHTML = data.weightCurrent+"/"+data.weightPlanned+"/"+data.weightMax
   # document.getElementById('UsedUnits-Data').innerHTML = data.usedUnitsCurrent+"/"+data.usedUnitsPlanned
   # document.getElementById('UnitLocation-Data').innerHTML = data.largestUnitLocation
   # document.getElementById('UnitSize-Data').innerHTML = data.largestUnitSize 
   # document.getElementById('PowerAD-Data').innerHTML = data.powerActualDerivation
   console.log "justforshure"
   return

display = ( data ) ->
   transforms = scene.selectAll('transform').data(data)

   shapesEnter = transforms.enter().append('transform')
      .append('shape').data(data).attr('id', (d)-> 'rack'+d.componentID).attr('class', 'rack')

   # scene.selectAll('.rack').onmouseover = rackDataFuncs

   transforms.transition().attr('translation', (d, i) -> d.xPosition + ' ' + d.yPosition + ' 0.0')

   shapesEnter.append('appearance').append('material')

   scene.selectAll('material').data(data).transition().duration(1000).delay(500)
      .attr('diffuseColor', (d)-> setRackColor(d))

   shapesEnter.append('box').data(data)
      .attr('size', (d) -> d.floorPlanWidth + ' ' + (d.floorPlanHeight - 0.1) + ' ' + d.rackUnitHeight)

   return

display data

setInterval (-> display data), 10000

setRackColor = (data) ->
   switch document.getElementsByClassName('selected-color')[0].value
      when "Power"
         value = data.powerCurrent / data.powerMax
         value = if isNumber(value) then value else "steelblue"
      when "Weight"
         value = data.weightCurrent / data.weightMax
         value = if isNumber(value) then value else "steelblue"
      when "Temperature"
         value = data.temperatureCurrent / data.coolingMax
         value = if isNumber(value) then value else "steelblue"
      else
         value = "steelblue"

   if value is "steelblue"
      return "steelblue"

   if value < 0.5
      r = Math.floor(value * 255)
      g = 200
   else
      r = 255
      g = Math.floor((1 - value) * 255)

   "#" + ((if r < 16 then "0" else "")) + r.toString(16) + ((if g < 16 then "0" else "")) + g.toString(16) + "00"

toggleCamera = ->
   clearAllSelected('selected-view')
   @className += " selected-view"
   document.getElementById(@value).setAttribute('set_bind','true')
   return

toggleColor = ->
   clearAllSelected('selected-color')
   @className += " selected-color"
   display data

clearAllSelected = (str)->
   allSelected = document.getElementsByClassName(str)
   while (allSelected.length)
      allSelected[0].className = "button"
   return

gridSetup = (bounds)->
   # Attach a shape to the scene
   # Give it a light grey color with transparency
   shape = scene.append('Transform').append('Shape').attr('id', 'grid')
   shape.append('Appearance').append('Material').attr('id', 'gridMaterial').attr('diffuseColor', '0.8, 0.8, 0.8').attr('transparency','0.65')
   #coordinateString is a string representing the coordinates
   coordinateString = ""
   #lineString is a string representing connections between coordinates
   lineString = ""
   #lineset signifies what set of line user is on
   lineset = 0

   gridHeightStart = Math.roundTo(Math.ceil((bounds.boundingBox.minY - bounds.maxHeight) / 0.6 - 1) * 0.6, 2)
   gridHeightEnd = Math.roundTo(Math.ceil((bounds.boundingBox.maxY + bounds.maxHeight) / 0.6 + 1) * 0.6, 2)
   gridWidthStart = Math.roundTo(Math.ceil((bounds.boundingBox.minX - bounds.maxWidth) / 0.6 - 1) * 0.6, 2)
   gridWidthEnd = Math.roundTo(Math.ceil((bounds.boundingBox.maxX + bounds.maxWidth) / 0.6 + 1) * 0.6, 2)

   # Verticle lines on the Grid
   gridStart = gridWidthStart 
   while gridStart <= gridWidthEnd
      lineString += "#{gridStart} #{gridHeightStart} -1 #{gridStart} #{gridHeightEnd} -1 "
      coordinateString += "#{lineset} #{lineset + 1} -1 "
      gridStart = Math.roundTo(gridStart + 0.6, 2)
      lineset += 2

   # Horizontal Lines on the Grid
   gridStart = gridHeightStart
   while gridStart <= gridHeightEnd
      lineString += "#{gridWidthStart} #{gridStart} -1 #{gridWidthEnd} #{gridStart} -1 "
      coordinateString += "#{lineset} #{lineset + 1} -1 "
      gridStart = Math.roundTo(gridStart + 0.6, 2)
      lineset += 2

   set = shape.append('IndexedLineSet').attr('coordIndex', '#{coordinateString}')
   set.append('Coordinate').attr('point', "#{lineString}")

# setup the grid
gridSetup(bounds)

window.onload = -> 
   #options setup. Initializes the button to proper function
   colorButton.onmouseover = toggleColor for colorButton in document.getElementsByClassName('color-Option')[0].children
   cameraButton.onmouseover = toggleCamera for cameraButton in document.getElementsByClassName('camera-Option')[0].children

   #this will turn off movement controls
   #document.getElementById('x3dElement').runtime.noNav()

   # this will toggle the grid transparency 
   document.getElementById('gridToggle').onclick = -> 
      if document.getElementById('gridMaterial').transparency is "1.0"
         document.getElementById('gridMaterial').transparency = ".65"
      else
         document.getElementById('gridMaterial').transparency = "1.0"
      return
   return