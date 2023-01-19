Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0330673986
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 14:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjASNI7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 08:08:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjASNIR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 08:08:17 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB476F31C;
        Thu, 19 Jan 2023 05:08:14 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9CF01240009;
        Thu, 19 Jan 2023 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1674133693;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6K4yWU5zXNS7rCMC7inDbg1ZXzG9ovvZLrR75ufoQvs=;
        b=p1E6NcsRU1W0Q0HQ/H2HNG9ep5qr+90vE2r0nUiZcx0IhICgyYKGqJcD/HMTXSN1y1O0Tz
        YCTzRFOS7YbGmnNHWQEA7GO2lVex60A1Rbcdql4h73FvFWH8V/ASi6EqKYZzhADUfv8bRw
        I2pJywhld9/55+6dHRkqUKty6zPXmPAzRh/LeN5JBm7lFSU/TUAi7ft2ZkZESeTq+APqUV
        oRM1zHrmUJVjBWSjhSdWxvpJ4JrVCrEv4b8YQIknX+p8TNGoLifgGR14dbVp79UMZlc7M9
        rTqThGWemBbw2UwRrib6Oq2r9Bocnud1/l/z4QvmI1A6Y9vDwYveUrOjP5nYFA==
Date:   Thu, 19 Jan 2023 14:08:06 +0100
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
Message-ID: <20230119140806.6b926cad@booty>
In-Reply-To: <ddbf82d0-155f-9189-44df-1f796c028b53@ideasonboard.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
        <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
        <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
        <20230118181753.7a325953@booty>
        <Y8gu4mlXUlyiFKZD@smile.fi.intel.com>
        <20230119092115.02cbbab3@booty>
        <ddbf82d0-155f-9189-44df-1f796c028b53@ideasonboard.com>
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

Hi Tomi, Andy,

On Thu, 19 Jan 2023 14:39:09 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> On 19/01/2023 10:21, Luca Ceresoli wrote:
> > Hi Andy,
> > 
> > On Wed, 18 Jan 2023 19:39:46 +0200
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> >   
> >> On Wed, Jan 18, 2023 at 06:17:53PM +0100, Luca Ceresoli wrote:  
> >>> On Wed, 18 Jan 2023 16:23:53 +0200
> >>> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> >>
> >> ...
> >>  
> >>>>> +A typical example follows.
> >>>>> +
> >>>>> +Topology::
> >>>>> +
> >>>>> +                      Slave X @ 0x10
> >>>>> +              .-----.   |
> >>>>> +  .-----.     |     |---+---- B
> >>>>> +  | CPU |--A--| ATR |
> >>>>> +  `-----'     |     |---+---- C
> >>>>> +              `-----'   |
> >>>>> +                      Slave Y @ 0x10
> >>>>> +
> >>>>> +Alias table:
> >>>>> +
> >>>>> +.. table::
> >>>>> +
> >>>>> +   ======   =====
> >>>>> +   Client   Alias
> >>>>> +   ======   =====
> >>>>> +   X        0x20
> >>>>> +   Y        0x30
> >>>>> +   ======   =====
> >>>>> +
> >>>>> +Transaction:
> >>>>> +
> >>>>> + - Slave X driver sends a transaction (on adapter B), slave address 0x10
> >>>>> + - ATR driver rewrites messages with address 0x20, forwards to adapter A
> >>>>> + - Physical I2C transaction on bus A, slave address 0x20
> >>>>> + - ATR chip propagates transaction on bus B with address translated to 0x10
> >>>>> + - Slave X chip replies on bus B
> >>>>> + - ATR chip forwards reply on bus A
> >>>>> + - ATR driver rewrites messages with address 0x10
> >>>>> + - Slave X driver gets back the msgs[], with reply and address 0x10  
> >>>>
> >>>> I'm not sure I got the real / virtual status of the adapters. Are the B and C
> >>>> virtual ones, while A is the real?  
> >>>
> >>> Let me reply, as I wrote these docs back at the times and thus I feel
> >>> guilty in case that's unclear. :)
> >>>
> >>> I don't like the word "virtual" in this situation. A, B and C are all
> >>> physical busses, made of copper and run by electrons on PCBs. B and C
> >>> are the "remote" or "downstream" busses (w.r.t. the CPU), where the i2c
> >>> devices are and where transactions happen using the address that the
> >>> chip responds to. A is the "local" or "upstream" bus that is driven
> >>> directly by the CPU (*) and where address aliases are used. Using
> >>> aliases there is necessary because using address 0x10 would be
> >>> ambiguous as there are two 0x10 chips out there.
> >>>
> >>> (*) There could be more layers of course, but still A is "closer to the
> >>> CPU than B and C", for the sake of completeness.  
> >>
> >> Can the diagram and/or text be updated to elaborate this?  
> > 
> > Let's see whether the text below is better. I haven't changed the
> > image, I don't think we can do much more in ASCII, but maybe we can
> > replace it with an SVG [0]?
> > 
> > [0]
> > https://github.com/lucaceresoli/docs/blob/master/video-serdes-linux/images/i2c-ti.svg
> > 
> > A typical example follows.
> > 
> > Topology::
> > 
> >                        Slave X @ 0x10
> >                .-----.   |
> >    .-----.     |     |---+---- B
> >    | CPU |--A--| ATR |
> >    `-----'     |     |---+---- C
> >                `-----'   |
> >                        Slave Y @ 0x10  
> 
> Slightly beside the point of this discussion, but one thing (I think) I 
> tried to highlight in some older cover letter was that we don't really 
> have the above structure. We have something like this (a quick edit, sorry):
> 
>                              .------.  Slave X @ 0x10
>                  .------.    | FPDS |   |
>      .-----.     | FPDD |-F1-`------'---+---- B
>      | CPU |--A--| ATR  |
>      `-----'     |      |-F2-.------.---+---- C
>                  `------'    | FPDS |   |
>                              `------'  Slave Y @ 0x10
> 
> Where FPDD = Deserializer, FPDS = Serializer, F1/F2 = FPD-Link bus 1/2.
> 
> So the ATR functionality is in the deserializer, but the actual remote 
> i2c bus is on the serializer.

I'd rather say that the ATF functionality is in the sum of ser+des as
they really cooperate. But this is kind of philosophical. :) What
matters is that it's worth mentioning that the "ATR" box is actually an
abstract visualization of a feature that is provided by two or more
chips (in the known universe, at least).

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
