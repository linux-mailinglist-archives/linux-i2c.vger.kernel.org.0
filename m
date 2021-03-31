Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0032335020E
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 16:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235835AbhCaOT4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 10:19:56 -0400
Received: from mga12.intel.com ([192.55.52.136]:25411 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236101AbhCaOTX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 10:19:23 -0400
IronPort-SDR: uYcsX6iOCzlSVbtCe17emogWsovB1tiFCUhKBPyh/CJM1cWUGmBw7dGtf/91/HoIKiJ+wpuJ9t
 +zdCXyAktksA==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="171428736"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="171428736"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 07:19:22 -0700
IronPort-SDR: 1IJ9U49tZyes7rDzg9rqFwKFSXrdEJkj5eIUoEaQ5WKaBH6PmPZNxD5VbIUV+iRyXM1v7IpFVF
 32EurUDBrWSg==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="394054396"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 07:19:19 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lRbgi-00025b-Ql; Wed, 31 Mar 2021 17:19:16 +0300
Date:   Wed, 31 Mar 2021 17:19:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: Re: [PATCH v4] i2c: designware: Add driver support for AMD NAVI GPU
Message-ID: <YGSE5C+3E6BNR997@smile.fi.intel.com>
References: <20210331140730.2058967-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331140730.2058967-1-Sanket.Goswami@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 31, 2021 at 07:37:30PM +0530, Sanket Goswami wrote:
> The Latest AMD NAVI GPU card has an integrated Type-C controller and
> Designware I2C with PCI Interface. The PD controller for USB Type-C can
> be accessed over I2C. The client driver is part of the USB Type-C UCSI
> driver.
> 
> Also, there exists a couple of notable IP limitations that are dealt as
> workarounds:
> - I2C transaction work on a polling mode as IP does not generate
> interrupt.
> - I2C read command sent twice to address the IP issues.
> - AMD NAVI GPU based products are already in the commercial market,
>   hence some of the I2C parameters are statically programmed as they
>   can not be part of the ACPI table.

Looks good enough to me, thanks.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Co-developed-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v4:
> - Fixes review comments given by Andy. 
> 
> Changes in v3:
> - Fixes runtime PM issue.
> - Addressed review comments were given by Jarkko and Andy.
> 
> Changes in v2:
> - Utilized existing functionality of i2c_dw_xfer_init to configure I2C
>   bus.
> - Removed i2c_dw_populate_client and rewrrient navi_amd_register_client
>   to deduplicate from existing drivers.
> - Addressed review comments were given by Andy.
> 
>  drivers/i2c/busses/i2c-designware-common.c |   3 +
>  drivers/i2c/busses/i2c-designware-core.h   |   8 ++
>  drivers/i2c/busses/i2c-designware-master.c | 133 +++++++++++++++++++++
>  drivers/i2c/busses/i2c-designware-pcidrv.c |  61 ++++++++++
>  4 files changed, 205 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index 3c19aada4b30..fdc34d9e3702 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -150,6 +150,9 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
>  	reg = readl(dev->base + DW_IC_COMP_TYPE);
>  	i2c_dw_release_lock(dev);
>  
> +	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
> +		map_cfg.max_register = AMD_UCSI_INTR_REG;
> +
>  	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
>  		map_cfg.reg_read = dw_reg_read_swab;
>  		map_cfg.reg_write = dw_reg_write_swab;
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 5392b82f68a4..6a53f75abf7c 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -295,8 +295,16 @@ struct dw_i2c_dev {
>  
>  #define MODEL_MSCC_OCELOT	BIT(8)
>  #define MODEL_BAIKAL_BT1	BIT(9)
> +#define MODEL_AMD_NAVI_GPU	BIT(10)
>  #define MODEL_MASK		GENMASK(11, 8)
>  
> +/*
> + * Enable UCSI interrupt by writing 0xd at register
> + * offset 0x474 specified in hardware specification.
> + */
> +#define AMD_UCSI_INTR_REG	0x474
> +#define AMD_UCSI_INTR_EN	0xd
> +
>  int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
>  u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
>  u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index dd27b9dbe931..e288b654cb47 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -23,6 +23,10 @@
>  
>  #include "i2c-designware-core.h"
>  
> +#define AMD_TIMEOUT_MIN_US	25
> +#define AMD_TIMEOUT_MAX_US	250
> +#define AMD_MASTERCFG_MASK	GENMASK(15, 0)
> +
>  static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
>  {
>  	/* Configure Tx/Rx FIFO threshold levels */
> @@ -259,6 +263,108 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
>  	regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK);
>  }
>  
> +static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read_poll_timeout(dev->map, DW_IC_INTR_STAT, val,
> +				       !(val & DW_IC_INTR_STOP_DET),
> +					1100, 20000);
> +	if (ret)
> +		dev_err(dev->dev, "i2c timeout error %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int i2c_dw_status(struct dw_i2c_dev *dev)
> +{
> +	int status;
> +
> +	status = i2c_dw_wait_bus_not_busy(dev);
> +	if (status)
> +		return status;
> +
> +	return i2c_dw_check_stopbit(dev);
> +}
> +
> +/*
> + * Initiate and continue master read/write transaction with polling
> + * based transfer routine afterward write messages into the Tx buffer.
> + */
> +static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
> +{
> +	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
> +	int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
> +	int cmd = 0, status;
> +	u8 *tx_buf;
> +	u32 val;
> +
> +	/*
> +	 * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
> +	 * it is mandatory to set the right value in specific register
> +	 * (offset:0x474) as per the hardware IP specification.
> +	 */
> +	regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);
> +
> +	dev->msgs = msgs;
> +	dev->msgs_num = num_msgs;
> +	i2c_dw_xfer_init(dev);
> +	i2c_dw_disable_int(dev);
> +
> +	/* Initiate messages read/write transaction */
> +	for (msg_wrt_idx = 0; msg_wrt_idx < num_msgs; msg_wrt_idx++) {
> +		tx_buf = msgs[msg_wrt_idx].buf;
> +		buf_len = msgs[msg_wrt_idx].len;
> +
> +		if (!(msgs[msg_wrt_idx].flags & I2C_M_RD))
> +			regmap_write(dev->map, DW_IC_TX_TL, buf_len - 1);
> +		/*
> +		 * Initiate the i2c read/write transaction of buffer length,
> +		 * and poll for bus busy status. For the last message transfer,
> +		 * update the command with stopbit enable.
> +		 */
> +		for (msg_itr_lmt = buf_len; msg_itr_lmt > 0; msg_itr_lmt--) {
> +			if (msg_wrt_idx == num_msgs - 1 && msg_itr_lmt == 1)
> +				cmd |= BIT(9);
> +
> +			if (msgs[msg_wrt_idx].flags & I2C_M_RD) {
> +				/* Due to hardware bug, need to write the same command twice. */
> +				regmap_write(dev->map, DW_IC_DATA_CMD, 0x100);
> +				regmap_write(dev->map, DW_IC_DATA_CMD, 0x100 | cmd);
> +				if (cmd) {
> +					regmap_write(dev->map, DW_IC_TX_TL, 2 * (buf_len - 1));
> +					regmap_write(dev->map, DW_IC_RX_TL, 2 * (buf_len - 1));
> +					/*
> +					 * Need to check the stop bit. However, it cannot be
> +					 * detected from the registers so we check it always
> +					 * when read/write the last byte.
> +					 */
> +					status = i2c_dw_status(dev);
> +					if (status)
> +						return status;
> +
> +					for (data_idx = 0; data_idx < buf_len; data_idx++) {
> +						regmap_read(dev->map, DW_IC_DATA_CMD, &val);
> +						tx_buf[data_idx] = val;
> +					}
> +					status = i2c_dw_check_stopbit(dev);
> +					if (status)
> +						return status;
> +				}
> +			} else {
> +				regmap_write(dev->map, DW_IC_DATA_CMD, *tx_buf++ | cmd);
> +				usleep_range(AMD_TIMEOUT_MIN_US, AMD_TIMEOUT_MAX_US);
> +			}
> +		}
> +		status = i2c_dw_check_stopbit(dev);
> +		if (status)
> +			return status;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * Initiate (and continue) low level master read/write transaction.
>   * This function is only called from i2c_dw_isr, and pumping i2c_msg
> @@ -462,6 +568,16 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  
>  	pm_runtime_get_sync(dev->dev);
>  
> +	/*
> +	 * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
> +	 * As it is polling based transfer mechanism, which does not support
> +	 * interrupt based functionalities of existing DesignWare driver.
> +	 */
> +	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
> +		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
> +		goto done_nolock;
> +	}
> +
>  	if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
>  		ret = -ESHUTDOWN;
>  		goto done_nolock;
> @@ -738,6 +854,20 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
>  	return 0;
>  }
>  
> +static int amd_i2c_adap_quirk(struct dw_i2c_dev *dev)
> +{
> +	struct i2c_adapter *adap = &dev->adapter;
> +	int ret;
> +
> +	pm_runtime_get_noresume(dev->dev);
> +	ret = i2c_add_numbered_adapter(adap);
> +	if (ret)
> +		dev_err(dev->dev, "Failed to add adapter: %d\n", ret);
> +	pm_runtime_put_noidle(dev->dev);
> +
> +	return ret;
> +}
> +
>  int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  {
>  	struct i2c_adapter *adap = &dev->adapter;
> @@ -774,6 +904,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  	adap->dev.parent = dev->dev;
>  	i2c_set_adapdata(adap, dev);
>  
> +	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
> +		return amd_i2c_adap_quirk(dev);
> +
>  	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
>  		irq_flags = IRQF_NO_SUSPEND;
>  	} else {
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 55c83a7a24f3..7ca0017883a6 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -26,6 +26,7 @@
>  #include "i2c-designware-core.h"
>  
>  #define DRIVER_NAME "i2c-designware-pci"
> +#define AMD_CLK_RATE_HZ	100000
>  
>  enum dw_pci_ctl_id_t {
>  	medfield,
> @@ -34,6 +35,7 @@ enum dw_pci_ctl_id_t {
>  	cherrytrail,
>  	haswell,
>  	elkhartlake,
> +	navi_amd,
>  };
>  
>  struct dw_scl_sda_cfg {
> @@ -78,11 +80,23 @@ static struct dw_scl_sda_cfg hsw_config = {
>  	.sda_hold = 0x9,
>  };
>  
> +/* NAVI-AMD HCNT/LCNT/SDA hold time */
> +static struct dw_scl_sda_cfg navi_amd_config = {
> +	.ss_hcnt = 0x1ae,
> +	.ss_lcnt = 0x23a,
> +	.sda_hold = 0x9,
> +};
> +
>  static u32 mfld_get_clk_rate_khz(struct dw_i2c_dev *dev)
>  {
>  	return 25000;
>  }
>  
> +static u32 navi_amd_get_clk_rate_khz(struct dw_i2c_dev *dev)
> +{
> +	return AMD_CLK_RATE_HZ;
> +}
> +
>  static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
>  {
>  	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
> @@ -104,6 +118,35 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
>  	return -ENODEV;
>  }
>  
> + /*
> +  * TODO find a better way how to deduplicate instantiation
> +  * of USB PD slave device from nVidia GPU driver.
> +  */
> +static int navi_amd_register_client(struct dw_i2c_dev *dev)
> +{
> +	struct i2c_board_info	info;
> +
> +	memset(&info, 0, sizeof(struct i2c_board_info));
> +	strscpy(info.type, "ccgx-ucsi", I2C_NAME_SIZE);
> +	info.addr = 0x08;
> +	info.irq = dev->irq;
> +
> +	dev->slave = i2c_new_client_device(&dev->adapter, &info);
> +	if (!dev->slave)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int navi_amd_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
> +{
> +	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
> +
> +	dev->flags |= MODEL_AMD_NAVI_GPU;
> +	dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
> +	return 0;
> +}
> +
>  static int mrfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
>  {
>  	/*
> @@ -155,6 +198,12 @@ static struct dw_pci_controller dw_pci_controllers[] = {
>  		.bus_num = -1,
>  		.get_clk_rate_khz = ehl_get_clk_rate_khz,
>  	},
> +	[navi_amd] = {
> +		.bus_num = -1,
> +		.scl_sda_cfg = &navi_amd_config,
> +		.setup =  navi_amd_setup,
> +		.get_clk_rate_khz = navi_amd_get_clk_rate_khz,
> +	},
>  };
>  
>  #ifdef CONFIG_PM
> @@ -274,6 +323,14 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  		return r;
>  	}
>  
> +	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
> +		r = navi_amd_register_client(dev);
> +		if (r) {
> +			dev_err(dev->dev, "register client failed with %d\n", r);
> +			return r;
> +		}
> +	}
> +
>  	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  	pm_runtime_put_autosuspend(&pdev->dev);
> @@ -337,6 +394,10 @@ static const struct pci_device_id i2_designware_pci_ids[] = {
>  	{ PCI_VDEVICE(INTEL, 0x4bbe), elkhartlake },
>  	{ PCI_VDEVICE(INTEL, 0x4bbf), elkhartlake },
>  	{ PCI_VDEVICE(INTEL, 0x4bc0), elkhartlake },
> +	{ PCI_VDEVICE(ATI,  0x7314), navi_amd },
> +	{ PCI_VDEVICE(ATI,  0x73a4), navi_amd },
> +	{ PCI_VDEVICE(ATI,  0x73e4), navi_amd },
> +	{ PCI_VDEVICE(ATI,  0x73c4), navi_amd },
>  	{ 0,}
>  };
>  MODULE_DEVICE_TABLE(pci, i2_designware_pci_ids);
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


