local composer = require( "composer" )
local scene = composer.newScene()

local widget = require "widget"

local function irParaOMenu()
	
	composer.gotoScene( "jogo", "fade", 500 )
	
end

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImageRect( "background.png", display.actualContentWidth, display.actualContentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0 + display.screenOriginX 
	background.y = 0 + display.screenOriginY
	
	local iniciar = display.newImageRect("iniciar.png",220,90)
	iniciar.x = display.contentCenterX
	iniciar.y = 820

	iniciar:addEventListener("touch", irParaOMenu)
	sceneGroup:insert( background )
	sceneGroup:insert(iniciar)
end

scene:addEventListener( "create", scene )

return scene