Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEAE64755D
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 19:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiLHSJW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 13:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiLHSJU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 13:09:20 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261D948774;
        Thu,  8 Dec 2022 10:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670522959; x=1702058959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=txh7YJKE0E8JOPXOa+vZqXWz/X+tUvda/1SL6EmUw3g=;
  b=c1lrqrVGN2hxJ/GTeiaCivOkDKi5mKXUu69wnNsUoOtx1z83iAYMS8iz
   34NuqXaHzeHpkvujvwfhT5ZgEmsQYQCxPMp90aJ93EQNPc+u3lbyzcGpt
   fXVXJgn2Bm8wU53/kVNfqRG64WYtWA32c62c2hMDqv/5h6MHuU6qpTQIc
   s7sJRvsEUeUZe0cvD35JgaJrCcm0O4EocJJW1S/DiB2khZlPcfMRQYDpq
   Xtlahcpzt8VQWjK4KcuBW6l+AOnEBNa5tK8R0F/jd30T1f7mhIKkwXJmD
   z79opurwlmC/KRGk22l5FVE3B/ePJJzlMOZVNdqfwVSk1es49FLXyB+4l
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="318407803"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="318407803"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 10:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="710574261"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="710574261"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 08 Dec 2022 10:09:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p3LKX-006WD8-32;
        Thu, 08 Dec 2022 20:09:09 +0200
Date:   Thu, 8 Dec 2022 20:09:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v5 2/8] i2c: add I2C Address Translator (ATR) support
Message-ID: <Y5IoRdxle8nbrK4U@smile.fi.intel.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-3-tomi.valkeinen@ideasonboard.com>
 <Y5HeRL6H5vEeDznl@smile.fi.intel.com>
 <e55d0aa0-e860-3510-2d2f-11486a23c3ea@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e55d0aa0-e860-3510-2d2f-11486a23c3ea@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 08, 2022 at 06:01:19PM +0200, Tomi Valkeinen wrote:
> On 08/12/2022 14:53, Andy Shevchenko wrote:
> > On Thu, Dec 08, 2022 at 12:40:00PM +0200, Tomi Valkeinen wrote:

...

> > > +	if (bus_handle) {
> > > +		device_set_node(&chan->adap.dev, fwnode_handle_get(bus_handle));
> > 
> > I believe the correct way, while above still works, is
> > 
> > 		device_set_node(&chan->adap.dev, bus_handle);
> > 		fwnode_handle_get(dev_fwnode(&chan->adap.dev));
> 
> Hmm, why is that correct? Shouldn't you give device_set_node() an fwnode
> that has been referenced?

You take a reference on the adap->dev and not on input. It's just a logical,
But as I said your variant still works.

> > But I agree that this looks a bit verbose. And...
> > 
> > > +	} else {
> > > +		struct fwnode_handle *atr_node;
> > > +		struct fwnode_handle *child;
> > > +		u32 reg;
> > > +
> > > +		atr_node = device_get_named_child_node(dev, "i2c-atr");
> > > +
> > > +		fwnode_for_each_child_node(atr_node, child) {
> > > +			ret = fwnode_property_read_u32(child, "reg", &reg);
> > > +			if (ret)
> > > +				continue;
> > > +			if (chan_id == reg)
> > > +				break;
> > > +		}
> > > +
> > > +		device_set_node(&chan->adap.dev, child);
> > 
> > ...OTOH, you set node with bumped reference here. So I leave all this to
> > the maintainers.
> > 
> > > +		fwnode_handle_put(atr_node);
> > > +	}

...

> > > +static inline void i2c_atr_set_clientdata(struct i2c_atr *atr, void *data)
> > > +{
> > > +	atr->priv = data;
> > > +}
> > > +
> > > +static inline void *i2c_atr_get_clientdata(struct i2c_atr *atr)
> > > +{
> > > +	return atr->priv;
> > > +}
> > 
> > The function names are misleading, because I would think this is about driver
> > data that has been set.
> > 
> > I would rather use name like
> > 
> > 	i2c_atr_get_priv()
> > 	i2c_atr_set_priv()
> 
> Indeed, set_clientdata is probably wrong. But i2c_atr_set_priv() sounds like
> it's private to the i2c-atr itself. Maybe i2c_atr_set_driver_data?

Works for me.

-- 
With Best Regards,
Andy Shevchenko


