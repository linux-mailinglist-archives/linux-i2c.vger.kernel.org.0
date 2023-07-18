Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEB2375750B
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jul 2023 09:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjGRHKh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jul 2023 03:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjGRHKh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jul 2023 03:10:37 -0400
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07FECC
        for <linux-i2c@vger.kernel.org>; Tue, 18 Jul 2023 00:10:34 -0700 (PDT)
Received: from [192.168.0.2] (ip5f5aefe8.dynamic.kabel-deutschland.de [95.90.239.232])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 9E0F361E5FE01;
        Tue, 18 Jul 2023 09:10:30 +0200 (CEST)
Message-ID: <51107191-095e-fee6-4665-100e0af2e370@molgen.mpg.de>
Date:   Tue, 18 Jul 2023 09:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Read CPLD firmware version on Edgecore AS5114-48X
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <688ccf73-1205-6ee6-d8e5-5b18c8abd9c7@molgen.mpg.de>
 <20230624133214.48015fb6@endymion.delvare>
 <2fd078b9-e55d-7649-3231-3c587f5d4ec4@molgen.mpg.de>
 <20230718090533.533b4ff2@endymion.delvare>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230718090533.533b4ff2@endymion.delvare>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear Jean,


Am 18.07.23 um 09:05 schrieb Jean Delvare:

> On Fri, 14 Jul 2023 12:57:33 +0200, Paul Menzel wrote:
>> I updated the CPLD firmware to version 1.09 now, and to verify tried
>> your commands, but get an error:
>>
>>       # i2cdump -f -y 0 0x40
>>       No size specified (using byte-data access)
>>            0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
>>       00: 88 01 ff 07 0f cc cc cc cc cc cc cc cc cc cc cc    ??.?????????????
>>       10: ff 03 3f cc 01 cc cc cc cc cc cc cc cc cc cc cc    .???????????????
>>       20: ff cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    .???????????????
>>       30: 03 00 00 00 cc cc cc cc cc cc cc cc cc cc cc cc    ?...????????????
>>       40: cc cc cc 0e cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
>>       50: 0d 4a 03 00 7f cc cc cc cc cc cc cc cc cc cc cc    ?J?.????????????
>>       60: 01 71 1e cc cc cc cc cc cc cc cc cc cc cc cc cc    ?q??????????????
>>       70: 7f 7f 7f 7f 7f cc cc cc cc cc cc cc cc cc cc cc    ????????????????
>>       80: 6a 69 69 69 68 cc cc cc cc cc cc cc cc cc cc cc    jiiih???????????
>>       90: 02 00 71 71 cc cc cc cc cc cc cc cc cc cc cc cc    ?.qq????????????
>>       a0: 00 00 00 00 00 00 f0 01 00 00 00 c0 cc cc cc cc    ......??...?????
>>       b0: 00 00 00 00 00 00 00 00 00 00 00 00 cc cc cc cc    ............????
>>       c0: 0f fe ff ff ff 3f 00 00 00 00 00 00 cc cc cc cc    ??...?......????
>>       d0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc    ????????????????
>>       e0: 00 71 cc cc cc cc cc cc cc cc cc cc cc cc cc 00    .q?????????????.
>>       f0: 41 53 35 31 31 34 00 00 00 00 00 00 41 57 53 09    AS5114......AWS?
>>       # i2cget 0 0x40 0x01 b
>>       Error: Could not set address to 0x40: Device or resource busy
>>       # i2cget 0 0x40 0xff b
>>       Error: Could not set address to 0x40: Device or resource busy
>>
>> Do you know, why i2cdump is able to read the date, but i2cget is not?
> 
> You already have a kernel driver bound to address 0x40, so you aren't
> supposed to access it from user-space. You bypassed this check with
> option -f you passed to i2cdump, but you did not pass option -f to
> i2cget, which is why the former succeeded while the latter failed.
> 
> So either pass -f to i2cget, or unload the kernel driver
> (arm64_accton_as4224_cpld) before reading the value from user-space.
> Whichever option is safer depends on what happens when the system runs
> without that driver. In theory it's better to unload the driver,
> however depending on how the driver is implemented and whether reading
> these values has any side effect on the hardware side, forcing the read
> may be fine.

Thank you again for the detailed and spot-on answer. Passing `-f` it 
worked (without any side-effects for now):

     # dpkg -l i2c-tools | grep ^ii
     ii  i2c-tools      3.1.2-3      arm64        heterogeneous set of 
I2C tools for Linux
     root@ec-as5114-48x-03:~# i2cget -f 0 0x40 0x01 b
     WARNING! This program can confuse your I2C bus, cause data loss and 
worse!
     I will read from device file /dev/i2c-0, chip address 0x40, data 
address
     0x01, using read byte data.
     Continue? [Y/n] Y
     0x01
     root@ec-as5114-48x-03:~# i2cget -f 0 0x40 0xff b
     WARNING! This program can confuse your I2C bus, cause data loss and 
worse!
     I will read from device file /dev/i2c-0, chip address 0x40, data 
address
     0xff, using read byte data.
     Continue? [Y/n]
     0x09


Kind regards,

Paul
