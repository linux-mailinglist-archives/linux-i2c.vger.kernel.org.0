Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05B3B73337B
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345292AbjFPOYY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:24:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjFPOYX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:24:23 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0440730E7;
        Fri, 16 Jun 2023 07:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686925462; x=1718461462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oeSczsDxX7dgG1qanbCD5eUTqofXJ4ON1bXoul1eVY8=;
  b=UsmxdsCdDW4latAvu8eJXLJPvakIuD0OcAiN0dhnrIo+JPs4AFTGzXFm
   fegacz7EX7Im/f3d8Rq8iAKbRKWjI0O+pB1aUpeh6npfZ2xDnHbcmbtZr
   HzoeTDezaYMXhskZB9AaIal6pYA9PzPvb4f+TUJkThR59/UgjJPPvJxHe
   4Y1HSgGX3SHtsM5VKdaqFX3OjiFIFIJdZCwhGaCmtRi56XsiCt7bNBdCC
   kvShqAUS4+eirGo2zIgOvd84R9zKj6scVHR6Aqu72IrL/N4yGONpH8Gok
   PGo7wWwnZgw9+Zn1OWkumGP37rOxLgj+qHGXoj5YPTxRGC1fJ6LRK0Q9I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="359232974"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="359232974"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 07:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742689320"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="742689320"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 16 Jun 2023 07:24:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qAAN3-004Iob-2s;
        Fri, 16 Jun 2023 17:24:13 +0300
Date:   Fri, 16 Jun 2023 17:24:13 +0300
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
Subject: Re: [PATCH v14 13/18] media: i2c: ds90ub953: Use
 v4l2_fwnode_endpoint_parse()
Message-ID: <ZIxwjebnV/1JaoXt@smile.fi.intel.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-14-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616135922.442979-14-tomi.valkeinen@ideasonboard.com>
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

On Fri, Jun 16, 2023 at 04:59:17PM +0300, Tomi Valkeinen wrote:
> Use v4l2_fwnode_endpoint_parse() to parse the sink endpoint parameters.

> +	nlanes = vep.bus.mipi_csi2.num_data_lanes;
>  

I would also drop this blank line now.

> -	if (ret != 1 && ret != 2 && ret != 4)
> +	if (nlanes != 1 && nlanes != 2 && nlanes != 4)

Isn't the following cleaner?

	if (!is_power_of_2(nlanes) || nlanes > 4)

>  		return dev_err_probe(dev, -EINVAL,
> -				     "bad number of data-lanes: %d\n", ret);
> +				     "bad number of data-lanes: %d\n", nlanes);

-- 
With Best Regards,
Andy Shevchenko


