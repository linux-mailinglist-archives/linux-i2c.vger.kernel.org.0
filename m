Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6FD952FC57
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 14:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbiEUM2W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 08:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232622AbiEUM2V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 08:28:21 -0400
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr [80.12.242.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CC887202
        for <linux-i2c@vger.kernel.org>; Sat, 21 May 2022 05:28:18 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.180.246])
        by smtp.orange.fr with ESMTPA
        id sODMnGgnKL5fDsODMnUwId; Sat, 21 May 2022 14:28:16 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 21 May 2022 14:28:16 +0200
X-ME-IP: 86.243.180.246
Message-ID: <dd299256-2266-4736-e50f-17b417529699@wanadoo.fr>
Date:   Sat, 21 May 2022 14:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] i2c: bcm2835: Fix error handling in bcm2835_i2c_probe
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, Miaoqian Lin <linmq006@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Eric Anholt <eric@anholt.net>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Annaliese McDermond <nh6z@nh6z.net>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220403063310.7525-1-linmq006@gmail.com>
 <YojRB2043uYeV0XH@shikoro>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <YojRB2043uYeV0XH@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 21/05/2022 à 13:46, Wolfram Sang a écrit :
> On Sun, Apr 03, 2022 at 06:33:08AM +0000, Miaoqian Lin wrote:
>> In the error handling path, the clk_prepare_enable() function
>> call should be balanced by a corresponding 'clk_disable_unprepare()'
>> call. And clk_set_rate_exclusive calls clk_rate_exclusive_get(),
>> it should be balanced with call to clk_rate_exclusive_put().
>> , as already done in the remove function.
>>
>> Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> 
> Looking for a reviewer here, pretty please?

Hi,

on which tree are you working?
A similar patch is already available in -next since several months. (see 
[1])

CJ

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/i2c/busses/i2c-bcm2835.c?id=b205f5850263632b6897d8f0bfaeeea4955f8663
> 
>> ---
>>   drivers/i2c/busses/i2c-bcm2835.c | 21 ++++++++++++++++-----
>>   1 file changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
>> index 5149454eef4a..d794448866a7 100644
>> --- a/drivers/i2c/busses/i2c-bcm2835.c
>> +++ b/drivers/i2c/busses/i2c-bcm2835.c
>> @@ -454,18 +454,21 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>>   	ret = clk_prepare_enable(i2c_dev->bus_clk);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "Couldn't prepare clock");
>> -		return ret;
>> +		goto err_put_clk;
>>   	}
>>   
>>   	i2c_dev->irq = platform_get_irq(pdev, 0);
>> -	if (i2c_dev->irq < 0)
>> -		return i2c_dev->irq;
>> +	if (i2c_dev->irq < 0) {
>> +		ret =  i2c_dev->irq;
>> +		goto err_disable_clk;
>> +	}
>>   
>>   	ret = request_irq(i2c_dev->irq, bcm2835_i2c_isr, IRQF_SHARED,
>>   			  dev_name(&pdev->dev), i2c_dev);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "Could not request IRQ\n");
>> -		return -ENODEV;
>> +		ret = -ENODEV;
>> +		goto err_disable_clk;
>>   	}
>>   
>>   	adap = &i2c_dev->adapter;
>> @@ -489,8 +492,16 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>>   
>>   	ret = i2c_add_adapter(adap);
>>   	if (ret)
>> -		free_irq(i2c_dev->irq, i2c_dev);
>> +		goto err_free_irq;
>> +
>> +	return ret;
>>   
>> +err_free_irq:
>> +	free_irq(i2c_dev->irq, i2c_dev);
>> +err_disable_clk:
>> +	clk_disable_unprepare(i2c_dev->bus_clk);
>> +err_put_clk:
>> +	clk_rate_exclusive_put(i2c_dev->bus_clk);
>>   	return ret;
>>   }
>>   
>> -- 
>> 2.17.1
>>

