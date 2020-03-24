Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B77B319148A
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 16:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbgCXPfU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 11:35:20 -0400
Received: from mga04.intel.com ([192.55.52.120]:20383 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727216AbgCXPfU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 11:35:20 -0400
IronPort-SDR: LgWswiGKgRZcEtQCpX5S3ORFudk+2Zo0lp6rRUAYot75geEy27RdMTAuyYsvdHp0Hn1BWk/mLa
 x5MxbtF0ZSqQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2020 08:35:20 -0700
IronPort-SDR: DjgDT7YuDwbDWYF1HGq2qCo2JezbGlElTudi5lGD2km4UWW+ArvxX+SXNRQf/xcxzNHEj84W24
 iUl24loeegPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; 
   d="scan'208";a="235616865"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga007.jf.intel.com with ESMTP; 24 Mar 2020 08:35:16 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jGlaI-00CZJi-U8; Tue, 24 Mar 2020 17:35:18 +0200
Date:   Tue, 24 Mar 2020 17:35:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     ajayg@nvidia.com, Wolfram Sang <wsa@the-dreams.de>,
        "open list:I2C CONTROLLER DRIVER FOR NVIDIA GPU" 
        <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] i2c: nvidia-gpu: Handle timeout correctly in
 gpu_i2c_check_status()
Message-ID: <20200324153518.GP1922688@smile.fi.intel.com>
References: <20200324152812.20231-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324152812.20231-1-kai.heng.feng@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 24, 2020 at 11:28:11PM +0800, Kai-Heng Feng wrote:
> Nvidia card may come with a "phantom" UCSI device, and its driver gets
> stuck in probe routine, prevents any system PM operations like suspend.
> 
> There's an unaccounted case that the target time can equal to jiffies in
> gpu_i2c_check_status(), let's solve that by using readl_poll_timeout()
> instead of jiffies comparison functions. 
> 

Thank you!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


> Fixes: c71bcdcb42a7 ("i2c: add i2c bus driver for NVIDIA GPU")
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v3:
> - Use readl_poll_timeout to make the retry loop simpler.
> 
> v2:
> - Use a boolean to make sure the operation is timeout or not.
> 
>  drivers/i2c/busses/i2c-nvidia-gpu.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
> index 62e18b4db0ed..f5d25ce00f03 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> @@ -75,20 +76,15 @@ static void gpu_enable_i2c_bus(struct gpu_i2c_dev *i2cd)
>  
>  static int gpu_i2c_check_status(struct gpu_i2c_dev *i2cd)
>  {
> -	unsigned long target = jiffies + msecs_to_jiffies(1000);
>  	u32 val;
> +	int ret;
>  
> -	do {
> -		val = readl(i2cd->regs + I2C_MST_CNTL);
> -		if (!(val & I2C_MST_CNTL_CYCLE_TRIGGER))
> -			break;
> -		if ((val & I2C_MST_CNTL_STATUS) !=
> -				I2C_MST_CNTL_STATUS_BUS_BUSY)
> -			break;
> -		usleep_range(500, 600);
> -	} while (time_is_after_jiffies(target));
> -
> -	if (time_is_before_jiffies(target)) {
> +	ret = readl_poll_timeout(i2cd->regs + I2C_MST_CNTL, val,
> +				 !(val & I2C_MST_CNTL_CYCLE_TRIGGER) ||
> +				 (val & I2C_MST_CNTL_STATUS) != I2C_MST_CNTL_STATUS_BUS_BUSY,
> +				 500, 1000 * USEC_PER_MSEC);
> +
> +	if (ret) {
>  		dev_err(i2cd->dev, "i2c timeout error %x\n", val);
>  		return -ETIMEDOUT;
>  	}
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


