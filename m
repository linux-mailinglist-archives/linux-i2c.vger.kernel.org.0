Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D12634E4C5
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Mar 2021 11:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhC3Jvx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Mar 2021 05:51:53 -0400
Received: from mga12.intel.com ([192.55.52.136]:24594 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229633AbhC3Jv0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Mar 2021 05:51:26 -0400
IronPort-SDR: 9pizw+jQY/ic/bRSn7Ya1tg88gqhq/9NM7o1Ga/CdFTRb+vmAg42ErrIGtSy557lyjWw8shU9j
 PM4X5cO5WHrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="171137199"
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="171137199"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 02:51:07 -0700
IronPort-SDR: 7vJLkuKOdiVlqQu+bRSw5XZJZWbZvRy3JZL4oAOG4YKXrYA50k1c6iQ8P1MmA/Xjb0+3NNSyfh
 VrRKBh864VAQ==
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="393551541"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 02:51:05 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lRB1a-00HIFR-OY; Tue, 30 Mar 2021 12:51:02 +0300
Date:   Tue, 30 Mar 2021 12:51:02 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: Re: [PATCH v3] i2c: designware: Add driver support for AMD NAVI GPU
Message-ID: <YGL0hogMK6Uqjx/3@smile.fi.intel.com>
References: <20210330064715.3620864-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330064715.3620864-1-Sanket.Goswami@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 30, 2021 at 12:17:15PM +0530, Sanket Goswami wrote:

Thanks for an update, my comments below.

> The Latest AMD NAVI GPU card has an integrated Type-C controller and
> Designware I2C with PCI Interface. The Type-C controller can be
> accessed over I2C.

Entire controller? You probably have to rephrase this to make sure
that everybody understands what you are talking about (presumable it's
"USB PD for Type-C" rather than "Type-C controller").

> The client driver is part of the USB Type-C UCSI
> driver.

> Also, there exists a couple of notable IP limitations that are dealt as
> workarounds:
> - I2C transaction work on a polling mode as IP does not generate
> interrupt.
> - I2C read command sent twice to address the IP issues.
> - AMD NAVI GPU based products are already in the commercial market,
>   hence some of the I2C parameters are statically programmed as it can
>   not be part of ACPI table.

...

> +	if (dev->flags & MODEL_AMD_NAVI_GPU)

	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)

> +		map_cfg.max_register = AMD_UCSI_INTR_REG;

...

>  #define ACCESS_INTR_MASK	BIT(0)
>  #define ACCESS_NO_IRQ_SUSPEND	BIT(1)
>  
> +#define MODEL_AMD_NAVI_GPU	BIT(2)

This bit number doesn't fit MODEL_MASK.

>  #define MODEL_MSCC_OCELOT	BIT(8)
>  #define MODEL_BAIKAL_BT1	BIT(9)
>  #define MODEL_MASK		GENMASK(11, 8)

+ blank line here.

> +#define AMD_UCSI_INTR_EN	0xd
> +#define AMD_UCSI_INTR_REG	0x474

Not sure I understood where is what. 0xd is a value or register offset?
Needs to be register offset first, followed by values. Also add a comment
to explain what is this register for.

...

> +#define AMD_TIMEOUT_MIN_MSEC	10000
> +#define AMD_TIMEOUT_MAX_MSEC	11000

MSEC -> MS

So, it's 10 and 11 seconds?! Needs a very good comment about such a long
delays.

...

> +static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read_poll_timeout(dev->map, DW_IC_INTR_STAT, val,
> +				       !(val & DW_IC_INTR_STOP_DET),
> +					1100, 20000);
> +	if (ret) {
> +		dev_err(dev->dev, "i2c timeout error %d\n", ret);

> +		return -ETIMEDOUT;

Why shadowed error code?

> +	}

> +	regmap_read(dev->map, DW_IC_CLR_INTR, &val);

So, if above stops the polling, the condition is that bit is cleared.
How this makes it set again? Elaborate, please, why do you need the below
conditional and under which circumstances it may become true.

