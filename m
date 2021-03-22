Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C480C344C86
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Mar 2021 18:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbhCVRAL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Mar 2021 13:00:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:29330 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231544AbhCVQ74 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Mar 2021 12:59:56 -0400
IronPort-SDR: tXRUvVQV8Zvmta4gGuk3BPyHiGWmpkfgL6RdNN8EKXQVqtf+z5bO0AcIQAwXYTOgomZRnP3lX+
 IXoiNWiFllUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="170271732"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="170271732"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 09:59:53 -0700
IronPort-SDR: FiLWm0VsFXnGrf8uZ4VF/Mnt1Z0Tqjc5+qnP6yLWYqgH/Z1Q2onfB83l623xUuBDRBRvOvdZsD
 P93vQlWTGdiA==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="390548578"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 09:59:50 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lONu6-00EmuM-UW; Mon, 22 Mar 2021 18:59:46 +0200
Date:   Mon, 22 Mar 2021 18:59:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org, digetx@gmail.com,
        treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, prime.zeng@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v3 2/3] i2c: add support for HiSilicon I2C controller
Message-ID: <YFjNAvVTavCRt/C8@smile.fi.intel.com>
References: <1616411413-7177-1-git-send-email-yangyicong@hisilicon.com>
 <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616411413-7177-3-git-send-email-yangyicong@hisilicon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 22, 2021 at 07:10:12PM +0800, Yicong Yang wrote:
> Add HiSilicon I2C controller driver for the Kunpeng SoC. It provides
> the access to the i2c busses, which connects to the eeprom, rtc, etc.
> 
> The driver works with IRQ mode, and supports basic I2C features and 10bit
> address. The DMA is not supported.

...

> +#include <linux/acpi.h>

Hadn't noticed how you are using this header.

> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/completion.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>

Missed mod_devicetable.h.
Probably missed property.h, but not sure.

> +#include <linux/platform_device.h>

...

> +#define HISI_I2C_INT_ALL	0x1f

GENMASK() ?

...

> +#define HISI_I2C_INT_ERR	(HISI_I2C_INT_TRANS_ERR | \
> +				 HISI_I2C_INT_FIFO_ERR)

Either one line, or it will look better like
#define HISI_I2C_INT_ERR					\
	(HISI_I2C_INT_TRANS_ERR | HISI_I2C_INT_FIFO_ERR)

...

> +#define HISI_I2C_STD_SPEED_MODE		0x0
> +#define HISI_I2C_FAST_SPEED_MODE	0x1
> +#define HISI_I2C_HIGH_SPEED_MODE	0x2

Why not plain decimal numbers?

...

> +struct hisi_i2c_controller {
> +	struct device *dev;

> +	struct i2c_adapter adapter;

If you put this as a first member, the container_of() become a no-op for this.
But I dunno if it's used against this structure.

> +	void __iomem *iobase;
> +	int irq;
> +
> +	/* Intermediates for recording the transfer process */
> +	struct completion *completion;
> +	struct i2c_msg *msgs;
> +	int msg_num;
> +	int msg_tx_idx;
> +	int buf_tx_idx;
> +	int msg_rx_idx;
> +	int buf_rx_idx;
> +	u16 tar_addr;
> +	u32 xfer_err;
> +
> +	/* I2C bus configuration */
> +	u32 scl_fall_time;
> +	u32 scl_rise_time;
> +	u32 sda_hold_time;
> +	u64 clk_rate_khz;
> +	u32 bus_freq_hz;
> +	u32 spk_len;
> +};

...

> +	struct i2c_timings t;
> +
> +	i2c_parse_fw_timings(ctlr->dev, &t, true);
> +	ctlr->bus_freq_hz = t.bus_freq_hz;

> +	ctlr->scl_fall_time = t.scl_fall_ns;
> +	ctlr->scl_rise_time = t.scl_rise_ns;
> +	ctlr->sda_hold_time = t.sda_hold_ns;

Why not simply to have the timings structure embedded into hisi_i2c_controller
one?

...

> +	ctlr->dev = dev;

Would it make sense to assign aster getting IRQ resource...

> +	ctlr->iobase = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ctlr->iobase))
> +		return PTR_ERR(ctlr->iobase);
> +
> +	ctlr->irq = platform_get_irq(pdev, 0);
> +	if (ctlr->irq < 0)
> +		return ctlr->irq;

...somewhere here?

> +	hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);

...

> +	ctlr->clk_rate_khz = DIV_ROUND_UP_ULL(ctlr->clk_rate_khz, 1000);

HZ_PER_KHZ ?

-- 
With Best Regards,
Andy Shevchenko


