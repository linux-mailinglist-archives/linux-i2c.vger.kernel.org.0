Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDF47333E8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345715AbjFPOrV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345709AbjFPOrU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:47:20 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F49030EB;
        Fri, 16 Jun 2023 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686926839; x=1718462839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3pdNeP0i/PgyncqKPW3Fgnkmv3W9fkTO/Cx83udpRkk=;
  b=fODlW8eAKDpDp9XRDtWANG3eSmWyDsu678TnTGW+FSSzeGe8HTpdRmjf
   za+fM8Sjzwc7UDJJn55Y2Fme4xNXuqIW934EgZyNP2nSt6vP8A4FjNxcW
   uXK2iRngdXdE20umn6b8p3Gus29MBdlCJtilrSXClSTkl2xicTe2ySNc8
   wXeZJPAcoY054zota+wjX+gw+9/j8KqkXuTBSlE7VItMOz0XziHrfdGKt
   pm+HTj0CYmimKKUZ+vFYe8GyoKPOJLXDp4o/1WY+LI7HXGHNNDsdcJxmg
   nG1xmYXvWtkFduH69TY/qPEmJDt8vRR8CvB/VuYTgSZXG+HAbXl9Pq38y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="359237419"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="359237419"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 07:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="663210345"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="663210345"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 16 Jun 2023 07:47:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qAAjG-004J3L-0o;
        Fri, 16 Jun 2023 17:47:10 +0300
Date:   Fri, 16 Jun 2023 17:47:09 +0300
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
Message-ID: <ZIx17WC7plfDPpmc@smile.fi.intel.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-19-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616135922.442979-19-tomi.valkeinen@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 16, 2023 at 04:59:22PM +0300, Tomi Valkeinen wrote:
> Add support for FPD-Link non-sync mode with external clock. The only
> thing that needs to be added is the calculation for the clkout.

...

> +	switch (priv->mode) {
> +	case UB953_MODE_SYNC:
> +		if (priv->hw_data->is_ub971)
> +			return priv->plat_data->bc_rate * 160ull;
> +		else
> +			return priv->plat_data->bc_rate / 2 * 160ull;

Redundant 'else'.

Do I understand correctly you don't want to fallthrough because it will give
±160 in the rate (depending if it's even or odd)?

> +	case UB953_MODE_NONSYNC_EXT:
> +		/* CLKIN_DIV = 1 always */
> +		return clk_get_rate(priv->clkin) * 80ull;
> +
> +	default:
>  		/* Not supported */
>  		return 0;
>  	}

-- 
With Best Regards,
Andy Shevchenko


