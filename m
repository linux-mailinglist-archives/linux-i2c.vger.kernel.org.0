Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55DD967B261
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 13:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbjAYMLN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 07:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234699AbjAYMLM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 07:11:12 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00315FE0;
        Wed, 25 Jan 2023 04:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674648671; x=1706184671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cuAj2WpziNFOg5adP48sEdhtbwxCAEmx2Zc1n71HQlU=;
  b=FXbLz+j9G6qq5sKo19wygtWddqFlEMbqUCkm64S3+dYbUp0EzNnbPh8D
   /zeLAHXYk0n6h0Z1NvWuowEap+J1F5yCH8kUplOFrsGnqfz6o2elUBTXa
   Qgm7mewh9erXDXkLx6i2fEDjzO2uVtPHHzL+QLKqLbVuH3YM18MTRuvgk
   jp+mR/Zdbx4So/Azmz4vmdGMbZmpgeXKBU/BZOfw2av1DGaSTo5mtFEvs
   s2w0W9i5peSaHq64kErPqj9e2YV2EZ3p3kEMKzoFh2DzksA2qluD7B9hk
   uh4wqemKQ69T4ulwPuOjguSZDNab+oKSJi+82O3LzavMEMZpXZMnEMH9s
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="326568108"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="326568108"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 04:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="692936140"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="692936140"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 25 Jan 2023 04:10:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pKec2-00Eq1L-2z;
        Wed, 25 Jan 2023 14:10:46 +0200
Date:   Wed, 25 Jan 2023 14:10:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v7 5/7] media: i2c: add DS90UB960 driver
Message-ID: <Y9EcRlooHwIjOqiZ@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-6-tomi.valkeinen@ideasonboard.com>
 <Y8gUuqLBXsXQoNUC@smile.fi.intel.com>
 <aba49d82-c76f-7ff2-751c-d1be7b8f3bca@ideasonboard.com>
 <Y8rFh6zO7Hp9mLxE@smile.fi.intel.com>
 <4286abe2-f23f-d4c9-ef18-f351af7a3a8b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4286abe2-f23f-d4c9-ef18-f351af7a3a8b@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 25, 2023 at 01:15:34PM +0200, Tomi Valkeinen wrote:
> On 20/01/2023 18:47, Andy Shevchenko wrote:

...

> > > > Esp. taking into account that some of them are using actually
> > > > post-inc. Why this difference?
> > > 
> > > Possibly a different person has written that particular piece of code, or
> > > maybe a copy paste from somewhere.
> > > 
> > > I'm personally fine with seeing both post and pre increments in code.
> > 
> > I'm not :-), if it's not required by the code. Pre-increment always puzzles
> > me: Is here anything I have to pay an additional attention to?
> 
> That is interesting, as to me pre-increment is the simpler, more obvious
> case. It's just:
> 
> v = v + 1
> v
> 
> Whereas post-increment is:
> 
> temp = v
> v = v + 1
> temp
> 
> In any case, we're side-tracking here, I think =).

Yes, just see the statistics of use below.

...

> > > > > +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
> > > > 
> > > > Post-inc?
> > > 
> > > I still like pre-inc =).
> > > 
> > > I see there's a mix os post and pre incs in the code. I'll align those when
> > > I encounter them, but I don't think it's worth the effort to methodically go
> > > through all of them to change them use the same style.
> > 
> > Kernel uses post-inc is an idiom for loops:
> > 
> > $ git grep -n -w '[_a-z0-9]\+++' | wc -l
> > 148693
> > 
> > $ git grep -n -w ' ++[a-z0-9_]\+' | wc -l
> > 8701
> > 
> > So, non-standard pattern needs to be explained.

> > > > > +	}

...

> > > > > +	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
> > > > > +	if (ret) {
> > > > > +		if (ret != -EINVAL) {
> > > > > +			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
> > > > > +				nport, ret);
> > > > > +			return ret;
> > > > > +		}
> > 
> > This seems like trying to handle special cases, if you want it to be optional,
> > why not ignoring all errors?
> 
> I don't follow. Why would we ignore all errors even if the property is
> optional? If there's a failure in reading the property, or checking if it
> exists or not, surely that's an actual error to be handled, not to be
> ignored?

What the problem to ignore them?

But if you are really pedantic about it, perhaps the proper way is to add

fwnode_property_*_optional()

APIs to the set where you take default and return 0 in case default had been
used for the absent property.

> > > > > +	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
> > > > > +		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n", nport,
> > > > > +			eq_level);
> > 
> > This part is a validation of DT again, but we discussed above this.
> > 
> > > > > +	} else {
> > > > > +		rxport->eq.manual_eq = true;
> > > > > +		rxport->eq.manual.eq_level = eq_level;
> > > > > +	}

...

> > > > > +struct ds90ub9xx_platform_data {
> > > > > +	u32 port;
> > > > > +	struct i2c_atr *atr;
> > > > > +	unsigned long bc_rate;
> > > > 
> > > > Not sure why we need this to be public except, probably, atr...
> > > 
> > > The port and atr are used by the serializers, for atr. The bc_rate is used
> > > by the serializers to figure out the clocking (they may use the FPD-Link's
> > > frequency internally).
> > 
> > The plain numbers can be passed as device properties. That's why the question
> > about platform data. Platform data in general is discouraged to be used in a
> > new code.
> 
> Device properties, as in, coming from DT?

From anywhere.

> The port could be in the DT, but
> the others are not hardware properties.

Why do we need them? For example, bc_rate.

> Yes, I don't like using platform data. We need some way to pass information
> between the drivers.

Device properties allow that and targeting to remove the legacy platform data
in zillions of the drivers.

> Maybe a custom FPD-Link bus could do that, but that's
> then going into totally new directions.

-- 
With Best Regards,
Andy Shevchenko


