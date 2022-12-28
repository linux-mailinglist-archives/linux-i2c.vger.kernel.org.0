Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10C44657A43
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Dec 2022 16:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233679AbiL1PJj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Dec 2022 10:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233712AbiL1PJb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Dec 2022 10:09:31 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0EF13E3D;
        Wed, 28 Dec 2022 07:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672240160; x=1703776160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fdP0nh1OD1wvErCaU7T6b8HwCVcBr17oElrYcEN5+No=;
  b=chOzYeWml2pigiNoXhR7iH18hvNjoPDmysXlUMSONwzkwBhveK8pZCJu
   beMMk+a8U1tLMv9XmvbrauN2mfiJVrl1v8jNZ0l3j1mejJcvB+uRKZr2c
   44Xpmpl3F8p0eJswfu2kw4Rx8XfvtBCTRraz4as3CzD+3A3ZQ/DuDW+mb
   GBP0FAMjOu3uLOlgKU9YMElbqoqJS2dv3zo4ymRUZ/97j/MMYKl8AqseF
   0uKZcOMmRWr6im/lUn9hburCDF7d1fwK6UpCUJNKgdkM/qq2O8SL4jlrw
   MTwpn7QZ4/V5IzL9k5QomUt0luJ7b74dz0qBG+A3ZBA6UP/weriUTOany
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="385309686"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="385309686"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 07:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="603359287"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="603359287"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 28 Dec 2022 07:09:15 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pAY3O-000gDi-0l;
        Wed, 28 Dec 2022 17:09:14 +0200
Date:   Wed, 28 Dec 2022 17:09:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     wsa@kernel.org, linus.walleij@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v4 2/2] i2c: Set i2c pinctrl recovery info from it's
 device pinctrl
Message-ID: <Y6xcGWK7ghrQIjL/@smile.fi.intel.com>
References: <20221221205116.73941-1-hhhawa@amazon.com>
 <20221221205116.73941-3-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221205116.73941-3-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 21, 2022 at 08:51:16PM +0000, Hanna Hawa wrote:
> Currently the i2c subsystem rely on the controller device tree to
> initialize the pinctrl recovery information, part of the drivers does
> not set this field (rinfo->pinctrl), for example i2c designware driver.

DesignWare

> The pins information is saved part of the device structure before probe
> and it's done on pinctrl_bind_pins().
> 
> Make the i2c init recovery to get the device pins if it's not
> initialized by the driver from the device pins.

...

> -	struct pinctrl *p = bri->pinctrl;
> +	struct pinctrl *p;
> +
> +	bri->pinctrl = bri->pinctrl ?: dev_pinctrl(dev->parent);
> +	p = bri->pinctrl;

What about

	struct pinctrl *p = bri->pinctrl ?: dev_pinctrl(dev->parent);

	bri->pinctrl = p;

?

Seems like one line of code less.

Either way,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


