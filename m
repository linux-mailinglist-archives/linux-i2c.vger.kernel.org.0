Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 350A27333C1
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345241AbjFPOiC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345182AbjFPOh7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:37:59 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DEA30E7;
        Fri, 16 Jun 2023 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686926276; x=1718462276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2veLEf490knl4gAIjPQCKjmkISoob58F0/w88Mad1aw=;
  b=amwTuwPxubI5PBoxPxGbDIH3NsV7TV+Nvt6e6XTjQTTMvGbamhqK4Ts2
   3AMpFHEE3AsMktRKsK1YArdDxAujWs0A5cdsyHK53ns0vxt/QKTAVm/+f
   6AAvI7ylynuP23yopG1w8uUrnir32ckb1haNR0lGSN65SboKRhzhiK/W0
   dZRVMzi86dwAGMqYi23QANK3Bk2Pi8NNABCnFG/Dgy29DRY9TuCGd8NBl
   OoE2xp1ldS0vIhpFIs7eMn2iXvzf+61fJx0TepFVk5Uy3cjCKsxotsrlw
   7WjpvrIJ9F9vavcNuvEUbshz8C90L6SPmeSsnnIsa8On86HXj48+dFHcu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="339558452"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="339558452"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 07:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="857408631"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="857408631"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2023 07:37:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qAAa1-004Ixf-2g;
        Fri, 16 Jun 2023 17:37:37 +0300
Date:   Fri, 16 Jun 2023 17:37:37 +0300
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
Message-ID: <ZIxzsUbuUz3ysA31@smile.fi.intel.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-18-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616135922.442979-18-tomi.valkeinen@ideasonboard.com>
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

On Fri, Jun 16, 2023 at 04:59:21PM +0300, Tomi Valkeinen wrote:
> Separate clkout calculations and register writes into two functions:
> ub953_calc_clkout_params and ub953_write_clkout_regs, and add a struct
> ub953_clkout_data that is used to store the clkout parameters.

...

> +struct ub953_clkout_data {
> +	u32 hs_div;
> +	u32 m;
> +	u32 n;

Please, use struxt u32_fract instead of m/n.

> +	unsigned long rate;
> +};

...

> +static void ub953_calc_clkout_params(struct ub953_data *priv,
> +				     unsigned long target_rate,
> +				     struct ub953_clkout_data *clkout_data)
> +{
> +	struct device *dev = &priv->client->dev;
> +	unsigned long clkout_rate;
> +	u64 fc_rate;
> +
> +	fc_rate = ub953_get_fc_rate(priv);
> +
> +	if (priv->hw_data->is_ub971) {
> +		u8 m, n;

Ditto. struct u8_fract; (But probably needs to be added into math.h.
I'll Ack/Rb such a patch when one appears.

> +		clkout_rate = ub953_calc_clkout_ub971(priv, target_rate,
> +						      fc_rate, &m, &n);

Can be also parameter to that function.

> +		clkout_data->m = m;
> +		clkout_data->n = n;
> +
> +		dev_dbg(dev, "%s %llu * %u / (8 * %u) = %lu (requested %lu)",
> +			__func__, fc_rate, m, n, clkout_rate, target_rate);
> +	} else {
> +		u8 hs_div, m, n;

Yeah, and so on...

> +		clkout_rate = ub953_calc_clkout_ub953(priv, target_rate,
> +						      fc_rate, &hs_div, &m, &n);
> +
> +		clkout_data->hs_div = hs_div;
> +		clkout_data->m = m;
> +		clkout_data->n = n;
> +
> +		dev_dbg(dev, "%s %llu / %u * %u / %u = %lu (requested %lu)",
> +			__func__, fc_rate, hs_div, m, n, clkout_rate,
> +			target_rate);
> +	}
> +
> +	clkout_data->rate = clkout_rate;
> +}

-- 
With Best Regards,
Andy Shevchenko


