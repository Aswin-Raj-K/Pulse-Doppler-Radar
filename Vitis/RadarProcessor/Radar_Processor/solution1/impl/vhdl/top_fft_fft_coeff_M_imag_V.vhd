-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity top_fft_fft_coeff_M_imag_V_rom is 
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


architecture rtl of top_fft_fft_coeff_M_imag_V_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 39=> "0000000000", 40 => "1111001110", 41 => "1110011110", 42 => "1101110001", 
    43 => "1101001010", 44 => "1100101011", 45 => "1100010011", 46 => "1100000100", 
    47 => "1100000000", 48 => "1100000100", 49 => "1100010011", 50 => "1100101011", 
    51 => "1101001010", 52 => "1101110001", 53 => "1110011110", 54 => "1111001110", 
    55 => "0000000000", 56 => "0000110001", 57 => "0001100001", 58 => "0010001110", 
    59 => "0010110101", 60 => "0011010100", 61 => "0011101100", 62 => "0011111011", 
    63 => "0100000000", 64 => "0011111011", 65 => "0011101100", 66 => "0011010100", 
    67 => "0010110101", 68 => "0010001110", 69 => "0001100001", 70 => "0000110001", 
    71 to 78=> "0000000000", 79 => "1110011110", 80 => "1101001010", 81 => "1100010011", 
    82 => "1100000000", 83 => "1100010011", 84 => "1101001010", 85 => "1110011110", 
    86 => "0000000000", 87 => "0001100001", 88 => "0010110101", 89 => "0011101100", 
    90 => "0100000000", 91 => "0011101100", 92 => "0010110101", 93 => "0001100001", 
    94 => "0000000000", 95 => "1110011110", 96 => "1101001010", 97 => "1100010011", 
    98 => "1100000000", 99 => "1100010011", 100 => "1101001010", 101 => "1110011110", 
    102 => "0000000000", 103 => "0001100001", 104 => "0010110101", 105 => "0011101100", 
    106 => "0100000000", 107 => "0011101100", 108 => "0010110101", 109 => "0001100001", 
    110 to 117=> "0000000000", 118 => "1101110001", 119 => "1100010011", 120 => "1100000100", 
    121 => "1101001010", 122 => "1111001110", 123 => "0001100001", 124 => "0011010100", 
    125 => "0100000000", 126 => "0011010100", 127 => "0001100001", 128 => "1111001110", 
    129 => "1101001010", 130 => "1100000100", 131 => "1100010011", 132 => "1101110001", 
    133 => "0000000000", 134 => "0010001110", 135 => "0011101100", 136 => "0011111011", 
    137 => "0010110101", 138 => "0000110001", 139 => "1110011110", 140 => "1100101011", 
    141 => "1100000000", 142 => "1100101011", 143 => "1110011110", 144 => "0000110001", 
    145 => "0010110101", 146 => "0011111011", 147 => "0011101100", 148 => "0010001110", 
    149 to 156=> "0000000000", 157 => "1101001010", 158 => "1100000000", 159 => "1101001010", 
    160 => "0000000000", 161 => "0010110101", 162 => "0100000000", 163 => "0010110101", 
    164 => "0000000000", 165 => "1101001010", 166 => "1100000000", 167 => "1101001010", 
    168 => "0000000000", 169 => "0010110101", 170 => "0100000000", 171 => "0010110101", 
    172 => "0000000000", 173 => "1101001010", 174 => "1100000000", 175 => "1101001010", 
    176 => "0000000000", 177 => "0010110101", 178 => "0100000000", 179 => "0010110101", 
    180 => "0000000000", 181 => "1101001010", 182 => "1100000000", 183 => "1101001010", 
    184 => "0000000000", 185 => "0010110101", 186 => "0100000000", 187 => "0010110101", 
    188 to 195=> "0000000000", 196 => "1100101011", 197 => "1100010011", 198 => "1111001110", 
    199 => "0010110101", 200 => "0011111011", 201 => "0001100001", 202 => "1101110001", 
    203 => "1100000000", 204 => "1101110001", 205 => "0001100001", 206 => "0011111011", 
    207 => "0010110101", 208 => "1111001110", 209 => "1100010011", 210 => "1100101011", 
    211 => "0000000000", 212 => "0011010100", 213 => "0011101100", 214 => "0000110001", 
    215 => "1101001010", 216 => "1100000100", 217 => "1110011110", 218 => "0010001110", 
    219 => "0100000000", 220 => "0010001110", 221 => "1110011110", 222 => "1100000100", 
    223 => "1101001010", 224 => "0000110001", 225 => "0011101100", 226 => "0011010100", 
    227 to 234=> "0000000000", 235 => "1100010011", 236 => "1101001010", 237 => "0001100001", 
    238 => "0100000000", 239 => "0001100001", 240 => "1101001010", 241 => "1100010011", 
    242 => "0000000000", 243 => "0011101100", 244 => "0010110101", 245 => "1110011110", 
    246 => "1100000000", 247 => "1110011110", 248 => "0010110101", 249 => "0011101100", 
    250 => "0000000000", 251 => "1100010011", 252 => "1101001010", 253 => "0001100001", 
    254 => "0100000000", 255 => "0001100001", 256 => "1101001010", 257 => "1100010011", 
    258 => "0000000000", 259 => "0011101100", 260 => "0010110101", 261 => "1110011110", 
    262 => "1100000000", 263 => "1110011110", 264 => "0010110101", 265 => "0011101100", 
    266 to 273=> "0000000000", 274 => "1100000100", 275 => "1110011110", 276 => "0011010100", 
    277 => "0010110101", 278 => "1101110001", 279 => "1100010011", 280 => "0000110001", 
    281 => "0100000000", 282 => "0000110001", 283 => "1100010011", 284 => "1101110001", 
    285 => "0010110101", 286 => "0011010100", 287 => "1110011110", 288 => "1100000100", 
    289 => "0000000000", 290 => "0011111011", 291 => "0001100001", 292 => "1100101011", 
    293 => "1101001010", 294 => "0010001110", 295 => "0011101100", 296 => "1111001110", 
    297 => "1100000000", 298 => "1111001110", 299 => "0011101100", 300 => "0010001110", 
    301 => "1101001010", 302 => "1100101011", 303 => "0001100001", 304 => "0011111011", 
    305 to 312=> "0000000000", 313 => "1100000000", 314 => "0000000000", 315 => "0100000000", 
    316 => "0000000000", 317 => "1100000000", 318 => "0000000000", 319 => "0100000000", 
    320 => "0000000000", 321 => "1100000000", 322 => "0000000000", 323 => "0100000000", 
    324 => "0000000000", 325 => "1100000000", 326 => "0000000000", 327 => "0100000000", 
    328 => "0000000000", 329 => "1100000000", 330 => "0000000000", 331 => "0100000000", 
    332 => "0000000000", 333 => "1100000000", 334 => "0000000000", 335 => "0100000000", 
    336 => "0000000000", 337 => "1100000000", 338 => "0000000000", 339 => "0100000000", 
    340 => "0000000000", 341 => "1100000000", 342 => "0000000000", 343 => "0100000000", 
    344 to 351=> "0000000000", 352 => "1100000100", 353 => "0001100001", 354 => "0011010100", 
    355 => "1101001010", 356 => "1101110001", 357 => "0011101100", 358 => "0000110001", 
    359 => "1100000000", 360 => "0000110001", 361 => "0011101100", 362 => "1101110001", 
    363 => "1101001010", 364 => "0011010100", 365 => "0001100001", 366 => "1100000100", 
    367 => "0000000000", 368 => "0011111011", 369 => "1110011110", 370 => "1100101011", 
    371 => "0010110101", 372 => "0010001110", 373 => "1100010011", 374 => "1111001110", 
    375 => "0100000000", 376 => "1111001110", 377 => "1100010011", 378 => "0010001110", 
    379 => "0010110101", 380 => "1100101011", 381 => "1110011110", 382 => "0011111011", 
    383 to 390=> "0000000000", 391 => "1100010011", 392 => "0010110101", 393 => "0001100001", 
    394 => "1100000000", 395 => "0001100001", 396 => "0010110101", 397 => "1100010011", 
    398 => "0000000000", 399 => "0011101100", 400 => "1101001010", 401 => "1110011110", 
    402 => "0100000000", 403 => "1110011110", 404 => "1101001010", 405 => "0011101100", 
    406 => "0000000000", 407 => "1100010011", 408 => "0010110101", 409 => "0001100001", 
    410 => "1100000000", 411 => "0001100001", 412 => "0010110101", 413 => "1100010011", 
    414 => "0000000000", 415 => "0011101100", 416 => "1101001010", 417 => "1110011110", 
    418 => "0100000000", 419 => "1110011110", 420 => "1101001010", 421 => "0011101100", 
    422 to 429=> "0000000000", 430 => "1100101011", 431 => "0011101100", 432 => "1111001110", 
    433 => "1101001010", 434 => "0011111011", 435 => "1110011110", 436 => "1101110001", 
    437 => "0100000000", 438 => "1101110001", 439 => "1110011110", 440 => "0011111011", 
    441 => "1101001010", 442 => "1111001110", 443 => "0011101100", 444 => "1100101011", 
    445 => "0000000000", 446 => "0011010100", 447 => "1100010011", 448 => "0000110001", 
    449 => "0010110101", 450 => "1100000100", 451 => "0001100001", 452 => "0010001110", 
    453 => "1100000000", 454 => "0010001110", 455 => "0001100001", 456 => "1100000100", 
    457 => "0010110101", 458 => "0000110001", 459 => "1100010011", 460 => "0011010100", 
    461 to 468=> "0000000000", 469 => "1101001010", 470 => "0100000000", 471 => "1101001010", 
    472 => "0000000000", 473 => "0010110101", 474 => "1100000000", 475 => "0010110101", 
    476 => "0000000000", 477 => "1101001010", 478 => "0100000000", 479 => "1101001010", 
    480 => "0000000000", 481 => "0010110101", 482 => "1100000000", 483 => "0010110101", 
    484 => "0000000000", 485 => "1101001010", 486 => "0100000000", 487 => "1101001010", 
    488 => "0000000000", 489 => "0010110101", 490 => "1100000000", 491 => "0010110101", 
    492 => "0000000000", 493 => "1101001010", 494 => "0100000000", 495 => "1101001010", 
    496 => "0000000000", 497 => "0010110101", 498 => "1100000000", 499 => "0010110101", 
    500 to 507=> "0000000000", 508 => "1101110001", 509 => "0011101100", 510 => "1100000100", 
    511 => "0010110101", 512 => "1111001110", 513 => "1110011110", 514 => "0011010100", 
    515 => "1100000000", 516 => "0011010100", 517 => "1110011110", 518 => "1111001110", 
    519 => "0010110101", 520 => "1100000100", 521 => "0011101100", 522 => "1101110001", 
    523 => "0000000000", 524 => "0010001110", 525 => "1100010011", 526 => "0011111011", 
    527 => "1101001010", 528 => "0000110001", 529 => "0001100001", 530 => "1100101011", 
    531 => "0100000000", 532 => "1100101011", 533 => "0001100001", 534 => "0000110001", 
    535 => "1101001010", 536 => "0011111011", 537 => "1100010011", 538 => "0010001110", 
    539 to 546=> "0000000000", 547 => "1110011110", 548 => "0010110101", 549 => "1100010011", 
    550 => "0100000000", 551 => "1100010011", 552 => "0010110101", 553 => "1110011110", 
    554 => "0000000000", 555 => "0001100001", 556 => "1101001010", 557 => "0011101100", 
    558 => "1100000000", 559 => "0011101100", 560 => "1101001010", 561 => "0001100001", 
    562 => "0000000000", 563 => "1110011110", 564 => "0010110101", 565 => "1100010011", 
    566 => "0100000000", 567 => "1100010011", 568 => "0010110101", 569 => "1110011110", 
    570 => "0000000000", 571 => "0001100001", 572 => "1101001010", 573 => "0011101100", 
    574 => "1100000000", 575 => "0011101100", 576 => "1101001010", 577 => "0001100001", 
    578 to 585=> "0000000000", 586 => "1111001110", 587 => "0001100001", 588 => "1101110001", 
    589 => "0010110101", 590 => "1100101011", 591 => "0011101100", 592 => "1100000100", 
    593 => "0100000000", 594 => "1100000100", 595 => "0011101100", 596 => "1100101011", 
    597 => "0010110101", 598 => "1101110001", 599 => "0001100001", 600 => "1111001110", 
    601 => "0000000000", 602 => "0000110001", 603 => "1110011110", 604 => "0010001110", 
    605 => "1101001010", 606 => "0011010100", 607 => "1100010011", 608 => "0011111011", 
    609 => "1100000000", 610 => "0011111011", 611 => "1100010011", 612 => "0011010100", 
    613 => "1101001010", 614 => "0010001110", 615 => "1110011110", 616 => "0000110001", 
    617 to 663=> "0000000000", 664 => "0000110001", 665 => "1110011110", 666 => "0010001110", 
    667 => "1101001010", 668 => "0011010100", 669 => "1100010011", 670 => "0011111011", 
    671 => "1100000000", 672 => "0011111011", 673 => "1100010011", 674 => "0011010100", 
    675 => "1101001010", 676 => "0010001110", 677 => "1110011110", 678 => "0000110001", 
    679 => "0000000000", 680 => "1111001110", 681 => "0001100001", 682 => "1101110001", 
    683 => "0010110101", 684 => "1100101011", 685 => "0011101100", 686 => "1100000100", 
    687 => "0100000000", 688 => "1100000100", 689 => "0011101100", 690 => "1100101011", 
    691 => "0010110101", 692 => "1101110001", 693 => "0001100001", 694 => "1111001110", 
    695 to 702=> "0000000000", 703 => "0001100001", 704 => "1101001010", 705 => "0011101100", 
    706 => "1100000000", 707 => "0011101100", 708 => "1101001010", 709 => "0001100001", 
    710 => "0000000000", 711 => "1110011110", 712 => "0010110101", 713 => "1100010011", 
    714 => "0100000000", 715 => "1100010011", 716 => "0010110101", 717 => "1110011110", 
    718 => "0000000000", 719 => "0001100001", 720 => "1101001010", 721 => "0011101100", 
    722 => "1100000000", 723 => "0011101100", 724 => "1101001010", 725 => "0001100001", 
    726 => "0000000000", 727 => "1110011110", 728 => "0010110101", 729 => "1100010011", 
    730 => "0100000000", 731 => "1100010011", 732 => "0010110101", 733 => "1110011110", 
    734 to 741=> "0000000000", 742 => "0010001110", 743 => "1100010011", 744 => "0011111011", 
    745 => "1101001010", 746 => "0000110001", 747 => "0001100001", 748 => "1100101011", 
    749 => "0100000000", 750 => "1100101011", 751 => "0001100001", 752 => "0000110001", 
    753 => "1101001010", 754 => "0011111011", 755 => "1100010011", 756 => "0010001110", 
    757 => "0000000000", 758 => "1101110001", 759 => "0011101100", 760 => "1100000100", 
    761 => "0010110101", 762 => "1111001110", 763 => "1110011110", 764 => "0011010100", 
    765 => "1100000000", 766 => "0011010100", 767 => "1110011110", 768 => "1111001110", 
    769 => "0010110101", 770 => "1100000100", 771 => "0011101100", 772 => "1101110001", 
    773 to 780=> "0000000000", 781 => "0010110101", 782 => "1100000000", 783 => "0010110101", 
    784 => "0000000000", 785 => "1101001010", 786 => "0100000000", 787 => "1101001010", 
    788 => "0000000000", 789 => "0010110101", 790 => "1100000000", 791 => "0010110101", 
    792 => "0000000000", 793 => "1101001010", 794 => "0100000000", 795 => "1101001010", 
    796 => "0000000000", 797 => "0010110101", 798 => "1100000000", 799 => "0010110101", 
    800 => "0000000000", 801 => "1101001010", 802 => "0100000000", 803 => "1101001010", 
    804 => "0000000000", 805 => "0010110101", 806 => "1100000000", 807 => "0010110101", 
    808 => "0000000000", 809 => "1101001010", 810 => "0100000000", 811 => "1101001010", 
    812 to 819=> "0000000000", 820 => "0011010100", 821 => "1100010011", 822 => "0000110001", 
    823 => "0010110101", 824 => "1100000100", 825 => "0001100001", 826 => "0010001110", 
    827 => "1100000000", 828 => "0010001110", 829 => "0001100001", 830 => "1100000100", 
    831 => "0010110101", 832 => "0000110001", 833 => "1100010011", 834 => "0011010100", 
    835 => "0000000000", 836 => "1100101011", 837 => "0011101100", 838 => "1111001110", 
    839 => "1101001010", 840 => "0011111011", 841 => "1110011110", 842 => "1101110001", 
    843 => "0100000000", 844 => "1101110001", 845 => "1110011110", 846 => "0011111011", 
    847 => "1101001010", 848 => "1111001110", 849 => "0011101100", 850 => "1100101011", 
    851 to 858=> "0000000000", 859 => "0011101100", 860 => "1101001010", 861 => "1110011110", 
    862 => "0100000000", 863 => "1110011110", 864 => "1101001010", 865 => "0011101100", 
    866 => "0000000000", 867 => "1100010011", 868 => "0010110101", 869 => "0001100001", 
    870 => "1100000000", 871 => "0001100001", 872 => "0010110101", 873 => "1100010011", 
    874 => "0000000000", 875 => "0011101100", 876 => "1101001010", 877 => "1110011110", 
    878 => "0100000000", 879 => "1110011110", 880 => "1101001010", 881 => "0011101100", 
    882 => "0000000000", 883 => "1100010011", 884 => "0010110101", 885 => "0001100001", 
    886 => "1100000000", 887 => "0001100001", 888 => "0010110101", 889 => "1100010011", 
    890 to 897=> "0000000000", 898 => "0011111011", 899 => "1110011110", 900 => "1100101011", 
    901 => "0010110101", 902 => "0010001110", 903 => "1100010011", 904 => "1111001110", 
    905 => "0100000000", 906 => "1111001110", 907 => "1100010011", 908 => "0010001110", 
    909 => "0010110101", 910 => "1100101011", 911 => "1110011110", 912 => "0011111011", 
    913 => "0000000000", 914 => "1100000100", 915 => "0001100001", 916 => "0011010100", 
    917 => "1101001010", 918 => "1101110001", 919 => "0011101100", 920 => "0000110001", 
    921 => "1100000000", 922 => "0000110001", 923 => "0011101100", 924 => "1101110001", 
    925 => "1101001010", 926 => "0011010100", 927 => "0001100001", 928 => "1100000100", 
    929 to 936=> "0000000000", 937 => "0100000000", 938 => "0000000000", 939 => "1100000000", 
    940 => "0000000000", 941 => "0100000000", 942 => "0000000000", 943 => "1100000000", 
    944 => "0000000000", 945 => "0100000000", 946 => "0000000000", 947 => "1100000000", 
    948 => "0000000000", 949 => "0100000000", 950 => "0000000000", 951 => "1100000000", 
    952 => "0000000000", 953 => "0100000000", 954 => "0000000000", 955 => "1100000000", 
    956 => "0000000000", 957 => "0100000000", 958 => "0000000000", 959 => "1100000000", 
    960 => "0000000000", 961 => "0100000000", 962 => "0000000000", 963 => "1100000000", 
    964 => "0000000000", 965 => "0100000000", 966 => "0000000000", 967 => "1100000000", 
    968 to 975=> "0000000000", 976 => "0011111011", 977 => "0001100001", 978 => "1100101011", 
    979 => "1101001010", 980 => "0010001110", 981 => "0011101100", 982 => "1111001110", 
    983 => "1100000000", 984 => "1111001110", 985 => "0011101100", 986 => "0010001110", 
    987 => "1101001010", 988 => "1100101011", 989 => "0001100001", 990 => "0011111011", 
    991 => "0000000000", 992 => "1100000100", 993 => "1110011110", 994 => "0011010100", 
    995 => "0010110101", 996 => "1101110001", 997 => "1100010011", 998 => "0000110001", 
    999 => "0100000000", 1000 => "0000110001", 1001 => "1100010011", 1002 => "1101110001", 
    1003 => "0010110101", 1004 => "0011010100", 1005 => "1110011110", 1006 => "1100000100", 
    1007 to 1014=> "0000000000", 1015 => "0011101100", 1016 => "0010110101", 1017 => "1110011110", 
    1018 => "1100000000", 1019 => "1110011110", 1020 => "0010110101", 1021 => "0011101100", 
    1022 => "0000000000", 1023 => "1100010011", 1024 => "1101001010", 1025 => "0001100001", 
    1026 => "0100000000", 1027 => "0001100001", 1028 => "1101001010", 1029 => "1100010011", 
    1030 => "0000000000", 1031 => "0011101100", 1032 => "0010110101", 1033 => "1110011110", 
    1034 => "1100000000", 1035 => "1110011110", 1036 => "0010110101", 1037 => "0011101100", 
    1038 => "0000000000", 1039 => "1100010011", 1040 => "1101001010", 1041 => "0001100001", 
    1042 => "0100000000", 1043 => "0001100001", 1044 => "1101001010", 1045 => "1100010011", 
    1046 to 1053=> "0000000000", 1054 => "0011010100", 1055 => "0011101100", 1056 => "0000110001", 
    1057 => "1101001010", 1058 => "1100000100", 1059 => "1110011110", 1060 => "0010001110", 
    1061 => "0100000000", 1062 => "0010001110", 1063 => "1110011110", 1064 => "1100000100", 
    1065 => "1101001010", 1066 => "0000110001", 1067 => "0011101100", 1068 => "0011010100", 
    1069 => "0000000000", 1070 => "1100101011", 1071 => "1100010011", 1072 => "1111001110", 
    1073 => "0010110101", 1074 => "0011111011", 1075 => "0001100001", 1076 => "1101110001", 
    1077 => "1100000000", 1078 => "1101110001", 1079 => "0001100001", 1080 => "0011111011", 
    1081 => "0010110101", 1082 => "1111001110", 1083 => "1100010011", 1084 => "1100101011", 
    1085 to 1092=> "0000000000", 1093 => "0010110101", 1094 => "0100000000", 1095 => "0010110101", 
    1096 => "0000000000", 1097 => "1101001010", 1098 => "1100000000", 1099 => "1101001010", 
    1100 => "0000000000", 1101 => "0010110101", 1102 => "0100000000", 1103 => "0010110101", 
    1104 => "0000000000", 1105 => "1101001010", 1106 => "1100000000", 1107 => "1101001010", 
    1108 => "0000000000", 1109 => "0010110101", 1110 => "0100000000", 1111 => "0010110101", 
    1112 => "0000000000", 1113 => "1101001010", 1114 => "1100000000", 1115 => "1101001010", 
    1116 => "0000000000", 1117 => "0010110101", 1118 => "0100000000", 1119 => "0010110101", 
    1120 => "0000000000", 1121 => "1101001010", 1122 => "1100000000", 1123 => "1101001010", 
    1124 to 1131=> "0000000000", 1132 => "0010001110", 1133 => "0011101100", 1134 => "0011111011", 
    1135 => "0010110101", 1136 => "0000110001", 1137 => "1110011110", 1138 => "1100101011", 
    1139 => "1100000000", 1140 => "1100101011", 1141 => "1110011110", 1142 => "0000110001", 
    1143 => "0010110101", 1144 => "0011111011", 1145 => "0011101100", 1146 => "0010001110", 
    1147 => "0000000000", 1148 => "1101110001", 1149 => "1100010011", 1150 => "1100000100", 
    1151 => "1101001010", 1152 => "1111001110", 1153 => "0001100001", 1154 => "0011010100", 
    1155 => "0100000000", 1156 => "0011010100", 1157 => "0001100001", 1158 => "1111001110", 
    1159 => "1101001010", 1160 => "1100000100", 1161 => "1100010011", 1162 => "1101110001", 
    1163 to 1170=> "0000000000", 1171 => "0001100001", 1172 => "0010110101", 1173 => "0011101100", 
    1174 => "0100000000", 1175 => "0011101100", 1176 => "0010110101", 1177 => "0001100001", 
    1178 => "0000000000", 1179 => "1110011110", 1180 => "1101001010", 1181 => "1100010011", 
    1182 => "1100000000", 1183 => "1100010011", 1184 => "1101001010", 1185 => "1110011110", 
    1186 => "0000000000", 1187 => "0001100001", 1188 => "0010110101", 1189 => "0011101100", 
    1190 => "0100000000", 1191 => "0011101100", 1192 => "0010110101", 1193 => "0001100001", 
    1194 => "0000000000", 1195 => "1110011110", 1196 => "1101001010", 1197 => "1100010011", 
    1198 => "1100000000", 1199 => "1100010011", 1200 => "1101001010", 1201 => "1110011110", 
    1202 to 1209=> "0000000000", 1210 => "0000110001", 1211 => "0001100001", 1212 => "0010001110", 
    1213 => "0010110101", 1214 => "0011010100", 1215 => "0011101100", 1216 => "0011111011", 
    1217 => "0100000000", 1218 => "0011111011", 1219 => "0011101100", 1220 => "0011010100", 
    1221 => "0010110101", 1222 => "0010001110", 1223 => "0001100001", 1224 => "0000110001", 
    1225 => "0000000000", 1226 => "1111001110", 1227 => "1110011110", 1228 => "1101110001", 
    1229 => "1101001010", 1230 => "1100101011", 1231 => "1100010011", 1232 => "1100000100", 
    1233 => "1100000000", 1234 => "1100000100", 1235 => "1100010011", 1236 => "1100101011", 
    1237 => "1101001010", 1238 => "1101110001", 1239 => "1110011110", 1240 => "1111001110", 
    1241 to 1520=> "0000000000" );


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

entity top_fft_fft_coeff_M_imag_V is
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

architecture arch of top_fft_fft_coeff_M_imag_V is
    component top_fft_fft_coeff_M_imag_V_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    top_fft_fft_coeff_M_imag_V_rom_U :  component top_fft_fft_coeff_M_imag_V_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;

