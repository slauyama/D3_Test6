Function.prototype.debounce = (threshold, execAsap) ->
   func = this
   timeout = 0
   return ->
      obj = this
      args = arguments

      delayed = ->
         if (!execAsap)
            func.apply(obj, args)
         timeout = null
         return
 
      if (timeout)
         clearTimeout(timeout)
      else if (execAsap)
         func.apply(obj, args)
 
      timeout = setTimeout(delayed, threshold || 100) 
      return
      
bounds =
   boundBox:
      minX: HIGH_NUM
      maxX: -HIGH_NUM
      minY: HIGH_NUM
      maxY: -HIGH_NUM

   boundWthHgt:
      maxWidth: -HIGH_NUM
      maxHeight: -HIGH_NUM

   avgInterval: 100
   
   resetBounds: ->
      @boundBox.minX = HIGH_NUM
      @boundBox.maxX = -HIGH_NUM
      @boundBox.minY = HIGH_NUM
      @boundBox.maxY = -HIGH_NUM

      @boundWthHgt.minWidth = HIGH_NUM
      @boundWthHgt.maxWidth = -HIGH_NUM
      @boundWthHgt.minHeight = HIGH_NUM
      @boundWthHgt.maxHeight = -HIGH_NUM
      return

   calculateBounds: (fpID) ->
      @resetBounds()
      @boundBox.minX = Math.roundTo(d3.min(data, (d) -> d.XPos), 2)
      @boundBox.maxX = Math.roundTo(d3.max(data, (d) -> d.XPos), 2)
      @boundBox.minY = Math.roundTo(d3.min(data, (d) -> d.YPos), 2)
      @boundBox.maxY = Math.roundTo(d3.max(data, (d) -> d.YPos), 2)
      @boundWthHgt.maxWidth = Math.roundTo(d3.max(data, (d) -> d.FloorPlanWidth), 2)
      @boundWthHgt.maxHeight = Math.roundTo(d3.max(data, (d) -> d.FloorPlanHeight), 2)
      return

bounds.calculateBounds()
frontDis = bounds.boundBox.minY - bounds.boundWthHgt.maxHeight - (bounds.boundBox.maxX - bounds.boundBox.minX)
backDis = -frontDis
sideDis = bounds.boundBox.maxX + bounds.boundWthHgt.maxWidth + (bounds.boundBox.maxY - bounds.boundBox.minY)
topDis = (bounds.boundBox.maxX - bounds.boundBox.minY) + (bounds.boundBox.maxY - bounds.boundBox.minY)

x3d = d3.select("body").append("x3d").attr( "height", "400px" ).attr( "width", "700px" ).attr('id', 'x3dElement')
scene = x3d.append("scene")

scene.append("viewpoint").attr("id", "Top View").attr( "centerOfRotation", "0 0 0").attr( "position", "0 0 #{topDis}" ).attr( "orientation", "0.0 0.0 0.0 0.0" ).attr( "fieldOfView", '0.75')
scene.append("viewpoint").attr("id", "Front View").attr( "centerOfRotation", "0 0 0").attr( "position", "0 #{frontDis} 0" ).attr( "orientation", "1.0 0.0 0.0 1.570").attr( "fieldOfView", '0.95')
scene.append("viewpoint").attr("id", "Side View").attr( "centerOfRotation", "0 0 0").attr( "position", "#{sideDis} 0 0.25" ).attr( "orientation", "0.50 0.50 0.50 2.093").attr( "fieldOfView", '0.95')
scene.append("viewpoint").attr("id", "Back View").attr( "centerOfRotation", "0 0 0").attr( "position", "0.0 #{backDis} -.50" ).attr( "orientation", "0.0 0.75 0.65 3.14").attr( "fieldOfView", '0.95')
scene.append("viewpoint").attr("id", "Perspective").attr( "centerOfRotation", "0 0 0").attr( "position", "#{backDis / 3} #{-sideDis} #{topDis / 3}" ).attr( "orientation", "1.0 0.25 0.25 1.25").attr( "fieldOfView", '0.95')
# Custom View Removed
# scene.append("viewpoint").attr("id", "Custom View").attr( "centerOfRotation", "0 0 0").attr( "position", "#{-backDis / 3} #{-sideDis} #{topDis / 3}"  ).attr( "orientation", "1.0 -0.2 -0.1 1.25" ).attr( "fieldOfView", '0.75')

HIGH_NUM = 9007199254740992

