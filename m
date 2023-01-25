Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECBE167B1BA
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 12:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235729AbjAYLlx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 06:41:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235570AbjAYLlw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 06:41:52 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B5E2195F;
        Wed, 25 Jan 2023 03:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674646908; x=1706182908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mU94htPXEz2pHW7YqIdCZL3DKTjFRjvvgNm9xhpgYKI=;
  b=hp8JrSZmHw7u3yOApdDKP27ZfdDg7qvlLB3KbH8krwpJCJ4LTmqpLOBm
   Uou7DpBF6knRwkcyLhrO2vGN+CFKlAIrSk53pvD8HKttPkn+sA2yNxcnm
   QNjcaHwVhb5AGG0I5h/IJeO31eCWGAjiUKo1RKbEiH/BxDjiS9qlA2jXF
   73wJ1TGy1ut3KxC3Klkj4tiTQF6pFkhKAp2d4fBo7jthwPTCuXs/0Leko
   dSD8f1rdizZZ6SDWPOvP5MgygmUgsaG0dkMuj1gzYXh02NoS2XwkV4Qn4
   5p8wHBYj1p+eUdEyeUg7A6a2PuwEYYkcApPiM+DYkSPdHvmYBJ4sCPuFd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306198696"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="306198696"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 03:41:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="991238414"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; 
   d="scan'208";a="991238414"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2023 03:41:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pKe9r-00EpOh-17;
        Wed, 25 Jan 2023 13:41:39 +0200
Date:   Wed, 25 Jan 2023 13:41:38 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
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
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v8 5/7] media: i2c: add DS90UB960 driver
Message-ID: <Y9EVcktGPabqYw+q@smile.fi.intel.com>
References: <20230120153417.1156207-1-tomi.valkeinen@ideasonboard.com>
 <20230120153417.1156207-6-tomi.valkeinen@ideasonboard.com>
 <Y88EhodG7b+oSvtE@pendragon.ideasonboard.com>
 <beaebec6-4ec5-8041-5f70-a974ae417a78@ideasonboard.com>
 <Y9AjFcsQQZqZBhAb@pendragon.ideasonboard.com>
 <ead8904b-0e17-81e7-98a8-19e4abfdf281@ideasonboard.com>
 <Y9EAw+PUwZJFH+NO@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9EAw+PUwZJFH+NO@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 25, 2023 at 12:13:23PM +0200, Laurent Pinchart wrote:
> On Wed, Jan 25, 2023 at 09:39:57AM +0200, Tomi Valkeinen wrote:

...

> I find
> 
> 	dev_dbg(dev, read_err_str, port, "ti,cdr-mode", ret);
> 
> less readable as I then have to look up the read_err_str string to
> understand that line. I also wonder, in that case, if the compiler can
> still warn if the format string doesn't match the argument types.

Sorry to be a bit offtopic, but this argument is exactly what I'm trying
to tell Sakari when reviewing some other series.

-- 
With Best Regards,
Andy Shevchenko


