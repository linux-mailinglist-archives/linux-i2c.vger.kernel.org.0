Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB2F6A56E6
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 11:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjB1KjY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Feb 2023 05:39:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjB1KjX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Feb 2023 05:39:23 -0500
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CA89902D;
        Tue, 28 Feb 2023 02:39:22 -0800 (PST)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id A02D061CC40F9;
        Tue, 28 Feb 2023 11:39:20 +0100 (CET)
Message-ID: <47ed190e-ebae-fdc6-f46a-f42a36fb6f26@molgen.mpg.de>
Date:   Tue, 28 Feb 2023 11:39:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Accelerometer lis3lv02d is present on SMBus but its address is
 unknown, skipping registration
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>
References: <97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de>
 <Y/0EIRsycj8EWjrz@ninjato>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Dell.Client.Kernel@dell.com,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <Y/0EIRsycj8EWjrz@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dear Wolfram,


Thank you for your prompt reply.

Am 27.02.23 um 20:27 schrieb Wolfram Sang:

>> What can a user do about this? It looks like the I2C addresses need to be
>> added to `dell_lis3lv02d_devices[]` in `drivers/i2c/busses/i2c-i801.c`.
> 
> Complain to Dell about the missing address ;)

I will. (As “Laptop system certified with Ubuntu“ [1], I was hoping that 
Canonical would have solved that with Dell already.)

> Until then:
> 
>> [   20.631866] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> 
> # cd /sys/bus/pci/drivers/i801_smbus/0000\:00\:1f.4
> # ls -d i2c-?
> 
> The last digit of the printout is the bus number. Then:
> 
> # modprobe i2c-dev
> # i2cdetect <bus_number>
> 
> And post the output here.

     $ cd /sys/bus/pci/drivers/i801_smbus/0000:00:1f.4
     $ ls -d i2c-?
     i2c-6
     $ sudo i2cdetect 6
     WARNING! This program can confuse your I2C bus, cause data loss and 
worse!
     I will probe file /dev/i2c-6.
     I will probe address range 0x08-0x77.
     Continue? [Y/n] Y
          0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
     00:                         08 -- -- -- -- -- -- --
     10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
     20: -- -- -- -- -- -- -- -- -- 29 -- -- -- -- -- --
     30: 30 -- -- -- -- 35 UU UU -- -- -- -- -- -- -- --
     40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
     50: UU -- 52 -- -- -- -- -- -- -- -- -- -- -- -- --
     60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
     70: -- -- -- -- -- -- -- --

> If you are brave and see that the address 0x1d or 0x29 are printed in
> your output, you could try adding an entry to the array you already
> mentioned above with the address you found. It may be safer to do
> some sanity checking before, though.

So, 29 shows up in the dump. Let’s see if I am going to find the time to 
build a Linux kernel. (I couldn’t find a module parameter to force 
loading at a specific address.)


Kind regards,

Paul


[1]: https://ubuntu.com/certified/201902-26859
