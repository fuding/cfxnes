//=========================================================
// Zapper input device
//=========================================================

export class Zapper {

    init(ppu) {
        this.ppu = ppu;
        this.triggerPressed = false;
        this.beamX = 0;
        this.beamY = 0;
    }

    strobe() {
    }

    read() {
        return this.triggerPressed << 4 | !this.isLightDetected() << 3;
    }

    isLightDetected() {
        return this.beamX && this.beamY
            && this.ppu.isBrightFramePixel(this.beamX, this.beamY);
    }

    setTriggerPressed(pressed) {
        this.triggerPressed = pressed;
    }

    setBeamPosition(x, y) {
        this.beamX = x;
        this.beamY = y;
    }

}

Zapper["dependencies"] = [ "ppu" ];
