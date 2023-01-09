Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFD3C6627C9
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 14:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234702AbjAINzx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 08:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234914AbjAINzt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 08:55:49 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B9E34D47;
        Mon,  9 Jan 2023 05:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673272547; x=1704808547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tGKHnAfBxD0cWgsYK90ScVvKbs945zzAa+okIcBUQCc=;
  b=WWn4ZPbIkg1X8LY0za3SWAx7qSnt0cyB2yGtOkR2byIMalWPiLABAlzN
   0ENz9NPxFHOgBIz97dtt4wHCAn/CfJ7jOrI0wLsBTSCLhEEwR2LyQETSv
   dZDFyXV8nQfDCCHoPAtkJquEJ66vy/C77qerLA5uf+MnStSrt65F8lzzY
   iyd8uyGsQa8IaR8uvdQtgMvCIXy0wWnAZHa+vhbOqVMbB443R6u5CKHgQ
   MPLnMFQgHestzjFt6PkCxiGwYdhpgCRKt+wSZznVJmoeCTA8VA27rBZbL
   8Motu+oP15oXn1Pv8zUNimmNxRZ8Qxa+Yqa3SKA9hV7qWBArz4PdokplP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="409118980"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="409118980"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 05:55:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="799032829"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="799032829"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2023 05:55:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pEscl-006VQL-0l;
        Mon, 09 Jan 2023 15:55:39 +0200
Date:   Mon, 9 Jan 2023 15:55:38 +0200
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
Message-ID: <Y7wc2lX8eGPITx30@smile.fi.intel.com>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-8-tomi.valkeinen@ideasonboard.com>
 <Y7pBSq49dL8Fzxsc@pendragon.ideasonboard.com>
 <Y7v1Wrma/Ev8KEzy@smile.fi.intel.com>
 <5173a16a-83c5-5cfe-f6ce-03e1c90e8790@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5173a16a-83c5-5cfe-f6ce-03e1c90e8790@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 09, 2023 at 02:59:01PM +0200, Tomi Valkeinen wrote:
> On 09/01/2023 13:07, Andy Shevchenko wrote:
> > On Sun, Jan 08, 2023 at 06:06:34AM +0200, Laurent Pinchart wrote:
> > > On Thu, Jan 05, 2023 at 04:03:06PM +0200, Tomi Valkeinen wrote:

...

> > > > +	gc->of_node = priv->client->dev.of_node;
> > 
> > We don't have of_node anymore in gc. And if the parent device is set, you can
> > drop this line (it will work with older and newer kernels. Otherwise, use
> > fwnode.
> 
> What do you mean "we don't have of_node anymore"?

There is no of_node member of struct gpio_chip anymore. This will fail
to compile.

-- 
With Best Regards,
Andy Shevchenko


