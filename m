Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDCCF734E33
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 10:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjFSInP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 04:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjFSImz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 04:42:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265D03A92;
        Mon, 19 Jun 2023 01:40:48 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18098547;
        Mon, 19 Jun 2023 10:39:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687163998;
        bh=6NJRwC5Dr2vzbjlVl+AeJg6cppAZ6p7cGxmaf/F5s+A=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=PaMdwDVelUCr2Bpl2OTfDXcqBa72Fpqc3Hu/XO7d+sfRqTSba/rZCj1lwsB+RT3uR
         gIs59uF6Vc5B3SJS4habkckkrntXpSc/YOZGagGbM0stbTIGIvGlg/AkMT1KEKFO5J
         +4E8WyJYBT0wdbv/Q2lI9F6NGyDLy4rYgedF8/Wg=
Message-ID: <fa3f72a1-8f69-e3f1-96c3-5e53c612afe7@ideasonboard.com>
Date:   Mon, 19 Jun 2023 11:40:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 11/18] media: i2c: ds90ub9xx: Select GPIOLIB rather
 than OF_GPIO
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-12-tomi.valkeinen@ideasonboard.com>
 <ZIxu+IvTSaFW3erU@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZIxu+IvTSaFW3erU@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/06/2023 17:17, Andy Shevchenko wrote:
> On Fri, Jun 16, 2023 at 04:59:15PM +0300, Tomi Valkeinen wrote:
>> Select GPIOLIB rather than OF_GPIO, as the drivers use gpiolib
>> functionality, but no of_gpio (directly).
> 
> This is useful change, but has to be folded in the original code.
> We do not want even a trace of newly added OF_GPIO.

Yes, I think the first three new patches should be squashed:

   media: i2c: ds90ub960: Fix use of UB960_SR_FWD_CTL1
   media: i2c: ds90ub9xx: Add COMMON_CLK kconfig dependency
   media: i2c: ds90ub9xx: Select GPIOLIB rather than OF_GPIO

The rest... Thinking about it now, I should have perhaps left them out, 
as they're not fixing issues, and perhaps they just confuse the merging 
process.

  Tomi

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/i2c/Kconfig | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 8a5f09a3de6c..29fc00e30d8b 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -1622,7 +1622,7 @@ config VIDEO_DS90UB913
>>   	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
>>   	select I2C_ATR
>>   	select MEDIA_CONTROLLER
>> -	select OF_GPIO
>> +	select GPIOLIB
>>   	select REGMAP_I2C
>>   	select V4L2_FWNODE
>>   	select VIDEO_V4L2_SUBDEV_API
>> @@ -1635,7 +1635,7 @@ config VIDEO_DS90UB953
>>   	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
>>   	select I2C_ATR
>>   	select MEDIA_CONTROLLER
>> -	select OF_GPIO
>> +	select GPIOLIB
>>   	select REGMAP_I2C
>>   	select V4L2_FWNODE
>>   	select VIDEO_V4L2_SUBDEV_API
>> @@ -1648,7 +1648,7 @@ config VIDEO_DS90UB960
>>   	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
>>   	select I2C_ATR
>>   	select MEDIA_CONTROLLER
>> -	select OF_GPIO
>> +	select GPIOLIB
>>   	select REGMAP_I2C
>>   	select V4L2_FWNODE
>>   	select VIDEO_V4L2_SUBDEV_API
>> -- 
>> 2.34.1
>>
> 