> +	if (val & DW_IC_INTR_STOP_DET)
> +		return -ETIMEDOUT;
> +
> +	return 0;
> +}
> +
> +static int i2c_dw_status(struct dw_i2c_dev *dev)
> +{
> +	int status;
> +
> +	status = i2c_dw_wait_bus_not_busy(dev);
> +	if (status)

> +		return -ETIMEDOUT;

Why you always shadow error codes?

> +	return i2c_dw_check_stopbit(dev);
> +}
> +
> +/*
> + * Initiate and continue master read/write transaction with polling
> + * based transfer routine afterward write messages into the tx buffer.

tx -> Tx

> + */
> +static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
> +{
> +	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
> +	int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
> +	int cmd = 0, ret, status;
> +	u8 *tx_buf;
> +	u32 val;

+ blank line.

> +	/*
> +	 * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
> +	 * it is mandatory to set the right value in specific register
> +	 * (offset:0x474) as per the hardware IP specification.
> +	 */
> +	regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);

> +	ret = i2c_dw_acquire_lock(dev);

Do you need this? Does AMD have that ugly ACPI based mutex?

> +	if (ret) {
> +		dev_err(dev->dev, "Failed to get bus ownership\n");
> +		return ret;
> +	}
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
> +					if (status) {

> +						ret = -ETIMEDOUT;

???

> +						goto lock_release;
> +					}
> +					for (data_idx = 0; data_idx < buf_len; data_idx++) {
> +						regmap_read(dev->map, DW_IC_DATA_CMD, &val);
> +						tx_buf[data_idx] = val;
> +					}
> +					status = i2c_dw_check_stopbit(dev);
> +					if (status) {

> +						ret = -ETIMEDOUT;

???

> +						goto lock_release;
> +					}
> +				}
> +			} else {
> +				regmap_write(dev->map, DW_IC_DATA_CMD, *tx_buf++ | cmd);
> +				usleep_range(AMD_TIMEOUT_MIN_MSEC, AMD_TIMEOUT_MAX_MSEC);
> +			}
> +		}
> +		status = i2c_dw_check_stopbit(dev);
> +		if (status) {

> +			ret = -ETIMEDOUT;

???

> +			goto lock_release;
> +		}
> +	}

> +lock_release:
> +	i2c_dw_release_lock(dev);

So you need this? Why?

> +	return ret;
> +}

...

>  	pm_runtime_get_sync(dev->dev);

+ Blank line.

> +	/*
> +	 * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
> +	 * As it is polling based transfer mechanism, which does not support
> +	 * interrupt based functionalities of existing DesignWare driver.
> +	 */
> +	if (dev->flags & MODEL_AMD_NAVI_GPU) {
> +		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
> +		goto done_nolock;
> +	}

...

> +static int amd_i2c_adap_quirk(struct dw_i2c_dev *dev)
> +{
> +	struct i2c_adapter *adap = &dev->adapter;
> +	int ret;
> +
> +	pm_runtime_get_noresume(dev->dev);
> +	ret = i2c_add_numbered_adapter(adap);

> +	if (ret)
> +		dev_err(dev->dev, "Failed to add adapter : %d\n", ret);

Why is this under PM hooks?

> +	pm_runtime_put_noidle(dev->dev);
> +
> +	return ret;
> +}

>  int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  {
>  	struct i2c_adapter *adap = &dev->adapter;
> @@ -774,6 +922,9 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  	adap->dev.parent = dev->dev;
>  	i2c_set_adapdata(adap, dev);
>  
> +	if (dev->flags & MODEL_AMD_NAVI_GPU)
> +		return amd_i2c_adap_quirk(dev);
> +
>  	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
>  		irq_flags = IRQF_NO_SUSPEND;
>  	} else {

...

> +#define AMD_CLK_RATE_HZ	100000

Shouldn't others be also defined like this?

...

Add a TODO line here to point out that nVidia driver and this should be
deduplicated on how they instantiate a USB PD slave device.

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

...

> +	if (dev->flags & MODEL_AMD_NAVI_GPU)
> +		r = navi_amd_register_client(dev);

> +	if (r) {
> +		dev_err(dev->dev, "register client failed with %d\n", r);
> +		return r;
> +	}

This seems to be on a wrong scope.

-- 
With Best Regards,
Andy Shevchenko


