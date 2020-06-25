Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8253E209FAB
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jun 2020 15:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404861AbgFYNVm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jun 2020 09:21:42 -0400
Received: from mga17.intel.com ([192.55.52.151]:37557 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404854AbgFYNVl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Jun 2020 09:21:41 -0400
IronPort-SDR: RG/6hCFqooTtnLO87QSJMnBxBP7zx0WTI/aKIvUGnmD7iGgg8afgEWTzhyNDiNG2tpr//7tkvs
 JP+E/zaXIpSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="125124533"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; 
   d="scan'208";a="125124533"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2020 06:21:41 -0700
IronPort-SDR: UZ13Dsz3B/RxDtHFZ4YHTb0dQGzn8YZVHR1vzTUQJwNnbjM6uhRMqY+XmQTPRmGOn90RdDZvCa
 eXIcvaFqjZ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; 
   d="scan'208";a="311985461"
Received: from mylly.fi.intel.com (HELO [10.237.72.69]) ([10.237.72.69])
  by fmsmga002.fm.intel.com with ESMTP; 25 Jun 2020 06:21:40 -0700
Subject: Re: [PATCH v2] i2c: designware: platdrv: Set class based on dmi
To:     Ricardo Ribalda <ribalda@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
References: <20200624112530.852254-1-ribalda@kernel.org>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <e309d8c9-4721-ac78-87a2-272b4f1a8d3c@linux.intel.com>
Date:   Thu, 25 Jun 2020 16:21:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624112530.852254-1-ribalda@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 6/24/20 2:25 PM, Ricardo Ribalda wrote:
> Current AMD's zen-based APUs use this core for some of its i2c-buses.
> 
> With this patch we re-enable autodetection of hwmon-alike devices, so
> lm-sensors will be able to work automatically.
> 
> It does not affect the boot-time of embedded devices, as the class is
> set based on the dmi information.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@kernel.org>
> ---
> v2:
> Changes by Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
>   - CodeStyle
> Changes by kernel test robot <lkp@intel.com>
>   - Include dmi header to fix build error on arc
>   - check if dmi_get_system_info returned NULL
>   drivers/i2c/busses/i2c-designware-platdrv.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index c2efaaaac252..5892fdba9c25 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -12,6 +12,7 @@
>   #include <linux/clk-provider.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
> +#include <linux/dmi.h>
>   #include <linux/err.h>
>   #include <linux/errno.h>
>   #include <linux/i2c.h>
> @@ -173,6 +174,19 @@ static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
>   		pm_runtime_put_noidle(dev->dev);
>   }
>   
> +static bool dw_i2c_hwmon_bus(void)
> +{
> +	const char *product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
> +
> +	if (!product_name)
> +		return false;
> +
> +	if (strstr(product_name, "QT5222"))
> +		return true;
> +
> +	return false;
> +}
> +

I'm not too familiar with the DMI stuff but is the more usual way to 
have struct dmi_system_id table and match it with dmi_check_system()? 
Perhaps scales better than individual dmi_get_system_info() and string 
comparison calls.

Andy and I were pondering offline is there any info in ACPI table that 
tells which bus have these sensors or can it be hardcoded with the DMI 
match so that there is no need probe all buses for these sensors on that 
product. But that can be another optimization patch I guess.

-- 
Jarkko
