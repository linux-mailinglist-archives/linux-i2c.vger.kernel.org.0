Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA49346115
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 15:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhCWOL2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 10:11:28 -0400
Received: from mga01.intel.com ([192.55.52.88]:11161 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231734AbhCWOLF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Mar 2021 10:11:05 -0400
IronPort-SDR: yeNHj5o/HpvjqEQzkoNVvuUl8RKeU4Tinl5+V0ao7XvN1ATyEaojc+9ZP/bmrNQzAe7CADGT5I
 VY/VQ4VlLScg==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="210561518"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="210561518"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 07:10:04 -0700
IronPort-SDR: JD1MSXuVMvNAQkB0K+bVyHEGlrTXDovueZZhp4arNLAbSYRHVkjV7lJ73BCEmIlNT6cd25ps6G
 1W41iD2pBKPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="452153707"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2021 07:10:01 -0700
Subject: Re: [PATCH v2] i2c: designware: Add driver support for AMD NAVI GPU
To:     Sanket Goswami <Sanket.Goswami@amd.com>,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
References: <20210322165947.1921770-1-Sanket.Goswami@amd.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <629d5f1a-b5a6-c457-4108-f4c546d702db@linux.intel.com>
Date:   Tue, 23 Mar 2021 16:10:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322165947.1921770-1-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 3/22/21 6:59 PM, Sanket Goswami wrote:
> The Latest AMD NAVI GPU card has an integrated Type-C controller and
> Designware I2C with PCI Interface. The Type-C controller can be
> accessed over I2C. The client driver is part of the USB Type-C UCSI
> driver.
> 
> Also, there exists a couple of notable IP limitations that are dealt as
> workarounds:
> - I2C transaction work on a polling mode as IP does not generate
> interrupt.
> - I2C read command sent twice to address the IP issues.
> 
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Co-developed-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v2:
> - Utilized existing functionality of i2c_dw_xfer_init to configure I2C
>    bus.
> - Removed i2c_dw_populate_client and rewrrient navi_amd_register_client
>    to deduplicate from existing drivers.
> - Addressed review comments from Andy.
>   
> drivers/i2c/busses/i2c-designware-common.c |   3 +
>   drivers/i2c/busses/i2c-designware-core.h   |   3 +
>   drivers/i2c/busses/i2c-designware-master.c | 136 +++++++++++++++++++++
>   drivers/i2c/busses/i2c-designware-pcidrv.c |  57 +++++++++
>   4 files changed, 199 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index 3c19aada4b30..50883a70b482 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -150,6 +150,9 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
>   	reg = readl(dev->base + DW_IC_COMP_TYPE);
>   	i2c_dw_release_lock(dev);
>   
> +	if (dev->flags & AMD_NON_INTR_MODE)
> +		map_cfg.max_register = AMD_UCSI_INTR_REG;
> +
>   	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
>   		map_cfg.reg_read = dw_reg_read_swab;
>   		map_cfg.reg_write = dw_reg_write_swab;
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 5392b82f68a4..f29923c452ac 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -293,9 +293,12 @@ struct dw_i2c_dev {
>   #define ACCESS_INTR_MASK	BIT(0)
>   #define ACCESS_NO_IRQ_SUSPEND	BIT(1)
>   
> +#define AMD_NON_INTR_MODE	BIT(2)
>   #define MODEL_MSCC_OCELOT	BIT(8)
>   #define MODEL_BAIKAL_BT1	BIT(9)
>   #define MODEL_MASK		GENMASK(11, 8)
> +#define AMD_UCSI_INTR_EN	0xd
> +#define AMD_UCSI_INTR_REG	0x474
>   
>   int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
>   u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index dd27b9dbe931..a76e1f992850 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -23,6 +23,10 @@
>   
>   #include "i2c-designware-core.h"
>   
> +#define AMD_TIMEOUT_MIN_MSEC	10000
> +#define AMD_TIMEOUT_MAX_MSEC	11000
> +#define AMD_MASTERCFG_MASK	GENMASK(15, 0)
> +
>   static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
>   {
>   	/* Configure Tx/Rx FIFO threshold levels */
> @@ -208,6 +212,13 @@ static int i2c_dw_init_master(struct dw_i2c_dev *dev)
>   	if (dev->sda_hold_time)
>   		regmap_write(dev->map, DW_IC_SDA_HOLD, dev->sda_hold_time);
>   
> +	/*
> +	 * In order to enable the interrupt for UCSI i.e. AMD NAVI GPU card,
> +	 * it is mandatory to set the right value in specific register
> +	 * (offset:0x474) as per the hardware IP specification.
> +	 */
> +	if (dev->flags & AMD_NON_INTR_MODE)
> +		regmap_write(dev->map, AMD_UCSI_INTR_REG, AMD_UCSI_INTR_EN);

This confuses me - this patch is about adding support for DesignWare IP 
that does not generate interrupts but here code is enabling an 
interrupt. I guess it's for UCSI but should above code then go to a 
driver handling that IP?

> +static int i2c_dw_check_stopbit(struct dw_i2c_dev *i2cd)
...
> +static int i2c_dw_status(struct dw_i2c_dev *i2cd)
...
> +static int amd_i2c_dw_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
...
> +{
> +	struct dw_i2c_dev *i2cd = i2c_get_adapdata(adap);

For uniformity I'd use struct dw_i2c_dev *dev name instead of *i2cd 
since that what driver uses currently in other places.

> @@ -461,6 +587,13 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>   	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
>   
>   	pm_runtime_get_sync(dev->dev);
> +	/*
> +	 * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
> +	 * As it is polling based transfer mechanism, which does not support
> +	 * interrupt based functionalities of existing DesignWare driver.
> +	 */
> +	if (dev->flags & AMD_NON_INTR_MODE)
> +		return amd_i2c_dw_master_xfer(adap, msgs, num);
>   
Does runtime PM go out of sync here?

Jarkko
