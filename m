Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFD007791FA
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 16:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbjHKOgt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Aug 2023 10:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjHKOgs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Aug 2023 10:36:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1E4130;
        Fri, 11 Aug 2023 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691764608; x=1723300608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HBBeknX3pGhRDzL6xnEjgPIPEWSXMCVK9V7MBHQ/wck=;
  b=OMqZQxNry1B3lAQ7s0FcdNWtl5oUkiL4t7hrEeSJAVdYfivgexbmYFKC
   DuBgS/M8BfupUubgUgQTJuN9KyIaykqIY4htedRewbtV+3G8afFPArj0R
   r2K/mcm01G4lxrD5vgUJXvPnKzfLPAJXGfo9JnjqYsiRsogNHlsI88vmp
   IuTmiBBh27hUzhWqoglRbHokVUdW+1iqD0lHchakmMThfFERy8ITzd+f0
   iAtEU5EVxVlPC0CIiUtY2zDWKts6AWbLW5P5yJaDcmaxuChrEqToe272c
   O3hFZPtHcsMpOxSdXJczrwulcJC74fdPO8Qxn6Ky5bSgN57cioydn6vza
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="374458737"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="374458737"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 07:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="709550076"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="709550076"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 11 Aug 2023 07:36:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qUTFs-001Vv3-1x;
        Fri, 11 Aug 2023 17:36:44 +0300
Date:   Fri, 11 Aug 2023 17:36:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>
Subject: Re: [PATCH] i2c: designware: add support for pinctrl for recovery
Message-ID: <ZNZHfPCMg1Js28iF@smile.fi.intel.com>
References: <20230811135201.23046-1-yann@sionneau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811135201.23046-1-yann@sionneau.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 11, 2023 at 03:52:01PM +0200, Yann Sionneau wrote:
> From: Yann Sionneau <ysionneau@kalray.eu>
> 
> Currently if the SoC needs pinctrl to switch the scl and sda

SCL
SDA

> from hw function to gpio function, the recovery won't work.

from the I2C

GPIO

> scl-gpio = <>;
> sda-gpio = <>;
> 
> Are not enough for some SoCs to have a working recovery.
> Some need:
> 
> scl-gpio = <>;
> sda-gpio = <>;
> pinctrl-names = "default", "recovery";
> pinctrl-0 = <&i2c_pins_hw>;
> pinctrl-1 = <&i2c_pins_gpio>;
> 
> The driver was not filling rinfo->pinctrl with the device node
> pinctrl data which is needed by generic recovery code.

...

>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> +#include <linux/pinctrl/consumer.h>

Keep this in order.

...

> +	rinfo->pinctrl = devm_pinctrl_get(dev->dev);
> +	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {

It's not possible to have it NULL, why a dead code?

> +		rinfo->pinctrl = NULL;
> +		dev_info(dev->dev, "can't get pinctrl, bus recovery might not work\n");
> +	}

-- 
With Best Regards,
Andy Shevchenko


