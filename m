Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDEB369AA3D
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 12:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjBQLYY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 06:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjBQLYX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 06:24:23 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6E6642DF;
        Fri, 17 Feb 2023 03:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676633062; x=1708169062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RUHMDt6eHewLs7RsR6DcPytDd6NJdHekltVoH/mlQGQ=;
  b=jcZRPPKfGcl40TQJMrm2S+EnXIyDu4DnF4NM/yODAG1Wj438KFO3+qCp
   pI7KK3FGdc8FPQy6UqQ6ytGpzPrHRysCdowkFvNucbUtAvj9XKo/jHIoW
   qVH88DQLH+WfJNi/4U531BYkB4hQfzb58RinIBzCgk3rLqUURJpvCnBFX
   monx3F6yYZAFkeciS8IzVzB2OAtqqjvJHuTlOI6gyNh7eXHIUEqE9Xhig
   fau7MJxZqvp6RHHQy2aPEoGPqRG9Ao7a+pgpHSQHnh7m3aowyFKBdosIp
   2SoneeDj/f4lymuK1rIVlSj2kSJoZn5FEGUMi55sZyEqFaUUPeIsPTbPH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331967805"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="331967805"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:24:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="916047677"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="916047677"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 17 Feb 2023 03:24:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pSyqb-008BAc-2C;
        Fri, 17 Feb 2023 13:24:13 +0200
Date:   Fri, 17 Feb 2023 13:24:13 +0200
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
Message-ID: <Y+9j3cYOG+Z0zmyC@smile.fi.intel.com>
References: <20230216140747.445477-1-tomi.valkeinen@ideasonboard.com>
 <Y+5Rb17FTG4IxcE0@smile.fi.intel.com>
 <e4141652-53c0-fce1-dac7-5da5368e2240@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4141652-53c0-fce1-dac7-5da5368e2240@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Feb 17, 2023 at 08:57:32AM +0200, Tomi Valkeinen wrote:
> On 16/02/2023 17:53, Andy Shevchenko wrote:
> > On Thu, Feb 16, 2023 at 04:07:39PM +0200, Tomi Valkeinen wrote:

...

> > >   	struct i2c_board_info ser_info = {
> > > -		.of_node = to_of_node(rxport->remote_fwnode),
> > > -		.fwnode = rxport->remote_fwnode,
> > 
> > > +		.of_node = to_of_node(rxport->ser.fwnode),
> > > +		.fwnode = rxport->ser.fwnode,
> > 
> > Why do you need to have both?!
> 
> I didn't debug it, but having only fwnode there will break the probing (no
> match).

This needs to be investigated. The whole fwnode approach, when we have both
fwnode and legacy of_node fields in the same data structure, is that fwnode
_OR_ of_node initialization is enough, when both are defined the fwnode
should take precedence.

If your testing is correct (and I have no doubts) it means we have a serious
bug lurking somewhere.

> > >   		.platform_data = ser_pdata,
> > >   	};

...

> > 		cur_vc = desc.entry[0].bus.csi2.vc;
> > 
> > > +		for (i = 0; i < desc.num_entries; ++i) {
> > > +			u8 vc = desc.entry[i].bus.csi2.vc;
> > 
> > > +			if (i == 0) {
> > > +				cur_vc = vc;
> > > +				continue;
> > > +			}
> > 
> > This is an invariant to the loop, see above.
> 
> Well, the current code handles the case of num_entries == 0. I can change it
> as you suggest, and first check if num_entries == 0 and also start the loop
> from 1.

You may try to compile both variants and see which one gets lets code.
I believe it will be mine or they are equivalent in case compiler is clever
enough to recognize the invariant.

> > > +			if (vc == cur_vc)
> > > +				continue;
> > > +
> > > +			dev_err(&priv->client->dev,
> > > +				"rx%u: source with multiple virtual-channels is not supported\n",
> > > +				nport);
> > > +			return -ENODEV;
> > > +		}

...

> > > +	for (i = 0; i < 6; ++i)
> > >   		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
> > >   	id[6] = 0;
> > 
> > Wondering if this magic can be defined.
> 
> The number of ID registers? Yes, I can add a define.

Yes.

...

...

> > >   	if (ret) {
> > >   		if (ret != -EINVAL) {
> > > -			dev_err(dev,
> > > -				"rx%u: failed to read 'ti,strobe-pos': %d\n",
> > > -				nport, ret);
> > > +			dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
> > > +				"ti,strobe-pos", ret);
> > >   			return ret;
> > >   		}
> > >   	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
> > > @@ -3512,8 +3403,8 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
> > >   	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
> > >   	if (ret) {
> > >   		if (ret != -EINVAL) {
> > > -			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
> > > -				nport, ret);
> > > +			dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
> > > +				"ti,eq-level", ret);
> > >   			return ret;
> > >   		}
> > >   	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
> > 
> 
> Hmm, I noticed this one (and the one above) was missing return -EINVAL.
> 
> > Seems like you may do (in both cases) similar to the above:
> > 
> > 	var = 0;
> > 	ret = read_u32();
> > 	if (ret && ret != -EINVAL) {
> > 		// error handling
> > 	}
> > 	if (var > limit) {
> > 		// another error handling
> > 	}
> 
> That's not the same. You'd also need to do:
> 
> if (!ret) {
> 	// handle the retrieved value
> }
> 
> which, I think, is not any clearer (perhaps more unclear).
> 
> What I could do is:
> 
> if (ret) {
> 	if (ret != -EINVAL) {
> 		dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
> 			"ti,eq-level", ret);
> 		return ret;
> 	}
> } else {
> 	if (eq_level > UB960_MAX_EQ_LEVEL) {
> 		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n",
> 			nport, eq_level);
> 		return -EINVAL;
> 	}
> 
> 	rxport->eq.manual_eq = true;
> 	rxport->eq.manual.eq_level = eq_level;
> }
> 
> Maybe the above style makes it clearer, as it clearly splits the "don't have
> value" and "have value" branches.

Up to you, but this just a good example why I do not like how optional
properties are handled in a "smart" way.

To me

	foo = DEFAULT;
	_property_read_(&foo); // no error checking

is clean, neat, small and good enough solution.

...

> > > +	static const char *vpoc_names[UB960_MAX_RX_NPORTS] = { "vpoc0", "vpoc1",
> > > +							       "vpoc2", "vpoc3" };
> > 
> > Wouldn't be better to format it as
> > 
> > 	static const char *vpoc_names[UB960_MAX_RX_NPORTS] = {
> > 		"vpoc0", "vpoc1", "vpoc2", "vpoc3",
> > 	};
> > 
> > ?
> 
> Clang-format disagrees, but I agree with you ;).

So it needs to be fixed then :-)
Glad that you agreed on this.

-- 
With Best Regards,
Andy Shevchenko


