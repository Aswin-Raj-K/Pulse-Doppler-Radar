-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity top_fft_fft_coeff_M_real_V_rom is 
    generic(
             DWIDTH     : integer := 10; 
             AWIDTH     : integer := 11; 
             MEM_SIZE    : integer := 1521
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of top_fft_fft_coeff_M_real_V_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 31=> "0100000000", 32 to 38=> "0000000000", 39 => "0100000000", 40 => "0011111011", 
    41 => "0011101100", 42 => "0011010100", 43 => "0010110101", 44 => "0010001110", 
    45 => "0001100001", 46 => "0000110001", 47 => "0000000000", 48 => "1111001110", 
    49 => "1110011110", 50 => "1101110001", 51 => "1101001010", 52 => "1100101011", 
    53 => "1100010011", 54 => "1100000100", 55 => "1100000000", 56 => "1100000100", 
    57 => "1100010011", 58 => "1100101011", 59 => "1101001010", 60 => "1101110001", 
    61 => "1110011110", 62 => "1111001110", 63 => "0000000000", 64 => "0000110001", 
    65 => "0001100001", 66 => "0010001110", 67 => "0010110101", 68 => "0011010100", 
    69 => "0011101100", 70 => "0011111011", 71 to 77=> "0000000000", 78 => "0100000000", 
    79 => "0011101100", 80 => "0010110101", 81 => "0001100001", 82 => "0000000000", 
    83 => "1110011110", 84 => "1101001010", 85 => "1100010011", 86 => "1100000000", 
    87 => "1100010011", 88 => "1101001010", 89 => "1110011110", 90 => "0000000000", 
    91 => "0001100001", 92 => "0010110101", 93 => "0011101100", 94 => "0100000000", 
    95 => "0011101100", 96 => "0010110101", 97 => "0001100001", 98 => "0000000000", 
    99 => "1110011110", 100 => "1101001010", 101 => "1100010011", 102 => "1100000000", 
    103 => "1100010011", 104 => "1101001010", 105 => "1110011110", 106 => "0000000000", 
    107 => "0001100001", 108 => "0010110101", 109 => "0011101100", 110 to 116=> "0000000000", 
    117 => "0100000000", 118 => "0011010100", 119 => "0001100001", 120 => "1111001110", 
    121 => "1101001010", 122 => "1100000100", 123 => "1100010011", 124 => "1101110001", 
    125 => "0000000000", 126 => "0010001110", 127 => "0011101100", 128 => "0011111011", 
    129 => "0010110101", 130 => "0000110001", 131 => "1110011110", 132 => "1100101011", 
    133 => "1100000000", 134 => "1100101011", 135 => "1110011110", 136 => "0000110001", 
    137 => "0010110101", 138 => "0011111011", 139 => "0011101100", 140 => "0010001110", 
    141 => "0000000000", 142 => "1101110001", 143 => "1100010011", 144 => "1100000100", 
    145 => "1101001010", 146 => "1111001110", 147 => "0001100001", 148 => "0011010100", 
    149 to 155=> "0000000000", 156 => "0100000000", 157 => "0010110101", 158 => "0000000000", 
    159 => "1101001010", 160 => "1100000000", 161 => "1101001010", 162 => "0000000000", 
    163 => "0010110101", 164 => "0100000000", 165 => "0010110101", 166 => "0000000000", 
    167 => "1101001010", 168 => "1100000000", 169 => "1101001010", 170 => "0000000000", 
    171 => "0010110101", 172 => "0100000000", 173 => "0010110101", 174 => "0000000000", 
    175 => "1101001010", 176 => "1100000000", 177 => "1101001010", 178 => "0000000000", 
    179 => "0010110101", 180 => "0100000000", 181 => "0010110101", 182 => "0000000000", 
    183 => "1101001010", 184 => "1100000000", 185 => "1101001010", 186 => "0000000000", 
    187 => "0010110101", 188 to 194=> "0000000000", 195 => "0100000000", 196 => "0010001110", 
    197 => "1110011110", 198 => "1100000100", 199 => "1101001010", 200 => "0000110001", 
    201 => "0011101100", 202 => "0011010100", 203 => "0000000000", 204 => "1100101011", 
    205 => "1100010011", 206 => "1111001110", 207 => "0010110101", 208 => "0011111011", 
    209 => "0001100001", 210 => "1101110001", 211 => "1100000000", 212 => "1101110001", 
    213 => "0001100001", 214 => "0011111011", 215 => "0010110101", 216 => "1111001110", 
    217 => "1100010011", 218 => "1100101011", 219 => "0000000000", 220 => "0011010100", 
    221 => "0011101100", 222 => "0000110001", 223 => "1101001010", 224 => "1100000100", 
    225 => "1110011110", 226 => "0010001110", 227 to 233=> "0000000000", 234 => "0100000000", 
    235 => "0001100001", 236 => "1101001010", 237 => "1100010011", 238 => "0000000000", 
    239 => "0011101100", 240 => "0010110101", 241 => "1110011110", 242 => "1100000000", 
    243 => "1110011110", 244 => "0010110101", 245 => "0011101100", 246 => "0000000000", 
    247 => "1100010011", 248 => "1101001010", 249 => "0001100001", 250 => "0100000000", 
    251 => "0001100001", 252 => "1101001010", 253 => "1100010011", 254 => "0000000000", 
    255 => "0011101100", 256 => "0010110101", 257 => "1110011110", 258 => "1100000000", 
    259 => "1110011110", 260 => "0010110101", 261 => "0011101100", 262 => "0000000000", 
    263 => "1100010011", 264 => "1101001010", 265 => "0001100001", 266 to 272=> "0000000000", 
    273 => "0100000000", 274 => "0000110001", 275 => "1100010011", 276 => "1101110001", 
    277 => "0010110101", 278 => "0011010100", 279 => "1110011110", 280 => "1100000100", 
    281 => "0000000000", 282 => "0011111011", 283 => "0001100001", 284 => "1100101011", 
    285 => "1101001010", 286 => "0010001110", 287 => "0011101100", 288 => "1111001110", 
    289 => "1100000000", 290 => "1111001110", 291 => "0011101100", 292 => "0010001110", 
    293 => "1101001010", 294 => "1100101011", 295 => "0001100001", 296 => "0011111011", 
    297 => "0000000000", 298 => "1100000100", 299 => "1110011110", 300 => "0011010100", 
    301 => "0010110101", 302 => "1101110001", 303 => "1100010011", 304 => "0000110001", 
    305 to 311=> "0000000000", 312 => "0100000000", 313 => "0000000000", 314 => "1100000000", 
    315 => "0000000000", 316 => "0100000000", 317 => "0000000000", 318 => "1100000000", 
    319 => "0000000000", 320 => "0100000000", 321 => "0000000000", 322 => "1100000000", 
    323 => "0000000000", 324 => "0100000000", 325 => "0000000000", 326 => "1100000000", 
    327 => "0000000000", 328 => "0100000000", 329 => "0000000000", 330 => "1100000000", 
    331 => "0000000000", 332 => "0100000000", 333 => "0000000000", 334 => "1100000000", 
    335 => "0000000000", 336 => "0100000000", 337 => "0000000000", 338 => "1100000000", 
    339 => "0000000000", 340 => "0100000000", 341 => "0000000000", 342 => "1100000000", 
    343 to 350=> "0000000000", 351 => "0100000000", 352 => "1111001110", 353 => "1100010011", 
    354 => "0010001110", 355 => "0010110101", 356 => "1100101011", 357 => "1110011110", 
    358 => "0011111011", 359 => "0000000000", 360 => "1100000100", 361 => "0001100001", 
    362 => "0011010100", 363 => "1101001010", 364 => "1101110001", 365 => "0011101100", 
    366 => "0000110001", 367 => "1100000000", 368 => "0000110001", 369 => "0011101100", 
    370 => "1101110001", 371 => "1101001010", 372 => "0011010100", 373 => "0001100001", 
    374 => "1100000100", 375 => "0000000000", 376 => "0011111011", 377 => "1110011110", 
    378 => "1100101011", 379 => "0010110101", 380 => "0010001110", 381 => "1100010011", 
    382 => "1111001110", 383 to 389=> "0000000000", 390 => "0100000000", 391 => "1110011110", 
    392 => "1101001010", 393 => "0011101100", 394 => "0000000000", 395 => "1100010011", 
    396 => "0010110101", 397 => "0001100001", 398 => "1100000000", 399 => "0001100001", 
    400 => "0010110101", 401 => "1100010011", 402 => "0000000000", 403 => "0011101100", 
    404 => "1101001010", 405 => "1110011110", 406 => "0100000000", 407 => "1110011110", 
    408 => "1101001010", 409 => "0011101100", 410 => "0000000000", 411 => "1100010011", 
    412 => "0010110101", 413 => "0001100001", 414 => "1100000000", 415 => "0001100001", 
    416 => "0010110101", 417 => "1100010011", 418 => "0000000000", 419 => "0011101100", 
    420 => "1101001010", 421 => "1110011110", 422 to 428=> "0000000000", 429 => "0100000000", 
    430 => "1101110001", 431 => "1110011110", 432 => "0011111011", 433 => "1101001010", 
    434 => "1111001110", 435 => "0011101100", 436 => "1100101011", 437 => "0000000000", 
    438 => "0011010100", 439 => "1100010011", 440 => "0000110001", 441 => "0010110101", 
    442 => "1100000100", 443 => "0001100001", 444 => "0010001110", 445 => "1100000000", 
    446 => "0010001110", 447 => "0001100001", 448 => "1100000100", 449 => "0010110101", 
    450 => "0000110001", 451 => "1100010011", 452 => "0011010100", 453 => "0000000000", 
    454 => "1100101011", 455 => "0011101100", 456 => "1111001110", 457 => "1101001010", 
    458 => "0011111011", 459 => "1110011110", 460 => "1101110001", 461 to 467=> "0000000000", 
    468 => "0100000000", 469 => "1101001010", 470 => "0000000000", 471 => "0010110101", 
    472 => "1100000000", 473 => "0010110101", 474 => "0000000000", 475 => "1101001010", 
    476 => "0100000000", 477 => "1101001010", 478 => "0000000000", 479 => "0010110101", 
    480 => "1100000000", 481 => "0010110101", 482 => "0000000000", 483 => "1101001010", 
    484 => "0100000000", 485 => "1101001010", 486 => "0000000000", 487 => "0010110101", 
    488 => "1100000000", 489 => "0010110101", 490 => "0000000000", 491 => "1101001010", 
    492 => "0100000000", 493 => "1101001010", 494 => "0000000000", 495 => "0010110101", 
    496 => "1100000000", 497 => "0010110101", 498 => "0000000000", 499 => "1101001010", 
    500 to 506=> "0000000000", 507 => "0100000000", 508 => "1100101011", 509 => "0001100001", 
    510 => "0000110001", 511 => "1101001010", 512 => "0011111011", 513 => "1100010011", 
    514 => "0010001110", 515 => "0000000000", 516 => "1101110001", 517 => "0011101100", 
    518 => "1100000100", 519 => "0010110101", 520 => "1111001110", 521 => "1110011110", 
    522 => "0011010100", 523 => "1100000000", 524 => "0011010100", 525 => "1110011110", 
    526 => "1111001110", 527 => "0010110101", 528 => "1100000100", 529 => "0011101100", 
    530 => "1101110001", 531 => "0000000000", 532 => "0010001110", 533 => "1100010011", 
    534 => "0011111011", 535 => "1101001010", 536 => "0000110001", 537 => "0001100001", 
    538 => "1100101011", 539 to 545=> "0000000000", 546 => "0100000000", 547 => "1100010011", 
    548 => "0010110101", 549 => "1110011110", 550 => "0000000000", 551 => "0001100001", 
    552 => "1101001010", 553 => "0011101100", 554 => "1100000000", 555 => "0011101100", 
    556 => "1101001010", 557 => "0001100001", 558 => "0000000000", 559 => "1110011110", 
    560 => "0010110101", 561 => "1100010011", 562 => "0100000000", 563 => "1100010011", 
    564 => "0010110101", 565 => "1110011110", 566 => "0000000000", 567 => "0001100001", 
    568 => "1101001010", 569 => "0011101100", 570 => "1100000000", 571 => "0011101100", 
    572 => "1101001010", 573 => "0001100001", 574 => "0000000000", 575 => "1110011110", 
    576 => "0010110101", 577 => "1100010011", 578 to 584=> "0000000000", 585 => "0100000000", 
    586 => "1100000100", 587 => "0011101100", 588 => "1100101011", 589 => "0010110101", 
    590 => "1101110001", 591 => "0001100001", 592 => "1111001110", 593 => "0000000000", 
    594 => "0000110001", 595 => "1110011110", 596 => "0010001110", 597 => "1101001010", 
    598 => "0011010100", 599 => "1100010011", 600 => "0011111011", 601 => "1100000000", 
    602 => "0011111011", 603 => "1100010011", 604 => "0011010100", 605 => "1101001010", 
    606 => "0010001110", 607 => "1110011110", 608 => "0000110001", 609 => "0000000000", 
    610 => "1111001110", 611 => "0001100001", 612 => "1101110001", 613 => "0010110101", 
    614 => "1100101011", 615 => "0011101100", 616 => "1100000100", 617 to 623=> "0000000000", 
    624 => "0100000000", 625 => "1100000000", 626 => "0100000000", 627 => "1100000000", 
    628 => "0100000000", 629 => "1100000000", 630 => "0100000000", 631 => "1100000000", 
    632 => "0100000000", 633 => "1100000000", 634 => "0100000000", 635 => "1100000000", 
    636 => "0100000000", 637 => "1100000000", 638 => "0100000000", 639 => "1100000000", 
    640 => "0100000000", 641 => "1100000000", 642 => "0100000000", 643 => "1100000000", 
    644 => "0100000000", 645 => "1100000000", 646 => "0100000000", 647 => "1100000000", 
    648 => "0100000000", 649 => "1100000000", 650 => "0100000000", 651 => "1100000000", 
    652 => "0100000000", 653 => "1100000000", 654 => "0100000000", 655 => "1100000000", 
    656 to 662=> "0000000000", 663 => "0100000000", 664 => "1100000100", 665 => "0011101100", 
    666 => "1100101011", 667 => "0010110101", 668 => "1101110001", 669 => "0001100001", 
    670 => "1111001110", 671 => "0000000000", 672 => "0000110001", 673 => "1110011110", 
    674 => "0010001110", 675 => "1101001010", 676 => "0011010100", 677 => "1100010011", 
    678 => "0011111011", 679 => "1100000000", 680 => "0011111011", 681 => "1100010011", 
    682 => "0011010100", 683 => "1101001010", 684 => "0010001110", 685 => "1110011110", 
    686 => "0000110001", 687 => "0000000000", 688 => "1111001110", 689 => "0001100001", 
    690 => "1101110001", 691 => "0010110101", 692 => "1100101011", 693 => "0011101100", 
    694 => "1100000100", 695 to 701=> "0000000000", 702 => "0100000000", 703 => "1100010011", 
    704 => "0010110101", 705 => "1110011110", 706 => "0000000000", 707 => "0001100001", 
    708 => "1101001010", 709 => "0011101100", 710 => "1100000000", 711 => "0011101100", 
    712 => "1101001010", 713 => "0001100001", 714 => "0000000000", 715 => "1110011110", 
    716 => "0010110101", 717 => "1100010011", 718 => "0100000000", 719 => "1100010011", 
    720 => "0010110101", 721 => "1110011110", 722 => "0000000000", 723 => "0001100001", 
    724 => "1101001010", 725 => "0011101100", 726 => "1100000000", 727 => "0011101100", 
    728 => "1101001010", 729 => "0001100001", 730 => "0000000000", 731 => "1110011110", 
    732 => "0010110101", 733 => "1100010011", 734 to 740=> "0000000000", 741 => "0100000000", 
    742 => "1100101011", 743 => "0001100001", 744 => "0000110001", 745 => "1101001010", 
    746 => "0011111011", 747 => "1100010011", 748 => "0010001110", 749 => "0000000000", 
    750 => "1101110001", 751 => "0011101100", 752 => "1100000100", 753 => "0010110101", 
    754 => "1111001110", 755 => "1110011110", 756 => "0011010100", 757 => "1100000000", 
    758 => "0011010100", 759 => "1110011110", 760 => "1111001110", 761 => "0010110101", 
    762 => "1100000100", 763 => "0011101100", 764 => "1101110001", 765 => "0000000000", 
    766 => "0010001110", 767 => "1100010011", 768 => "0011111011", 769 => "1101001010", 
    770 => "0000110001", 771 => "0001100001", 772 => "1100101011", 773 to 779=> "0000000000", 
    780 => "0100000000", 781 => "1101001010", 782 => "0000000000", 783 => "0010110101", 
    784 => "1100000000", 785 => "0010110101", 786 => "0000000000", 787 => "1101001010", 
    788 => "0100000000", 789 => "1101001010", 790 => "0000000000", 791 => "0010110101", 
    792 => "1100000000", 793 => "0010110101", 794 => "0000000000", 795 => "1101001010", 
    796 => "0100000000", 797 => "1101001010", 798 => "0000000000", 799 => "0010110101", 
    800 => "1100000000", 801 => "0010110101", 802 => "0000000000", 803 => "1101001010", 
    804 => "0100000000", 805 => "1101001010", 806 => "0000000000", 807 => "0010110101", 
    808 => "1100000000", 809 => "0010110101", 810 => "0000000000", 811 => "1101001010", 
    812 to 818=> "0000000000", 819 => "0100000000", 820 => "1101110001", 821 => "1110011110", 
    822 => "0011111011", 823 => "1101001010", 824 => "1111001110", 825 => "0011101100", 
    826 => "1100101011", 827 => "0000000000", 828 => "0011010100", 829 => "1100010011", 
    830 => "0000110001", 831 => "0010110101", 832 => "1100000100", 833 => "0001100001", 
    834 => "0010001110", 835 => "1100000000", 836 => "0010001110", 837 => "0001100001", 
    838 => "1100000100", 839 => "0010110101", 840 => "0000110001", 841 => "1100010011", 
    842 => "0011010100", 843 => "0000000000", 844 => "1100101011", 845 => "0011101100", 
    846 => "1111001110", 847 => "1101001010", 848 => "0011111011", 849 => "1110011110", 
    850 => "1101110001", 851 to 857=> "0000000000", 858 => "0100000000", 859 => "1110011110", 
    860 => "1101001010", 861 => "0011101100", 862 => "0000000000", 863 => "1100010011", 
    864 => "0010110101", 865 => "0001100001", 866 => "1100000000", 867 => "0001100001", 
    868 => "0010110101", 869 => "1100010011", 870 => "0000000000", 871 => "0011101100", 
    872 => "1101001010", 873 => "1110011110", 874 => "0100000000", 875 => "1110011110", 
    876 => "1101001010", 877 => "0011101100", 878 => "0000000000", 879 => "1100010011", 
    880 => "0010110101", 881 => "0001100001", 882 => "1100000000", 883 => "0001100001", 
    884 => "0010110101", 885 => "1100010011", 886 => "0000000000", 887 => "0011101100", 
    888 => "1101001010", 889 => "1110011110", 890 to 896=> "0000000000", 897 => "0100000000", 
    898 => "1111001110", 899 => "1100010011", 900 => "0010001110", 901 => "0010110101", 
    902 => "1100101011", 903 => "1110011110", 904 => "0011111011", 905 => "0000000000", 
    906 => "1100000100", 907 => "0001100001", 908 => "0011010100", 909 => "1101001010", 
    910 => "1101110001", 911 => "0011101100", 912 => "0000110001", 913 => "1100000000", 
    914 => "0000110001", 915 => "0011101100", 916 => "1101110001", 917 => "1101001010", 
    918 => "0011010100", 919 => "0001100001", 920 => "1100000100", 921 => "0000000000", 
    922 => "0011111011", 923 => "1110011110", 924 => "1100101011", 925 => "0010110101", 
    926 => "0010001110", 927 => "1100010011", 928 => "1111001110", 929 to 935=> "0000000000", 
    936 => "0100000000", 937 => "0000000000", 938 => "1100000000", 939 => "0000000000", 
    940 => "0100000000", 941 => "0000000000", 942 => "1100000000", 943 => "0000000000", 
    944 => "0100000000", 945 => "0000000000", 946 => "1100000000", 947 => "0000000000", 
    948 => "0100000000", 949 => "0000000000", 950 => "1100000000", 951 => "0000000000", 
    952 => "0100000000", 953 => "0000000000", 954 => "1100000000", 955 => "0000000000", 
    956 => "0100000000", 957 => "0000000000", 958 => "1100000000", 959 => "0000000000", 
    960 => "0100000000", 961 => "0000000000", 962 => "1100000000", 963 => "0000000000", 
    964 => "0100000000", 965 => "0000000000", 966 => "1100000000", 967 to 974=> "0000000000", 
    975 => "0100000000", 976 => "0000110001", 977 => "1100010011", 978 => "1101110001", 
    979 => "0010110101", 980 => "0011010100", 981 => "1110011110", 982 => "1100000100", 
    983 => "0000000000", 984 => "0011111011", 985 => "0001100001", 986 => "1100101011", 
    987 => "1101001010", 988 => "0010001110", 989 => "0011101100", 990 => "1111001110", 
    991 => "1100000000", 992 => "1111001110", 993 => "0011101100", 994 => "0010001110", 
    995 => "1101001010", 996 => "1100101011", 997 => "0001100001", 998 => "0011111011", 
    999 => "0000000000", 1000 => "1100000100", 1001 => "1110011110", 1002 => "0011010100", 
    1003 => "0010110101", 1004 => "1101110001", 1005 => "1100010011", 1006 => "0000110001", 
    1007 to 1013=> "0000000000", 1014 => "0100000000", 1015 => "0001100001", 1016 => "1101001010", 
    1017 => "1100010011", 1018 => "0000000000", 1019 => "0011101100", 1020 => "0010110101", 
    1021 => "1110011110", 1022 => "1100000000", 1023 => "1110011110", 1024 => "0010110101", 
    1025 => "0011101100", 1026 => "0000000000", 1027 => "1100010011", 1028 => "1101001010", 
    1029 => "0001100001", 1030 => "0100000000", 1031 => "0001100001", 1032 => "1101001010", 
    1033 => "1100010011", 1034 => "0000000000", 1035 => "0011101100", 1036 => "0010110101", 
    1037 => "1110011110", 1038 => "1100000000", 1039 => "1110011110", 1040 => "0010110101", 
    1041 => "0011101100", 1042 => "0000000000", 1043 => "1100010011", 1044 => "1101001010", 
    1045 => "0001100001", 1046 to 1052=> "0000000000", 1053 => "0100000000", 1054 => "0010001110", 
    1055 => "1110011110", 1056 => "1100000100", 1057 => "1101001010", 1058 => "0000110001", 
    1059 => "0011101100", 1060 => "0011010100", 1061 => "0000000000", 1062 => "1100101011", 
    1063 => "1100010011", 1064 => "1111001110", 1065 => "0010110101", 1066 => "0011111011", 
    1067 => "0001100001", 1068 => "1101110001", 1069 => "1100000000", 1070 => "1101110001", 
    1071 => "0001100001", 1072 => "0011111011", 1073 => "0010110101", 1074 => "1111001110", 
    1075 => "1100010011", 1076 => "1100101011", 1077 => "0000000000", 1078 => "0011010100", 
    1079 => "0011101100", 1080 => "0000110001", 1081 => "1101001010", 1082 => "1100000100", 
    1083 => "1110011110", 1084 => "0010001110", 1085 to 1091=> "0000000000", 1092 => "0100000000", 
    1093 => "0010110101", 1094 => "0000000000", 1095 => "1101001010", 1096 => "1100000000", 
    1097 => "1101001010", 1098 => "0000000000", 1099 => "0010110101", 1100 => "0100000000", 
    1101 => "0010110101", 1102 => "0000000000", 1103 => "1101001010", 1104 => "1100000000", 
    1105 => "1101001010", 1106 => "0000000000", 1107 => "0010110101", 1108 => "0100000000", 
    1109 => "0010110101", 1110 => "0000000000", 1111 => "1101001010", 1112 => "1100000000", 
    1113 => "1101001010", 1114 => "0000000000", 1115 => "0010110101", 1116 => "0100000000", 
    1117 => "0010110101", 1118 => "0000000000", 1119 => "1101001010", 1120 => "1100000000", 
    1121 => "1101001010", 1122 => "0000000000", 1123 => "0010110101", 1124 to 1130=> "0000000000", 
    1131 => "0100000000", 1132 => "0011010100", 1133 => "0001100001", 1134 => "1111001110", 
    1135 => "1101001010", 1136 => "1100000100", 1137 => "1100010011", 1138 => "1101110001", 
    1139 => "0000000000", 1140 => "0010001110", 1141 => "0011101100", 1142 => "0011111011", 
    1143 => "0010110101", 1144 => "0000110001", 1145 => "1110011110", 1146 => "1100101011", 
    1147 => "1100000000", 1148 => "1100101011", 1149 => "1110011110", 1150 => "0000110001", 
    1151 => "0010110101", 1152 => "0011111011", 1153 => "0011101100", 1154 => "0010001110", 
    1155 => "0000000000", 1156 => "1101110001", 1157 => "1100010011", 1158 => "1100000100", 
    1159 => "1101001010", 1160 => "1111001110", 1161 => "0001100001", 1162 => "0011010100", 
    1163 to 1169=> "0000000000", 1170 => "0100000000", 1171 => "0011101100", 1172 => "0010110101", 
    1173 => "0001100001", 1174 => "0000000000", 1175 => "1110011110", 1176 => "1101001010", 
    1177 => "1100010011", 1178 => "1100000000", 1179 => "1100010011", 1180 => "1101001010", 
    1181 => "1110011110", 1182 => "0000000000", 1183 => "0001100001", 1184 => "0010110101", 
    1185 => "0011101100", 1186 => "0100000000", 1187 => "0011101100", 1188 => "0010110101", 
    1189 => "0001100001", 1190 => "0000000000", 1191 => "1110011110", 1192 => "1101001010", 
    1193 => "1100010011", 1194 => "1100000000", 1195 => "1100010011", 1196 => "1101001010", 
    1197 => "1110011110", 1198 => "0000000000", 1199 => "0001100001", 1200 => "0010110101", 
    1201 => "0011101100", 1202 to 1208=> "0000000000", 1209 => "0100000000", 1210 => "0011111011", 
    1211 => "0011101100", 1212 => "0011010100", 1213 => "0010110101", 1214 => "0010001110", 
    1215 => "0001100001", 1216 => "0000110001", 1217 => "0000000000", 1218 => "1111001110", 
    1219 => "1110011110", 1220 => "1101110001", 1221 => "1101001010", 1222 => "1100101011", 
    1223 => "1100010011", 1224 => "1100000100", 1225 => "1100000000", 1226 => "1100000100", 
    1227 => "1100010011", 1228 => "1100101011", 1229 => "1101001010", 1230 => "1101110001", 
    1231 => "1110011110", 1232 => "1111001110", 1233 => "0000000000", 1234 => "0000110001", 
    1235 => "0001100001", 1236 => "0010001110", 1237 => "0010110101", 1238 => "0011010100", 
    1239 => "0011101100", 1240 => "0011111011", 1241 to 1520=> "0000000000" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity top_fft_fft_coeff_M_real_V is
    generic (
        DataWidth : INTEGER := 10;
        AddressRange : INTEGER := 1521;
        AddressWidth : INTEGER := 11);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of top_fft_fft_coeff_M_real_V is
    component top_fft_fft_coeff_M_real_V_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    top_fft_fft_coeff_M_real_V_rom_U :  component top_fft_fft_coeff_M_real_V_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;

