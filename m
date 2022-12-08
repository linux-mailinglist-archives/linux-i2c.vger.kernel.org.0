Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6DDE646F98
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 13:27:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiLHM07 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 07:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiLHM06 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 07:26:58 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988A98658A;
        Thu,  8 Dec 2022 04:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670502417; x=1702038417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=spdlWevniBpu51g03nRTe2+ZbrLpWs90S14TUiE7A/M=;
  b=BfdCLZOca8PNTJTb2V5gKTLkEhylw7PigXyhzUkvbIr8FWZKHtuqZzUv
   HumHlDAC02rVFjnF/7qbfBnp5Wtr5+1pRyE3kwDBzUB1wGyc/dVelQaOC
   XNq8LHAGUTTRvkXmOiGKJHu+AeJhK7WZXBJRhl7GKldG3cNyB2TTEvc42
   /Dc7vwoGikd2D/jqj6/AOlchLVoNEVc8rXspBjF0dz3z6MV8og/SWgCQ2
   BgL8rz+lK0+WVQpdVN0F4EjdAdSllXaGDhyqlMvvFiadwCQRoHwzM8XAb
   V8b3xJXsMND0I4UeRiEsNDbMZOl1AZoXuCJkEtd2YqXl0vt8b9gbYTSbM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="318297842"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="318297842"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 04:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="821320560"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="821320560"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2022 04:26:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p3FzD-006KFQ-1i;
        Thu, 08 Dec 2022 14:26:47 +0200
Date:   Thu, 8 Dec 2022 14:26:47 +0200
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
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v5 0/8] i2c-atr and FPDLink
Message-ID: <Y5HYBzZlkTrsdjfX@smile.fi.intel.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <c5eac6a6-f44b-ddd0-d27b-ccbe01498ae9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5eac6a6-f44b-ddd0-d27b-ccbe01498ae9@ideasonboard.com>
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

On Thu, Dec 08, 2022 at 12:42:13PM +0200, Tomi Valkeinen wrote:
> On 08/12/2022 12:39, Tomi Valkeinen wrote:

...

> +#include <linux/fwnode.h>
>  #include <linux/i2c-atr.h>
>  #include <linux/i2c.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> -#include <linux/of.h>
>  #include <linux/slab.h>

+ Blank line here?

> +#define ATR_MAX_ADAPTERS 99	/* Just a sanity limit */
> +#define ATR_MAX_SYMLINK_LEN 16	/* Longest name is 10 chars: "channel-99" */

...

> +		u16 *new_buf;
> +
> +		new_buf = kmalloc_array(num, sizeof(chan->orig_addrs[0]),
> +					GFP_KERNEL);

		new_buf = kmalloc_array(num, sizeof(*new_buf), GFP_KERNEL);

?

> +		if (!new_buf)
>  			return -ENOMEM;

...

>  	struct i2c_atr_cli2alias_pair *c2a;
> -	u16 alias_id = 0;
> -	int ret = 0;
> +	u16 alias_id;
> +	int ret;

Is it mangled or it's missing blank line here?

>  	c2a = kzalloc(sizeof(*c2a), GFP_KERNEL);
>  	if (!c2a)

...

>  struct device;
>  struct i2c_atr;
> +struct fwnode_handle;

Order?

...

>  /**
> - * Helper to add I2C ATR features to a device driver.
> + * struct i2c_atr - Represents the I2C ATR instance
>   */

This is incomplete. Have you run kernel doc validator against this file?

>  struct i2c_atr {

>  };

-- 
With Best Regards,
Andy Shevchenko


