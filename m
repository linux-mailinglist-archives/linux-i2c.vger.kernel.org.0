Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A140C69ACD3
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 14:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjBQNpo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 08:45:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjBQNpl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 08:45:41 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0119F5590;
        Fri, 17 Feb 2023 05:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676641540; x=1708177540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0bI4eu7CsGkpbAbTeeplt9TFcf3bqOc9S2sMj8KlvNs=;
  b=gkUGGhTWui7lPJvnP5+Drme2/AzBxD1pXx2Z2pHErj3yuXjqBXMeHFtQ
   VxOkT37TGWl5ndSwOgwYtNFpqVYGviHlTwGUYUNLbYY715Qo64eSWrw0l
   ubaAldEenZ/lX/cDjqX6iBvlX1mu3RGxVEGEzIncMFU0rObizMUcqAsEu
   UAGM3JwNpN5N7hN07E/iTwOPcMB4e4ZxzDiQ/qD2aw3G7o8aMA1jEx9Fg
   2LXC3zdZjCFrb7gkaTXTp5QTj/zp5EdAPwPcU6MLcK0tVofZE+YOGTFmM
   3wD0pageQnMci0ojr1xGdC+HeFCiojdMnnEqdA5hC5da2CwEGRSSoJb4C
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="359437736"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="359437736"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 05:45:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670546804"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="670546804"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 17 Feb 2023 05:45:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pT13J-008EHk-24;
        Fri, 17 Feb 2023 15:45:29 +0200
Date:   Fri, 17 Feb 2023 15:45:29 +0200
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
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v9 0/8] i2c-atr and FPDLink
Message-ID: <Y++E+Rr54p3vd8Jn@smile.fi.intel.com>
References: <20230216140747.445477-1-tomi.valkeinen@ideasonboard.com>
 <Y+5Rb17FTG4IxcE0@smile.fi.intel.com>
 <e4141652-53c0-fce1-dac7-5da5368e2240@ideasonboard.com>
 <Y+9j3cYOG+Z0zmyC@smile.fi.intel.com>
 <9f3f0744-f771-cd2c-3b8e-5b79f7a430c7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f3f0744-f771-cd2c-3b8e-5b79f7a430c7@ideasonboard.com>
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

On Fri, Feb 17, 2023 at 02:57:02PM +0200, Tomi Valkeinen wrote:
> On 17/02/2023 13:24, Andy Shevchenko wrote:
> > On Fri, Feb 17, 2023 at 08:57:32AM +0200, Tomi Valkeinen wrote:
> > > On 16/02/2023 17:53, Andy Shevchenko wrote:
> > > > On Thu, Feb 16, 2023 at 04:07:39PM +0200, Tomi Valkeinen wrote:

...

> > > > >    	struct i2c_board_info ser_info = {
> > > > > -		.of_node = to_of_node(rxport->remote_fwnode),
> > > > > -		.fwnode = rxport->remote_fwnode,
> > > > 
> > > > > +		.of_node = to_of_node(rxport->ser.fwnode),
> > > > > +		.fwnode = rxport->ser.fwnode,
> > > > 
> > > > Why do you need to have both?!
> > > 
> > > I didn't debug it, but having only fwnode there will break the probing (no
> > > match).
> > 
> > This needs to be investigated. The whole fwnode approach, when we have both
> > fwnode and legacy of_node fields in the same data structure, is that fwnode
> > _OR_ of_node initialization is enough, when both are defined the fwnode
> > should take precedence.
> > 
> > If your testing is correct (and I have no doubts) it means we have a serious
> > bug lurking somewhere.
> 
> Having both defined or only of_node defined works for me.

But of_node is _legacy_ stuff. We should not really consider this option in the
new code.

> Perhaps the issue is that these drivers only add of_match_table, and thus
> having only .fwnode above is not enough.

No, the code should work with fwnode that carrying DT node or another.
The matching table shouldn't affect this either.

> Looking at i2c_device_match(), i2c_of_match_device() only uses of_node, so
> perhaps I would need CONFIG_ACPI for acpi_driver_match_device to do matching
> with of_node? Although I don't see the acpi code using fwnode, just of_node.
> Well, I have to say I have no idea without spending more time on this.

Again, there is a bug and that bug seems nasty one as it would allow to
work the device in one environment and not in another.

Since it's about I²C board files, I believe that an issue is in I²C core.

> > > > >    		.platform_data = ser_pdata,
> > > > >    	};

...

> > > > 		cur_vc = desc.entry[0].bus.csi2.vc;
> > > > 
> > > > > +		for (i = 0; i < desc.num_entries; ++i) {
> > > > > +			u8 vc = desc.entry[i].bus.csi2.vc;
> > > > 
> > > > > +			if (i == 0) {
> > > > > +				cur_vc = vc;
> > > > > +				continue;
> > > > > +			}
> > > > 
> > > > This is an invariant to the loop, see above.
> > > 
> > > Well, the current code handles the case of num_entries == 0. I can change it
> > > as you suggest, and first check if num_entries == 0 and also start the loop
> > > from 1.
> > 
> > You may try to compile both variants and see which one gets lets code.
> > I believe it will be mine or they are equivalent in case compiler is clever
> > enough to recognize the invariant.
> 
> But your suggestion accesses desc.entry[0] even if there are no entries,
> accessing possibly uninitialized memory. In that case it doesn't use it for
> anything, but at least I find that kind of code worrying.

Yes you probably will need a 0 case to be handled separately. I was and
is not objecting this.

> > > > > +			if (vc == cur_vc)
> > > > > +				continue;
> > > > > +
> > > > > +			dev_err(&priv->client->dev,
> > > > > +				"rx%u: source with multiple virtual-channels is not supported\n",
> > > > > +				nport);
> > > > > +			return -ENODEV;
> > > > > +		}

...

> > Up to you, but this just a good example why I do not like how optional
> > properties are handled in a "smart" way.
> > 
> > To me
> > 
> > 	foo = DEFAULT;
> > 	_property_read_(&foo); // no error checking
> > 
> > is clean, neat, small and good enough solution.
> 
> Yes, if you have a default. I don't.

It can't be true. If you have an optional property you always have a default
even if you are not using it (let's call it special case).

	foo_present = property_present();
	property_read(&foo_val);

	...

	if (foo_present) {
		// do something with foo_val
	}

The boolean variable is needed when the range of the foo_val takes all possible
values of the type (u32?). Otherwise you always can define a magic that will
tell you "okay, this is not in use". Of course having boolean always is also
fine.

> I could add a new magic number for the
> eq_level which means not-defined and use it as a default, but I don't
> usually like default values which are not 0. Here I have the manual_eq
> boolean to tell if we're using manual EQ or not.

Oh, this is similar that I described above.

But as I said, you can keep your initial version, it's up to you and
maintainers to cope with that (uglification).

-- 
With Best Regards,
Andy Shevchenko


