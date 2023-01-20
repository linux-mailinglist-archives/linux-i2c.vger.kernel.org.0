Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171E06751C6
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 10:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjATJ4R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 04:56:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjATJ4Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 04:56:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D9580B8C;
        Fri, 20 Jan 2023 01:55:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE927514;
        Fri, 20 Jan 2023 10:55:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674208524;
        bh=j8S6Gdb+RcZjpA9ccAUgC+Tk6AJVUMl0mpaT0mynImc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jNhQ48HPPsOaeB9aI7pdnX5VDQePaakBdq1CFGnCfyQwL93/CLURBMKH+tBaOTEME
         66ABUXZMyJOIUiLJsn5YcjEcVnyjPQYEQH4XaJqHF4POlCEZ1S9HlyQzLhgGlbI1dW
         6q/EY7KPoxXnkDEmDEKiNPJRDSW6IePWllJlNcTE=
Date:   Fri, 20 Jan 2023 11:55:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v7 1/7] i2c: add I2C Address Translator (ATR) support
Message-ID: <Y8plCZ/27zy4J2Tk@pendragon.ideasonboard.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
 <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
 <20230118181753.7a325953@booty>
 <Y8gu4mlXUlyiFKZD@smile.fi.intel.com>
 <20230119092115.02cbbab3@booty>
 <db2e7386-e625-5bad-0c99-bae633e96d80@ideasonboard.com>
 <20230119123520.7f1aa680@booty>
 <79331f60-0849-9d5a-822a-987df01a4b96@ideasonboard.com>
 <20230119140056.686c0dea@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230119140056.686c0dea@booty>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello,

On Thu, Jan 19, 2023 at 02:00:56PM +0100, Luca Ceresoli wrote:
> On Thu, 19 Jan 2023 14:22:26 +0200 Tomi Valkeinen wrote:
> > On 19/01/2023 13:35, Luca Ceresoli wrote:
> > > On Thu, 19 Jan 2023 12:09:57 +0200 Tomi Valkeinen wrote:
> > >> On 19/01/2023 10:21, Luca Ceresoli wrote:
> > >>
> > >> <snip>
> > >>  
> > >>>>>>> +void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data)
> > >>>>>>> +{
> > >>>>>>> +	atr->priv = data;
> > >>>>>>> +}
> > >>>>>>> +EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, I2C_ATR);
> > >>>>>>> +
> > >>>>>>> +void *i2c_atr_get_driver_data(struct i2c_atr *atr)
> > >>>>>>> +{
> > >>>>>>> +	return atr->priv;
> > >>>>>>> +}
> > >>>>>>> +EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, I2C_ATR);  
> > >>>>>>
> > >>>>>> Just to be sure: Is it really _driver_ data and not _device instance_ data?  
> > >>>>>
> > >>>>> It is device instance data indeed. I don't remember why this got
> > >>>>> changed, but in v3 it was i2c_atr_set_clientdata().  
> > >>>>
> > >>>> It's me who was and is against calling it clientdata due to possible
> > >>>> confusion with i2c_set/get_clientdata() that is about *driver data*.
> > >>>> I missed that time the fact that this is about device instance data.
> > >>>> I dunno which name would be better in this case, i2c_atr_set/get_client_priv() ?  
> > >>>
> > >>> Not sure I'm following you here. The i2c_atr_set_clientdata() name was
> > >>> given for similarity with i2c_set_clientdata(). The latter wraps
> > >>> dev_set_drvdata(), which sets `struct device`->driver_data. There is
> > >>> one driver_data per each `struct device` instance, not per each driver.
> > >>> The same goes for i2c_atr_set_driver_data(): there is one priv pointer
> > >>> per each `struct i2c_atr` instance.  
> > >>
> > >> I'm a bit confused. What is "driver data" and what is "device instance
> > >> data"?
> > >>
> > >> This deals with the driver's private data, where the "driver" is the
> > >> owner/creator of the i2c-atr. The i2c-atr itself doesn't have a device
> > >> (it's kind of part of the owner's device), and there's no driver in
> > >> i2c-atr.c
> > >>
> > >> I don't like "client" here, as it reminds me of i2c_client (especially
> > >> as we're in i2c context).
> > >>
> > >> What about i2c_atr_set_user_data()? Or "owner_data"?  
> > > 
> > > Ah, only now I got the point Andy made initially about "client" not
> > > being an appropriate word.
> > > 
> > > In i2c we have:
> > > 
> > >    i2c_set_clientdata(struct i2c_client *client, void *data)
> > >            ^^^^^^~~~~            ^^^^^^                ~~~~
> > > 
> > > so "client" clearly makes sense there, now here.  
> > 
> > Isn't that also used by the i2c_client? A driver which handles an i2c 
> > device is the "i2c client", in a sense?
> > 
> > > The same logic applied here would lead to:
> > > 
> > >    i2c_atr_set_atrdata(struct i2c_atr *atr, void *data)
> > >                ^^^~~~~            ^^^             ~~~~
> > > 
> > > which makes sense but it is a ugly IMO.  
> > 
> > Here, I think, there's a bit of a difference to the i2c_client case, as 
> > we have a separate component for the i2c-atr. Although I guess one can 
> > argue that the top level driver is the ATR driver, as it handles the HW, 
> > and i2c-atr.c is just a set of helpers, so... I don't know =).
> > 
> > > So I think i2c_atr_get_driver_data() in this v7 makes sense, it's to
> > > set the data that the ATR driver instance needs.
> > > 
> > > This is coherent with logic in spi/spi.h:
> > > 
> > >    spi_set_drvdata(struct spi_device *spi, void *data)
> > > 
> > > except for the abbreviation ("_drvdata" vs "_driver_data").
> > > 
> > > Andy, Tomi, would i2c_atr_set_drvdata() be OK for you, just like SPI
> > > does?  
> > 
> > Well, I'm good with the current i2c_atr_set_driver_data(). If all agrees 
> > that it's "driver data", I'd rather keep it like that. I find this 
> > "drvdata" style very odd. Why no underscore between drv and data? Why 
> > abbreviate drv, it doesn't really help anything here?
> 
> Agreed, I'm OK with either form of "driver data".

Have you considered allowing drivers to embed i2c_atr in a larger
structure, instead of forcing allocation through i2c_atr_new() ? Drivers
could then use container_of() instead of the get/set driver/device data
accessors.

-- 
Regards,

Laurent Pinchart
