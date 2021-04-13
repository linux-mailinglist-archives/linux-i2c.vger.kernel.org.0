Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328B535DEFE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 14:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhDMMhZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 08:37:25 -0400
Received: from mga04.intel.com ([192.55.52.120]:33328 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229900AbhDMMhY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 08:37:24 -0400
IronPort-SDR: SCFi7eA8/LaUd+Q09PWJOle6/dCMfpmZtYCHO+X1MWSMXnnDiE7De89fhHo71VY/pIuUvn35l0
 tjjP+v046gzw==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="192275051"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="192275051"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 05:37:02 -0700
IronPort-SDR: EftD6PGd6kRAx7iMLM+mfW7kd+FeJfLBMWizENmewb7XA3QgXhEGs5iYRxhMbqOFtbNGo3LpQO
 BqRFct8SPUIw==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="398759106"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 05:37:00 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lWIHp-003l5j-Or; Tue, 13 Apr 2021 15:36:57 +0300
Date:   Tue, 13 Apr 2021 15:36:57 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yicong Yang <yangyicong@hisilicon.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: I2C_HISI should depend on ARCH_HISI && ACPI
Message-ID: <YHWQaQaw53eZtYzn@smile.fi.intel.com>
References: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26db9291095c1dfd81c73b0f5f1434f9b399b1f5.1618316565.git.geert+renesas@glider.be>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 13, 2021 at 02:26:15PM +0200, Geert Uytterhoeven wrote:
> The HiSilicon Kunpeng I2C controller is only present on HiSilicon
> Kunpeng SoCs, and its driver relies on ACPI to probe for its presence.
> Hence add dependencies on ARCH_HISI and ACPI, to prevent asking the user
> about this driver when configuring a kernel without Hisilicon platform
> or ACPI firmware support.

I don't by the ACPI dependency, sorry.

The driver is a pure platform driver that can be enumerated on ACPI enabled
devices, but otherwise it can be used as a platform one.

If you remove ACPI dependency, feel free to add my
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: d62fbdb99a85730a ("i2c: add support for HiSilicon I2C controller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index b5b4e0d0ff4dd0bc..3ead6d9e130b2ebc 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -647,7 +647,7 @@ config I2C_HIGHLANDER
>  
>  config I2C_HISI
>  	tristate "HiSilicon I2C controller"
> -	depends on ARM64 || COMPILE_TEST
> +	depends on (ARM64 && ARCH_HISI && ACPI) || COMPILE_TEST
>  	help
>  	  Say Y here if you want to have Hisilicon I2C controller support
>  	  available on the Kunpeng Server.
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


