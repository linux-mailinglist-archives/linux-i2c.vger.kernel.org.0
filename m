Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC253651F57
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 11:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233561AbiLTK5z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 05:57:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbiLTK5z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 05:57:55 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664452BDB;
        Tue, 20 Dec 2022 02:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671533874; x=1703069874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=juVdS8Pgo8SrrW4tJljdoX0hAgcFCVN4YqxFmDsB+HM=;
  b=Vq7e3Xz3u2UjS3SrRn0VYw41AJPTkPQT1xOzoGB60ObitSvlawk1bF3P
   y3TWgt4ePqeoo6ST5i//w3iV1jWjmD/sGEDWBT/tP/UjNX0oLueTbP5fG
   vL5iW8Q5ahwCYPRqLgk1zhfKUFPQFi7l06bOo8GxHSsXA6P0Dg6d7Hdpd
   g3Y1dC/Y8X8pHiEmRwQhN3ZL21f+3PzcBxV0xQQROm2IX3fpe9hTWJGpH
   HN4osXbmlvtA0LQUR4Nheier39ZhX6ILMLrhwL8p/nhf0W4Q72mnHnRw/
   9HFLU/V76CzOC/H0Jfq63gzTiKR1u7dZjgpgpSBTTiD/Tbiw9fdQ/DVkp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="307266927"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="307266927"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 02:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="681599370"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="681599370"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 20 Dec 2022 02:57:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7aJU-00Cpgw-0z;
        Tue, 20 Dec 2022 12:57:36 +0200
Date:   Tue, 20 Dec 2022 12:57:36 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     wsa@kernel.org, linus.walleij@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v3 1/1] i2c: Set pinctrl recovery info to device pinctrl
Message-ID: <Y6GVIOQ59m29P4w1@smile.fi.intel.com>
References: <20221219193228.35078-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219193228.35078-1-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 19, 2022 at 07:32:28PM +0000, Hanna Hawa wrote:
> Currently the i2c subsystem rely on the controller device tree to
> initialize the pinctrl recovery information, part of the drivers does
> not set this field (rinfo->pinctrl), for example i2c designware driver.
> 
> The pins information is saved part of the device structure before probe
> and it's done on pinctrl_bind_pins().
> 
> Make the i2c init recovery to get the device pins if it's not
> initialized by the driver from the device pins.
> 
> Added new API to get the device pinctrl.

...

> -	struct pinctrl *p = bri->pinctrl;
> +	struct pinctrl *p;
> +
> +	if (!bri->pinctrl)
> +		bri->pinctrl = dev_pinctrl(dev->parent);
> +	p = bri->pinctrl;

As I said, you may use Elvis here as well.

	bri->pinctrl = bri->pinctrl ?: dev_pinctrl(...);
	p = bri->pinctrl;

-- 
With Best Regards,
Andy Shevchenko


