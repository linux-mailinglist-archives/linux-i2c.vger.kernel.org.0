Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3C52D31BE
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 19:09:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbgLHSIW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Dec 2020 13:08:22 -0500
Received: from mga03.intel.com ([134.134.136.65]:44988 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730478AbgLHSIW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Dec 2020 13:08:22 -0500
IronPort-SDR: a0SnREGr6Lb4wb6V2ZILfXIHmitZOrNnVLp1PidhrJLlzT9ikqCVgk08BhZRo/F3zsRyAoSO3U
 g5x+xm+ZjjYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="174059555"
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="174059555"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 10:06:26 -0800
IronPort-SDR: ztnBQ8J5st4m+d6WK3mZPfhI6N1vlxltcvy7fmZmSjzbJJgAo6nzaXR34rLjaXvAu/TxuGRMIL
 wdNoLOq6B4JQ==
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; 
   d="scan'208";a="437472672"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 10:06:23 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kmhOW-00Csl6-AU; Tue, 08 Dec 2020 20:07:24 +0200
Date:   Tue, 8 Dec 2020 20:07:24 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sanjay R Mehta <sanju.mehta@amd.com>
Cc:     wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, kblaiech@mellanox.com, loic.poulain@linaro.org,
        rppt@kernel.org, bjorn.andersson@linaro.org, linux@roeck-us.net,
        vadimp@mellanox.com, tali.perry1@gmail.com,
        linux-i2c@vger.kernel.org,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
Subject: Re: [PATCH v3] i2c: add i2c bus driver for amd navi gpu
Message-ID: <20201208180724.GL4077@smile.fi.intel.com>
References: <1607446104-58597-1-git-send-email-sanju.mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1607446104-58597-1-git-send-email-sanju.mehta@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 08, 2020 at 10:48:24AM -0600, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <Sanju.Mehta@amd.com>

Please, don't send new versions too often. Give a chance others to review.

> Latest amdgpu card has USB Type-C interface. There is a Type-C controller
> which can be accessed over I2C.

This is confusing. Does it mean Type-C controller is being controlled via I²C
or this is a bridge I²C-to-Type-C (of course I barely believe in the latter but
who knows)?

> This driver adds I2C bus driver to communicate with Type-C controller. I2C
> client driver will be part of USB Type-C UCSI driver.

Is this IP is from Synopsys? Can you clarify it here?

...

>  drivers/i2c/busses/i2c-amdgpu-navi.c | 325 +++++++++++++++++++++++++++

If the answer is yes to the above Q, I would rather see this file to be in
i2c-designware namespace (and going further perhaps even part of its PCI
glue driver (with corresponding configuration option taken into account).

...

> +#define AMD_UCSI_INTR_EN	0xD
> +#define AMD_UCSI_INTR_REG	0x474
> +#define AMD_MASTERCFG_MASK	GENMASK(15, 0)

So, this sounds like a custom register space on top of Synopsys' one, correct?

...

> +struct amdgpu_i2c_dev {

> +	void __iomem		*regs;
> +	struct regmap		*map;
> +	struct device		*dev;
> +	u32			master_cfg;
> +	u32			slave_adr;
> +	u32			tx_fifo_depth;
> +	u32			rx_fifo_depth;
> +	u16			ss_hcnt;
> +	u16			ss_lcnt;
> +	struct i2c_adapter	adapter;

Can you rather embed struct dw_i2c_dev here instead of all above?

> +	struct i2c_board_info	*gpu_ccgx_ucsi;
> +	struct i2c_client	*ccgx_client;
> +};

...

> +static void amdgpu_configure_i2c_bus(struct amdgpu_i2c_dev *i2cd)
> +{
> +	u16 icon;
> +	u32 reg;
> +
> +	/* First disable the controller */
> +	regmap_write(i2cd->map, DW_IC_ENABLE, 0);
> +	i2cd->master_cfg = DW_IC_CON_MASTER | DW_IC_CON_SLAVE_DISABLE | DW_IC_CON_RESTART_EN |
> +			   DW_IC_CON_SPEED_STD;
> +
> +	/* clear all the interrupts */
> +	regmap_read(i2cd->map, DW_IC_CLR_INTR, &reg);
> +	regmap_write(i2cd->map, DW_IC_INTR_MASK, 0);
> +
> +	icon = i2cd->master_cfg & AMD_MASTERCFG_MASK;
> +	icon &= ~BIT(3);
> +	icon &= ~DW_IC_CON_10BITADDR_MASTER;
> +	icon = icon | DW_IC_CON_SPEED_STD;
> +	/* configure the master */
> +	regmap_write(i2cd->map, DW_IC_CON, icon);
> +	/* configure the FIFO */
> +	i2cd->tx_fifo_depth = 32;
> +	i2cd->rx_fifo_depth = 32;
> +	regmap_write(i2cd->map, DW_IC_TX_TL, i2cd->tx_fifo_depth);
> +	regmap_write(i2cd->map, DW_IC_RX_TL, i2cd->rx_fifo_depth);
> +
> +	/* setup 100k Speed */
> +	i2cd->ss_hcnt = 430;
> +	i2cd->ss_lcnt = 570;
> +	regmap_write(i2cd->map, DW_IC_SS_SCL_HCNT, i2cd->ss_hcnt);
> +	regmap_write(i2cd->map, DW_IC_SS_SCL_LCNT, i2cd->ss_lcnt);
> +	/* setup the slave address */
> +	i2cd->slave_adr = 0x08;
> +	regmap_write(i2cd->map, DW_IC_TAR, i2cd->slave_adr);
> +
> +	/* Now Enable the controller */
> +	regmap_write(i2cd->map, DW_IC_ENABLE, 1);
> +}

Can you use existing code from i2c-designware-common.c?

(For instance, i2c_dw_scl_hcnt() / i2c_dw_scl_lcnt() for counters,
 i2c_dw_set_fifo_size() for FIFO depth)

...

> +static int amdgpu_i2c_check_activity(struct amdgpu_i2c_dev *i2cd)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read_poll_timeout(i2cd->map, DW_IC_STATUS, val,
> +				       !(val & DW_IC_STATUS_ACTIVITY),
> +				       1100, 20000);
> +	if (ret) {
> +		dev_err(i2cd->dev, "i2c timeout error %x\n", val);
> +		return -ETIMEDOUT;
> +	}
> +
> +	regmap_read(i2cd->map, DW_IC_STATUS, &val);
> +	if (val & DW_IC_STATUS_ACTIVITY)
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}

Isn't it a dup of i2c_dw_wait_bus_not_busy()?

...

> +/* Polling based xfer routine */
> +static int amdgpu_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct amdgpu_i2c_dev *i2cd = i2c_get_adapdata(adap);
> +	int i, j, len, k;
> +	int cmd = 0;
> +	int status;
> +	u8 *buf;
> +	u32 val;
> +
> +	amdgpu_configure_i2c_bus(i2cd);
> +
> +	for (i = 0; i < num; i++) {
> +		buf = msgs[i].buf;
> +		len = msgs[i].len;
> +
> +		if (!(msgs[i].flags & I2C_M_RD))
> +			regmap_write(i2cd->map, DW_IC_TX_TL, len - 1);
> +
> +		for (j = len; j > 0; j--) {
> +			if (i == num - 1 && j == 1)

> +				cmd |= BIT(9);

What is this magic for?

> +
> +			if (msgs[i].flags & I2C_M_RD) {
> +				regmap_write(i2cd->map, DW_IC_DATA_CMD, 0x100);
> +				regmap_write(i2cd->map, DW_IC_DATA_CMD, 0x100 | cmd);
> +				if (cmd) {
> +					regmap_write(i2cd->map, DW_IC_TX_TL, 2 * (len - 1));
> +					regmap_write(i2cd->map, DW_IC_RX_TL, 2 * (len - 1));
> +					status = amdgpu_i2c_status(i2cd);
> +					if (status)
> +						return -ETIMEDOUT;
> +
> +					for (k = 0; k < len; k++) {
> +						regmap_read(i2cd->map, DW_IC_DATA_CMD, &val);
> +						buf[k] = val;
> +					}
> +					status = amdgpu_i2c_check_stopbit(i2cd);
> +					if (status)
> +						return -ETIMEDOUT;
> +				}
> +			} else {
> +				regmap_write(i2cd->map, DW_IC_DATA_CMD, *buf++ | cmd);
> +				usleep_range(10000, 11000);
> +			}
> +		}
> +		status = amdgpu_i2c_check_stopbit(i2cd);
> +		if (status)
> +			return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}

...

> +static u32 amdgpu_i2c_functionality(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm amdgpu_i2c_algorithm = {
> +	.master_xfer	= amdgpu_i2c_master_xfer,
> +	.functionality	= amdgpu_i2c_functionality,
> +};

Can you utilize i2c_dw_func() along with functionality member of struct
dw_i2c_dev?

...

> +static const struct pci_device_id amdgpu_i2c_ids[] = {
> +		{PCI_VDEVICE(ATI, 0x7314)},
> +		{PCI_VDEVICE(ATI, 0x73A4)},
> +		{PCI_VDEVICE(ATI, 0x73C4)},
> +		{PCI_VDEVICE(ATI, 0x73E4)},

Two issues with indentation:
- extra TAB
- missed surrounding spaces inside {} of each record.

> +		{ }
> +};
> +MODULE_DEVICE_TABLE(pci, amdgpu_i2c_ids);

Move it closer to the actual user of the table.

...

> +static int amdgpu_populate_client(struct amdgpu_i2c_dev *i2cd, int irq)
> +{
> +	i2cd->gpu_ccgx_ucsi = devm_kzalloc(i2cd->dev,
> +					   sizeof(*i2cd->gpu_ccgx_ucsi),
> +					   GFP_KERNEL);

Do you really need this to be alive for entire lifetime of the device
bound to the driver?

> +	if (!i2cd->gpu_ccgx_ucsi)
> +		return -ENOMEM;
> +
> +	strlcpy(i2cd->gpu_ccgx_ucsi->type, "ccgx-ucsi", sizeof(i2cd->gpu_ccgx_ucsi->type));
> +	i2cd->gpu_ccgx_ucsi->addr = 0x8;
> +	i2cd->gpu_ccgx_ucsi->irq = irq;

> +	i2cd->ccgx_client = i2c_new_client_device(&i2cd->adapter, i2cd->gpu_ccgx_ucsi);
> +	if (!i2cd->ccgx_client)
> +		return -ENODEV;
> +
> +	return 0;

Read documentation: "This returns ... or an ERR_PTR to describe the error."

> +}

...

> +	pci_set_master(pdev);

Why?

...

> +	status = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);

Do you know what type of IRQ your hardware handles?

> +	if (status < 0) {
> +		dev_err(&pdev->dev, "pci_alloc_irq_vectors err %d\n", status);
> +		return status;
> +	}
> +
> +	irq = pci_irq_vector(pdev, 0);

...

> +	/* Enable ucsi interrupt */

Please, spell abbreviation capitalized everywhere, like UCSI in this case.

...

> +static void amdgpu_i2c_remove(struct pci_dev *pdev)
> +{
> +	struct amdgpu_i2c_dev *i2cd = dev_get_drvdata(&pdev->dev);
> +
> +	regmap_write(i2cd->map, AMD_UCSI_INTR_REG, 0);
> +	i2c_del_adapter(&i2cd->adapter);
> +	pci_free_irq_vectors(pdev);

Here is the thing. You better not interleave devm_*() / pci_m*() / etc with
regular calls because here you have an ordering issues.

OTOH it may be grouped like all managed followed by the rest which is regular
calls. And yes, here I'm talking about ->probe().

> +}

-- 
With Best Regards,
Andy Shevchenko


