Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76C30673385
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 09:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjASIVa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 03:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjASIV2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 03:21:28 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D315AB54;
        Thu, 19 Jan 2023 00:21:23 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id DFECC1BF20E;
        Thu, 19 Jan 2023 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1674116482;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=veOWoLF328JN2YGPaEWIFK6SnXU+PpnhHG+uDKLCgrU=;
        b=dBv5gt1Bl0sZDv3iJqp0D22mPQFwHYeeqnAgOOo1WGKKLVhZns4hpcxoHfibtd1epgO9aP
        cZvH3PHji/+gKlO4VsF1wRkq5JYPTmbmLKaEG8zaP+UKM15sofzo/KKSLclGXA7qBt6EnO
        HEin0hKuU4vtWDIRgNzmoyPOUiCVSAII5/lwQp0wYVFWdP2gZSxZDJd2EUeleNLkaeDDzn
        155/3lA+88b4W9muHe2dy9wElrkWI92Ox1N9DPrYLsB1rb1HKSyyhA9aASPO63XqR8ppfV
        gcEyKBvPGZ4PRRrU/+zhHe0JArGQnWWAi4lWqS3E3XAebin2Tt6WrqpDk5uh3Q==
Date:   Thu, 19 Jan 2023 09:21:15 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
Message-ID: <20230119092115.02cbbab3@booty>
In-Reply-To: <Y8gu4mlXUlyiFKZD@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
        <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
        <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
        <20230118181753.7a325953@booty>
        <Y8gu4mlXUlyiFKZD@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Wed, 18 Jan 2023 19:39:46 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Jan 18, 2023 at 06:17:53PM +0100, Luca Ceresoli wrote:
> > On Wed, 18 Jan 2023 16:23:53 +0200
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> 
> ...
> 
> > > > +A typical example follows.
> > > > +
> > > > +Topology::
> > > > +
> > > > +                      Slave X @ 0x10
> > > > +              .-----.   |
> > > > +  .-----.     |     |---+---- B
> > > > +  | CPU |--A--| ATR |
> > > > +  `-----'     |     |---+---- C
> > > > +              `-----'   |
> > > > +                      Slave Y @ 0x10
> > > > +
> > > > +Alias table:
> > > > +
> > > > +.. table::
> > > > +
> > > > +   ======   =====
> > > > +   Client   Alias
> > > > +   ======   =====
> > > > +   X        0x20
> > > > +   Y        0x30
> > > > +   ======   =====
> > > > +
> > > > +Transaction:
> > > > +
> > > > + - Slave X driver sends a transaction (on adapter B), slave address 0x10
> > > > + - ATR driver rewrites messages with address 0x20, forwards to adapter A
> > > > + - Physical I2C transaction on bus A, slave address 0x20
> > > > + - ATR chip propagates transaction on bus B with address translated to 0x10
> > > > + - Slave X chip replies on bus B
> > > > + - ATR chip forwards reply on bus A
> > > > + - ATR driver rewrites messages with address 0x10
> > > > + - Slave X driver gets back the msgs[], with reply and address 0x10    
> > > 
> > > I'm not sure I got the real / virtual status of the adapters. Are the B and C
> > > virtual ones, while A is the real?  
> > 
> > Let me reply, as I wrote these docs back at the times and thus I feel
> > guilty in case that's unclear. :)
> > 
> > I don't like the word "virtual" in this situation. A, B and C are all
> > physical busses, made of copper and run by electrons on PCBs. B and C
> > are the "remote" or "downstream" busses (w.r.t. the CPU), where the i2c
> > devices are and where transactions happen using the address that the
> > chip responds to. A is the "local" or "upstream" bus that is driven
> > directly by the CPU (*) and where address aliases are used. Using
> > aliases there is necessary because using address 0x10 would be
> > ambiguous as there are two 0x10 chips out there.
> > 
> > (*) There could be more layers of course, but still A is "closer to the
> > CPU than B and C", for the sake of completeness.  
> 
> Can the diagram and/or text be updated to elaborate this?

Let's see whether the text below is better. I haven't changed the
image, I don't think we can do much more in ASCII, but maybe we can
replace it with an SVG [0]?

[0]
https://github.com/lucaceresoli/docs/blob/master/video-serdes-linux/images/i2c-ti.svg

A typical example follows.

Topology::

                      Slave X @ 0x10
              .-----.   |
  .-----.     |     |---+---- B
  | CPU |--A--| ATR |
  `-----'     |     |---+---- C
              `-----'   |
                      Slave Y @ 0x10

Alias table:

A, B and C are three physical I2C busses, electrically independent from
each other. The ATR receives the transactions initiated on bus A and
propagates them on bus B or bus C or none depending on the device address
in the transaction and based on the alias table.

Alias table:

.. table::

   ===============   =====
   Client            Alias
   ===============   =====
   X (bus B, 0x10)   0x20
   Y (bus C, 0x10)   0x30
   ===============   =====

Transaction:

 - Slave X driver sends a transaction (on adapter B), slave address 0x10
 - ATR driver finds slave X is on bus B and has alias 0x20, rewrites
   messages with address 0x20, forwards to adapter A
 - Physical I2C transaction on bus A, slave address 0x20
 - ATR chip detects transaction on address 0x20, finds it in table,
   propagates transaction on bus B with address translated to 0x10,
   keeps clock streched on bus A waiting for reply
 - Slave X chip (on bus B) detects transaction at its own physical
   address 0x10 and replies normally
 - ATR chip stops clock stretching and forwards reply on bus A,
   with address translated back to 0x20
 - ATR driver receives the reply, rewrites messages with address 0x10
   as they were initially
 - Slave X driver gets back the msgs[], with reply and address 0x10

Let me know whether this sounds better. And perhaps Tomi can further
improve it.


> > > > +void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data)
> > > > +{
> > > > +	atr->priv = data;
> > > > +}
> > > > +EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, I2C_ATR);
> > > > +
> > > > +void *i2c_atr_get_driver_data(struct i2c_atr *atr)
> > > > +{
> > > > +	return atr->priv;
> > > > +}
> > > > +EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, I2C_ATR);    
> > > 
> > > Just to be sure: Is it really _driver_ data and not _device instance_ data?  
> > 
> > It is device instance data indeed. I don't remember why this got
> > changed, but in v3 it was i2c_atr_set_clientdata().  
> 
> It's me who was and is against calling it clientdata due to possible
> confusion with i2c_set/get_clientdata() that is about *driver data*.
> I missed that time the fact that this is about device instance data.
> I dunno which name would be better in this case, i2c_atr_set/get_client_priv() ?

Not sure I'm following you here. The i2c_atr_set_clientdata() name was
given for similarity with i2c_set_clientdata(). The latter wraps 
dev_set_drvdata(), which sets `struct device`->driver_data. There is
one driver_data per each `struct device` instance, not per each driver.
The same goes for i2c_atr_set_driver_data(): there is one priv pointer
per each `struct i2c_atr` instance.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
