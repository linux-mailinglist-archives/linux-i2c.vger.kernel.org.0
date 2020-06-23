Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B15BA204BC8
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 09:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731511AbgFWH7o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jun 2020 03:59:44 -0400
Received: from mga18.intel.com ([134.134.136.126]:33474 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731396AbgFWH7o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Jun 2020 03:59:44 -0400
IronPort-SDR: 7KicQLmqbqzfu2rINqef6mK6b7tIcYXOleC/yxcb7mkEuN0boBxDI472dPFLW9ZotBCvDlEg6S
 iy/VvVgKdHtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="131405963"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="131405963"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 00:59:43 -0700
IronPort-SDR: guciHM9+Q5fHNPBrFOCzI9Awwyfb/rwf9UJW1Y8dwKtdJ0C67EG4C68f3Hql8c6ElPsV+5Dnlp
 fHrh352pdYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; 
   d="scan'208";a="353730797"
Received: from mylly.fi.intel.com (HELO [10.237.72.87]) ([10.237.72.87])
  by orsmga001.jf.intel.com with ESMTP; 23 Jun 2020 00:59:41 -0700
Subject: Re: [PATCH] i2c: designware: Fix functionality in !CONFIG_ACPI case
To:     John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
References: <20200623025144.34246-1-john.stultz@linaro.org>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <d6c317ee-4f97-9c57-6b04-1eabd814b6ce@linux.intel.com>
Date:   Tue, 23 Jun 2020 10:59:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623025144.34246-1-john.stultz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 6/23/20 5:51 AM, John Stultz wrote:
> On the HiKey board, where CONFIG_ACPI is not set, we started
> to see a graphics regression where the adv7511 HDMI bridge driver
> wasn't probing. This was due to the i2c bus failing to start up.
> 
> I bisected the problem down to commit f9288fcc5c615 ("i2c:
> designware: Move ACPI parts into common module") and after
> looking at it a bit, I realized that change moved some
> initialization into i2c_dw_acpi_adjust_bus_speed(). However,
> i2c_dw_acpi_adjust_bus_speed() is only functional if CONFIG_ACPI
> is set.
> 
> This patch pulls i2c_dw_acpi_adjust_bus_speed() out of the
> ifdef CONFIG_ACPI conditional, and gets the board working again.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-i2c@vger.kernel.org
> Fixes: f9288fcc5c615 ("i2c: designware: Move ACPI parts into common module")
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/i2c/busses/i2c-designware-common.c | 4 ++--
>   drivers/i2c/busses/i2c-designware-core.h   | 3 +--
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index e3a8640db7da..33de185e15f2 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -286,6 +286,8 @@ int i2c_dw_acpi_configure(struct device *device)
>   }
>   EXPORT_SYMBOL_GPL(i2c_dw_acpi_configure);
>   
> +#endif	/* CONFIG_ACPI */
> +

I think the regression is in these lines below that were moved from 
probe to i2c_dw_acpi_adjust_bus_speed() and cause that neither 
"cloock-frequency" device property or I2C_MAX_FAST_MODE_FREQ affect the 
bus speed when CONFIG_ACPI is not set.

+       /*
+        * Find bus speed from the "clock-frequency" device property, ACPI
+        * or by using fast mode if neither is set.
+        */
+       if (acpi_speed && t->bus_freq_hz)
+               t->bus_freq_hz = min(t->bus_freq_hz, acpi_speed);
+       else if (acpi_speed || t->bus_freq_hz)
+               t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
+       else
+               t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;

Andy: what you think should the i2c_dw_acpi_adjust_bus_speed() fixed to 
return adjusted speed or zero if not found (also for !CONFIG_ACPI) and 
move above lines back to probe? It looks more clear to me that way and 
should fix the regression I think.

-- 
Jarkko
