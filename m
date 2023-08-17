Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6992A77F8DE
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 16:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351876AbjHQO1z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 10:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351921AbjHQO1g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 10:27:36 -0400
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBAA2D79;
        Thu, 17 Aug 2023 07:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1692282449;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=02Bq9s/NYUjphQGu1QxD81vJQgaivPeKOZxVDKAg+U4=;
        b=L9F2STMPIiG8SUaDsPFNoToRD5b8bIXE+mWM82peCdftrXCG+zOgIi7wyoXXzYHNwjahsX
        KNul/ps725SqhZ0lz0POqz+C7UKmpANZstA5GJYXgMwewJYhaewkmPb5t+dOPjfjc54vN0
        1dqUilxMokbOXul3qOWRXcmQmDCFk+s=
Received: from [192.168.43.126] (hen56-1_migr-78-240-185-16.fbx.proxad.net [78.240.185.16])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 7bda20a6 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Thu, 17 Aug 2023 14:27:29 +0000 (UTC)
Message-ID: <685b10d2-7627-eea8-69e4-454af039fa5d@sionneau.net>
Date:   Thu, 17 Aug 2023 16:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] i2c: designware: add support for pinctrl for recovery
Content-Language: en-US
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>
References: <20230816095015.23705-1-yann@sionneau.net>
 <97d62909-551b-4abd-a743-5be09e617665@linux.intel.com>
From:   Yann Sionneau <yann@sionneau.net>
In-Reply-To: <97d62909-551b-4abd-a743-5be09e617665@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

Le 17/08/2023 à 10:07, Jarkko Nikula a écrit :
> Hi
>
> On 8/16/23 12:50, Yann Sionneau wrote:
>> From: Yann Sionneau <ysionneau@kalray.eu>
>>
>> Currently if the SoC needs pinctrl to switch the SCL and SDA
>> from the I2C function to GPIO function, the recovery won't work.
>>
>> scl-gpio = <>;
>> sda-gpio = <>;
>>
>> Are not enough for some SoCs to have a working recovery.
>> Some need:
>>
>> scl-gpio = <>;
>> sda-gpio = <>;
>> pinctrl-names = "default", "recovery";
>> pinctrl-0 = <&i2c_pins_hw>;
>> pinctrl-1 = <&i2c_pins_gpio>;
>>
>> The driver was not filling rinfo->pinctrl with the device node
>> pinctrl data which is needed by generic recovery code.
>>
>> Tested-by: Yann Sionneau <ysionneau@kalray.eu>
>> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
>
> Tested-by from author is needless. Expectation is that author has 
> tested the patch while not always true :-)
Ok, I just wanted to emphasize the fact that I have the device and I 
tested the change with the device. Ack!
>
>> @@ -905,6 +906,15 @@ static int i2c_dw_init_recovery_info(struct 
>> dw_i2c_dev *dev)
>>           return PTR_ERR(gpio);
>>       rinfo->sda_gpiod = gpio;
>>   +    rinfo->pinctrl = devm_pinctrl_get(dev->dev);
>> +    if (IS_ERR(rinfo->pinctrl)) {
>> +        if (PTR_ERR(rinfo->pinctrl) == -EPROBE_DEFER)
>> +            return PTR_ERR(rinfo->pinctrl);
>> +
>> +        rinfo->pinctrl = NULL;
>> +        dev_info(dev->dev, "can't get pinctrl, bus recovery might 
>> not work\n");
>
> I think dev_dbg() suits better here or is it needed at all? End user 
> may not be able to do anything when sees this in dmesg. I.e. more like 
> development time dev_dbg() information.
I agree dev_dbg() is a better idea.
>
> Does i2c-core-base.c: i2c_gpio_init_pinctrl_recovery() already do 
> dev_info() print when pinctrl & GPIO are set properly making above 
> also kind of needless?

Thanks for the review. In fact I had to use gdb to understand why the 
recovery was not working. Because as you said, it only prints something 
to say "everything looks ok!".

I kind of prefer when it prints when something goes wrong.

But I let you decide what you think is the best.

-- 

Yann

