Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE622C8312
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 12:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727288AbgK3LTx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 06:19:53 -0500
Received: from mga14.intel.com ([192.55.52.115]:53876 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726991AbgK3LTx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Nov 2020 06:19:53 -0500
IronPort-SDR: eALRnKzJrkNd+m4VpqXegC4UQqpIE8yNCVwu6IllFScAMux23Kl9zWD9FWubbkOL6CkHaju3ad
 r0uuzwxzQhgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="171833932"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="171833932"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 03:18:12 -0800
IronPort-SDR: 5X8Tc7DCdXzhdDv8CFJc09FehYzjAcD0BPPyn0Q3yPSHOMMFfZCfoz85kcfJn92QG1LA5GjvmU
 FLVjDsV1kWKA==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="315200774"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 03:18:08 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kjhD3-00B1vI-UN; Mon, 30 Nov 2020 13:19:09 +0200
Date:   Mon, 30 Nov 2020 13:19:09 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sanjay R Mehta <sanju.mehta@amd.com>
Cc:     wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, kblaiech@mellanox.com, loic.poulain@linaro.org,
        rppt@kernel.org, bjorn.andersson@linaro.org, linux@roeck-us.net,
        vadimp@mellanox.com, tali.perry1@gmail.com,
        linux-i2c@vger.kernel.org,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
Subject: Re: [PATCH] i2c: add i2c bus driver for AMD NAVI GPU
Message-ID: <20201130111909.GJ4077@smile.fi.intel.com>
References: <1606505439-39836-1-git-send-email-sanju.mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606505439-39836-1-git-send-email-sanju.mehta@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 27, 2020 at 01:30:39PM -0600, Sanjay R Mehta wrote:
> From: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
> 
> Latest AMD GPU card has USB Type-C interface. There is a
> Type-C controller which can be accessed over I2C.
> 
> This driver adds I2C bus driver to communicate with Type-C controller.
> I2C client driver will be part of USB Type-C UCSI driver.

...

> +I2C CONTROLLER DRIVER FOR AMD NAVI GPU

>  I2C MUXES

I always thought that NVIDIA should come after AMD...
You still didn't learn to run checkpatch.pl?

...

> +#include <asm/unaligned.h>

Move this after linux/* ones, or explain why should it be first.

> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>

...

> +#define DRIVER_DESC "AMD I2C Controller Driver for Navi"
> +#define AMD_UCSI_INTR_REG 0x474
> +#define AMD_UCSI_INTR_EN 0xD
> +#define AMD_MASTERCFG_MASK GENMASK_ULL(15, 0)

linux/bits.h is missing.

May you create a better indentation of the values to make it easier to read?

> +struct amdgpu_i2c_dev {
> +	void __iomem *regs;

DesignWare driver has been converted to use regmap. How comes you are using old
approach?

> +	struct device *dev;
> +	u32 master_cfg;
> +	u32 slave_adr;
> +	u32			tx_fifo_depth;
> +	u32			rx_fifo_depth;
> +	u32			sda_hold_time;
> +	u16			ss_hcnt;
> +	u16			ss_lcnt;
> +	u16			fs_hcnt;
> +	u16			fs_lcnt;
> +	u16			fp_hcnt;
> +	u16			fp_lcnt;
> +	u16			hs_hcnt;
> +	u16			hs_lcnt;
> +	struct i2c_adapter adapter;
> +	struct i2c_board_info *gpu_ccgx_ucsi;
> +	struct i2c_client *ccgx_client;
> +};

...

> +	while (readl(i2cd->regs + DW_IC_STATUS) & DW_IC_STATUS_ACTIVITY) {
> +		if (timeout <= 0) {
> +			dev_dbg(i2cd->dev, "timeout waiting for bus ready\n");
> +			if (readl(i2cd->regs + DW_IC_STATUS) & DW_IC_STATUS_ACTIVITY)
> +				return -ETIMEDOUT;
> +			return 0;
> +		}
> +		timeout--;
> +		usleep_range(1000, 1100);
> +	}

Homework: discover iopoll.h (or regmap.h if we take into account previous
comment). Bonus: try to read newest kernel submission in the area to see what's
new.

I stopped here. I think it's enough to revisit entire patch.
It will look differently for sure when you address all given comments.

-- 
With Best Regards,
Andy Shevchenko


