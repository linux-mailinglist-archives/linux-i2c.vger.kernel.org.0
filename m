Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9408F6E73B8
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Apr 2023 09:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbjDSHNi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Apr 2023 03:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjDSHNh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Apr 2023 03:13:37 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A4B469A;
        Wed, 19 Apr 2023 00:13:35 -0700 (PDT)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 31FB5240002;
        Wed, 19 Apr 2023 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1681888414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RTPr0qXgUAiaKYOz5+LueWThu8nf5uFWHeafU8Tagso=;
        b=fudy4vON3s+meeKECVU7GcL156W3N/zZrDlKnFBecfWJBu/Zeu2bDoyFOLekcef3mQVQ2h
        8KIwa7Hrjco5SY/KJ5b2n7ZJavPfMx6BIHQkhzTlR5pj404ZjpdaGy81dYfuIZBt1DjnRu
        kOmN+o+JdmXkaoGnL7Go18ioSouaVNZLqc3kfk0z3FL6IUejYZsIEY5GlSmKpvQGkf7e5N
        ZhLGMPZpw5qVfi5zMw7Yt7IsrPK5yjbg4sUGd0E6KhMP7adAaxg1jNLfsHcQAFhd7LkMVF
        9YWg0vrcsQwTaLVWKkZzkbgOXNw/yrMz3UsGzvk9RfaAXYspAJfohwukZYeDHg==
Date:   Wed, 19 Apr 2023 09:13:26 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
Message-ID: <20230419091326.1327018d@booty>
In-Reply-To: <ZD6oPq+Na/80E7Mv@shikoro>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
        <20230222132907.594690-2-tomi.valkeinen@ideasonboard.com>
        <ZD6oPq+Na/80E7Mv@shikoro>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram, Tomi,

On Tue, 18 Apr 2023 16:25:02 +0200
Wolfram Sang <wsa@kernel.org> wrote:

> Hi Tomi, hi Luca,
> 
> as mentioned on IRC already, good move to use bus notifiers here and
> drop the generic attach/detach callbacks. Those were a show stopper for
> me. This version is nicely self contained. I like that!
> 
> > diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
> > index 6270f1fd7d4e..aaf33d1315f4 100644
> > --- a/Documentation/i2c/index.rst
> > +++ b/Documentation/i2c/index.rst
> > @@ -16,6 +16,7 @@ Introduction
> >     instantiating-devices
> >     busses/index
> >     i2c-topology
> > +   muxes/i2c-atr  
> 
> The muxes-dir is only for the description of mux drivers. I'd prefer to
> have this document not in the sub-dir. Also, renaming the document to
> "address-translations.rst" might be worth discussing.
> 
> >     muxes/i2c-mux-gpio
> >     i2c-sysfs
> >  
> > diff --git a/Documentation/i2c/muxes/i2c-atr.rst b/Documentation/i2c/muxes/i2c-atr.rst
> > new file mode 100644
> > index 000000000000..da226fd4de63
> > --- /dev/null
> > +++ b/Documentation/i2c/muxes/i2c-atr.rst
> > @@ -0,0 +1,97 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=====================
> > +Kernel driver i2c-atr  
> 
> Maybe "I2C address translations"?

Even better: "I2C address translator dirvers", or just "I2C address
translators"? Here we document a facility to implement a driver for
an address translator, and discussion on "address translation" in
general is just a part of it. Same for the filename.

Uh, I guess this was a journey in the realm of nitpicking, sorry... :)

> > +Description
> > +-----------
> > +
> > +An I2C Address Translator (ATR) is a device with an I2C slave parent
> > +("upstream") port and N I2C master child ("downstream") ports, and
> > +forwards transactions from upstream to the appropriate downstream port
> > +with a modified slave address. The address used on the parent bus is
> > +called the "alias" and is (potentially) different from the physical
> > +slave address of the child bus. Address translation is done by the
> > +hardware.
> > +
> > +An ATR looks similar to an i2c-mux except:
> > + - the address on the parent and child busses can be different
> > + - there is normally no need to select the child port; the alias used on the
> > +   parent bus implies it
> > +
> > +The ATR functionality can be provided by a chip with many other
> > +features. This file provides a helper to implement an ATR within your  
> 
> I'd like to get rid of all "your". Maybe "client driver" here?

I agree.

> > +
> > +I2C ATR functions and data structures
> > +-------------------------------------
> > +  
> 
> ...
> 
> > +/**
> > + * struct i2c_atr_cli2alias_pair - Holds the alias assigned to a client.  
> 
> I stumbled over this one because "cli" is "command line interface" for
> me... The long version isn't much longer: 'i2c_atr_client_alias_pair'
> But I'd be also fine with: 'i2c_atr_alias_pair'

The short one looks better to me. The only "alias" involved in ATRs is
the client alias, thus no ambiguity.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
