Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24AB17353D3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 12:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbjFSKtE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 06:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjFSKsg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 06:48:36 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0A010D2;
        Mon, 19 Jun 2023 03:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687171705; x=1718707705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=K+lZ9WFPMWC3ASBG9Jy2Zl4Eqf7XwfhBA2UB45dFP10=;
  b=PFGJolF4yuqxkgaUfQ34h3kccExoL3V/rd7gm1F8Yh8+5lYqLeTjROMW
   sDNiWFXfbKQMZi3+sytTlYvSfziBNMOKhe8tg/rqP6RL1HAjExz3bVYpY
   64rg11ZGaPlwDJtpMqv/fGltZIw5+JZm0zl42Pvctptp1wtDmDe8PsUC1
   00bd6gO+ayhBgD2EAzLwNRmyyU6BSozHYh41XIcuJHpjCI1h+cj7yUadh
   DXYS+56XsBMoffd28ZoSXnSUX9efqyVJ2z76KclJTGhQKIRiYn5wYpVe/
   PvSL9eYTVNxr9A82gKE9vZPBaeEqg9FRZ55WbnYXT70BviQizOzqt5u1C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="358473824"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="358473824"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 03:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="663943226"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="663943226"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 19 Jun 2023 03:48:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qBCQh-004yAN-2o;
        Mon, 19 Jun 2023 13:48:15 +0300
Date:   Mon, 19 Jun 2023 13:48:15 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v14 18/18] media: i2c: ds90ub953: Support non-sync mode
Message-ID: <ZJAyb9WHjWrdSsBw@smile.fi.intel.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-19-tomi.valkeinen@ideasonboard.com>
 <ZIx17WC7plfDPpmc@smile.fi.intel.com>
 <dc79de4e-4043-5448-db44-ef8f7749a376@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc79de4e-4043-5448-db44-ef8f7749a376@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 19, 2023 at 12:00:57PM +0300, Tomi Valkeinen wrote:
> On 16/06/2023 17:47, Andy Shevchenko wrote:
> > On Fri, Jun 16, 2023 at 04:59:22PM +0300, Tomi Valkeinen wrote:
> > > Add support for FPD-Link non-sync mode with external clock. The only
> > > thing that needs to be added is the calculation for the clkout.

...

> > > +	switch (priv->mode) {
> > > +	case UB953_MODE_SYNC:
> > > +		if (priv->hw_data->is_ub971)
> > > +			return priv->plat_data->bc_rate * 160ull;
> > > +		else
> > > +			return priv->plat_data->bc_rate / 2 * 160ull;
> > 
> > Redundant 'else'.
> 
> True, but I like the symmetry in:
> 
> if (foo)
> 	return 123;
> else
> 	return 321;

At the same time it will be symmetry with other switch-case(s). That's why the
question about fallthrough below.

> > Do I understand correctly you don't want to fallthrough because it will give
> > ±160 in the rate (depending if it's even or odd)?
> 
> Sorry, can you clarify? Fallthrough to what?

To the below case since '/ 2 * 160 ~= *80'. Why ~ because it might give
off-by-one error due to even/odd input.

> > > +	case UB953_MODE_NONSYNC_EXT:
> > > +		/* CLKIN_DIV = 1 always */
> > > +		return clk_get_rate(priv->clkin) * 80ull;

-- 
With Best Regards,
Andy Shevchenko


