#!/bin/sh
names=( 
"00000000000000020006000e7e9ffc3f"  "default"                           "pirate"
"00008160000006810000408080010102"  "diamond_cross"                     "plus"
"028006030e0e7ebffc7f7070c0600140"  "dnd-ask"                           "pointer"
"03b6e0fcb3499374a867c041f52298f0"  "dnd-copy"                          "pointing_hand"
"03b6e0fcb3499374a867d041f52298f0"  "dnd-link"                          "progress"
"0426c94ea35c87780ff01dc239897213"  "dnd-move"                          "question_arrow"
"043a9f68147c53184671403ffa811cc5"  "dnd-no-drop"                       "right-arrow"
"048008013003cff3c00c801001200000"  "dnd-none"                          "rightbutton"
"0876e1c15ff2fc01f906f1c363074c0f"  "dot"                               "right_ptr"
"08e8e1c95fe2fc01f976f1e063a24ccd"  "dotbox"                            "right_side"
"08ffe1cb5fe6fc01f906f1c063814ccf"  "double_arrow"                      "right_tee"
"08ffe1e65f80fcfdf9fff11263e74c48"  "draft_large"                       "row-resize"
"1081e37283d90000800003c07f3ef6bf"  "draft_small"                       "rtl_logo"
"14fef782d02440884392942c11205230"  "draped_box"                        "sailboat"
"208530c400c041818281048008011002"  "e29285e634086352946a0e7090d73106"  "sb_down_arrow"
"2870a09082c103050810ffdffffe0204"  "e-resize"                          "sb_h_double_arrow"
"3085a0e285430894940527032f8b26df"  "ew-resize"                         "sb_left_arrow"
"38c5dff7c7b8962045400281044508d2"  "exchange"                          "sb_right_arrow"
"3ecb610c1bf2410f44200f48c40d3599"  "f41c0e382c94c0958e07017e42b00462"  "sb_up_arrow"
"4498f0e0c1937ffe01fd06f973665830"  "f41c0e382c97c0938e07017e42800402"  "sb_v_double_arrow"
"50585d75b494802d0151028115016902"  "fcf1c3c7cd4491d801f1e1c78f100000"  "se-resize"
"5aca4d189052212118709018842178c0"  "fcf21c00b30f7e3f83fe0dfd12e71cff"  "shuttle"
"5c6cd98b3f3ebcb1f9c7f1c204630408"  "fd_double_arrow"                   "size_all"
"6407b0e94181790501fd1e167b474872"  "fleur"                             "size_bdiag"
"640fb0e74195791501fd1ed57b41487f"  "forbidden"                         "size_fdiag"
"9081237383d90e509aa00f00170e968f"  "gobbler"                           "size_hor"
"9116a3ea924ed2162ecab71ba103b17f"  "grabbing"                          "size_ver"
"9d800788f1b08800ae810202380a0822"  "gumby"                             "sizing"
"a2a266d0498c3104214a47bd64ab0fc8"  "half-busy"                         "spider"
"alias"                             "hand"                              "split_h"
"all-scroll"                        "hand1"                             "split_v"
"arrow"                             "hand2"                             "spraycan"
"b66166c04f8c3109214a4fbd64a50fc8"  "h_double_arrow"                    "s-resize"
"based_arrow_down"                  "heart"                             "star"
"based_arrow_up"                    "help"                              "sw-resize"
"bd_double_arrow"                   "ibeam"                             "target"
"boat"                              "icon"                              "tcross"
"bogosity"                          "iron_cross"                        "text"
"bottom_left_corner"                "leftbutton"                        "top_left_arrow"
"bottom_right_corner"               "left_ptr"                          "top_left_corner"
"bottom_side"                       "left_ptr_watch"                    "top_right_corner"
"bottom_tee"                        "left_side"                         "top_side"
"box_spiral"                        "left_tee"                          "top_tee"
"c07385c7190e701020ff7ffffd08103c"  "link"                              "trek"
"c7088f0f3e6c8088236ef8e1e3e70000"  "ll_angle"                          "ul_angle"
"cell"                              "lr_angle"                          "umbrella"
"center_ptr"                        "man"                               "up_arrow"
"circle"                            "middlebutton"                      "up-arrow"
"clock"                             "mouse"                             "ur_angle"
"closedhand"                        "move"                              "v_double_arrow"
"coffee_mug"                        "ne-resize"                         "vertical-text"
"color-picker"                      "nesw-resize"                       "wait"
"col-resize"                        "no-drop"                           "watch"
"context-menu"                      "not-allowed"                       "whats_this"
"copy"                              "n-resize"                          "w-resize"
"cross"                             "ns-resize"                         "X_cursor"
"crossed_circle"                    "nw-resize"                         "X-cursor"
"crosshair"                         "nwse-resize"                       "xterm"
"cross_reverse"                     "openhand"                          "zoom-in"
"d9ce0ab605698f320427677b458ad60b"  "pencil"                            "zoom-out" )

cd $(dirname "$0")

echo "clean folders..."
rm -r ./cursors
rm -r ./source
mkdir cursors
mkdir source

echo "make pngs..."
for n in "${names[@]}"; do
	cp blank.png source/$n.png
done

echo "make config files..."
for n in "${names[@]}"; do
	echo "16 0 0 $n.png" > source/$n.cfg
done

echo "generating cursors..."
cd source
for n in "${names[@]}"; do
	xcursorgen $n.cfg ../cursors/$n
done
