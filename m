Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60F0672531
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 18:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjARRkK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 12:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbjARRj5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 12:39:57 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA1C45238;
        Wed, 18 Jan 2023 09:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674063596; x=1705599596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vGFQg5vQ2tBuxQdDvjqjjggEnx6mFCJZT90tdFoRLCM=;
  b=jEC0hPrYKGs0/H9OS0O/EYN6vdp+o614bFwIwW0tsJPwD4wKCtS/LaEj
   VMYu6z8dfpbGlpeTcj/zbInzdMK+eoVmp7l+eaCx3rVfctRQ1+SiBhhLa
   Dn2iR9awHx0o7HjuJXOSJuWIUrb4RbLTbaQ9TsRD6HKEzymiLYL2XZIrn
   n1xle0x+KTKxqihq8NkmnaBb9KJra54MVKJh9uGa6elm3gP0ujydw1Y7U
   m9+qF8Z0xiSQ7DxLlN+najdWUGxEjylYS1fLOQ30YX3XsewLOHShM9uUY
   kajRed1Jk0qwOv85WNXiwYzoYhZ15QAvGzJtrE4Gf/3wS2XzZYHc7bSlK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323732911"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="323732911"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 09:39:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="659881433"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="659881433"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 18 Jan 2023 09:39:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pICPb-00BIio-0o;
        Wed, 18 Jan 2023 19:39:47 +0200
Date:   Wed, 18 Jan 2023 19:39:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
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
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v7 1/7] i2c: add I2C Address Translator (ATR) support
Message-ID: <Y8gu4mlXUlyiFKZD@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-2-tomi.valkeinen@ideasonboard.com>
 <Y8gA+cz9m7PaEhfP@smile.fi.intel.com>
 <20230118181753.7a325953@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118181753.7a325953@booty>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 18, 2023 at 06:17:53PM +0100, Luca Ceresoli wrote:
> On Wed, 18 Jan 2023 16:23:53 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

...

> > > +A typical example follows.
> > > +
> > > +Topology::
> > > +
> > > +                      Slave X @ 0x10
> > > +              .-----.   |
> > > +  .-----.     |     |---+---- B
> > > +  | CPU |--A--| ATR |
> > > +  `-----'     |     |---+---- C
> > > +              `-----'   |
> > > +                      Slave Y @ 0x10
> > > +
> > > +Alias table:
> > > +
> > > +.. table::
> > > +
> > > +   ======   =====
> > > +   Client   Alias
> > > +   ======   =====
> > > +   X        0x20
> > > +   Y        0x30
> > > +   ======   =====
> > > +
> > > +Transaction:
> > > +
> > > + - Slave X driver sends a transaction (on adapter B), slave address 0x10
> > > + - ATR driver rewrites messages with address 0x20, forwards to adapter A
> > > + - Physical I2C transaction on bus A, slave address 0x20
> > > + - ATR chip propagates transaction on bus B with address translated to 0x10
> > > + - Slave X chip replies on bus B
> > > + - ATR chip forwards reply on bus A
> > > + - ATR driver rewrites messages with address 0x10
> > > + - Slave X driver gets back the msgs[], with reply and address 0x10  
> > 
> > I'm not sure I got the real / virtual status of the adapters. Are the B and C
> > virtual ones, while A is the real?
> 
> Let me reply, as I wrote these docs back at the times and thus I feel
> guilty in case that's unclear. :)
> 
> I don't like the word "virtual" in this situation. A, B and C are all
> physical busses, made of copper and run by electrons on PCBs. B and C
> are the "remote" or "downstream" busses (w.r.t. the CPU), where the i2c
> devices are and where transactions happen using the address that the
> chip responds to. A is the "local" or "upstream" bus that is driven
> directly by the CPU (*) and where address aliases are used. Using
> aliases there is necessary because using address 0x10 would be
> ambiguous as there are two 0x10 chips out there.
> 
> (*) There could be more layers of course, but still A is "closer to the
> CPU than B and C", for the sake of completeness.

Can the diagram and/or text be updated to elaborate this?

...

> > > +void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data)
> > > +{
> > > +	atr->priv = data;
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, I2C_ATR);
> > > +
> > > +void *i2c_atr_get_driver_data(struct i2c_atr *atr)
> > > +{
> > > +	return atr->priv;
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, I2C_ATR);  
> > 
> > Just to be sure: Is it really _driver_ data and not _device instance_ data?
> 
> It is device instance data indeed. I don't remember why this got
> changed, but in v3 it was i2c_atr_set_clientdata().

It's me who was and is against calling it clientdata due to possible
confusion with i2c_set/get_clientdata() that is about *driver data*.
I missed that time the fact that this is about device instance data.
I dunno which name would be better in this case, i2c_atr_set/get_client_priv() ?

-- 
With Best Regards,
Andy Shevchenko


