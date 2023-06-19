Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4B77355BF
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 13:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231521AbjFSL2a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 07:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjFSL22 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 07:28:28 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854DF1700;
        Mon, 19 Jun 2023 04:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687174080; x=1718710080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xf23/MtYveY8JP522ZK351WjL956r9eMqWGHw9Q7TQQ=;
  b=BJ+0+MxIIUvp6uweH/WPwDpP0DWKMr/HntxQXEgyb2ezWu4rxNE8ahPt
   AXvsUsjPdxzTpy4JemEh/Ng2VrhX73pRHCUynRd3FMeMd1sOT5e5cfYnW
   uDhmaz+w3bGmNnY+1pQ8k7V9uKuG08uIsU0y6JYbb9sxtjO65w0fW6fv5
   ym3AUq0qG81mYQEzMBaxfmqaK250IVnQPyBC6o77nHuXCjmX7g+lzG5VC
   JFULYN66FHVHTVFKE4D8Cut0vmgJs2po9eule6CiwBKCWEaYX1zn1WYEE
   Nvj1EeO+pyrteqZVI8KcP3utj/GUqAX+dMDMv2jwKIXr6tJNBoy14BHOz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="349328375"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="349328375"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 04:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="826562710"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="826562710"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2023 04:27:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qBD31-004ync-2q;
        Mon, 19 Jun 2023 14:27:51 +0300
Date:   Mon, 19 Jun 2023 14:27:51 +0300
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
Message-ID: <ZJA7t6KwEipAX494@smile.fi.intel.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-18-tomi.valkeinen@ideasonboard.com>
 <ZIxzsUbuUz3ysA31@smile.fi.intel.com>
 <002e0475-23dd-5106-6f5c-e4b50a0c506f@ideasonboard.com>
 <ZJAxqFuJ/Tj5dIT8@smile.fi.intel.com>
 <3e915435-b4d0-e792-6bdc-02bbf8f08362@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e915435-b4d0-e792-6bdc-02bbf8f08362@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 19, 2023 at 02:11:09PM +0300, Tomi Valkeinen wrote:
> On 19/06/2023 13:44, Andy Shevchenko wrote:
> > On Mon, Jun 19, 2023 at 01:14:34PM +0300, Tomi Valkeinen wrote:
> > > On 16/06/2023 17:37, Andy Shevchenko wrote:
> > > > On Fri, Jun 16, 2023 at 04:59:21PM +0300, Tomi Valkeinen wrote:

...

> > > > > +struct ub953_clkout_data {
> > > > > +	u32 hs_div;
> > > > > +	u32 m;
> > > > > +	u32 n;
> > > > 
> > > > Please, use struxt u32_fract instead of m/n.
> > > 
> > > I'm not sure how that helps. The documentation talks about m and n. Using
> > > different terms will make it more difficult to compare the code and the
> > > docs.
> > 
> > You can always add a comment.
> > 
> > (For example in drivers/clk/clk-fractional-divider.c our documentation also
> >   says about m/n, but most of the people understands that this is about
> >   fractional divider and actually with properly spelled parameters it will
> >   help others who are not experts in the CLK hardware.)
> 
> Yes, I would agree with you if this was a generic piece of code, but I don't
> see the reasoning as valid as this is specific to a piece of hardware. Here,
> I think, matching the code to the HW documentation is more important than
> possibly making the code more understandable to people who are not familiar
> with the HW.
> 
> Especially as for non-English people seeing "numerator" and "denominator"
> might require a check to figure out which one is which, whereas m and n are
> (I would guess) a bit more universal (or maybe it's just me).

I think for unprepared user the English plain words are simpler,
or maybe it's just me.

At least we have a strong disagreement here, seems :-)

-- 
With Best Regards,
Andy Shevchenko


