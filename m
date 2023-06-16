Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4843F73339F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbjFPOdY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFPOdY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:33:24 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C9C30E7;
        Fri, 16 Jun 2023 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686926003; x=1718462003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bvGpNDLA3a0FFTGl0eVY+fodubNpqqXghduB4BJyHyg=;
  b=lMbLfizi9C+rva15GSFUPQboSfuPo0os/zih35nUvpG/tosrS3DwlNIg
   5Jh/AT8BZEuwXdZHoEejn8AXZ4aiDsOwftCWjJ6Y+J5gDzXtCzpPoF3QF
   s+gu5FcqlIed1aFGQY+ojak8IpggztllsYTnQ8Jaz7RPH8zxuDiE5I7Gl
   pvPHgjgT7gQKOgLuFLFQVrT3EZfIqeoq8hjnm0YB+RU3coo++y8W2tA2c
   D74b2rMGm8HihqhJvqxUHQnPZQ4hGzAvyboI+64qPxo8R/mw3HE9aUSv1
   0AkdB7l7T0jjK70NBZgchJu3zEjIaAQo85n8ji6maI+a5ABQYy+Uypr/1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="338843656"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="338843656"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 07:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742691961"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="742691961"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 16 Jun 2023 07:33:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1qAAVl-004Iuf-1D;
        Fri, 16 Jun 2023 17:33:13 +0300
Date:   Fri, 16 Jun 2023 17:33:13 +0300
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
Subject: Re: [PATCH v14 15/18] media: i2c: ds90ub953: Handle
 V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK
Message-ID: <ZIxyqTdEsS40emBV@smile.fi.intel.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-16-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616135922.442979-16-tomi.valkeinen@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 16, 2023 at 04:59:19PM +0300, Tomi Valkeinen wrote:
> Handle V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK flag to configure the CSI-2 RX
> continuous/non-continuous clock register.

...

>  	struct regmap		*regmap;

I forgot if we discussed this along with i2c_client *client nearby. Since I
reviewed Hans' patches the pure struct device *dev (instead of *client) might
make more sense, despite being duplicative with regmap associated device.

>  	u32			num_data_lanes;
> +	bool			non_cont_clk;
>  
>  	struct gpio_chip	gpio_chip;

And also try to place this as a first member and see (by using bloat-o-meter,
for example) if it saves bytes.

I'm wondering if we have tools like pahole but which suggests the better layout
based on the code generation... Maybe something along with clang?

-- 
With Best Regards,
Andy Shevchenko


