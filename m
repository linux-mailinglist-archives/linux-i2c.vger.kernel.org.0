Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24E1D673705
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 12:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbjASLft (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 06:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbjASLfj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 06:35:39 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4092B83;
        Thu, 19 Jan 2023 03:35:29 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A9052E0012;
        Thu, 19 Jan 2023 11:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1674128128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9b4Gd71VIpRzmWAFvIEX9qIOF0R0AhLHNhOUdNP3BeY=;
        b=dwQEieih0KVf2hhXRvwQq0Dfw9zd0/0j7TapWPquKpkqFdrH1zKD/aKuctuBVhciWWfqMi
        isuP5qMq4WOLwJ4n0SLcsXDH51ybVlGZfVeKOC2QqqzXs0Dj2eBiXyRmD6czMihTluHhJi
        r35o/pZRGJooSKyOtcPzL2ucsqvfzHQ120rM4A5gMMyXGO1guHYDp+UsEoBd0N8R4d+KGi
        XtWhPtJGMvBy+sAc9R4EhQSjcbcLmPlQ4ubJ2ylTLx2FBxMXmCnpU/eovi2ZVBg2/csI35
        ecMDVy8a/qHpzX9LBJsiD2jvxhlwoPJJU+JxNGtBio8F0yVjKedBxw+IaGjkKA==
Date:   Thu, 19 Jan 2023 12:35:20 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
        Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v7 1/7] i2c: add I2C Address Translator (ATR) support
Message-ID: <20230119123520.7f1aa680@booty>
In-Reply-To: <db2e7386-e625-5bad-0c99-bae633e96d80@ideasonboard.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
        <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
        <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
        <20230118181753.7a325953@booty>
        <Y8gu4mlXUlyiFKZD@smile.fi.intel.com>
        <20230119092115.02cbbab3@booty>
        <db2e7386-e625-5bad-0c99-bae633e96d80@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi, Andy,

On Thu, 19 Jan 2023 12:09:57 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> On 19/01/2023 10:21, Luca Ceresoli wrote:
> 
> <snip>
> 
> >>>>> +void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data)
> >>>>> +{
> >>>>> +	atr->priv = data;
> >>>>> +}
> >>>>> +EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, I2C_ATR);
> >>>>> +
> >>>>> +void *i2c_atr_get_driver_data(struct i2c_atr *atr)
> >>>>> +{
> >>>>> +	return atr->priv;
> >>>>> +}
> >>>>> +EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, I2C_ATR);  
> >>>>
> >>>> Just to be sure: Is it really _driver_ data and not _device instance_ data?  
> >>>
> >>> It is device instance data indeed. I don't remember why this got
> >>> changed, but in v3 it was i2c_atr_set_clientdata().  
> >>
> >> It's me who was and is against calling it clientdata due to possible
> >> confusion with i2c_set/get_clientdata() that is about *driver data*.
> >> I missed that time the fact that this is about device instance data.
> >> I dunno which name would be better in this case, i2c_atr_set/get_client_priv() ?  
> > 
> > Not sure I'm following you here. The i2c_atr_set_clientdata() name was
> > given for similarity with i2c_set_clientdata(). The latter wraps
> > dev_set_drvdata(), which sets `struct device`->driver_data. There is
> > one driver_data per each `struct device` instance, not per each driver.
> > The same goes for i2c_atr_set_driver_data(): there is one priv pointer
> > per each `struct i2c_atr` instance.  
> 
> I'm a bit confused. What is "driver data" and what is "device instance 
> data"?
> 
> This deals with the driver's private data, where the "driver" is the 
> owner/creator of the i2c-atr. The i2c-atr itself doesn't have a device 
> (it's kind of part of the owner's device), and there's no driver in 
> i2c-atr.c
> 
> I don't like "client" here, as it reminds me of i2c_client (especially 
> as we're in i2c context).
> 
> What about i2c_atr_set_user_data()? Or "owner_data"?

Ah, only now I got the point Andy made initially about "client" not
being an appropriate word.

In i2c we have:

  i2c_set_clientdata(struct i2c_client *client, void *data)
          ^^^^^^~~~~            ^^^^^^                ~~~~

so "client" clearly makes sense there, now here.

The same logic applied here would lead to:

  i2c_atr_set_atrdata(struct i2c_atr *atr, void *data)
              ^^^~~~~            ^^^             ~~~~

which makes sense but it is a ugly IMO.

So I think i2c_atr_get_driver_data() in this v7 makes sense, it's to
set the data that the ATR driver instance needs.

This is coherent with logic in spi/spi.h:

  spi_set_drvdata(struct spi_device *spi, void *data)

except for the abbreviation ("_drvdata" vs "_driver_data").

Andy, Tomi, would i2c_atr_set_drvdata() be OK for you, just like SPI
does?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
