Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2CE69F649
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Feb 2023 15:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbjBVORa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Feb 2023 09:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjBVORa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Feb 2023 09:17:30 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 324473644F;
        Wed, 22 Feb 2023 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677075449; x=1708611449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=83gHjeOPJy/ebwA63jpSgxtLzSZQQNepSc+M+FuDWxU=;
  b=F3r0ojh/qT/FqCuSz97dwXQrRhpyCv9luSJbPKLCNfH8B3eZuNblZq1U
   F9/5N9LSchFjZF1vvQFZvCwVgLcoyXHx1bjW79su6kXUfXJyjoHEq//M6
   xcu+/ZTvmjxCdT5PvIEow7jWdPY3B3XL7TEuff/H32O4CtUddqACOWhax
   WnYY4wBjNWUP0bvthdMqWyQPxA38T7lbAZqNWcLlS0ZjWEtPvOV0gqJVf
   Uw5R1QCK8bFdFd6/rNmJmvsy0r3u9GtaYxiAYbXBlHxToDqIsBDwuUjQJ
   STvucOvMrqzhJLkayWjeAYHfnPNGTaDjDrwqVnAZv8uyV3HaDFQ6ij3wl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="330661306"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="330661306"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 06:17:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="814948241"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="814948241"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2023 06:17:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pUpvs-00ARUf-2E;
        Wed, 22 Feb 2023 16:17:20 +0200
Date:   Wed, 22 Feb 2023 16:17:20 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v10 0/8] i2c-atr and FPDLink
Message-ID: <Y/Yj8OnYHLyiinMi@smile.fi.intel.com>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
 <Y/YjlW2byyHKamxl@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/YjlW2byyHKamxl@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 22, 2023 at 04:15:50PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 22, 2023 at 03:28:59PM +0200, Tomi Valkeinen wrote:
> > Hi,
> > 
> > You can find v9 from:
> > 
> > https://lore.kernel.org/all/20230216140747.445477-1-tomi.valkeinen@ideasonboard.com/
> > 
> > Diff to v9 included below.
> > 
> > Main changes in v10:
> > - Switch pre-increments to post-increments
> > - Add macros for FPD3_RX_ID lengths
> > - Use regmap_bulk_read in 16 bit reg accessors
> 
> Thanks!
> I have no more remarks, nice job!
> 
> One thing below to just look at and if you want / have time / chance update.

...

> > +	ret = regmap_bulk_read(priv->regmap, reg, &__v, 2);
> 
> sizeof()
> 
> ...
> 
> > +	ret = regmap_bulk_read(priv->regmap, reg, &__v, 2);
> 
> Ditto.

Here is a formal tag for patches 1, 2, 6, 7, and 8
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


