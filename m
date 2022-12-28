Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737216579E5
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Dec 2022 16:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233540AbiL1PFw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Dec 2022 10:05:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233537AbiL1PFv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Dec 2022 10:05:51 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E4EB6E;
        Wed, 28 Dec 2022 07:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672239950; x=1703775950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vvsN9dHdNYsPS46Qk1pInWKgjG6g6OQU3qkb21QbfXY=;
  b=U1mFe/xbK5GqFu9scFw/BgGdjACIY4VirkhFJ+aOupbtr8rDMyKDLig2
   fJZsel+KtIyztSFUc4dd7/p9PN2PPlcKDs61LdGswWtsNAq2kOiVMC64u
   Tt9aTYsHXKlCDRJdOXD8zhLxgl619gW4onTr/TocywH9g1JqUsoZwPDMR
   pesCCZ5Xf+mROozAM3EyRXxHqF9bVsRU/7D/vnW5rWBRtEAGLA+6cpJND
   k1AKEGzoKYj/8j8i1hjv7x5lrnAZ7cSlee7YQQ46z1n6D2mzQYLn0o87t
   RiN8/epbctd2Wgr9WONARx6+QSh7dGAVb2Bu1zxC8PtWiQbwceCd9abhg
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="320966573"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="320966573"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 07:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="827417335"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="827417335"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 28 Dec 2022 07:05:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pAY00-000g9r-31;
        Wed, 28 Dec 2022 17:05:44 +0200
Date:   Wed, 28 Dec 2022 17:05:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     wsa@kernel.org, linus.walleij@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v4 1/2] pinctrl: Add an API to get the pinctrl pins if
 initialized
Message-ID: <Y6xbSEVr8JgVNHjh@smile.fi.intel.com>
References: <20221221205116.73941-1-hhhawa@amazon.com>
 <20221221205116.73941-2-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221205116.73941-2-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 21, 2022 at 08:51:15PM +0000, Hanna Hawa wrote:
> Add an API to get the pinctrl pins if it was initialized before driver
> probed. This API will be used in I2C core to get the device pinctrl
> information for recovery state change.

...

>  /* The device core acts as a consumer toward pinctrl */

> +#include <linux/device.h>

It's slightly misplaced. The comment above is for the below inclusion.

>  #include <linux/pinctrl/consumer.h>

Can we make it

----8<----
#include <linux/device.h>

/* The device core acts as a consumer toward pinctrl */
#include <linux/pinctrl/consumer.h>
----8<----

?

With this addressed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


