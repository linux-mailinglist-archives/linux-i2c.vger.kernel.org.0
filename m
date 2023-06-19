Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E05773537E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 12:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjFSKqN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 06:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjFSKpq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 06:45:46 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B105D7;
        Mon, 19 Jun 2023 03:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687171522; x=1718707522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j50suO6EXOz8Oo186nH+IrtVagP+D115no47h3wo7UU=;
  b=NtmXgZ6SYKmYYxENFPLAAPqAtgC6lx3j821ZBuuRQjHKa9hyBeZTDpsB
   C3OqCr1/GB2fL1ylBluGLMRmlvbVzJN3R6VPtXg1fBXzO46n04irhKdvC
   juLIEh+mg72XJjdhpGIlQbLCAVWo2fgZX/XABxrho6ApxJL6WkAD2CneU
   0j26I20Z+X1F0/kcfhLrXbvNxHz7pS/77NQZfjt3DG5kwEHdxkdU1Hwx4
   diNXLbkCnA+XFAivphJ3WbieWH+7EdJhh41Yf0oM/hVfJECs0M7BZg1pU
   hulr4IYzqOkEI9R7y5ZVin1a/aGeNOQcBcuemfaJvpB83X17OkNSgqbej
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="363024614"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="363024614"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 03:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="713623657"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="713623657"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 19 Jun 2023 03:44:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qBCNU-004y7U-2k;
        Mon, 19 Jun 2023 13:44:56 +0300
Date:   Mon, 19 Jun 2023 13:44:56 +0300
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
Subject: Re: [PATCH v14 17/18] media: i2c: ds90ub953: Restructure clkout
 management
Message-ID: <ZJAxqFuJ/Tj5dIT8@smile.fi.intel.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-18-tomi.valkeinen@ideasonboard.com>
 <ZIxzsUbuUz3ysA31@smile.fi.intel.com>
 <002e0475-23dd-5106-6f5c-e4b50a0c506f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002e0475-23dd-5106-6f5c-e4b50a0c506f@ideasonboard.com>
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

On Mon, Jun 19, 2023 at 01:14:34PM +0300, Tomi Valkeinen wrote:
> On 16/06/2023 17:37, Andy Shevchenko wrote:
> > On Fri, Jun 16, 2023 at 04:59:21PM +0300, Tomi Valkeinen wrote:
> > > Separate clkout calculations and register writes into two functions:
> > > ub953_calc_clkout_params and ub953_write_clkout_regs, and add a struct
> > > ub953_clkout_data that is used to store the clkout parameters.

...

> > > +struct ub953_clkout_data {
> > > +	u32 hs_div;
> > > +	u32 m;
> > > +	u32 n;
> > 
> > Please, use struxt u32_fract instead of m/n.
> 
> I'm not sure how that helps. The documentation talks about m and n. Using
> different terms will make it more difficult to compare the code and the
> docs.

You can always add a comment.

(For example in drivers/clk/clk-fractional-divider.c our documentation also
 says about m/n, but most of the people understands that this is about
 fractional divider and actually with properly spelled parameters it will
 help others who are not experts in the CLK hardware.)

-- 
With Best Regards,
Andy Shevchenko


