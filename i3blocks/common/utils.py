# does not need a shebang line because it is not meant to be executable

import socket

def get_bars_as_text(percentage, num_sticks=6):
    '''Returns bars in form of text to display controls like volume and brightness.

    Example: It returns the following lines
    ||||....
    ||||||||
    ........

    '''

    interval = int(100/num_sticks)

    sticks = int( (percentage+interval/2)/ interval)

    return "|"*sticks + "."*(num_sticks-sticks)


    while percentage > 10:
        ret[ret.index('.')] = '|'
        percentage -= 10
    return ret
 

def get_color(percent, skip_bg=False):
        if percent < 10:
            if skip_bg: return "#FF1100"

            # exit code 33 will turn background red
            return "#FFFFFF"
        if percent < 20:
            return "#FF3300"
        if percent < 30:
            return "#FF6600"
        if percent < 40:
            return "#FF9900"
        if percent < 50:
            return "#FFCC00"
        if percent < 60:
            return "#FFFF00"
        if percent < 70:
            return "#FFFF33"
        if percent < 80:
            return "#FFFF66"
        if percent > 95:
            return "#19FF19"
        return "#FFFFFF"
    
    
def is_valid_ipv4_address(address):
    try:
        socket.inet_pton(socket.AF_INET, address)
    except AttributeError:  # no inet_pton here, sorry
        try:
            socket.inet_aton(address)
        except socket.error:
            return False
        return address.count('.') == 3
    except socket.error:  # not a valid address
        return False

    return True


if __name__ == "__main__":
    print(get_bars_as_text(10))


