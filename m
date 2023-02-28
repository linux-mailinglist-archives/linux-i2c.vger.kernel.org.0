Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5E2B6A574A
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 11:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbjB1K5s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Feb 2023 05:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjB1K5a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Feb 2023 05:57:30 -0500
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82EB2FCC1;
        Tue, 28 Feb 2023 02:56:53 -0800 (PST)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 632AB6244DF88;
        Tue, 28 Feb 2023 11:56:52 +0100 (CET)
Message-ID: <1669a3d8-1d19-e91b-8f6e-36f5037fff47@molgen.mpg.de>
Date:   Tue, 28 Feb 2023 11:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Accelerometer lis3lv02d is present on SMBus but its address is
 unknown, skipping registration
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>
References: <97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de>
 <Y/0EIRsycj8EWjrz@ninjato>
 <47ed190e-ebae-fdc6-f46a-f42a36fb6f26@molgen.mpg.de>
 <Y/3cYL0s1Ul9fgR+@ninjato>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Dell.Client.Kernel@dell.com,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <Y/3cYL0s1Ul9fgR+@ninjato>
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


Thank you again for the prompt reply.

Am 28.02.23 um 11:50 schrieb Wolfram Sang:

>> So, 29 shows up in the dump. Let’s see if I am going to find the time to
>> build a Linux kernel. (I couldn’t find a module parameter to force loading
>> at a specific address.)
> 
> We do this via sysfs:
> 
> # echo lis3lv02d 0x29 > /sys/bus/i2c/devices/i2c-6/new_device
> 
> (Depending on your system, you might need to ensure the lis3 driver is
> loaded before)
> 
> Hope it works!

It does. After your command, Linux logs:

```
[ 2110.787000] i2c i2c-6: new_device: Instantiated device lis3lv02d at 0x29
[ 2110.791932] lis3lv02d_i2c 6-0029: supply Vdd not found, using dummy 
regulator
[ 2110.791981] lis3lv02d_i2c 6-0029: supply Vdd_IO not found, using 
dummy regulator
[ 2110.809233] lis3lv02d: 8 bits 3DC sensor found
[ 2110.900668] input: ST LIS3LV02DL Accelerometer as 
/devices/platform/lis3lv02d/input/input23
```

I can cook up a patch, if you want.


Kind regards,

Paul
