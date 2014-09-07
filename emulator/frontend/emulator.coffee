Injector = require "../core/utils/injector"
Logger   = require "../core/utils/logger"

isLocalhost = ->
    url = document.URL or ""
    for pattern in [ "file://", "localhost", "127.0.0.1" ]
        return true if url.indexOf pattern >= 0
    return false

logger = Logger.get()
logger.attach Logger.console() if isLocalhost()

###########################################################
# Emulator API
###########################################################

class Emulator

    @dependencies: [ "executionManager", "cartridgeManager", "videoManager", "inputManager", "persistenceManager" ]

    constructor: (mode = "base") ->
        logger.info "Creating '#{mode}' dependency injection context"
        injector = new Injector "frontend/config/#{mode}-config"
        injector.injectInstance this

    init: (executionManager, cartridgeManager, videoManager, inputManager, persistenceManager) ->
        @executionManager = executionManager
        @cartridgeManager = cartridgeManager
        @videoManager = videoManager
        @inputManager = inputManager
        @persistenceManager = persistenceManager
        @persistenceManager.loadConfiguration()

    ###########################################################
    # Generic API
    ###########################################################

    "setDefaults": ->
        @executionManager.setDefaults()
        @videoManager.setDefaults()
        @inputManager.setDefaults()
        @persistenceManager.setDefaults()

    ###########################################################
    # Execution API
    ###########################################################

    "setExecutionDefaults": ->
        @executionManager.setDefaults()

    "step": ->
        @executionManager.step()

    "start": ->
        @executionManager.start()

    "stop": ->
        @executionManager.stop()

    "restart": ->
        @executionManager.restart()

    "isRunning": ->
        @executionManager.isRunning()

    "hardReset": ->
        @executionManager.hardReset()

    "softReset": ->
        @executionManager.softReset()

    "getFPS": ->
        @executionManager.getFPS()

    "setTVSystem": (tvSystem) ->
        @executionManager.setTVSystem tvSystem

    "getTVSystem": ->
        @executionManager.getTVSystem()

    ###########################################################
    # Cartridges API
    ###########################################################

    "loadCartridge": (file, onLoad, onError) ->
        @cartridgeManager.loadCartridge file, onLoad, onError

    "downloadCartridge": (url, onLoad, onError) ->
        @cartridgeManager.downloadCartridge url, onLoad, onError

    "insertCartridge": (arrayBuffer) ->
        @cartridgeManager.insertCartridge arrayBuffer

    "isCartridgeInserted": ->
        @cartridgeManager.isCartridgeInserted()

    ###########################################################
    # Video API
    ###########################################################

    "setVideoDefaults": ->
        @videoManager.setDefaults()

    "setVideoOutput": (canvas) ->
        @videoManager.setCanvas canvas

    "setVideoPalette": (palette) ->
        @videoManager.setPalette palette

    "getVideoPalette": ->
        @videoManager.getPalette()

    "setVideoScale": (scale) ->
        @videoManager.setScale scale

    "getVideoScale": (scale) ->
        @videoManager.getScale()

    "getMaxVideoScale": ->
        @videoManager.getMaxScale()

    "setVideoSmoothing": (smoothing) ->
        @videoManager.setSmoothing smoothing

    "isVideoSmoothing": ->
        @videoManager.isSmoothing()

    "setVideoDebugging": (debugging) ->
        @videoManager.setDebugging debugging

    "isVideoDebugging": ->
        @videoManager.isDebugging()

    "enterFullScreen": ->
        @videoManager.enterFullScreen()

    ###########################################################
    # Inputs API
    ###########################################################

    "setInputDefaults": ->
        @inputManager.setDefaults()

    "setInputDevice": (port, id) ->
        @inputManager.connectTarget port, id

    "getInputDevice": (port) ->
        @inputManager.getConnectedTarget port

    "mapInput": (targetPort, targetId, targetInput, sourceId, sourceInput) ->
        @inputManager.mapInput targetPort, targetId, targetInput, sourceId, sourceInput

    "unmapInput": (targetPort, targetId, targetInput, sourceId, sourceInput) ->
        @inputManager.unmapInput targetPort, targetId, targetInput, sourceId, sourceInput

    "getMappedInputName": (targetPort, targetId, targetInput) ->
        @inputManager.getMappedInputName targetPort, targetId, targetInput

    "recordInput": (callback) ->
        @inputManager.recordInput callback

    ###########################################################
    # Persistence API
    ###########################################################

    "setPersistenceDefaults": ->
        @persistenceManager.setDefaults()

    "enablePeriodicSave": (period) ->
        @persistenceManager.enablePeriodicSave period

    "disablePeriodicSave": ->
        @persistenceManager.disablePeriodicSave()

    "isPeriodicSave": ->
        @persistenceManager.isPeriodicSave()

module.exports = window["NESCoffee"] = Emulator