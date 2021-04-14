Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8DA35F4DD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 15:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351361AbhDNN2w convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 14 Apr 2021 09:28:52 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57139 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbhDNN2o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 09:28:44 -0400
Received: from localhost (lfbn-lyo-1-1679-174.w90-65.abo.wanadoo.fr [90.65.110.174])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 322B1240011;
        Wed, 14 Apr 2021 13:28:18 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Marek =?utf-8?Q?Beh=C3=BAn?= <kabel@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
        Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH] i2c: mv64xxx: Fix random system lock caused by runtime PM
In-Reply-To: <20210413195854.GB2751@kunai>
References: <20210408020000.21914-1-kabel@kernel.org>
 <20210413195854.GB2751@kunai>
Date:   Wed, 14 Apr 2021 15:28:18 +0200
Message-ID: <87mtu1atcd.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On Thu, Apr 08, 2021 at 04:00:00AM +0200, Marek Behún wrote:
>> I noticed a weird bug with this driver on Marvell CN9130 Customer
>> Reference Board.
>> 
>> Sometime after boot, the system locks with the following message:
>>  [104.071363] i2c i2c-0: mv64xxx: I2C bus locked, block: 1, time_left: 0
>> 
>> The system does not respond afterwards, only warns about RCU stalls.
>> 
>> This first appeared with commit e5c02cf54154 ("i2c: mv64xxx: Add runtime
>> PM support").
>> 
>> With further experimentation I discovered that adding a delay into
>> mv64xxx_i2c_hw_init() fixes this issue. This function is called before
>> every xfer, due to how runtime PM works in this driver. It seems that in
>> order to work correctly, a delay is needed after the bus is reset in
>> this function.

Marek,

As you mentioned it was related to reset and the issue occurred with the
support of runtime PM. Did you try to add the delay only in the function
mv64xxx_i2c_runtime_resume(), just after the mv64xxx_i2c_hw_init() call ?

>> 
>> Since there already is a known erratum with this controller needing a
>> delay, I assume that this is just another place this needs to be
>> applied. Therefore I apply the delay only if errata_delay is true.
>> 
>> Signed-off-by: Marek Behún <kabel@kernel.org>
>
> Gregory? Looks reasonable to me and if so, we should have this in 5.12
> already. Comments from others are welcome, too, of course.

Hello Wolfram,

I don't have this specific platform. However, as you said it looks
reasonable and as it fixes an issue. And even if I had a pending
question, it is just an optimisation so you can add my

Acked-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Gregory


>
>> ---
>>  drivers/i2c/busses/i2c-mv64xxx.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
>> index c590d36b5fd1..5c8e94b6cdb5 100644
>> --- a/drivers/i2c/busses/i2c-mv64xxx.c
>> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
>> @@ -221,6 +221,10 @@ mv64xxx_i2c_hw_init(struct mv64xxx_i2c_data *drv_data)
>>  	writel(0, drv_data->reg_base + drv_data->reg_offsets.ext_addr);
>>  	writel(MV64XXX_I2C_REG_CONTROL_TWSIEN | MV64XXX_I2C_REG_CONTROL_STOP,
>>  		drv_data->reg_base + drv_data->reg_offsets.control);
>> +
>> +	if (drv_data->errata_delay)
>> +		udelay(5);
>> +
>>  	drv_data->state = MV64XXX_I2C_STATE_IDLE;
>>  }
>>  
>> -- 
>> 2.26.2
>> 

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
