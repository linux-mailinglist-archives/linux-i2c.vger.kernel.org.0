Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1CEA61F229
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 12:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbiKGLsZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 06:48:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbiKGLsX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 06:48:23 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3382219000;
        Mon,  7 Nov 2022 03:48:20 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 351E140003;
        Mon,  7 Nov 2022 11:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1667821698;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0+dzKW5yl0joNm7NcIOVguZRX2maONI7QA72AhJ4FVs=;
        b=iXVkSqSSJjRGR5oZovvKS5uVB/H3fY2C58x0SU86ncCinz+FlHF2jNpztKHA9RWcJ1tw3g
        GRqeW3/nDFjLsG0McxRWObtLeOayld8zCLxuwRlMFVlZjuyKeFyLRfWmJqZbzbX3zJmyoc
        HjLxvzz648AyM7lDMJyAJ1gHLFBTcJu9IE3pXc2CwzR/xikAbyGzqxI6JFwaSu7wget/jI
        djScsm9G/JCklfaJ0W+m3Be1fyOc6Kc1AO7J3wWoRbApjWr38S9tSpogXEph+GPY+fo8t+
        WR9XlPN7uPx7hHvagzEevwCj3Kqe1SIWM+7KYYmbkQDwFTBxMsZjZ4qVFJ/5Sw==
Date:   Mon, 7 Nov 2022 12:48:14 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 0/8] i2c-atr and FPDLink
Message-ID: <20221107124814.19b12473@booty>
In-Reply-To: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
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

Hi Tomi, All,

On Tue,  1 Nov 2022 15:20:24 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> Hi,
> 
> Intro
> -----
> 
> This is, kind of, v4 of Luca's i2c-atr and FPDLink series, v3 of which
> you can find from:
> 
> https://lore.kernel.org/all/20220206115939.3091265-1-luca@lucaceresoli.net/
> 
> I say "kind of", as the FPDLink drivers have diverged from Luca's
> version quite a bit and the drivers support different HW versions. A
> Big thanks for Luca for working on the drivers!
> 
> I'd really like to send and review i2c-atr and FPDLink drivers
> separately, but as the concepts are new and those drivers are linked
> together, in the end I decided to keep them in one series. Even so, I
> think these patches divide quite clearly into to areas:
> 
> 1) i2c-atr and the related code in the FPDLink drivers
> 2) Everything else about FPDLink
> 
> The FPDLink drivers support multiple streams and for that reason the
> series is based on V4L2 streams series v15:
> 
> https://lore.kernel.org/all/20221003121852.616745-1-tomi.valkeinen@ideasonboard.com/
> 
> HW overview
> -----------
> 
> TI's DS90UB9xx IC (UB9xx for short) family is a set of deserializer and
> serializer ICs for video, both display and capture. These ICs support
> FPDLink 3 and some also support FPDLink 4. From the user's point of view
> there's really not much difference between FPDLink 3 and 4.
> 
> An example HW setup with two cameras could be like this:
> 
>                           +-- [Ser 1] <-- [Camera 1]
> [CSI-2 RX] <-- [Deser] <--|
>                           +-- [Ser 2] <-- [Camera 2]
> 
> The cameras send video streams over CSI-2 to the serializers. The
> serializers encode the received data to FPDLink and send it to the
> deserializer. The deserializer decodes the data and sends it forward
> over CSI-2 bus.
> 
> The FPDLink bus is a bi-directional bus, with a fast forward-channel and
> a slow back-channel. In addition to the video, the devices support
> forwarding GPIOs (both ways) and forwarding i2c transactions with
> address translation.
> 
> This series is only about the capture ICs. The HW versions supported
> by these drivers are:
> 
> - UB960, FPDLink 3 deserializer
> - UB9702, FPDLink 3/4 deserializer
> - UB953, FPDLink 3 CSI-2 serializer
> - UB913, FPDLink 3 parallel video serializer
> - UB971, FPDLink 3/4 CSI-2 serializer
> 
> Note that this series does not support UB954 deserializer, which Luca
> has. I don't have it and decided early to drop it for simpler
> development. As UB954 is a subset of UB960, adding support for it should
> be trivial.
> 
> FPDLink Deser and Ser Devices & Drivers
> ---------------------------------------
> 
> The serializer devices are, in a way, child devices of the deserializer.
> It is the deserializer driver which creates and removes the serializer
> devices, although the serializer device itself is not a child of the
> deserializer, but rather the serializer is created as a device on the
> i2c bus.
> 
> There are perhaps other methods to add the serializer devices. I think a
> real bus is an overkill, as FPDLink is a point-to-point link. But if
> there's no FPDLink bus, what are the options? Platform device? That's
> not good either. So, for the time being, the serializers are i2c clients
> on the main i2c bus, even if they're really behind the FPDLink.
> 
> Also, the deserializer driver needs to share some information with the
> serializers, and it is done with platform data set to the serializer
> device. If we had a bus, the bus could probably be used to convey this
> information.
> 
> I2C & I2C ATR
> -------------
> 
> We have three different i2c client types:
> 
> 1) The deserializer is a normal i2c slave, and there's nothing special
> about accessing it. The deserializer is connected to the "main" i2c bus.
> 
> 2) The serializers are also accessible with i2c via FPDLink: when a
> transaction to a specific (programmable) address happens on the main
> i2c-bus the deserializer takes the transaction and forwards it via
> FPDLink to the serializer. This is implemented in the deserializer
> driver by just creating the serializer i2c device on the main i2c-bus.
> This is not 100% correct, as the serializers are not directly connected
> to an i2c bus as i2c slaves.
> 
> 3) The serializer is an i2c master, and the camera and possibly other
> i2c peripherals can be connected to that "remote" i2c bus. The
> deserializer hardware has an i2c-alias table which describes which
> i2c-alias address the deserializer will react to, what is the real
> i2c-address and to which serializer the transactions will be forwarded
> to. This is called address translation (ATR).

