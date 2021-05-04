Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F013727FA
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 11:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhEDJTI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 05:19:08 -0400
Received: from mga04.intel.com ([192.55.52.120]:63075 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230158AbhEDJTH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 May 2021 05:19:07 -0400
IronPort-SDR: mxWGmA0n1XCdf2m4OJQI+/o9Ce3xfdQHNnaeACLdO9a/I3xAOwHfAn2rpPcrFej1QE+F2PK/bQ
 5SkrTpvEPucw==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="195884067"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="195884067"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 02:18:00 -0700
IronPort-SDR: 7draSFrfvY/hi9a8M9XFlwwgRXE1qfj2CvQILS/v7WyYJkAJ8oSaPm5EuEcdH+6i7wDqYGwWcB
 KAWKm7gjPL2Q==
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="396062620"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 02:17:58 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ldrBj-009VMz-Qd; Tue, 04 May 2021 12:17:55 +0300
Date:   Tue, 4 May 2021 12:17:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yicong Yang <yangyicong@hisilicon.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: I2C_HISI should depend on ACPI
Message-ID: <YJERQ8WYOvR+kucp@smile.fi.intel.com>
References: <22d124a7f12f2c8b280a9cc7f3b766351c9a8d64.1620119167.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22d124a7f12f2c8b280a9cc7f3b766351c9a8d64.1620119167.git.geert+renesas@glider.be>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 04, 2021 at 11:06:32AM +0200, Geert Uytterhoeven wrote:
> The HiSilicon Kunpeng I2C controller driver relies on ACPI to probe for
> its presence.  Hence add a dependency on ACPI, to prevent asking the
> user about this driver when configuring a kernel without ACPI firmware
> support.

As promised, okay from me.
Thanks!

> Fixes: d62fbdb99a85730a ("i2c: add support for HiSilicon I2C controller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Drop dependency on ARCH_HISI, as this is a public IP which doesn't
>     specifically depend on ARCH_HISI.
> ---
>  drivers/i2c/busses/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index b5b4e0d0ff4dd0bc..226c0b79eac030fa 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -647,7 +647,7 @@ config I2C_HIGHLANDER
>  
>  config I2C_HISI
>  	tristate "HiSilicon I2C controller"
> -	depends on ARM64 || COMPILE_TEST
> +	depends on (ARM64 && ACPI) || COMPILE_TEST
>  	help
>  	  Say Y here if you want to have Hisilicon I2C controller support
>  	  available on the Kunpeng Server.
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


