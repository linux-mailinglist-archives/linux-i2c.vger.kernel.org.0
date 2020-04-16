Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96481ABBEF
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 11:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503164AbgDPI7W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 04:59:22 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:2384 "EHLO
        cmccmta3.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502998AbgDPI7N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 04:59:13 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.19]) by rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id 2eea5e981e32466-81700; Thu, 16 Apr 2020 16:58:26 +0800 (CST)
X-RM-TRANSID: 2eea5e981e32466-81700
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.145.111] (unknown[112.25.154.146])
        by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea5e981e31183-3c8ab;
        Thu, 16 Apr 2020 16:58:26 +0800 (CST)
X-RM-TRANSID: 2eea5e981e31183-3c8ab
Subject: Re: [PATCH] i2c: drivers: Avoid unnecessary check inefm32_i2c_probe()
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     wsa@the-dreams.de, o.rempel@pengutronix.de, ardb@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200415140640.19948-1-tangbin@cmss.chinamobile.com>
 <20200415143133.qwbes5whbqx5jf2j@pengutronix.de>
 <20cc01b8-2661-7b3e-3dbc-38f7e282679b@cmss.chinamobile.com>
 <20200416065014.7umocf2aohz6q2nn@pengutronix.de>
From:   Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <145d0ba7-fca4-20f6-a6e2-6fc370bc9a57@cmss.chinamobile.com>
Date:   Thu, 16 Apr 2020 17:00:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416065014.7umocf2aohz6q2nn@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe:

On 2020/4/16 14:50, Uwe Kleine-König wrote:
>>>> diff --git a/drivers/i2c/busses/i2c-efm32.c b/drivers/i2c/busses/i2c-efm32.c
>>>> index 4de31fae7..4786ef6b2 100644
>>>> --- a/drivers/i2c/busses/i2c-efm32.c
>>>> +++ b/drivers/i2c/busses/i2c-efm32.c
>>>> @@ -312,9 +312,6 @@ static int efm32_i2c_probe(struct platform_device *pdev)
>>>>    	int ret;
>>>>    	u32 clkdiv;
>>>> -	if (!np)
>>>> -		return -EINVAL;
>>>> -
>>> I don't care much about this change. While the statement that this
>>> driver is only instantiated on dt platforms is probably right,
>>> explicitly checking for it might still prevent surprises later, serves
>>> as explicit statement for the driver reader that non-dt isn't supposed
>>> to work and given that the check is cheap I tend slightly to just keep
>>> it.
>>>
>> In this driver, the function efm32_i2c_probe() can be triggered only if the
>> platform_device and platform_driver matches,  and the matching condition is
>> DTS. It's my opinion.
> I admit I didn't recheck, but I think the driver will also be matched on
> non-dt platforms that provide an "efm32-i2c" device.

Year, I agree with you, the driver should be matched on dt or non-dt 
platforms. But for non-dt platforms, I think this driver may need minor 
changes, after all, it is just suitable for the dt platforms right now. 
That's my shallow opinions.

Thanks for your patient guidance and reply, thank you. I think you are 
also a good teacher, thanks.

Tang Bin

>



