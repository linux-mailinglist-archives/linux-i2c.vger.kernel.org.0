Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCAFF662823
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 15:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234441AbjAIOMc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 09:12:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233436AbjAIOMb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 09:12:31 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5279AC759;
        Mon,  9 Jan 2023 06:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673273550; x=1704809550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WF/p3vB0hiEJUpyYkHmfUFHXkAD91rnyRTjUtgjf87k=;
  b=gRYZNAlQ9xFG5urumvB4ZYYQVoKlYy/2mUd9dDQzoDhBdZf/i+WULsIi
   RVhLed7qHYar+9+lbI9xtGLjn2osTSwBcv/kihHkBAsVDfKZBxxZxG1bf
   qBFZFzR9w8vu3KuFyOcKaxzwhJ4tyJT6GpmQC0gGW2mat8zIbt4ppo0iA
   U7FolQ9oSo1Ofallh4pkU+bIoUz31+vt37F/LXOSbHpPMuscUYCRgd90k
   P6RYMbLS1KcXm9GQ+7xyJ9qYPU8BAAeV00hDVXHCeBuwyz0AKiSBizkXi
   kZKyaZBJw7ogTE2UZHI2zl6E2/3pqedcfjLkmj4UoZoE4MHk7VnlMcB4A
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="385182573"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="385182573"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 06:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="780693032"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="780693032"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 09 Jan 2023 06:11:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pEssL-006Vn7-26;
        Mon, 09 Jan 2023 16:11:45 +0200
Date:   Mon, 9 Jan 2023 16:11:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
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
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v6 7/8] media: i2c: add DS90UB913 driver
Message-ID: <Y7wgoXhWN7Ro3d/0@smile.fi.intel.com>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-8-tomi.valkeinen@ideasonboard.com>
 <Y7pBSq49dL8Fzxsc@pendragon.ideasonboard.com>
 <Y7v1Wrma/Ev8KEzy@smile.fi.intel.com>
 <5173a16a-83c5-5cfe-f6ce-03e1c90e8790@ideasonboard.com>
 <Y7wc2lX8eGPITx30@smile.fi.intel.com>
 <Y7wdePnmFx1XDGvB@smile.fi.intel.com>
 <10d369c1-4aaf-f59d-dbdc-48f04424a030@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10d369c1-4aaf-f59d-dbdc-48f04424a030@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 09, 2023 at 04:01:43PM +0200, Tomi Valkeinen wrote:
> On 09/01/2023 15:58, Andy Shevchenko wrote:
> > On Mon, Jan 09, 2023 at 03:55:39PM +0200, Andy Shevchenko wrote:
> > > On Mon, Jan 09, 2023 at 02:59:01PM +0200, Tomi Valkeinen wrote:
> > > > On 09/01/2023 13:07, Andy Shevchenko wrote:
> > > > > On Sun, Jan 08, 2023 at 06:06:34AM +0200, Laurent Pinchart wrote:
> > > > > > On Thu, Jan 05, 2023 at 04:03:06PM +0200, Tomi Valkeinen wrote:

...

> > > > > > > +	gc->of_node = priv->client->dev.of_node;
> > > > > 
> > > > > We don't have of_node anymore in gc. And if the parent device is set, you can
> > > > > drop this line (it will work with older and newer kernels. Otherwise, use
> > > > > fwnode.
> > > > 
> > > > What do you mean "we don't have of_node anymore"?
> > 
> > Just to add that you missed "gc" in the quote which is crucial to get
> > what I meant.
> 
> Well, the original text was just above...

Yes, but my point is that that part is crucial and since you left it out makes
me think that you are talking about general of_node, which is of course won't
gone any time soon :-)

> > > There is no of_node member of struct gpio_chip anymore. This will fail
> > > to compile.
> 
> It's in Linus' tree, but yes, now that I fetched linux-next I see it's gone.

Right. I expressed to Bart to include that change into one of the rcX, but he
decided to go for next. Dunno how many cases like yours we may experience in
this cycle.

-- 
With Best Regards,
Andy Shevchenko


