Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA746759B3
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 17:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjATQRg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 11:17:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjATQRf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 11:17:35 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD78DF957;
        Fri, 20 Jan 2023 08:17:24 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 9198C240010;
        Fri, 20 Jan 2023 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1674231443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GWFECQymxzugYEZWvea/kOz6siwpomm4LEhQL89Bq5Y=;
        b=TMaZlsLksagt53yV4HmWugi8Qfz0431i/PZDiX5agSfCImJ8Fqxu3VThwDPOfu8sMPipEJ
        WdkUqF4papwYk3E7p3kVOUscu1aK/zDuOetetjCv6Lh22L5YHvLPKcp7h/2yMgbXt+xSKr
        TjKxUwfLcH/iGYtm9QS9c6ixFdcFhCPBR6bjAAj2NryJ5AiWRGHYqUnqvNWJC10Fqfda8Y
        pTmtlsD1KIydVIs8q/mRD9dzTZqK7sjBCDaX+6XK0ufpJKES79ColclAemU12pBp3eKwt6
        pQwPE24Lt3x1D3yv2kRMyHm/GGlQzxy1Nt6Bwug+JpQrk6ryiycR7T4QtYH+xg==
Date:   Fri, 20 Jan 2023 17:17:18 +0100
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
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v7 0/7] i2c-atr and FPDLink
Message-ID: <20230120171718.3674af61@booty>
In-Reply-To: <Y8q6ggmOsygyVdTT@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
        <Y8gX0krXayfOa4Hi@smile.fi.intel.com>
        <bd6d6cc0-4e70-fa31-4b5e-e6bcddf62d36@ideasonboard.com>
        <Y8gvu/E5EoPqo8J1@smile.fi.intel.com>
        <20230119094358.010bc826@booty>
        <Y8q6ggmOsygyVdTT@smile.fi.intel.com>
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

Hi Andy,

On Fri, 20 Jan 2023 18:00:02 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Jan 19, 2023 at 09:43:58AM +0100, Luca Ceresoli wrote:
> > On Wed, 18 Jan 2023 19:43:23 +0200
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > On Wed, Jan 18, 2023 at 07:28:20PM +0200, Tomi Valkeinen wrote:  
> > > > On 18/01/2023 18:01, Andy Shevchenko wrote:    
> > > > > On Wed, Jan 18, 2023 at 02:40:24PM +0200, Tomi Valkeinen wrote:    
> 
> ...
> 
> > > > Can you clarify what you mean here?
> > > > 
> > > > The i2c_clients are not aware of the i2c-atr. They are normal i2c clients.
> > > > The FPD-Link drivers are aware of the ATR, as the FPD-Link hardware contains
> > > > the ATR support.    
> > > 
> > > Can't that hardware be represented as I2C adapter? In such case the ATR specifics
> > > can be hidden from the client (drivers).
> > > 
> > > I'm worrying about code duplication and other things that leak into drivers as
> > > ATR callbacks.  
> > 
> > Which callbacks do you refer to? i2c_atr_ops? I don't think we can do
> > without the attach/detach_client ones, it's where the driver-specific
> > implementation is hooked for the generic ATR infra to call it.
> > 
> > However now I noticed the select/deselect ops are still there. IIRC
> > they are not used by any driver and in the past the plan was to just
> > remove them. Tomi, do you think there is a good reason to keep them?
> >   
> > > It might be that I didn't get how hw exactly functioning on this
> > > level and why we need those callbacks.  
> > 
> > As far as "how hw exactly works", in case you haven't seen that, the
> > best explanation I was able to give is in my ELCE 2019 talk, at minute
> > ~22. It's a 2-3 minute watch. The slides have pointers to other talks
> > and discussion.  
> 
> Probably I have missed the URL in the discussion, care to resend?

I hadn't sent any URL :)

Here's the shortcut to go straight to the ATR description:
https://youtu.be/7hLv6fYAW-E?t=1350

Slides:
https://elinux.org/images/f/fc/Ceresoli-elce2019-video-serdes-linux.pdf

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