display = ( data ) ->
   shapes = scene.selectAll("transform").data(data)

   shapesEnter = shapes.enter().append( "transform" ).append( "shape" )

   # Enter and update   .attr("scale", (d)-> "1.5 .7 1.8669)"
   shapes.transition().attr("translation", (d, i) -> 
      d.XPos + " " + d.YPos + " 0.0")

   shapesEnter.append("appearance").append("material")

   scene.selectAll("material").data(data).transition().duration(1000).delay(500).attr("diffuseColor", (d)-> colorFunc(d))

   shapesEnter.append( "box" ).data(data).attr("size", (d) ->
      d.FloorPlanWidth + " " + (d.FloorPlanHeight - 0.05) + " " + d.RackUnitHeight)

   return

display data

setInterval (-> display data), 10000

colorFunc = (data) ->
   switch document.getElementsByClassName('selectedColor')[0].value
      when "Power"
         value = data.PowerCurrent / data.PowerMax
      when "Weight"
         value = data.WeightCurrent / data.WeightMax
      when "Temperature"
         value = data.HeatDissipationCurrent / data.CoolingMax

   if value < 0.5
      r = Math.floor(value * 255)
      g = 200
   else
      r = 255
      g = Math.floor((1 - value) * 255)

   "#" + ((if r < 16 then "0" else "")) + r.toString(16) + ((if g < 16 then "0" else "")) + g.toString(16) + "00"

toggleCamera = ->
   clearAllSelected('selectedView');
   @className += " selectedView";
   document.getElementById(@value).setAttribute('set_bind','true');
   return

toggleColor = ->
   clearAllSelected('selectedColor');
   @className += " selectedColor";
   display data

clearAllSelected = (str)->
   allSelected = document.getElementsByClassName(str);
   while (allSelected.length)
      allSelected[0].className = "button";
   return

optionSetup = ->
   childColor = document.getElementsByClassName('colorOption')[0].children
   childCamera = document.getElementsByClassName('cameraOption')[0].children
   i = 0

   while (i < childColor.length || i < childCamera.length)
      if (i < childColor.length)
         childColor[i].onmouseover = toggleColor
      if (i < childCamera.length)
         childCamera[i].onmouseover = toggleCamera
      i++
   return

gridSetup = (bounds)->

   # Attach a shape to the scene
   # Give it a light grey color with transparency
   shape = scene.append('Transform').append('Shape').attr('id', 'grid')
   shape.append('Appearance').append('Material').attr('id', 'gridMaterial').attr('diffuseColor', '.8, .8, .8').attr('transparency','.65')
   #pointStr is a string representing connections between coordinates
   pointStr = ""
   #coodStr is a string representing the coordinates
   coodStr = ""
   lineset = 0

   # Verticle lines on the Grid
   grid = Math.roundTo(bounds.boundBox.minX - bounds.boundWthHgt.maxWidth, 2)
   gridInterval = Math.roundTo((bounds.boundBox.maxX + bounds.boundWthHgt.maxWidth + Math.abs(grid)) / 12, 2)
   while grid <= Math.roundTo(bounds.boundBox.maxX + bounds.boundWthHgt.maxWidth)
      pointStr += "#{grid} #{Math.roundTo(bounds.boundBox.minY - bounds.boundWthHgt.maxHeight, 2)} -1 #{grid} #{Math.roundTo(bounds.boundBox.maxY + bounds.boundWthHgt.maxHeight, 2)} -1 "
      coodStr += "#{lineset} #{lineset + 1} -1 "
      grid = Math.roundTo(grid + .6, 2)
      lineset += 2

   # Horizontal Lines on the Grid
   grid = Math.roundTo(bounds.boundBox.minY - bounds.boundWthHgt.maxHeight, 2)
   gridInterval = Math.roundTo((bounds.boundBox.maxY + bounds.boundWthHgt.maxHeight + Math.abs(grid)) / 12, 2)
   while grid <= Math.roundTo(bounds.boundBox.maxY + bounds.boundWthHgt.maxHeight)
      pointStr += "#{Math.roundTo(bounds.boundBox.minX - bounds.boundWthHgt.maxWidth, 2)} #{grid} -1 #{Math.roundTo(bounds.boundBox.maxX + bounds.boundWthHgt.maxWidth, 2)} #{grid} -1 "
      coodStr += "#{lineset} #{lineset + 1} -1 "
      grid = Math.roundTo(grid + .6, 2)
      lineset += 2

   set = shape.append('IndexedLineSet').attr('coordIndex', '#{coodStr}')
   set.append('Coordinate').attr('point', "#{pointStr}")

# setup the grid
gridSetup(bounds)

window.onload = -> 
   optionSetup()

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