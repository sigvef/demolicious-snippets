###############################
#                             #
#  sin(x) demosembly snippet  #
#                             #
###############################
#
# This snippet is a drop-in
# sin(x) function. It uses a
# lerped quarter lookup table
# approach to get reasonable
# results.
#
# In this snippet, input and
# output values are scaled
# such that PI == 4096, i.e.
# sin(4096) == 0 and
# sin(2048) == 1303.
#                             #
###############################
#                             #
# INPUT:  x
# RETURN: sine wave from
#         -1303 to 1303 (ret)
#                             #
###############################

i = (x & 0x7FF) >> 7
quadrant = (x & 0x1FFF) >> 11
$mask = quadrant in [1, 3]
i = $mask ? 15 - i : i
a = 0
b = 127
a = i == 1 ? 127 : a
b = i == 1 ? 254 : b
a = i == 2 ? 254 : a
b = i == 2 ? 378 : b
a = i == 3 ? 378 : a
b = i == 3 ? 498 : b
a = i == 4 ? 498 : a
b = i == 4 ? 614 : b
a = i == 5 ? 614 : a
b = i == 5 ? 724 : b
a = i == 6 ? 724 : a
b = i == 6 ? 827 : b
a = i == 7 ? 827 : a
b = i == 7 ? 921 : b
a = i == 8 ? 921 : a
b = i == 8 ? 1007 : b
a = i == 9 ? 1007 : a
b = i == 9 ? 1084 : b
a = i == 10 ? 1084 : a
b = i == 10 ? 1149 : b
a = i == 11 ? 1149 : a
b = i == 11 ? 1204 : b
a = i == 12 ? 1204 : a
b = i == 12 ? 1247 : b
a = i == 13 ? 1247 : a
b = i == 13 ? 1278 : b
a = i == 14 ? 1278 : a
b = i == 14 ? 1300 : b
a = i == 15 ? 1300 : a
b = i == 15 ? 1303 : b
mixer = x & 0x7F
mixer = quadrant in [1, 3] ? 128 - mixer : mixer
ret = ((b * mixer) >> 7) + ((a * (0x7F - mixer)) >> 7)
ret = quadrant in [2, 3] ? -ret : ret
###############################
