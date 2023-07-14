Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 396E3753941
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jul 2023 13:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbjGNLG5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jul 2023 07:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjGNLG4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jul 2023 07:06:56 -0400
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2D9269D
        for <linux-i2c@vger.kernel.org>; Fri, 14 Jul 2023 04:06:53 -0700 (PDT)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2FB3B61E5FE03;
        Fri, 14 Jul 2023 12:57:34 +0200 (CEST)
Message-ID: <2fd078b9-e55d-7649-3231-3c587f5d4ec4@molgen.mpg.de>
Date:   Fri, 14 Jul 2023 12:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Read CPLD firmware version on Edgecore AS5114-48X
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <688ccf73-1205-6ee6-d8e5-5b18c8abd9c7@molgen.mpg.de>
 <20230624133214.48015fb6@endymion.delvare>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230624133214.48015fb6@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[Subject: Correct CPDL to CPLD.]

Dear Jean,


Thank you very much for y

Am 24.06.23 um 13:32 schrieb Jean Delvare:
> Hi Paul,
> 
> On Wed, 21 Jun 2023 09:59:44 +0200, Paul Menzel wrote:
>> I am trying to read the CPLD firmware version of the switch Edgecore
>> AS5114-48X with dentOS (Debian based).
>>
>> In U-Boot it supposedly work like below:
>>
>>       Marvell>> i2c dev 2
>>       Marvell>> i2c md 0x40 01 1
>>       0001: 01
>>       Marvell>> i2c md 0x40 ff 1
>>       00ff: 03
>>
>> But I like to do it with GNU/Linux, but my attempts failed:
>>
>> ```
>> # i2cdetect -y 2
>>        0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>> 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
>> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 50: UU UU -- -- -- -- -- -- -- -- -- -- -- -- -- --
>> 60: -- -- -- -- -- -- -- -- -- -- 6a -- -- -- -- --
>> 70: -- UU UU UU UU UU UU --
>> ```
>>
>> Nothing seems to be at address 0x40:
>>
>> ```
>> # i2cdump -f -y 2 0x40
>> No size specified (using byte-data access)
>>        0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
>> 00: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> (...)
>> f0: XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX XX    XXXXXXXXXXXXXXXX
>> ```
>>
>> Could the bus be different?
> 
> Yes, unlike the PCI bus which has a well defined topology, multiple I2C
> root segments can coexist in a system and their numbering is largely
> arbitrary. So there's no guarantee that i2c bus 2 on U-Boot is the same
> as i2c bus 2 on Linux.
> 
> I'm not familiar with U-Boot but you may try "i2c dev" or "i2c bus"
> commands there, maybe it will tell you what corresponds to i2c bus 2.
> 
>> (...)
>> # find / -iname *cpld*
>> /sys/bus/i2c/drivers/as4224_cpld
>> (...)
>> # ls -l /sys/bus/i2c/drivers/as4224_cpld/
>> total 0
>> lrwxrwxrwx 1 root root    0 Jun 20 16:53 0-0040 ->
>> ../../../../devices/platform/ap806/ap806:config-space@f0000000/f0511000.i2c/i2c-0/0-0040
>> --w------- 1 root root 4096 Jun 20 16:53 bind
>> lrwxrwxrwx 1 root root    0 Jun 20 16:53 module ->
>> ../../../../module/arm64_accton_as4224_cpld
>> --w------- 1 root root 4096 May 16 10:21 uevent
>> --w------- 1 root root 4096 Jun 20 16:53 unbind
>> ```
>>
>> Is it bus 0?
> 
> Seems so, yes.
> 
>> ```
>> # i2cdump -f -y 0 0x40
>> No size specified (using byte-data access)
>>        0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
>> 00: 80 01 ff 07 0f cc cc cc cc cc cc cc cc cc cc cc    ??.?????????????
>> 10: ff 03 3f cc 01 cc cc cc cc cc cc cc cc cc cc cc    .???????????????
>> 20: ff cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    .???????????????
>> 30: ff ff ff ff cc cc cc cc cc cc cc cc cc cc cc cc    ....????????????
>> 40: cc cc cc 0e cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
>> 50: 0d 4a 03 00 7f cc cc cc cc cc cc cc cc cc cc cc    ?J?.????????????
>> 60: 01 71 1e cc cc cc cc cc cc cc cc cc cc cc cc cc    ?q??????????????
>> 70: 7f 7f 7f 7f 7f cc cc cc cc cc cc cc cc cc cc cc    ????????????????
>> 80: 6c 69 69 69 68 cc cc cc cc cc cc cc cc cc cc cc    liiih???????????
>> 90: 02 00 71 71 cc cc cc cc cc cc cc cc cc cc cc cc    ?.qq????????????
>> a0: ff ff ff ff ff ff ff ff ff ff ff 7f cc cc cc cc    ...........?????
>> b0: ff ff ff ff ff ff 00 00 00 00 00 00 cc cc cc cc    ............????
>> c0: 0f fe ff ff ff 3f 00 00 00 00 00 00 cc cc cc cc    ??...?......????
>> d0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
>> e0: 00 71 cc cc cc cc cc cc cc cc cc cc cc cc cc cc    .q??????????????
>> f0: 41 53 35 31 31 34 00 00 00 00 00 00 41 57 53 05    AS5114......AWS?
>> ```
>>
>> What would be the values of `0x40 01 1` and ` 0x40 ff 1`?
> 
> As I understand the U-Boot i2c command syntax, 0x40 is the slave
> address, 01/ff is the register offset (in hexadecimal, despite no
> leading "0x") and 1 is the register count. So the equivalent Linux
> i2c-tools commands, assuming i2c bus 0, would be:
> 
> # i2cget 0 0x40 0x01 b
> # i2cget 0 0x40 0xff b
> 
> From the full register dump above, these commands will most probably
> return values (0x)01 and (0x)05, respectively. The former matches what
> you got from U-Boot, the latter doesn't. Which may or may not indicate
> a problem, depending on whether these values are supposed to be static
> or if they could change over time.

The U-Boot values were copied from the GitHub issue, so it’s not an 
error that they are different.

I updated the CPLD firmware to version 1.09 now, and to verify tried 
your commands, but get an error:

     # i2cdump -f -y 0 0x40
     No size specified (using byte-data access)
          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
     00: 88 01 ff 07 0f cc cc cc cc cc cc cc cc cc cc cc    ??.?????????????
     10: ff 03 3f cc 01 cc cc cc cc cc cc cc cc cc cc cc    .???????????????
     20: ff cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    .???????????????
     30: 03 00 00 00 cc cc cc cc cc cc cc cc cc cc cc cc    ?...????????????
     40: cc cc cc 0e cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
     50: 0d 4a 03 00 7f cc cc cc cc cc cc cc cc cc cc cc    ?J?.????????????
     60: 01 71 1e cc cc cc cc cc cc cc cc cc cc cc cc cc    ?q??????????????
     70: 7f 7f 7f 7f 7f cc cc cc cc cc cc cc cc cc cc cc    ????????????????
     80: 6a 69 69 69 68 cc cc cc cc cc cc cc cc cc cc cc    jiiih???????????
     90: 02 00 71 71 cc cc cc cc cc cc cc cc cc cc cc cc    ?.qq????????????
     a0: 00 00 00 00 00 00 f0 01 00 00 00 c0 cc cc cc cc    ......??...?????
     b0: 00 00 00 00 00 00 00 00 00 00 00 00 cc cc cc cc    ............????
     c0: 0f fe ff ff ff 3f 00 00 00 00 00 00 cc cc cc cc    ??...?......????
     d0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
     e0: 00 71 cc cc cc cc cc cc cc cc cc cc cc cc cc 00    .q?????????????.
     f0: 41 53 35 31 31 34 00 00 00 00 00 00 41 57 53 09    AS5114......AWS?
     # i2cget 0 0x40 0x01 b
     Error: Could not set address to 0x40: Device or resource busy
     # i2cget 0 0x40 0xff b
     Error: Could not set address to 0x40: Device or resource busy

Do you know, why i2cdump is able to read the date, but i2cget is not?


Kind regards,

Paul
