Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69D6B651F48
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 11:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbiLTKxg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 05:53:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiLTKxg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 05:53:36 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9777186BD;
        Tue, 20 Dec 2022 02:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671533614; x=1703069614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Z8MBPZB+ZK2HRknMDeyqvMRYRdmnVfz8oCMD9fMC5s=;
  b=b+B01QdLOae6SdOtd/f5gyaemaLod+dBRNu+pduUq2j8BaVGQY3abQ2t
   fLlWeBjlt7jG0mnKTdkG5M6Y0DLVROee+KnqqdEioav4Qm3P4R94vrulR
   jZ6nji7naftVh/7pEJLS1H7XmJcFkVqeXMW4Z3lHnf2O7mTOafoZtO9YX
   xob4R8PWG/72rplghS2+AMpkWR45iOJsYxsBNvBVWova+wFg4iMBZrMHV
   L7cfcrfICre6ObAIR75f9FDi2wzdlDqyyljirUBHdmXC2oMy3XyeNLE2C
   11WTTQB2GAypAB3T8MsWQMRQG/E5kwb8sfP0Mgg2FhvwyGY/4DlGHK82o
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="319637062"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="319637062"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 02:53:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="758032678"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="758032678"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2022 02:53:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7aFV-00Cpal-1K;
        Tue, 20 Dec 2022 12:53:29 +0200
Date:   Tue, 20 Dec 2022 12:53:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     wsa@kernel.org, linus.walleij@linaro.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v3 1/1] i2c: Set pinctrl recovery info to device pinctrl
Message-ID: <Y6GUKf5TCumM1Swy@smile.fi.intel.com>
References: <20221219193228.35078-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219193228.35078-1-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
> 
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>

The same comment about changelog. Place it in the correct position.

> Change Log v2->v3:
> - Add API to get the device pinctrl
> - Make the i2c init recovery to get the device pins
> 
> Change Log v1->v2:
> - set the rinfo->pinctrl to dev->pins->p instead calling
>   devm_pinctrl_get()
> ---

>  include/linux/pinctrl/devinfo.h | 11 +++++++++++

This should be a separate patch.

...

> +static inline struct pinctrl *dev_pinctrl(struct device *dev)
> +{
> +	return dev->pins && dev->pins->p ? dev->pins->p : NULL;

GCC supports Elvis, you can use it to simplify the above.

> +}

-- 
With Best Regards,
Andy Shevchenko


