Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFF25737CFF
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 10:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjFUH7y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 03:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjFUH7x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 03:59:53 -0400
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C08C170D
        for <linux-i2c@vger.kernel.org>; Wed, 21 Jun 2023 00:59:50 -0700 (PDT)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id E84D661E5FE05;
        Wed, 21 Jun 2023 09:59:44 +0200 (CEST)
Message-ID: <688ccf73-1205-6ee6-d8e5-5b18c8abd9c7@molgen.mpg.de>
Date:   Wed, 21 Jun 2023 09:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Read CPDL firmware version on Edgecore AS5114-48X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear I2C folks,


I am trying to read the CPDL firmware version of the switch Edgecore 
AS5114-48X with dentOS (Debian based).

In U-Boot it supposedly work like below:

     Marvell>> i2c dev 2
     Marvell>> i2c md 0x40 01 1
     0001: 01
     Marvell>> i2c md 0x40 ff 1
     00ff: 03

But I like to do it with GNU/Linux, but my attempts failed:

```
# i2cdetect -y 2
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: UU UU -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- 6a -- -- -- -- --
70: -- UU UU UU UU UU UU --
```

Nothing seems to be at address 0x40:

```
# i2cdump -f -y 2 0x40
No size specified (using byte-data access)
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
10: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
20: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
30: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
40: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
50: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
60: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
70: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
80: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
90: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
a0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
b0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
c0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
d0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
e0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
f0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
```

Could the bus be different?

```
# i2cdetect -l
i2c-3	i2c       	i2c-2-mux (chan_id 0)           	I2C adapter
i2c-30	i2c       	i2c-2-mux (chan_id 3)           	I2C adapter
i2c-20	i2c       	i2c-2-mux (chan_id 1)           	I2C adapter
i2c-49	i2c       	i2c-2-mux (chan_id 6)           	I2C adapter
i2c-10	i2c       	i2c-2-mux (chan_id 7)           	I2C adapter
i2c-39	i2c       	i2c-2-mux (chan_id 4)           	I2C adapter
i2c-1	i2c       	mv64xxx_i2c adapter             	I2C adapter
i2c-29	i2c       	i2c-2-mux (chan_id 2)           	I2C adapter
i2c-19	i2c       	i2c-2-mux (chan_id 0)           	I2C adapter
i2c-47	i2c       	i2c-2-mux (chan_id 4)           	I2C adapter
i2c-37	i2c       	i2c-2-mux (chan_id 2)           	I2C adapter
i2c-27	i2c       	i2c-2-mux (chan_id 0)           	I2C adapter
i2c-17	i2c       	i2c-2-mux (chan_id 6)           	I2C adapter
i2c-45	i2c       	i2c-2-mux (chan_id 2)           	I2C adapter
i2c-8	i2c       	i2c-2-mux (chan_id 5)           	I2C adapter
i2c-35	i2c       	i2c-2-mux (chan_id 0)           	I2C adapter
i2c-25	i2c       	i2c-2-mux (chan_id 6)           	I2C adapter
i2c-15	i2c       	i2c-2-mux (chan_id 4)           	I2C adapter
i2c-43	i2c       	i2c-2-mux (chan_id 0)           	I2C adapter
i2c-6	i2c       	i2c-2-mux (chan_id 3)           	I2C adapter
i2c-33	i2c       	i2c-2-mux (chan_id 6)           	I2C adapter
i2c-23	i2c       	i2c-2-mux (chan_id 4)           	I2C adapter
i2c-13	i2c       	i2c-2-mux (chan_id 2)           	I2C adapter
i2c-41	i2c       	i2c-2-mux (chan_id 6)           	I2C adapter
i2c-4	i2c       	i2c-2-mux (chan_id 1)           	I2C adapter
i2c-31	i2c       	i2c-2-mux (chan_id 4)           	I2C adapter
i2c-21	i2c       	i2c-2-mux (chan_id 2)           	I2C adapter
i2c-11	i2c       	i2c-2-mux (chan_id 0)           	I2C adapter
i2c-2	i2c       	mv64xxx_i2c adapter             	I2C adapter
i2c-48	i2c       	i2c-2-mux (chan_id 5)           	I2C adapter
i2c-38	i2c       	i2c-2-mux (chan_id 3)           	I2C adapter
i2c-0	i2c       	mv64xxx_i2c adapter             	I2C adapter
i2c-28	i2c       	i2c-2-mux (chan_id 1)           	I2C adapter
i2c-18	i2c       	i2c-2-mux (chan_id 7)           	I2C adapter
i2c-46	i2c       	i2c-2-mux (chan_id 3)           	I2C adapter
i2c-9	i2c       	i2c-2-mux (chan_id 6)           	I2C adapter
i2c-36	i2c       	i2c-2-mux (chan_id 1)           	I2C adapter
i2c-26	i2c       	i2c-2-mux (chan_id 7)           	I2C adapter
i2c-16	i2c       	i2c-2-mux (chan_id 5)           	I2C adapter
i2c-44	i2c       	i2c-2-mux (chan_id 1)           	I2C adapter
i2c-7	i2c       	i2c-2-mux (chan_id 4)           	I2C adapter
i2c-34	i2c       	i2c-2-mux (chan_id 7)           	I2C adapter
i2c-24	i2c       	i2c-2-mux (chan_id 5)           	I2C adapter
i2c-14	i2c       	i2c-2-mux (chan_id 3)           	I2C adapter
i2c-42	i2c       	i2c-2-mux (chan_id 7)           	I2C adapter
i2c-5	i2c       	i2c-2-mux (chan_id 2)           	I2C adapter
i2c-32	i2c       	i2c-2-mux (chan_id 5)           	I2C adapter
i2c-22	i2c       	i2c-2-mux (chan_id 3)           	I2C adapter
i2c-50	i2c       	i2c-2-mux (chan_id 7)           	I2C adapter
i2c-12	i2c       	i2c-2-mux (chan_id 1)           	I2C adapter
i2c-40	i2c       	i2c-2-mux (chan_id 5)           	I2C adapter
# find / -iname *cpld*
/sys/bus/i2c/drivers/as4224_cpld
/sys/module/arm64_accton_as4224_cpld
/sys/module/arm64_accton_as4224_cpld/drivers/i2c:as4224_cpld
/lib/modules/5.6.16/onl/wnc/arm64-wnc-qsa72-aom-a-48p/qsa72-aom-a-48p-sys_cpld.ko
/lib/modules/5.6.16/onl/wnc/arm64-wnc-qsd61-aom-a-48/qsd61-aom-a-48-sfp_plus_cpld.ko
/lib/modules/5.6.16/onl/wnc/arm64-wnc-qsd61-aom-a-48/qsd61-aom-a-48-sys_cpld.ko
/lib/modules/5.10.4/onl/delta/arm64-delta-tn48m2/arm64-delta-tn48m-cpld.ko
/lib/modules/5.10.4/onl/delta/arm64-delta-tn48m-poe/arm64-delta-tn48m-cpld.ko
/lib/modules/5.10.4/onl/delta/arm64-delta-tn4810m-dn/arm64-delta-tn48m-dn-cpld.ko
/lib/modules/5.10.4/onl/delta/arm64-delta-tn48m-poe-dn/arm64-delta-tn48m-dn-cpld.ko
/lib/modules/5.10.4/onl/delta/arm64-delta-tn4810m/arm64-delta-tn48m-cpld.ko
/lib/modules/5.10.4/onl/delta/arm64-delta-tn48m-dn/arm64-delta-tn48m-dn-cpld.ko
/lib/modules/5.10.4/onl/delta/arm64-delta-tn48m/arm64-delta-tn48m-cpld.ko
/lib/modules/5.10.4/onl/delta/arm64-delta-tx4810/arm64-delta-tx4810-cpld.ko
/lib/modules/5.10.4/onl/accton/arm64-accton-as4224-52p/arm64-accton-as4224-cpld.ko
/lib/modules/5.10.4/onl/accton/arm64-accton-as4224-52t/arm64-accton-as4224-cpld.ko
/lib/modules/5.10.4/onl/accton/arm64-accton-as5114-48x/arm64-accton-as4224-cpld.ko
# ls -l /sys/bus/i2c/drivers/as4224_cpld/
total 0
lrwxrwxrwx 1 root root    0 Jun 20 16:53 0-0040 -> 
../../../../devices/platform/ap806/ap806:config-space@f0000000/f0511000.i2c/i2c-0/0-0040
--w------- 1 root root 4096 Jun 20 16:53 bind
lrwxrwxrwx 1 root root    0 Jun 20 16:53 module -> 
../../../../module/arm64_accton_as4224_cpld
--w------- 1 root root 4096 May 16 10:21 uevent
--w------- 1 root root 4096 Jun 20 16:53 unbind
```

