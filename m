Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9CE6BE8E7
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 13:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjCQMMF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 08:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjCQMME (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 08:12:04 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE83A6BC3;
        Fri, 17 Mar 2023 05:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679055122; x=1710591122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IydmJs9AvmFek7/Hmnwkw3N3sjHYmige7U7d0Jyg07s=;
  b=LyzK+ah8uEr4yBO20uSGJLgtdRUa4jntkv3tuRGBlQMookDc/r5gyi50
   8VPm8j3Tr5u9mBzui13Cnl/i3+gS5YJqGU7hOr/vChe1Wqc+xOEWlj8of
   j85fphkSTBTVh34ojkcswN/FhpxZYqaquiqRqSffaJn8iig6xQ/z6j517
   GBfb/DzS+H5tCq+Ob3/YU6r9Plj982w0VhuHdhUx05b/eeCWSCUGFYx4B
   D6aqsMoSpfzIjGn07V4R87Q4zozbISexowUc8y9xouxj3kZrnOBhpdl7e
   pA70zGpBu4ymEUbSIb1adPxJVtGV5kd+WCaV2Fkvgzq7Ih+yrG/sVQma7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="336945920"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="336945920"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 05:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="630268231"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630268231"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 05:11:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pd8w4-0050up-2R;
        Fri, 17 Mar 2023 14:11:52 +0200
Date:   Fri, 17 Mar 2023 14:11:52 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Wolfram Sang <wsa@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v10 1/8] i2c: add I2C Address Translator (ATR) support
Message-ID: <ZBRZCHM4rI9Csvib@smile.fi.intel.com>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
 <20230222132907.594690-2-tomi.valkeinen@ideasonboard.com>
 <20230317101606.69602bba@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317101606.69602bba@booty>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 17, 2023 at 10:16:06AM +0100, Luca Ceresoli wrote:
> Hi Tomi, Wolfram,
> On Wed, 22 Feb 2023 15:29:00 +0200
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> > From: Luca Ceresoli <luca@lucaceresoli.net>

...

> > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Wolfram, I think Tomi improved this work as much as currently possible
> and this patch now looks extremely good to me. I wish we had this in
> mainline soon. Does it make sense for me to send a Reviewed-by tag,
> given I already have a S-o-b one?

I believe documentation is in favour that standalone SoB suffice.
Especially when you are the author (From line) the Rb makes no
sense to me.

...

> > +/**
> > + * struct i2c_atr - The I2C ATR instance
> > + * @parent:    The parent &struct i2c_adapter
> > + * @dev:       The device that owns the I2C ATR instance
> > + * @ops:       &struct i2c_atr_ops
> > + * @priv:      Private driver data, set with i2c_atr_set_driver_data()
> > + * @algo:      The &struct i2c_algorithm for adapters
> > + * @lock:      Lock for the I2C bus segment (see &struct i2c_lock_operations)
> > + * @max_adapters: Maximum number of adapters this I2C ATR can have
> > + * @adapter:   Array of adapters
> > + */
> > +struct i2c_atr {
> > +	struct i2c_adapter *parent;
> > +	struct device *dev;
> > +	const struct i2c_atr_ops *ops;
> > +
> > +	void *priv;
> > +
> > +	struct i2c_algorithm algo;
> > +	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
> 
> This comment is identical to the one in the kerneldoc comments just
> above, I'd just remove it.
> 
> > +	struct mutex lock;
> > +	int max_adapters;
> > +
> > +	struct notifier_block i2c_nb;
> 
> Undocumented?

`kernel-doc -v` should actually catch this up.

-- 
With Best Regards,
Andy Shevchenko


