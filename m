Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3366C0C3B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Mar 2023 09:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjCTI2v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Mar 2023 04:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbjCTI2r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Mar 2023 04:28:47 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E765FCF;
        Mon, 20 Mar 2023 01:28:43 -0700 (PDT)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 63AF924000E;
        Mon, 20 Mar 2023 08:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1679300922;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VUmZUI36S17TwuyoIALfbhr5LHj/5QOHo0Zh0o5vnc4=;
        b=WLrUfk1/e9wnH1HLlgZmpwDw8jw2Z3IVyRfg9G774nWlvMAzECobtwkMxAcIQFb1f4oS0/
        F6PHTgNA2Ir3hfILe89rcI8ZndN0I4jKfeO/gE9frnUkDc/PcO+XJYVkGViyWeeqAYHoeu
        6W0eY7OUbNsIoTX54WIYeYlQK0LJW/37KqqQR5UUeb8sjpV+X0XAouMqt3SPZUD1I8OF+8
        AsIuY7ZmYVxP4ova886K1x5aucSkJSAP9exG470p0d2IRyGC0ruwm1nUvJY8clv3XCDgmE
        0j4zl0Jp4MZ1P8m+myO20UnrJspurqXyriA+QjfbDoARq0vnfJbKcT67uIhyEA==
Date:   Mon, 20 Mar 2023 09:28:30 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     zzam@gentoo.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v10 1/8] i2c: add I2C Address Translator (ATR) support
Message-ID: <20230320092830.0431d042@booty>
In-Reply-To: <70323408-b823-1f1a-0202-434e6243b2af@gentoo.org>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
        <20230222132907.594690-2-tomi.valkeinen@ideasonboard.com>
        <70323408-b823-1f1a-0202-434e6243b2af@gentoo.org>
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

Hello Matthias,

thanks for the in-depth review!

On Mon, 20 Mar 2023 07:34:34 +0100
zzam@gentoo.org wrote:

> Some inline comments below.
> 
> Regards
> Matthias
> 
> Am 22.02.23 um 14:29 schrieb Tomi Valkeinen:
> > From: Luca Ceresoli <luca@lucaceresoli.net>
> > 
> > An ATR is a device that looks similar to an i2c-mux: it has an I2C
> > slave "upstream" port and N master "downstream" ports, and forwards
> > transactions from upstream to the appropriate downstream port. But it
> > is different in that the forwarded transaction has a different slave
> > address. The address used on the upstream bus is called the "alias"
> > and is (potentially) different from the physical slave address of the
> > downstream chip.
> > 
> > Add a helper file (just like i2c-mux.c for a mux or switch) to allow
> > implementing ATR features in a device driver. The helper takes care or
> > adapter creation/destruction and translates addresses at each transaction.
> > 
> > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >   Documentation/i2c/index.rst         |   1 +
> >   Documentation/i2c/muxes/i2c-atr.rst |  97 +++++
> >   MAINTAINERS                         |   8 +
> >   drivers/i2c/Kconfig                 |   9 +
> >   drivers/i2c/Makefile                |   1 +
> >   drivers/i2c/i2c-atr.c               | 548 ++++++++++++++++++++++++++++
> >   include/linux/i2c-atr.h             | 116 ++++++
> >   7 files changed, 780 insertions(+)
> >   create mode 100644 Documentation/i2c/muxes/i2c-atr.rst
> >   create mode 100644 drivers/i2c/i2c-atr.c
> >   create mode 100644 include/linux/i2c-atr.h
> >   
> [...]
> > diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> > new file mode 100644
> > index 000000000000..5ab890b83670
> > --- /dev/null
> > +++ b/drivers/i2c/i2c-atr.c
> > @@ -0,0 +1,548 @@  
> [...]
> > +
> > +/*
> > + * Replace all message addresses with their aliases, saving the original
> > + * addresses.
> > + *
> > + * This function is internal for use in i2c_atr_master_xfer(). It must be
> > + * followed by i2c_atr_unmap_msgs() to restore the original addresses.
> > + */
> > +static int i2c_atr_map_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
> > +			    int num)
> > +{
> > +	struct i2c_atr *atr = chan->atr;
> > +	static struct i2c_atr_cli2alias_pair *c2a;
> > +	int i;
> > +
> > +	/* Ensure we have enough room to save the original addresses */
> > +	if (unlikely(chan->orig_addrs_size < num)) {
> > +		u16 *new_buf;
> > +
> > +		/* We don't care about old data, hence no realloc() */
> > +		new_buf = kmalloc_array(num, sizeof(*new_buf), GFP_KERNEL);
> > +		if (!new_buf)
> > +			return -ENOMEM;
> > +
> > +		kfree(chan->orig_addrs);
> > +		chan->orig_addrs = new_buf;
> > +		chan->orig_addrs_size = num;
> > +	}
> > +
> > +	for (i = 0; i < num; i++) {
> > +		chan->orig_addrs[i] = msgs[i].addr;
> > +
> > +		c2a = i2c_atr_find_mapping_by_addr(&chan->alias_list,
> > +						   msgs[i].addr);
> > +		if (!c2a) {
> > +			dev_err(atr->dev, "client 0x%02x not mapped!\n",
> > +				msgs[i].addr);
> > +			return -ENXIO;  
> I miss the roll-back of previously modified msgs[].addr values.

Indeed you have a point. There is a subtle error in case all of the
following happen in a single i2c_atr_master_xfer() call:

 * there are 2+ messages, having different addresses
 * msg[0] is mapped correctly
 * msg[n] (n > 0) fails mapping

It's very unlikely, but in this case we'd get back to the caller with
an error and modified addresses for the first n messages. Which in turn
is unlikely to create any problems, but it could.

Tomi, do you agree?

This looks like a simple solution:

   if (!c2a) {
+    i2c_atr_unmap_msgs(chan, msgs, i);
     ...
   }

While there, maybe switching to dev_err_probe would make code cleaner.

> > +/*
> > + * Restore all message address aliases with the original addresses. This
> > + * function is internal for use in i2c_atr_master_xfer().
> > + *
> > + * @see i2c_atr_map_msgs()
> > + */
> > +static void i2c_atr_unmap_msgs(struct i2c_atr_chan *chan, struct i2c_msg *msgs,
> > +			       int num)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < num; i++)
> > +		msgs[i].addr = chan->orig_addrs[i];  
> Does this code needs null and size checks for orig_addrs/orig_addrs_size 
> to protect from oopses?
> This cannot happen now as i2c_atr_master_xfer returns early when 
> i2c_atr_map_msgs fails.

The map/unmap functions are really a part of i2c_atr_master_xfer() that
has been extracted for code readability, as the comments say, and I
can't think of a different use for them. So I think this code is OK as
is.

However a small comment might help future readers, especially in case
code will change and these functions gain new use cases.
E.g.

   This function is internal for use in i2c_atr_master_xfer()
+  and for this reason it needs no null and size checks on orig_addr.
   It must be followed by i2c_atr_unmap_msgs() to restore the original addresses.

Regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
