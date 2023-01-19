Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2C4673521
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 11:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbjASKKG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 05:10:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbjASKKE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 05:10:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A605066FB6;
        Thu, 19 Jan 2023 02:10:03 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F4D77EC;
        Thu, 19 Jan 2023 11:10:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674123001;
        bh=KeS3ZYlh0v1hgL0ubBbk0cm/I4qwuUYr/hTn/NPRngw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jC2PNGu9dua0vIbdOBh1G+iQ0MzFzcucrYoElYzktJUvYPo770BRKM3Lksy5LKOjn
         VD7dMrirvMpZTaCupD6iBWTPWYnFJNHpYg9uq7Tu/Il4GfJsywW4TgpFx9O9Lxc77P
         AG1sd5foL/PfPoZ1TR2hq7a15lL7LfdojcvU8YV0=
Message-ID: <db2e7386-e625-5bad-0c99-bae633e96d80@ideasonboard.com>
Date:   Thu, 19 Jan 2023 12:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 1/7] i2c: add I2C Address Translator (ATR) support
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
 <Y8gA+cz9m7PaEhfP@smile.fi.intel.com> <20230118181753.7a325953@booty>
 <Y8gu4mlXUlyiFKZD@smile.fi.intel.com> <20230119092115.02cbbab3@booty>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230119092115.02cbbab3@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 19/01/2023 10:21, Luca Ceresoli wrote:

<snip>

>>>>> +void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data)
>>>>> +{
>>>>> +	atr->priv = data;
>>>>> +}
>>>>> +EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, I2C_ATR);
>>>>> +
>>>>> +void *i2c_atr_get_driver_data(struct i2c_atr *atr)
>>>>> +{
>>>>> +	return atr->priv;
>>>>> +}
>>>>> +EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, I2C_ATR);
>>>>
>>>> Just to be sure: Is it really _driver_ data and not _device instance_ data?
>>>
>>> It is device instance data indeed. I don't remember why this got
>>> changed, but in v3 it was i2c_atr_set_clientdata().
>>
>> It's me who was and is against calling it clientdata due to possible
>> confusion with i2c_set/get_clientdata() that is about *driver data*.
>> I missed that time the fact that this is about device instance data.
>> I dunno which name would be better in this case, i2c_atr_set/get_client_priv() ?
> 
> Not sure I'm following you here. The i2c_atr_set_clientdata() name was
> given for similarity with i2c_set_clientdata(). The latter wraps
> dev_set_drvdata(), which sets `struct device`->driver_data. There is
> one driver_data per each `struct device` instance, not per each driver.
> The same goes for i2c_atr_set_driver_data(): there is one priv pointer
> per each `struct i2c_atr` instance.

I'm a bit confused. What is "driver data" and what is "device instance 
data"?

This deals with the driver's private data, where the "driver" is the 
owner/creator of the i2c-atr. The i2c-atr itself doesn't have a device 
(it's kind of part of the owner's device), and there's no driver in 
i2c-atr.c

I don't like "client" here, as it reminds me of i2c_client (especially 
as we're in i2c context).

What about i2c_atr_set_user_data()? Or "owner_data"?

  Tomi