Is it bus 0?

```
# i2cdump -f -y 0 0x40
No size specified (using byte-data access)
      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: 80 01 ff 07 0f cc cc cc cc cc cc cc cc cc cc cc    ??.?????????????
10: ff 03 3f cc 01 cc cc cc cc cc cc cc cc cc cc cc    .???????????????
20: ff cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    .???????????????
30: ff ff ff ff cc cc cc cc cc cc cc cc cc cc cc cc    ....????????????
40: cc cc cc 0e cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
50: 0d 4a 03 00 7f cc cc cc cc cc cc cc cc cc cc cc    ?J?.????????????
60: 01 71 1e cc cc cc cc cc cc cc cc cc cc cc cc cc    ?q??????????????
70: 7f 7f 7f 7f 7f cc cc cc cc cc cc cc cc cc cc cc    ????????????????
80: 6c 69 69 69 68 cc cc cc cc cc cc cc cc cc cc cc    liiih???????????
90: 02 00 71 71 cc cc cc cc cc cc cc cc cc cc cc cc    ?.qq????????????
a0: ff ff ff ff ff ff ff ff ff ff ff 7f cc cc cc cc    ...........?????
b0: ff ff ff ff ff ff 00 00 00 00 00 00 cc cc cc cc    ............????
c0: 0f fe ff ff ff 3f 00 00 00 00 00 00 cc cc cc cc    ??...?......????
d0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
e0: 00 71 cc cc cc cc cc cc cc cc cc cc cc cc cc cc    .q??????????????
f0: 41 53 35 31 31 34 00 00 00 00 00 00 41 57 53 05    AS5114......AWS?
```

What would be the values of `0x40 01 1` and ` 0x40 ff 1`?


Kind regards,

Paul
