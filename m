Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADAEA67226F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 17:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbjARQF7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 11:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbjARQFn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 11:05:43 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F120E58290;
        Wed, 18 Jan 2023 08:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674057753; x=1705593753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mYfGJuIXXRAEIbpAJg9uFdYN4T7ljyJ2hkxHWZSL2KI=;
  b=G0Pt/2IJVEbHKHebwE5WKdZ25WjBDAD4Q8/2lUUxaTixL5uydFTVHr1E
   Plp5BZe//9FhoSRQyaJN9r9b5K94WZ88kvXq3iiTh6eRfTSjMjmNQUiMg
   hVSd1OwOam6Yv+2cfLa0Lh2RxQk2D8SC2Gvq7pg1zj4rV16x1wrYJ5yMr
   3vUPeJwSFOx4vNItq6oZoUvO3oqh28ONfx2hcuAM7Ckiy2ehggWUL6/Ho
   GC1u0GGx7VyqdFjk3Nw+lcqCCf4wiO4rMD3HpEshX0ubDHWh0R6pM1df+
   I9Xjpi/ucxuDeOMcg3zOUobim8+crpm4GmD9/mFTeyp4rEfm7aWuiUw/1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411252681"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="411252681"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 08:01:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="637333673"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="637333673"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 18 Jan 2023 08:01:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pIAsM-00BG0e-1E;
        Wed, 18 Jan 2023 18:01:22 +0200
Date:   Wed, 18 Jan 2023 18:01:22 +0200
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
Subject: Re: [PATCH v7 0/7] i2c-atr and FPDLink
Message-ID: <Y8gX0krXayfOa4Hi@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 18, 2023 at 02:40:24PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> You can find the v6 from:
> 
> https://lore.kernel.org/all/20230105140307.272052-1-tomi.valkeinen@ideasonboard.com/
> 
> Main changes:
> 
> * i2c-atr: Use bus notifier. This allows us to drop the patch that adds
>   the attach_client/detach_client callbacks. On the downside, it removes
>   the option for error handling if the translation setup fails, and also
>   doesn't provide us the pointer to the i2c_board_info. I belive both
>   are acceptable downsides.
> 
> * Use fwnode in the fpdlink drivers instead of OF
> 
> * Addressed all the review comments (I hope)
> 
> * Lots of cosmetic or minor fixes which I came up while doing the fwnode
>   change

I believe my comments to the first driver applies to the next two, so please
address them whenever you are agree / it's possible / it makes sense.

About ATR implementation. We have the i2c bus (Linux representation of
the driver model) and i2c_adapter and i2c_client objects there. Can't we
have an i2c_client_aliased in similar way and be transparent with users?

It's just a thought which may be well far from the possibility
to be implemented if even possible...

-- 
With Best Regards,
Andy Shevchenko


