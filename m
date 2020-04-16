Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F211AB57F
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 03:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730329AbgDPB3B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 21:29:01 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:3501 "EHLO
        cmccmta1.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731316AbgDPB2p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 21:28:45 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee15e97b4bafac-73fd9; Thu, 16 Apr 2020 09:28:26 +0800 (CST)
X-RM-TRANSID: 2ee15e97b4bafac-73fd9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.146.139] (unknown[112.25.154.146])
        by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee55e97b4b9bad-0444d;
        Thu, 16 Apr 2020 09:28:26 +0800 (CST)
X-RM-TRANSID: 2ee55e97b4b9bad-0444d
Subject: Re: [PATCH] i2c: drivers: Avoid unnecessary check inefm32_i2c_probe()
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     wsa@the-dreams.de, o.rempel@pengutronix.de, ardb@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200415140640.19948-1-tangbin@cmss.chinamobile.com>
 <20200415143133.qwbes5whbqx5jf2j@pengutronix.de>
From:   Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <20cc01b8-2661-7b3e-3dbc-38f7e282679b@cmss.chinamobile.com>
Date:   Thu, 16 Apr 2020 09:30:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415143133.qwbes5whbqx5jf2j@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe:

On 2020/4/15 22:31, Uwe Kleine-König wrote:
> Same things apply as in the previous patch. (space after punctuation,
> Sob of sender should be last)
I will notice this problem next time, thanks.
>> ---
>>   drivers/i2c/busses/i2c-efm32.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-efm32.c b/drivers/i2c/busses/i2c-efm32.c
>> index 4de31fae7..4786ef6b2 100644
>> --- a/drivers/i2c/busses/i2c-efm32.c
>> +++ b/drivers/i2c/busses/i2c-efm32.c
>> @@ -312,9 +312,6 @@ static int efm32_i2c_probe(struct platform_device *pdev)
>>   	int ret;
>>   	u32 clkdiv;
>>   
>> -	if (!np)
>> -		return -EINVAL;
>> -
> I don't care much about this change. While the statement that this
> driver is only instantiated on dt platforms is probably right,
> explicitly checking for it might still prevent surprises later, serves
> as explicit statement for the driver reader that non-dt isn't supposed
> to work and given that the check is cheap I tend slightly to just keep
> it.
>
In this driver, the function efm32_i2c_probe() can be triggered only if 
the platform_device and platform_driver matches,  and the matching 
condition is DTS. It's my opinion.

Tnanks,

Tang Bin



