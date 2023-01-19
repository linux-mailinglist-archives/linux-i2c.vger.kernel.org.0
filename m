Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB23673842
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 13:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjASMXC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 07:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjASMWm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 07:22:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1558078A81;
        Thu, 19 Jan 2023 04:22:32 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8BCB501;
        Thu, 19 Jan 2023 13:22:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674130949;
        bh=HKd24MpJPUA2cBn9+Zxn633AqY8BeWf29Z3k0lXodMQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Gns5S8qh8jwvaj99tc5g1AfeyxIAkIZjBq/9Tf4k7lIvj53bCAPsZzS7pmRhgSV/K
         Kd29mhjrhapWvLrf+ZBu5OqoPbOGZiDbottCGG0ijhc4lJ5D6cdU2WXbKaac7PfUkw
         ars7HGmzXuEqzQakKo+WnqS61YcZJLewaaQELaI4=
Message-ID: <79331f60-0849-9d5a-822a-987df01a4b96@ideasonboard.com>
Date:   Thu, 19 Jan 2023 14:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 1/7] i2c: add I2C Address Translator (ATR) support
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
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
 <db2e7386-e625-5bad-0c99-bae633e96d80@ideasonboard.com>
 <20230119123520.7f1aa680@booty>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230119123520.7f1aa680@booty>
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

On 19/01/2023 13:35, Luca Ceresoli wrote:
> Hi Tomi, Andy,
> 
> On Thu, 19 Jan 2023 12:09:57 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
>> On 19/01/2023 10:21, Luca Ceresoli wrote:
>>
>> <snip>
>>
>>>>>>> +void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data)
>>>>>>> +{
>>>>>>> +	atr->priv = data;
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, I2C_ATR);
>>>>>>> +
>>>>>>> +void *i2c_atr_get_driver_data(struct i2c_atr *atr)
>>>>>>> +{
>>>>>>> +	return atr->priv;
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, I2C_ATR);
>>>>>>
>>>>>> Just to be sure: Is it really _driver_ data and not _device instance_ data?
>>>>>
>>>>> It is device instance data indeed. I don't remember why this got
>>>>> changed, but in v3 it was i2c_atr_set_clientdata().
>>>>
>>>> It's me who was and is against calling it clientdata due to possible
>>>> confusion with i2c_set/get_clientdata() that is about *driver data*.
>>>> I missed that time the fact that this is about device instance data.
>>>> I dunno which name would be better in this case, i2c_atr_set/get_client_priv() ?
>>>
>>> Not sure I'm following you here. The i2c_atr_set_clientdata() name was
>>> given for similarity with i2c_set_clientdata(). The latter wraps
>>> dev_set_drvdata(), which sets `struct device`->driver_data. There is
>>> one driver_data per each `struct device` instance, not per each driver.
>>> The same goes for i2c_atr_set_driver_data(): there is one priv pointer
>>> per each `struct i2c_atr` instance.
>>
>> I'm a bit confused. What is "driver data" and what is "device instance
>> data"?
>>
>> This deals with the driver's private data, where the "driver" is the
>> owner/creator of the i2c-atr. The i2c-atr itself doesn't have a device
>> (it's kind of part of the owner's device), and there's no driver in
>> i2c-atr.c
>>
>> I don't like "client" here, as it reminds me of i2c_client (especially
>> as we're in i2c context).
>>
>> What about i2c_atr_set_user_data()? Or "owner_data"?
> 
> Ah, only now I got the point Andy made initially about "client" not
> being an appropriate word.
> 
> In i2c we have:
> 
>    i2c_set_clientdata(struct i2c_client *client, void *data)
>            ^^^^^^~~~~            ^^^^^^                ~~~~
> 
> so "client" clearly makes sense there, now here.

Isn't that also used by the i2c_client? A driver which handles an i2c 
device is the "i2c client", in a sense?

> The same logic applied here would lead to:
> 
>    i2c_atr_set_atrdata(struct i2c_atr *atr, void *data)
>                ^^^~~~~            ^^^             ~~~~
> 
> which makes sense but it is a ugly IMO.

Here, I think, there's a bit of a difference to the i2c_client case, as 
we have a separate component for the i2c-atr. Although I guess one can 
argue that the top level driver is the ATR driver, as it handles the HW, 
and i2c-atr.c is just a set of helpers, so... I don't know =).

> So I think i2c_atr_get_driver_data() in this v7 makes sense, it's to
> set the data that the ATR driver instance needs.
> 
> This is coherent with logic in spi/spi.h:
> 
>    spi_set_drvdata(struct spi_device *spi, void *data)
> 
> except for the abbreviation ("_drvdata" vs "_driver_data").
> 
> Andy, Tomi, would i2c_atr_set_drvdata() be OK for you, just like SPI
> does?

Well, I'm good with the current i2c_atr_set_driver_data(). If all agrees 
that it's "driver data", I'd rather keep it like that. I find this 
"drvdata" style very odd. Why no underscore between drv and data? Why 
abbreviate drv, it doesn't really help anything here?

That said, I'm also fine with i2c_atr_set_drvdata if that's the popular 
opinion (between the three of us, so far ;).

  Tomi

