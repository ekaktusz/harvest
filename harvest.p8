pico-8 cartridge // http://www.pico-8.com
version 39
__lua__
#include include/main.lua
#include include/log.lua
#include include/bear.lua
#include include/food.lua
#include include/map.lua
#include include/collision.lua
#include include/particles.lua
#include include/animation.lua
#include include/game_state.lua
#include include/menu_state.lua
#include include/thirdparty.lua
#include include/space_level.lua
#include include/forest_level.lua
#include include/trees.lua
#include include/textbox.lua
#include include/cave.lua
#include include/terrain.lua
#include include/mountain.lua
#include include/stone.lua
#include include/water.lua
#include include/constellation.lua

__gfx__
ee00eeeeeeee00eeeeeeeeeeeeeeeeeeeeeee444444eeeeeeeeee444444eeeeeeeeee444444eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee33333333eeeeeeee
e0440e0000e0440eee00eeeeeeee00ee707e44fffff44eeeeeee44fffff44eeeeeee44fffff44eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee33333333eeeeeeee
e04f00444400f40ee0440e0000e0440ea0ae4a44444a44eeeeee4a44444a44eeeeee4f44444f44eeeeeeeee77777eeeeeeeeeeeaaaaaeeee33333333eeeeeeee
ee044444444440eee04f00444400f40eeee44aa4444aa4eeee707aa4444aa4eeeee44ff4444ff4eeeeeee77666deeeeeeeeeeaa8889eeeee33333333eeeeeeee
eee0407447040eeeee044444444440eeee4444aaaaaa94eeeea0a4aaaaaa94eeee4444fffffff4eeeee666ddddddeee7eee888999999eeea33333333eeeeeeee
eee0400440040eeeeee0407447040eeeee4f7444aa944707ee4f7444aa94444eee4f74444444444eeedddd1d1d1d1e7dee99992929292ea933333333eeeeeeee
eee0449559440eeeee044004400440eee4477ff99a9ffa0ae4477ff99a9fff4ee4477fffffffff4eed70dd6d6d6d77d6e97099898989aa9833333333eeeeeeee
eee0449999440eeeee044495594440eee4f7f4a9fa9fff4ee4f7f4a9fa97074ee4f7f4ffffffff4edd00d5d1d1d1dd6d990095929292998933333333eeeeeeee
eeee09900990eeeeee044499994440eee447ffa9faff4ff4e447ffa9fafa0af4e447fffffffffff4ddddd5d6d6d6d6d59999959898989895eeeeeeeeeeeeeeee
eeeee000000eeeeeeee0499009940eeeee447faaff444ff4ee447faaff444ff4ee447fffff444ff4e1dd15dd1d1d1d56e299a59929292958eeeeeeeeeeeeeeee
eeee04444440eeeeeeee00000000eeeee44444a9ffffff4ee44444a9ffffff4ee4444444ffffff4eee115d6d6d6d6115ee22598989898225eeeeeeeeeeeeeeee
eee0444444440eeeeee0444444440eeee47fffa44444444ee47fffa44444444ee47ffff44444444eeeee11d1d1d1d6e1eeee2292929298e2eeeeeeeeeeeeeeee
eee0440440440eeeeee0440440440eeee47ffffffffffff4e47ffffffffffff4e47ffffffffffff4eeeeee11111eddeeeeeeee22222e99eeeeeeeeeeeeeeeeee
ee0204099040f0eeee0204099040f0eee447f44f707ffff4e447f44ffffffff4e447f44ffffffff4eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e0240f0990202f0ee0240f0990202f0eee447fffa0affff470747ffffffffff4ee447ffffffffff4eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
e00000000000000ee00000000000000eeee444444444444ea0a444444444444eeee444444444444eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeee00eeee00eeeeeeebbbeeeeeeeeeeeeebbbeeeeeeeeeeebbbbbbeeeeeebeeeeeeeeee000eeeeeeeeeeeeeeeeeeeeee2ffffff44eee
eeeeeee00eeee00eeeeeee0440000440eeeee383bbeeeeeeeeeee333bbeeeeeeeeebbb3bbbbbbeee3b8888eeee02220eeeeeeeeeeeeeeeeeeee2ff1111fff4ee
eeeeee0440000440eeeeee04f4444f00eeeeeb338bebbeeeeeeeeb333bebbeeeeeb7b3bb3bb3bbeeb288878ee0122720eeeeeeeeeeeeeeeeee2ff1fffff1f44e
eeeeee04f4444f00eeeeeee04444440eeeeee3b333bb8beeeeeee3b333bbbbeebb77b3b33bb33bee28888878e0122220eeeee111ddeeeeeeee2ff1f111f1ff4e
eeeeeee04444440eeeeeeee04074070eee3b83b3838bbbeeee3b33b3333bbbeeb77bb3b33b3b3bbe28888878e0112220eeee3333666deeeeee2ff1fffff1ff4e
eeeeeee04074070eeee0000440040040e13b3333bb3bbeeee13b3333bb3bbeeeb73b33b33b3b33be28888888ee01110eeee13bd3b666eeeeee22ff1f111ff44e
eee0000440040040e004444444444950e12338354b3beeeee11333354b3beeeeb73b33b3bb3b33be22888882eee000eeeee13bdd3b66deeeee222fffffff444e
e0044444444449500444444444444990ee133b354333bbeeee133b354333bbeeb73b3bb3b33b33bee222222eeeeeeeeeeee13bddd3d66eeeee2422224444044e
04444444444449900444444440444400ee183b353383bbbeee133b353333bbbeb73b3b3bb33b33beeb1111eeeee4eeeeee1133bddddd66eeee2404044440444e
0444444440444400044444444400000ee3333354bb33b8bee3333354bb33bbbeb73b3b3b33bb33beb3bd771eeee5feeeee1d33bddddd66eeee24b3404440444e
044444444400000e02444444444440eeebb3545483343bbbebb3545433343bbbbb738888888888831bdddd71ee5ffeeee11d333dd1dd666eee24b3440440444e
0240444444440eee02404444904440ee133b35443344338b133b3544334433bbeb737808808808831d1ddd71ee5ff7eee1dddd3bd1dd666ee24b334400b3044e
e0404444904f00ee02404999904f020e1233b35434bb33bb1133b35434bb33bbeeb337888808883311d1dd71e54fff7ee1dddddd13d6666ee24b3344bb33334e
002009999044f0ee02400000004f020e1132b354433bb3be1133b354433bb3beeeee33780888833e1d1d1dd1e54fff7ee11ddddd133366de22b3322b33322334
020400000004f0ee0244020ee04f0200e11b1254183383eee11b13541333b3eeeeeee337780833eee1d1d11ee544ff7ee11dddd3333b6dee4333ee2233ee2224
020240eeee002f0ee0240220ee04f020eee11154111bbeeeeee11154111bbeeeeeeeee3333333eeeee1111eeee544feeee11111333bb1eeeeeeeeee23eeeee24
eeeeeeeeeeee0000000eeeeeeeee00eeeeeeeeeeeeeeeeeeeeeeeeeeeeee00eeeeeeeeeeeeeeeeeeee0000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeee0004444440000eeeee0040eeeeeeeeeeeeeeeeeee0000eeeee0040eeeeeeeeeeeeeeeeee00440eeeeee00eeeeeeeeeeeeeeeeeeeeeeeeeeeeee00ee
eeeeeee0044444444004400000004f0eeeeeeeeeeeeeeeeee004400000004f0eeeeeeeeeeeeeeeeee044f0000000040eeeeeeeeeeeeeeeeeee0000eeeee0040e
eeeeee0444444444204f004444f0000eeeeeeeeeeeeeeeeee04f00444ff0000eeeeeeeeeeeeeeeeee04f00444ff04f0eeeeeeeeeeeeeeeeee004400000004f0e
ee0000444444444420000444444ff0eeeeeeeeeeeeeeeeeee0000444444ff0eeeeeeeeeeeeeeeeeee00004444440000eeeeeeeeeeeeeeeeee04f00444ff0000e
e0040444444444442044444444444f0eeeeeeeeeeeeeeeeee004444444444f0eeeeeeeeeeeeeeeeee00444444444ff0eeeeeeeeeeeeeeeeee0000444444ff0ee
e04044444444444200444444444444f0eeeeeeeeeeeeeeeee0444444444444f0eeeeeeeeeeeee00000444444444444f0eeeeeeeeeeeeeeeee044444444444f0e
ee0444444444444204444074444074f0eeeeeeeeeeee000000444074444074f0eeeeeeeeee00022200444074444074f0eeeeeeeeeeeeeeee00444444444444f0
ee0444444444444204444004444004f0eeeeeee00000222204444004444004f0eeeeeee00022244404444004444004f0eeeeeeeeeeee000004444074444704f0
e044444444444444044444444444440eeeeee0022222244404444444444444f0eeeee0022244444404444444444444f0eeeeeee00000422204444004444004f0
e044444444444444444444400000440eeeee00224444444444444440000044f0eeee00224444444444444440000044f0eeeee0044444444404444444444444f0
e044444444444444444444405550440eeee00244444444444444444055504440eee00244444444444444444055504440eeee00444444444444444440000044f0
0444444444444444444444490009440eeee0244444444444444444490009440eeee0244444444444444444490009440eeee0044444444444444444405550440e
0444444444444444444444499099400ee000444444444444444444499099400e0000444444444444444444499099400eeee0444444444444444444490009440e
044444444444444444444449000902000404444444444444444444490009000e0404444444444444444444490009000ee000444444444444444444499099400e
044444444444444444444444444442f00404444444444444444444444444020e0404444444444444444444444444020e0404444444444444444444490009000e
044444444444444444444444444444f00004444444444444444444444444200ee004444444444444444444444444200e0404444444440044444444444440020e
04444444444444444444444444444470e04444444444444444444444444420eee04444444444444444444444444420ee00044444444ff004444444444444420e
044444444444444444444444444444f0e044444444444444044444404444400ee04444444444444404444440444440eee044444444444f00444444444444420e
044404444444444444444444444444f0e044444444444444044444f04440440ee044444444444444044444f0444040eee0444444444444f0444444444444440e
e0402444444444440244444444444f0ee044444444444444044444f04440440ee044444444444444044444f0444040eee0444444444444f0044444444444f00e
e0024444444444440240044444444f0ee024444444444444024444f04400440ee024444444444444024444f0440040eee04444444444444f004440444444f0ee
e00244f0444444400240444444444f00e024444f0444444402444f00900440eee024444f0444444402444f0090040eeee02444444444444f0044f0444044f0ee
e0444f0444444440224044444444f020e024444f0444444402444f09902440eee024444f0444444402444f0990240eeee02444444444444f0024f0494044f0ee
e044404444444440024044444444f020e024444f0444449902444f09002440eee022444f0444449902444f0900240eeee02244444444444f0024f0999024f0ee
ee0404444444444400004444444f0220e024444f099999990244f000002440eee002444f0999999900244f0002440eeee00244444444444f0024f0999024f0ee
eee0044444444444444444444440000ee02444ff099999990244f000e02240eeee0244ff0999999990244f0002440eeeee0224444444444f0024f0099024f0ee
eeeee0444444444444444444490eeeeee00244f0000000000024f0eee02240eeee0244f00000000000244f0e02240eeeee0024444444444000224f099024f0ee
eeeeee04444444444444449990eeeeeeee024f0002220eeee024f0eee02240eeee0024f020eeeeeee0024f0e02240eeeeee022444444444040022f090024f0ee
eeeeeee004444444499999900eeeeeeeee024f0e02220eeee024f00eee0220eeee00244f00eeeeeeee024f0ee0240eeeeee022222224444444002f00e024f0ee
eeeeeeeee00099999999000eeeeeeeeeee002400e02200eee002470eee02240eee02024f00eeeeeeee002400e02240eeeeee0222222222222220220ee02400ee
eeeeeeeeeeee00000000eeeeeeeeeeeeeee024f0e02220eeee024f0eee02240eee020244f0eeeeeeeee02440e02240eeeeee0000000000000000000ee0000eee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee4eee4eeeeeeeeeeeeeeeeee333333333333333399999999999999997777777777777777
eeeeeee3eeeeeeeeeeeeeee3eeeeeeeeeeebbbbbeeeeeeee4eee4eeee4eee4eeeeeaaaaaeeeeeeee33333b333333333399999399999999997777747777777777
eeeeeee3eeeeeeeeeeeeeee3eeeeeeeeeebbbbbbbeeeeeee46ee4e4e24ee40eeeeaaaaaaaeeeeeee3b33b33333333b339399399999999f997477477777777677
eeeeee13beeeeeeeeeeeee136eeeeeeeeebb333bbeeeeeee04724e4e40e40eeeeeaa999aaeeeeeee33b3b333333b3b3399393999999f9f997747477777767677
eeeeee13beeeeeeeeeeeee136eeeeeeeebb3333311bbbbeee074e70e4674eeeeeaa9999944aaaaee33b33333333b3b3399399999999f9f997747777777767677
eeeee1333beeeeeeeeeee13336eeeeeeeb3333313bbbbbbee044740e4040eeeeea9999949aaaaaae333333333333333399999999999999997777777777777777
eeeee13b1beeeeeeeeeee13716eeeeeeeeb331133b3bbbbeee0440eee44eeeeeeea994499a9aaaae333333333333333399999999999999997777777777777777
eeee1311b1beeeeeeeee1361716eeeeeee331bb13333bbbeeeee047ee40eeeeeee494aa49999aaae333333333333333399999999999999997777777777777777
eeee1333333beeeeeeee13333336eeeeeb31bbbbb33333beeeee0447640eeee4ea94aaaaa99999ae333333b333333333999999f9999999997777776777777777
eee133b3b3b3beeeeee1337373736eeebb33b333bb1133ee4eeee044040eeee4aa99a999aa449aee33333b333333333399999f99999999997777767777777777
ee33131b1b3eeeeeee331617173eeeeeb333bb31133113ee4eee4024040e4e60a999aa94499444ee333b3b3333333333999f9f99999999997776767777777777
eeee31313133eeeeeeee31313133eeeeb311331bb3bbb3ee06ee0e0444ee4e60a944994aa9aaa4ee333b3b33333b3333999f9f99999399997776767777747777
eee3333333333eeeeee3333333333eeebb1113bb3b3bb3be07e60ee240e40e40aa4449aa9a9aa9ae3333333333b3333399999999993999997777777777477777
ee33131b1b3beeeeee3313171736eeeeebbbb3b3333bbbbe047404e040e40640eaaaa9a9999aaaae3333333333b3333399999999993999997777777777477777
eee13133b313beeeeee1616373136eeeeeb333331113bbbbe440e4e040e7040eeea999994444aaaa333333333333333399999999999999997777777777777777
ee13333333333beeee133333333336eeebb33b3133133bbbe04040ee4764440eeaa99a9499444aaa333333333333333399999999999999997777777777777777
e13313131b1b33bee13313131717336eb333bb333331bbbbee0440ee444400eea999aa999992aaaa333333333333333399999999999999997777777777777777
eee33131b1b33eeeeee6316171736eeeb333bb3333bbbb3beee0246e4040eee4a999aa9999aaaa4a33333b333333333399999499999999997777747777777777
ee333333333333eeee333333333333eeeb333bb313bbb33eeeee0247604eee40ea949aa949aaa44e3b33b33333333f339499499999999f997477477777777f77
e33133333333beeee331333333336eeeebbb33b113bb333eeeeee044740e674eea4999a449aa444e33b3b333333f3f3377474999999f9f9977474777777f7f77
ee13b1b3b1b31beeee136173717316eeebb333111bbb3eeeeeeeee244506440eea49aa449aaa4eee39b39993393f9f3997477779999f7f9977477777777f7f77
e1313b313b3133bee16136313761636eeeeb31111333eeeeeeeeeee2454400eeeeaaa449a444eeeee39933333399399399999999777777997799977777777777
133333333333333b1333333333333336eeeeeee122eeeeeeeeeeeee20400eeeeeeeeeee422eeeeee333333333393939399999997777777797999999777777777
333313131b1b33333333131617173333eeeeeee204eeeeeeeeeeeee204eeeeeeeeeeeee204eeeeee333333333333333399999999997777777799999997777777
e5113131b1b1bbbee51161617171766eeeeeeee240eeeeeeeeeeeee240eeeeeeeeeeeee240eeeeee333333f333333333999999f999999999777999f977777777
eeee333333333eeeeeee333333333eeeeeeeeee240eeeeeeeeeeeee240eeeeeeeeeeeee240eeeeee33333f333333333399999f999999999977777f7777777777
eee331313131eeeeeee331313131eeeeeeeeeee204eeeeeeeeeeeee204eeeeeeeeeeeee204eeeeee333f3f3933333333999f9f9999999999777f7f7777777777
eeeee312141eeeeeeeeee312141eeeeeeeeeeee204eeeeeeeeeeeee204eeeeeeeeeeeee204eeeeee339f3f93333b3333777f7f7999949999777f7f7777747777
eeeeeee245eeeeeeeeeeeee245eeeeeeeeeeeee040eeeeeeeeeeeee040eeeeeeeeeeeee040eeeeeee339993933b3333397777777774999997777777777479997
eeeeeee245eeeeeeeeeeeee245eeeeeeeeeeee2440eeeeeeeeeeee2440eeeeeeeeeeee2440eeeeee3333393333b3933399977799994999997777777777499999
eeeeee24445eeeeeeeeeee24445eeeeeeeeeee44440eeeeeeeeeee44440eeeeeeeeeee44440eeeee333333333339399399999999999999997777777779999999
eeeee44e4e4eeeeeeeeee44e4e4eeeeeeeeee44e4e4eeeeeeeeee44e4e4eeeeeeeeee44e4e4eeeee333333333333333399999999999999997777777777777997
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeecccccccccccccccccccccccccccccccc
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeecccccccccccccccccccccccccccccccc
eeeeeeeeee111111eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6eeeeeeeeeeeeeccccc111cccccccccccccc111ccccccc
eeeeeeeee1dddddd1e111eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee66eeeeeeeeeeeecccc1c71cc11cc111cccc1c71cc11cc1
eeee11111ddd6666611d6deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee1d66eeeeeeeeeeeccc1cc71cccc11cccccc1cc71cccc11c
ee111dddd11111d6d1ddd6deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee11d66eeeeeeeeeec11cccc711cccccccc11cccc711ccccc
e116ddddd6166d1d11ddd6deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee111dd66eeeeeeeeecccccccccccccccccccccccccccccccc
116ddddd616dd6611dddd66eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee11d1dd66eeeeeeeeccccccccccc111cccccccccccccc111c
1ddddd6611d666661ddd666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee11111dddd6eeeeeeee1cc11ccccc1c71cc11cc11ccccc1c71c
1dd336661d6666661ddd66eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee666eeeeeeeeeeeeeeeeeeee11115d1ddd66eeeeeeec11cccccc1cc71cccc11cccccc1cc71c
111113331d66666dd11111eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed666eeeeeeeeeeeeeeeeeee111115dddd66eeeeeeeccccccc11cccc71ccccccccc11cccc71
11dd6111116eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000051ddd66eeeeeeeeeeeeeeeeee11111111dddd66eeeeeecccccccccccccccccccccccccccccccc
1dd66666111eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000015151ddd66eeeeeeeeeeeeeeee11111111d1ddd666eeeee66c666ccccc666cc66c666ccccc666cc
dd6666d611eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000015151dd66eeeeeeeeeeeeeddd111d1115ddddd666eeeee665666c666566656665666c666566656
d666666deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000001551d111eeeeeeeeeeedd1d1111d111111dddd666eeee665555566655e566665555566655e566
d666666deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000011111d666eeeeeeeee161dd1111d11115d1ddd6511eee555eeee555eeee55555eeee555eeee55
dd66666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000011ddd66eeeeeeeee166dd111dd111111d1d651dd6eecccccccccc7cccc7cccccccccccccccc
1dddd11eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000000016dd666eeeeeeee1d6dd111d11d111dddd61dddd6ec7ccccccccccccccc77777cccccccccc
11dd1d66eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000001016ddd6166eeeee1dd66111dd11d16ddddd6ddddd6ecccccccccccccccccc66666777cccccc
11111dddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000111dddd1d666eeee1ddd6111dd11d16ddddd6dddddd6cccc7ccccc7ccc77cccccccccccdccdd
661116dd6eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000000011dddd1dd66eee111dd611ddd11d1d6ddddd6ddddd6177c77ccc77c777dccccccddc666ddcc
dd6116ddddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000044411111ddd6ee111d5d6611d11dd1d6dddddd6dddd6cc776776c77776dccddcdd77ddcccccc
dd6d16d66deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000444444444e1dddde111d511d661111dd1dd6dddddddddddccd7766666776dcccccccccccccccccc
d66166611d6666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00444444444eeee1111111511dd6666111d1dd66ddddddddddcccd67766777dccccccccccccc66666c
d661d111d66dd6eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee4444444eee44eeeeee111111dddd666611111dd66ddddddddd1177d677677d77ccdccddc6666cccccc
d66131ddd6666d6eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee44444444eeeeeeeee111111ddddd6666d111dddd66dddddd1c711c7777777cc7ccddccccccdddddcc
d66131ddd66666116ddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee444eeeeeeeeee111d111dd1dd66666611d1dddddddd11cc7c777c11c777c1cccccccddcc777dc
dd631ddddd66631dd66deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee15dd611d1dddd66655615dd1dddddd11ccccccccccccccccccc7777ccccccccc
1d631dddddd663dddd66eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee5dd16611dd1dddd66d161d1ddd1dd11566c666ccccc666ccddcddddccccdddcc
1dd6111ddddd31ddddd66eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeddd11d61dddd1ddd6d5165dd5dddd15d665666c66656c6566656666ddd56665d
11ddd1ddddd33d11dddd6eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddd11d611ddddddddd5111d55dddddd665555566655e566665555566655e566
111dd111133111dd1111deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddd11ddd111ddddddddd5511111dddd555eeee555eeee55555eeee555eeee55
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000010101010101010101010000000000000101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0ec80e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e040e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e040e0e0e0e0e0e0e0e0e0e0e0e848484840e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e840e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e2a0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c00e0e0e0e0e0e0e0e0e280e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e240e0e0e0e0e0e0e0e3a0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e3b0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e2c0e0e0e0e0e0e2b0e0e84840e0e0e0e0e0e0e0e0e0e860e0e0e0e0e0e0e0e2a0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e2a0e0e0e0e0e0e840e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e2a0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e2a0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e2a0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e2a0e0e0e0e0e0e0e2a2a0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e2a0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e2a0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040414243000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050515253000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060616263000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070717273000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e0e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
