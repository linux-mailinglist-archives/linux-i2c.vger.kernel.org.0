Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E74768D46A
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Feb 2023 11:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbjBGKhG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Feb 2023 05:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbjBGKg7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Feb 2023 05:36:59 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1442BEE3;
        Tue,  7 Feb 2023 02:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675766195; x=1707302195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WnWgAkf7Xuz+zRl4IQ31HmrMbVjtrWcapDRwF5ekGgs=;
  b=D+bFcqCcKrsloTtA+UK2sAYF0sE9oBgqFm84SuuMVbSxdAztHQ1K1d7B
   1hRJ8zJt4W4FJHqysyl0rn3J2QgN5v0vMYD+HDjrfm1VLZs+QBIRsMcab
   95bOmSA2cpfEd1VugiL85tqFa88kK5RiF29BNiSahh88obX8VY/0XxeMH
   VYhlYSkmHedv2fyoaAUH78qTZsAxsJ3hCTdnhhDIjwK2hVQ3yd/F56864
   L3v0Ns6jt24iksNsZs7Q6EtO9lsSpjQuVrh6SMEAGenL136haytu5CdE5
   vMISjA/blCEDwZ03KwqEv2W+vBpvDMCsNy5zmtSSuKeZZMTU7iTTJxfTc
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="327161127"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="327161127"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 02:33:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="699206370"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="699206370"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 07 Feb 2023 02:33:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pPLIR-003ZGH-2k;
        Tue, 07 Feb 2023 12:33:55 +0200
Date:   Tue, 7 Feb 2023 12:33:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Raul E Rangel <rrangel@chromium.org>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [RFC] i2c: core: Do not enable wakeup by default
Message-ID: <Y+IpEwNSEtNk19D8@smile.fi.intel.com>
References: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 07, 2023 at 09:25:40AM +0200, Mika Westerberg wrote:
> After commit b38f2d5d9615 ("i2c: acpi: Use ACPI wake capability bit to
> set wake_irq") the I2C core has been setting I2C_CLIENT_WAKE for ACPI
> devices if they announce to be wake capable in their device description.
> However, on certain systems where audio codec has been connected through
> I2C this causes system suspend to wake up immediately because power to
> the codec is turned off which pulls the interrupt line "low" triggering
> wake up.
> 
> Possible reason why the interrupt is marked as wake capable is that some
> codecs apparently support "Wake on Voice" or similar functionality.
> 
> In any case, I don't think we should be enabling wakeup by default on
> all I2C devices that are wake capable. According to device_init_wakeup()
> documentation most devices should leave it disabled, with exceptions on
> devices such as keyboards, power buttons etc. Userspace can enable
> wakeup as needed by writing to device "power/wakeup" attribute.

I agree on the reasoning.

Should we have a Fixes tag?

Otherwise
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

In any case it would be nice if the initial contributors may have a chance
to test this and see how their setup is supposed to work.

> Reported-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Hi,
> 
> Sending this as RFC because I'm not too familiar with the usage of
> I2C_CLIENT_WAKE and whether this is something that is expected behaviour
> in users of I2C devices. On ACPI side I think this is the correct thing
> to do at least.
> 
>  drivers/i2c/i2c-core-base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 087e480b624c..7046549bdae7 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -527,7 +527,7 @@ static int i2c_device_probe(struct device *dev)
>  			goto put_sync_adapter;
>  		}
>  
> -		device_init_wakeup(&client->dev, true);
> +		device_init_wakeup(&client->dev, false);
>  
>  		if (wakeirq > 0 && wakeirq != client->irq)
>  			status = dev_pm_set_dedicated_wake_irq(dev, wakeirq);
> -- 
> 2.39.1
> 

-- 
With Best Regards,
Andy Shevchenko


