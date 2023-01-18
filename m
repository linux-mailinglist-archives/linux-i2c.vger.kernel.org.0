Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66736724AB
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 18:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjARRSL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 12:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbjARRSE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 12:18:04 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D80D51C41;
        Wed, 18 Jan 2023 09:18:01 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 867E7FF803;
        Wed, 18 Jan 2023 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1674062279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HHiWQiQKmF9Aq364tQ1OQoYyXwqW/hpH1Vz8i01CmX4=;
        b=W2GeEJNXWZ+yf3j1rPF8scQWxjgLiyhA2BCQpdJJj7AFFTLb/MgCZIUAiUqETbp8WtS0CS
        0rPiblgQSwSGIwccSso7YA1KfnnxvlsOY413u0TdNHcb09xaZyKPpciZDkD2Am5/CskueT
        GSTiH080p3ycDeogzaEXQ1oTxt+QLSIQQ61z1SJSIhQRzX0YPe8ucIMNzCut/UZQObmOzm
        Rkk+cBP9wKmvoHpi1PyiQOgo0U0CDCY9vavR3Iszjfjl1flEHy/L79ojuljCxDcF3/UJCn
        3QOfS56cFNigVaELWtoRE9ubBIj4bmwcG9AclRZGVqgd01zcvEJiNdpbnSkwsQ==
Date:   Wed, 18 Jan 2023 18:17:53 +0100
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
Message-ID: <20230118181753.7a325953@booty>
In-Reply-To: <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
        <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
        <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Andy,

On Wed, 18 Jan 2023 16:23:53 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Jan 18, 2023 at 02:40:25PM +0200, Tomi Valkeinen wrote:
> > From: Luca Ceresoli <luca@lucaceresoli.net>
> > 
> > An ATR is a device that looks similar to an i2c-mux: it has an I2C
> > slave "upstream" port and N master "downstream" ports, and forwards
> > transactions from upstream to the appropriate downstream port. But is
> > is different in that the forwarded transaction has a different slave  
> 
> is is ?
> 
> > address. The address used on the upstream bus is called the "alias"
> > and is (potentially) different from the physical slave address of the
> > downstream chip.
> > 
> > Add a helper file (just like i2c-mux.c for a mux or switch) to allow
> > implementing ATR features in a device driver. The helper takes care or
> > adapter creation/destruction and translates addresses at each transaction.  
> 
> ...
> 
> > +A typical example follows.
> > +
> > +Topology::
> > +
> > +                      Slave X @ 0x10
> > +              .-----.   |
> > +  .-----.     |     |---+---- B
> > +  | CPU |--A--| ATR |
> > +  `-----'     |     |---+---- C
> > +              `-----'   |
> > +                      Slave Y @ 0x10
> > +
> > +Alias table:
> > +
> > +.. table::
> > +
> > +   ======   =====
> > +   Client   Alias
> > +   ======   =====
> > +   X        0x20
> > +   Y        0x30
> > +   ======   =====
> > +
> > +Transaction:
> > +
> > + - Slave X driver sends a transaction (on adapter B), slave address 0x10
> > + - ATR driver rewrites messages with address 0x20, forwards to adapter A
> > + - Physical I2C transaction on bus A, slave address 0x20
> > + - ATR chip propagates transaction on bus B with address translated to 0x10
> > + - Slave X chip replies on bus B
> > + - ATR chip forwards reply on bus A
> > + - ATR driver rewrites messages with address 0x10
> > + - Slave X driver gets back the msgs[], with reply and address 0x10  
> 
> I'm not sure I got the real / virtual status of the adapters. Are the B and C
> virtual ones, while A is the real?

Let me reply, as I wrote these docs back at the times and thus I feel
guilty in case that's unclear. :)

I don't like the word "virtual" in this situation. A, B and C are all
physical busses, made of copper and run by electrons on PCBs. B and C
are the "remote" or "downstream" busses (w.r.t. the CPU), where the i2c
devices are and where transactions happen using the address that the
chip responds to. A is the "local" or "upstream" bus that is driven
directly by the CPU (*) and where address aliases are used. Using
aliases there is necessary because using address 0x10 would be
ambiguous as there are two 0x10 chips out there.

(*) There could be more layers of course, but still A is "closer to the
CPU than B and C", for the sake of completeness.

...

> > +void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data)
> > +{
> > +	atr->priv = data;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, I2C_ATR);
> > +
> > +void *i2c_atr_get_driver_data(struct i2c_atr *atr)
> > +{
> > +	return atr->priv;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, I2C_ATR);  
> 
> Just to be sure: Is it really _driver_ data and not _device instance_ data?

It is device instance data indeed. I don't remember why this got
changed, but in v3 it was i2c_atr_set_clientdata().

[v3]
https://lore.kernel.org/all/20220206115939.3091265-3-luca@lucaceresoli.net/

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
