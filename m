Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3CA5795AD
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jul 2022 10:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236614AbiGSI5H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jul 2022 04:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbiGSI5H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jul 2022 04:57:07 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654F41F603
        for <linux-i2c@vger.kernel.org>; Tue, 19 Jul 2022 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
         s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=Cu01Vg/dPrN6s3KAyngzKf1u6/mHgU32NkWcBVxKytY=; b=Vl5TMQvTpbNkGVi63pwZIIau0f
        iS7Pe9RQ1Vc0jdJvUTXsBluMmwHOyiE3H/5PGgAol6+bOJx29pQHq0f3CLUoM7r9TUyb+OOiDYI1E
        Y3yZ5CEibEJ+B5u8p4JZRnxmkySladcuwadqSHXTGKTpGZS9drKwCkEGB7wF0Kn4Pp+505PcHmCYn
        byx+cxyfOksaK7Lxg6tYcLrVReJmBmMZkIai9DRiR+DfbuP5a3frEw0QuVeS9H+jfiE1B1a12oDcr
        2Oz6tb2cdACPU2yWi7+sL8i67I98lzNlRUtP5dCz0+ksubB3b03GnJQtFb0K7Qst9ypgkzn5SsG1n
        ktI3SVvA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <lars@metafoo.de>)
        id 1oDj2O-000Av1-D8; Tue, 19 Jul 2022 10:57:04 +0200
Received: from [2001:a61:2a04:b01:9e5c:8eff:fe01:8578]
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1oDj2O-00012g-8I; Tue, 19 Jul 2022 10:57:04 +0200
Message-ID: <e5a63b48-5a09-cbe8-b173-a9c7b7abedc7@metafoo.de>
Date:   Tue, 19 Jul 2022 10:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] i2c: cadence: Support PEC for SMBus block read
Content-Language: en-US
To:     Michal Simek <michal.simek@amd.com>, Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-i2c@vger.kernel.org, git <git@xilinx.com>
References: <20220717145244.652278-1-lars@metafoo.de>
 <768b56a8-df1c-e24d-7879-328512598549@amd.com>
From:   Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <768b56a8-df1c-e24d-7879-328512598549@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.6/26606/Tue Jul 19 09:57:30 2022)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/18/22 11:25, Michal Simek wrote:
>
>
> On 7/17/22 16:52, Lars-Peter Clausen wrote:
>> SMBus packet error checking (PEC) is implemented by appending one
>> additional byte of checksum data at the end of the message. This 
>> provides
>> additional protection and allows to detect data corruption on the I2C 
>> bus.
>>
>> SMBus block reads support variable length reads. The first byte in 
>> the read
>> message is the number of available data bytes.
>>
>> The combination of PEC and block read is currently not supported by the
>> Cadence I2C driver.
>>   * When PEC is enabled the maximum transfer length for block reads
>>     increases from 33 to 34 bytes.
>>   * The I2C core smbus emulation layer relies on the driver updating the
>>     `i2c_msg` `len` field with the number of received bytes. The updated
>>     length is used when checking the PEC.
>>
>> Add support to the Cadence I2C driver for handling SMBus block reads 
>> with
>> PEC. To determine the maximum transfer length uses the initial `len` 
>> value
>> of the `i2c_msg`. When PEC is enabled this will be 2, when it is 
>> disabled
>> it will be 1.
>>
>> Once a read transfer is done also increment the `len` field by the 
>> amount
>> of received data bytes.
>>
>> This change has been tested with a UCM90320 PMBus power monitor, which
>> requires block reads to access certain data fields, but also has PEC
>> enabled by default.
>>
>> Fixes: df8eb5691c48 ("i2c: Add driver for Cadence I2C controller")
>
> Subject is saying that you adding support for PEC and here you are 
> saying that it is fixing initial commit.
>
> If this is adding new support I think Fixes tag shouldn't be here.
>
> If it is fixing issue subject should be updated and this Fixes tag 
> kept here.

I added it because I was afraid Wolfram would ask where is the fixes tag.

This change arguably somewhere between new feature and fix. The driver 
reports that it supports SMBus block read, but it does not work under 
the case that PEC is enabled. You can argue that it is a new feature 
because it never worked, but you can also argue it is a fix because the 
current implementation is broken. I'm fine either way with or without 
Fixes tag. I'll let Wolfram make the decision what he prefers.