An excellent description so far!

> I2C ATR Thoughts
> ----------------
> 
> I have addressed most of the comments Luca received for the i2c-atr
> driver, but other than that the i2c-atr driver is mostly the same.
> However, there's one big difference: the i2c bus can be given by the
> drivers.
> 
> So, looking at the DT, in Luca's version the deserializer node looked
> like this for serializers and i2c-atr:
> 
> deser {
> 	remote-chips {
> 		remote-chip@0 {
> 			// The serializer
> 		};
> 	};
> 
> 	i2c-atr {
> 		i2c@0 {
> 			// This is the bus behind the serializer
> 		};
> 	};
> };
> 
> I have:
> 
> deser {
> 	links {
> 		link@0 {
> 			serializer {
> 				// The serializer
> 				i2c {
> 					// This is the bus
> 				};
> 			}
> 		};
> 	};
> };
> 
> I think this reflects the hardware much better. But this means that the
> i2c-atr "device", which in Luca's version is only the deserializer, is
> in my version split between the deser and serializer. However, the only
> thing I changed in the i2c-atr driver is that the i2c_atr_add_adapter()
> function takes an fwnode handle which tells where the i2c bus is found
> (but if it's NULL, it looks for i2c-atr just like in Luca's version).
> 
> Perhaps the biggest difference is that in Luca's version the i2c-atr was
> private to the deserializer, and the deser driver called
> i2c_atr_add_adapter(). In my version the deser shares the i2c-atr with
> the serializers, and the serializers call i2c_atr_add_adapter(). I think
> this is much better, as the i2c-bus is behind the serializer, and the
> serializer's registers affect the bus, and thus the bus should really be
> create/destroyed by the serializer driver as it controls the bus'
> i2c-master hardware. 
> 
> Now, i2c-mux and i2c-atr are quite similar as has been discussed in the
> earlier reviews. And while the FPDLink ICs support ATR, we can easily
> imagine a simpler deserializer which only supports mux-style forwarding.
> For these reasons I believe we have two topics: 1) i2c-atr without
> FPDLink, and 2) i2c-atr (and i2c-mux) with FPDlink.
> 
> 1)
> I am not aware of a stand-alone IC that performs address translation.
> If there is, I think i2c-atr as it is in this series is a good solution
> (but the bus fwnode feature mentioned above can be dropped).
> 
> 2)
> If I suggested adding an i2c-bus fwnode parameter to
> i2c_mux_add_adapter(), and the i2c-bus might be under some other device,
> I think the reception could be quite negative (and I would agree). For
> this reason I'm not very happy with the i2c-atr and using it with
> FPDLink.
> 
> In fact, I'm thinking that it might be better to just drop the i2c-atr
> driver, and add the support directly to the FPDlink drivers. But that
> could mean possibly duplicating the same code for other deser/ser
> architectures, so I have kept the i2c-atr driver for now.

Indeed I think the ROHM serdes chips do have an address translation
feature that works pretty much like the TI ones, and the ATR should be
cleanly reusable across the two brands. The ATR code might be
simplified to just provide helpers for common code maybe, but I'd
rather avoid code duplication.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
