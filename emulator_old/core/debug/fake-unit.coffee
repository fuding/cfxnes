###########################################################
# Empty stub for testing
###########################################################

class FakeUnit

    powerUp: ->
    connectMapper: ->
    setNTSCMode: ->
    tick: ->
    readStatus: -> 0
    writeControl: (value) -> value
    writeMask: (value) -> value
    writeAddress: (value) -> value
    writeData: (value) -> value
    writeScroll: (value) -> value
    writeOAMAddress: (value) -> value
    writeOAMData: (value) -> value
    writeFrameCounter: (value) -> value
    writeStatus: (value) -> value
    writePulseDutyEnvelope: (value) -> value
    writePulseSweep: (value) -> value
    writePulseTimer: (value) -> value
    writePulseLengthCounter: (value) -> value
    writeTriangleLinearCounter: (value) -> value
    writeTriangleTimer: (value) -> value
    writeTriangleLengthCounter: (value) -> value
    writeNoiseEnvelope: (value) -> value
    writeNoiseTimer: (value) -> value
    writeNoiseLengthCounter: (value) -> value
    writeDMCSampleLength: (value) -> value
    writeDMCSampleAddress: (value) -> value
    writeDMCOutputLevel: (value) -> value
    writeDMCFlagsTimer: (value) -> value
    isBlockingCPU: -> false
    isBlockingDMA: -> false

module.exports = FakeUnit