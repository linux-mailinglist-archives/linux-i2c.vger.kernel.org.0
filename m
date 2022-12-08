Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED362646FB3
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 13:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiLHMal (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 07:30:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiLHMaj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 07:30:39 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D843C2B185;
        Thu,  8 Dec 2022 04:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670502638; x=1702038638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=geMWQwl8f3L8TwGLVN0GOzD32/STIXrJqv4HDrTS7ZE=;
  b=nrZEHigd0HXl6aoFAdunsYiwb+qUJWAfa5jqBMVWvHnhKB2nyeHq2oxQ
   EV0V58zegRN7BKxhe2jjJyapxnVCaXN81GB+/24QCAUTq2T32hY2Ahewf
   ZCxHZ7RbBdzmdTT+G/XiMeFAGBfK1Djoj2hjgVs6KMTloZ2GddHyMgVVO
   gf18BQIOy3X3p3KUjfTjjKtrVUCwpzYeNep+W0Y+6C7To0mcqUtkNSiSW
   KQWcJjlMh26JkzvULg2QAtSVEpKXi4BlW/Eqdt7vuxP+o15lya2oGh0TB
   AUVnbY/FiXaNFcCxmbTDTjVPBcs2Vq9oC6LhweIY/5PSY1w0Gxu47p+3O
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="318298662"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="318298662"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 04:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="821321712"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="821321712"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2022 04:30:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p3G2l-006KKW-1a;
        Thu, 08 Dec 2022 14:30:27 +0200
Date:   Thu, 8 Dec 2022 14:30:27 +0200
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
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v5 1/8] i2c: core: let adapters be notified of client
 attach/detach
Message-ID: <Y5HY4/Ho48KrGFoR@smile.fi.intel.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208104006.316606-2-tomi.valkeinen@ideasonboard.com>
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

On Thu, Dec 08, 2022 at 12:39:59PM +0200, Tomi Valkeinen wrote:
> From: Luca Ceresoli <luca@lucaceresoli.net>
> 
> An adapter might need to know when a new device is about to be
> added. This will soon bee needed to implement an "I2C address
> translator" (ATR for short), a device that propagates I2C transactions
> with a different slave address (an "alias" address). An ATR driver
> needs to know when a slave is being added to find a suitable alias and
> program the device translation map.
> 
> Add an attach/detach callback pair to allow adapter drivers to be
> notified of clients being added and removed.

...

> +	if (adap->attach_ops &&
> +	    adap->attach_ops->attach_client &&
> +	    adap->attach_ops->attach_client(adap, info, client) != 0)
> +		goto out_remove_swnode;

With a temporary variable it becomes better

	... *ops = adap->attach_ops;

	if (ops && ops->attach_client && ops->attach_client(adap, info, client))


Also notice drop of unneeded ' != 0' part.


>  	status = device_register(&client->dev);
>  	if (status)
> -		goto out_remove_swnode;
> +		goto out_detach_client;
>  
>  	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
>  		client->name, dev_name(&client->dev));
>  
>  	return client;
>  
> +out_detach_client:
> +	if (adap->attach_ops && adap->attach_ops->detach_client)
> +		adap->attach_ops->detach_client(adap, client);

In the similar way.

...

> +	if (adap->attach_ops &&
> +	    adap->attach_ops->detach_client)
> +		adap->attach_ops->detach_client(adap, client);

In the similar way.

-- 
With Best Regards,
Andy Shevchenko


