

|  | Critical Path Delay(ns) | Maximum Frequency (MHz) | LUT usage | Gates (LUT \* 6\) |
| :---- | ----- | ----- | ----- | ----- |
| RCA 8-bit Width | 7.108 | 140.6865504 | 8 | 48 |
| RCA 16-bit Width | 8.825 | 113.3144476 | 24 | 144 |
| RCA 32-bit Width | 12.286 | 81.39345597 | 56 | 336 |
| RCA 64-bit Width | 19.812 | 50.47445992 | 112 | 672 |
|  |  |  |  |  |
| CLA 8-bit Width | 7.1 | 140.8450704 | 8 | 48 |
| CLA 16-bit Width | 7.65 | 130.7189542 | 29 | 174 |
| CLA 32-bit Width | 9.737 | 102.7010373 | 71 | 426 |
| CLA 64-bit Width | 16.205 | 61.70934897 | 143 | 858 |
|  |  |  |  |  |
| Prefix-Adder 8-bit Width | 7.132 | 140.2131239 | 13 | 78 |
| Prefix-Adder 16-bit Width | 8.496 | 117.7024482 | 29 | 174 |
| Prefix-Adder 32-bit Width | 9.86 | 101.4198783 | 138 | 828 |
| Prefix-Adder 64-bit Width | 11.3 | 88.49557522 | 363 | 2178 |

Summary: As the width increases the RCA slows down the most as it increases but as you can see it uses the least amount of total gates. The CLA is best at the 16-32 bit width because it uses blocks which balance between delay and gate usage. The prefix on the other hand uses the most gates because it's computing everything in parallel, this leads to consistent times with it slowly increasing, but this also leads to it being the most expensive of the 3 but it may be worth it when getting to the higher bit ranges. 
