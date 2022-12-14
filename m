Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39CB664CDBE
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 17:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238137AbiLNQLi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 11:11:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238245AbiLNQLh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 11:11:37 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E806240B0;
        Wed, 14 Dec 2022 08:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671034296; x=1702570296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WjlEJHTSDyOZEITG6UIbC1rxW77QU7I7fDlGXpi7XAg=;
  b=oG+md+kGyUheCRLZDnWYOUzF+b+vGJ19HTR1KtSolUkKp+dvkzrBZQj4
   Qqb8+zMaeAhqZ8sVxiF6UzTWxO5LyrKpCuhoWVdkWclgDg7TJAUn+Iehq
   3JPLFP4FKOFSCx6N/rJS0aCXjJz+NEfUvsUeNrtFbrwcaWFm49LpDAurd
   hiC3hLE+9ImvhqJc0SqAhD1uo0xpwjX/h+4SqaMlFhsAdAvpfFcqvt50V
   kWqHWnUEpIuzTWULbqIo1JL2QcpIPEm8y+9ohJokDInz6naCAtdUU3CCW
   dTGYX+4vtF/pXUEaN1n8Yk1KUsYXT5aM4tz7f19YJwsyYHg9Y8hhUGInB
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="320302171"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="320302171"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 08:10:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="681552262"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="681552262"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2022 08:09:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p5UKR-009tOe-1t;
        Wed, 14 Dec 2022 18:09:55 +0200
Date:   Wed, 14 Dec 2022 18:09:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v2 1/1] i2c: designware: set pinctrl recovery information
 from device pinctrl
Message-ID: <Y5n1U1lYbcbJ5U1k@smile.fi.intel.com>
References: <20221214142725.23881-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214142725.23881-1-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 14, 2022 at 02:27:25PM +0000, Hanna Hawa wrote:
> The current implementation of designware recovery mechanism fit for
> specific device (Intel / Altera Cyclone V SOC) which have two separated
> "wired" GPIOs to the i2c bus via the SOC FPGA for the i2c recovery.
> 
> Make pinctrl recovery information to points to the device pinctrl by
> setting the rinfo->pinctrl to dev->pins->p.

> Change Log v1->v2:
> - set the rinfo->pinctrl to dev->pins->p instead calling
>   devm_pinctrl_get().

Wrong place for a changelog...

> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> ---

...should be located here.

...

> +	if (dev->dev->pins && dev->dev->pins->p)
> +		rinfo->pinctrl = dev->dev->pins->p;

Hmm... I don't see how this field is being used.
Can you elaborate?

-- 
With Best Regards,
Andy Shevchenko


