#!/usr/bin/python3
import os


def get_volume():
    cmd = "amixer sget Master | grep 'Right:'"
    cmdOut = os.popen(cmd).read().strip().split(" ")
    vol = cmdOut[4]
    vol = int(vol[1:-2])
    mute = cmdOut[5]
    mute = mute[1:-1]
    return mute, vol


def progbar(val, maxval):
    shape = ('⣷', '⣿', '⡄')

    val = min(val, maxval)
    perc = int(float(val * 5)/maxval)
    bar = []
    for i in range(5):
        if i < perc:
            bar.append(shape[1])
        elif i == perc:
            if val == 0:
                bar.append(shape[2])
            else:
                bar.append(shape[0])
        else:
            bar.append(" ")
    while len(bar) <= 5:
        bar.append(" ")

    final = ''.join(bar)
    return final


if __name__ == '__main__':
    mute, vol = get_volume()

    volbar = progbar(vol, 100)
    voltxt = volbar + "  {:.2f}%".format(vol)

    print(voltxt)
    if mute == 'off':
        img = "/usr/share/icons/Paper/24x24/status/stock_volume-mute.png"
    else:
        if vol == 0:
            img = "/usr/share/icons/Paper/24x24/status/stock_volume-min.png"
        elif vol >= 90:
            img = "/usr/share/icons/Paper/24x24/status/stock_volume-max.png"
        else:
            img = "/usr/share/icons/Paper/24x24/status/stock_volume-med.png"

    cmd = "dunstify Volume " + voltxt + " -i " + img + " -t 200 -r 2144"
    os.system(cmd)
