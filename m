Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2952863E204
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Nov 2022 21:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbiK3U36 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Nov 2022 15:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbiK3U3z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Nov 2022 15:29:55 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354E55444A;
        Wed, 30 Nov 2022 12:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669840194; x=1701376194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QT9+fo27gKUEyimelEguX5qkYfHdbTN2YbgB47Q5LRU=;
  b=IGonezhu7fP6AbZvRu+eSLpqrSgWLT1id1hHCNsiyU9WDkWV/4QQJBav
   hcwftTwrRjRgm85yLgmrx7q/fo3BLShRCYuoGNP1Een0K8Y2jtwFQ6lxc
   Sq5pTJDwrcgk7LoLPH83I38YPM9b4tNEU82kvyOZ2aBO3+vT6/5OyhY3n
   Vrt0cq3iTKwAeXuZDpuRD2rIUxJjQN1SAj+exLfhi7F2pjvrRg5W23KSf
   CA4r5Timz0JM0Gt/Lhevkr206GvBkMK2jVv7uxhzJcBNsmoEO/lIpCQof
   FzpuFjpQilwyDytbmDDziDfL8lonpxt9bOJEEkAcwu0djoenQQp9Qia6J
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="315531258"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="315531258"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 12:29:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="622022043"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="622022043"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 30 Nov 2022 12:29:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p0TiF-002Sw2-2I;
        Wed, 30 Nov 2022 22:29:47 +0200
Date:   Wed, 30 Nov 2022 22:29:47 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V4 1/5] i2c: gpio: Fix potential unused warning for
 'i2c_gpio_dt_ids'
Message-ID: <Y4e9O33vB1d6sNeR@smile.fi.intel.com>
References: <cover.1669777792.git.zhoubinbin@loongson.cn>
 <fda9f8bc2477a3a49bd57ea219f88b4199c2163e.1669777792.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fda9f8bc2477a3a49bd57ea219f88b4199c2163e.1669777792.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 30, 2022 at 01:55:51PM +0800, Binbin Zhou wrote:
> Dropping a matching #ifdef check along with dropping of_match_ptr()
> is just a cleanup, while dropping of_match_ptr() that has no
> corresponding #ifdef fixes an actual warning.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/i2c/busses/i2c-gpio.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index b1985c1667e1..0e4385a9bcf7 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -482,19 +482,17 @@ static int i2c_gpio_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#if defined(CONFIG_OF)
>  static const struct of_device_id i2c_gpio_dt_ids[] = {
>  	{ .compatible = "i2c-gpio", },
>  	{ /* sentinel */ }
>  };
>  
>  MODULE_DEVICE_TABLE(of, i2c_gpio_dt_ids);
> -#endif
>  
>  static struct platform_driver i2c_gpio_driver = {
>  	.driver		= {
>  		.name	= "i2c-gpio",
> -		.of_match_table	= of_match_ptr(i2c_gpio_dt_ids),
> +		.of_match_table	= i2c_gpio_dt_ids,
>  	},
>  	.probe		= i2c_gpio_probe,
>  	.remove		= i2c_gpio_remove,
> -- 
> 2.31.1
> 

-- 
With Best Regards,
Andy Shevchenko


