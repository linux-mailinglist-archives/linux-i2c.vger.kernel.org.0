Return-Path: <linux-i2c+bounces-13988-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9539C3A57B
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 11:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C11463AB310
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 10:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB652DC346;
	Thu,  6 Nov 2025 10:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVG+C/9u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E8B1E0DE8;
	Thu,  6 Nov 2025 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762425753; cv=none; b=H7VQfhRLpbAEjJT+LvAxxD5Gjz7AzYuniDfpqw7kVKS/fxpZkiVStUHsYfaUnWl2VNNepEXmw7qS/LczIZijSOq5T8urhqnkVUZKvzpgHasehc9zhKVsePVTb1+0/nBV1QLTcV2rbR+AESArinecRqUWgPYOww1w7v06nqcvL50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762425753; c=relaxed/simple;
	bh=r+tqb5O/ckdvg3rX9szUR7FE6EjYVyQ7uPAqe38uJnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FY4/84Zjg8w2c04MDM4/DUPHH4rrELHg8hT8sa8L7U/c65wM5HSoAx+DewICF/ebb+jrw5JYQJ7IveGTjp9BloPOgfVCR4PlUIeA3TMth1bg19ZEBlTo48NY6CBg25Fz/GdBj3c0SPyaw//+K+Tgu5Ly1Az6YjIqetsUayYd1cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVG+C/9u; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762425752; x=1793961752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r+tqb5O/ckdvg3rX9szUR7FE6EjYVyQ7uPAqe38uJnQ=;
  b=ZVG+C/9u5F7/VXYxrUv6I0GPdVq3w0Q6oj+CuYBTPbafFjpRoge0Tqp+
   kXiITw1l+ptB6F5QumkHulE2FtBwasereX+8cH5QjY9StFAy6KWtIzV3d
   azTVnMS4hI6xaOlNgpC9sF7UQu5clRMZQhvrQocanVG5ClbRT9TdZn0ce
   WZZgrKD9e+D7HYexMmfHF3BB3UA1SIbHuyDzYYSr5DSjcJes+3NlXrWzV
   Lrlk1DptJKxoGC5N5tgO4ZEvEL392Teg9e4PAJswCx/LH8E7NaQDuxvGb
   4j5DG/EHPb5muqyGYcdV1EZYG6yBCLxgJ7xPSHNFJXGft2aQtH1sG09fd
   w==;
X-CSE-ConnectionGUID: TwsKSziORO2qcTlPVfG3TA==
X-CSE-MsgGUID: 2PXJ603wS0SazJleJJIaPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75673690"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="75673690"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 02:42:31 -0800
X-CSE-ConnectionGUID: n5u465Y1QLKq3eZGZrF7tg==
X-CSE-MsgGUID: 4bsWdOOKRCqCX0fq8BW8ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="192082080"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2025 02:42:30 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A4C6795; Thu, 06 Nov 2025 11:42:28 +0100 (CET)
Date: Thu, 6 Nov 2025 11:42:28 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Replace magic numbers with named
 constants
Message-ID: <20251106104228.GP2912318@black.igk.intel.com>
References: <20251105161845.2535367-1-a.shimko.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251105161845.2535367-1-a.shimko.dev@gmail.com>

Hi,

On Wed, Nov 05, 2025 at 07:18:44PM +0300, Artem Shimko wrote:
> Replace various magic numbers with properly named constants to improve
> code readability and maintainability. This includes constants for
> register access, timing adjustments, timeouts, FIFO parameters,
> and default values.
> 
> All new constants are documented with clear comments explaining their
> purpose. The change makes the code more self-documenting without
> altering any functionality.

I think it adds too much to be honest.

> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> ---
> Hello maintainers and reviewers,
> 
> Fix replaces magic numbers throughout the DesignWare I2C driver with named 
> constants to improve code readability and maintainability.
> 
> The change introduces constants for register access, timing adjustments, 
> timeouts, FIFO parameters, and default values, all properly documented 
> with comments.
> 
> No functional changes.
> 
> Thank you for your consideration.
> --
> Best regards,
> Artem Shimko
> 
>  drivers/i2c/busses/i2c-designware-common.c | 121 ++++++++++++++++++---
>  1 file changed, 106 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index 5b1e8f74c4ac..1d4dccf9a2ce 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -34,6 +34,91 @@
>  
>  #include "i2c-designware-core.h"
>  
> +/*
> + * Byte offset between consecutive 16-bit registers
> + */
> +#define DW_IC_REG_STEP_BYTES			2
> +
> +/*
> + * Bit shift to combine two 16-bit values into 32-bit word
> + */
> +#define DW_IC_REG_WORD_SHIFT			16
> +
> +/*
> + * Default bus capacitance in picofarads
> + */
> +#define DW_IC_DEFAULT_BUS_CAPACITANCE_PF	100
> +
> +/*
> + * Standard HCNT adjustment
> + */
> +#define DW_IC_HCNT_ADJUST_STANDARD		3
> +
> +/*
> + * Number of disable attempts
> + */
> +#define DW_IC_DISABLE_TIMEOUT_ATTEMPTS		100
> +
> +/*
> + * Minimum retry delay in microseconds
> + */
> +#define DW_IC_DISABLE_RETRY_DELAY_MIN		25
> +
> +/*
> + * Maximum retry delay in microseconds
> + */
> +#define DW_IC_DISABLE_RETRY_DELAY_MAX		250
> +
> +/*
> + * Mask to check if controller is active
> + */
> +#define DW_IC_ENABLE_STATUS_ACTIVE_MASK		1
> +
> +/*
> + * Abort poll timeout in microseconds
> + */
> +#define DW_IC_ABORT_TIMEOUT_US			10
> +
> +/*
> + * Total abort timeout in microseconds
> + */
> +#define DW_IC_ABORT_TOTAL_TIMEOUT_US		100
> +
> +/*
> + * Poll interval in microseconds
> + */
> +#define DW_IC_BUSY_POLL_TIMEOUT_US		1100
> +
> +/*
> + * Total timeout in microseconds
> + */
> +#define DW_IC_BUSY_TOTAL_TIMEOUT_US		20000

For the timeouts you can do something like below to keep it small.

/* Timeouts in us */
#define DW_IC_BUSY_POLL_TIMEOUT		1100
#define DW_IC_BUSY_TOTAL_TIMEOUT	20000
#define DW_IC_FOO_TIMEOUT		1234


> +/*
> + * TX FIFO depth bit shift in DW_IC_COMP_PARAM_1
> + */
> +#define DW_IC_TX_FIFO_DEPTH_SHIFT		16
> +
> +/*
> + * RX FIFO depth bit shift in DW_IC_COMP_PARAM_1
> + */
> +#define DW_IC_RX_FIFO_DEPTH_SHIFT		8
> +
> +/*
> + * FIFO depth field mask
> + */
> +#define DW_IC_FIFO_DEPTH_MASK			0xff
> +
> +/*
> + * FIFO depth value offset (0-based to 1-based)
> + */
> +#define DW_IC_FIFO_DEPTH_OFFSET			1

All the register offsets, shifts and masks should be in
drivers/i2c/busses/i2c-designware-core.h and you don't need to "document"
them because all this is available in the datasheet.

> +
> +/*
> + * Minimum valid FIFO depth
> + */
> +#define DW_IC_MIN_FIFO_DEPTH			2
> +
>  static const char *const abort_sources[] = {
>  	[ABRT_7B_ADDR_NOACK] =
>  		"slave address not acknowledged (7bit mode)",
> @@ -106,7 +191,7 @@ static int dw_reg_read_word(void *context, unsigned int reg, unsigned int *val)
>  	struct dw_i2c_dev *dev = context;
>  
>  	*val = readw(dev->base + reg) |
> -		(readw(dev->base + reg + 2) << 16);
> +		(readw(dev->base + reg + DW_IC_REG_STEP_BYTES) << DW_IC_REG_WORD_SHIFT);
>  
>  	return 0;
>  }
> @@ -116,7 +201,7 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
>  	struct dw_i2c_dev *dev = context;
>  
>  	writew(val, dev->base + reg);
> -	writew(val >> 16, dev->base + reg + 2);
> +	writew(val >> DW_IC_REG_WORD_SHIFT, dev->base + reg + DW_IC_REG_STEP_BYTES);
>  
>  	return 0;
>  }
> @@ -165,7 +250,7 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
>  	if (reg == swab32(DW_IC_COMP_TYPE_VALUE)) {
>  		map_cfg.reg_read = dw_reg_read_swab;
>  		map_cfg.reg_write = dw_reg_write_swab;
> -	} else if (reg == (DW_IC_COMP_TYPE_VALUE & 0x0000ffff)) {
> +	} else if (reg == lower_16_bits(DW_IC_COMP_TYPE_VALUE)) {
>  		map_cfg.reg_read = dw_reg_read_word;
>  		map_cfg.reg_write = dw_reg_write_word;
>  	} else if (reg != DW_IC_COMP_TYPE_VALUE) {
> @@ -223,7 +308,7 @@ static int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
>  
>  #define MSCC_ICPU_CFG_TWI_DELAY		0x0
>  #define MSCC_ICPU_CFG_TWI_DELAY_ENABLE	BIT(0)
> -#define MSCC_ICPU_CFG_TWI_SPIKE_FILTER	0x4
> +#define MSCC_ICPU_CFG_TWI_SPIKE_FILTER	BIT(2)

This is unrelated change.
>  
>  static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
>  {
> @@ -384,7 +469,7 @@ int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
>  	i2c_parse_fw_timings(device, t, false);
>  
>  	if (device_property_read_u32(device, "snps,bus-capacitance-pf", &dev->bus_capacitance_pF))
> -		dev->bus_capacitance_pF = 100;
> +		dev->bus_capacitance_pF = DW_IC_DEFAULT_BUS_CAPACITANCE_PF;
>  
>  	dev->clk_freq_optimized = device_property_read_bool(device, "snps,clk-freq-optimized");
>  
> @@ -434,7 +519,8 @@ u32 i2c_dw_scl_hcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
>  	 * The reason why we need to take into account "tf" here,
>  	 * is the same as described in i2c_dw_scl_lcnt().
>  	 */
> -	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
> +	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf), MICRO) -
> +				     DW_IC_HCNT_ADJUST_STANDARD + offset;
>  }
>  
>  u32 i2c_dw_scl_lcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
> @@ -512,7 +598,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  	struct i2c_timings *t = &dev->timings;
>  	unsigned int raw_intr_stats, ic_stats;
>  	unsigned int enable;
> -	int timeout = 100;
> +	int timeout = DW_IC_DISABLE_TIMEOUT_ATTEMPTS;

If you do this, keep the "reverse christmas tree" ordering here.

>  	bool abort_needed;
>  	unsigned int status;
>  	int ret;
> @@ -539,8 +625,9 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  
>  		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
>  		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
> -					       !(enable & DW_IC_ENABLE_ABORT), 10,
> -					       100);
> +					       !(enable & DW_IC_ENABLE_ABORT),
> +					       DW_IC_ABORT_TIMEOUT_US,
> +					       DW_IC_ABORT_TOTAL_TIMEOUT_US);
>  		if (ret)
>  			dev_err(dev->dev, "timeout while trying to abort current transfer\n");
>  	}
> @@ -552,7 +639,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  		 * in that case this test reads zero and exits the loop.
>  		 */
>  		regmap_read(dev->map, DW_IC_ENABLE_STATUS, &status);
> -		if ((status & 1) == 0)
> +		if (!(status & DW_IC_ENABLE_STATUS_ACTIVE_MASK))
>  			return;
>  
>  		/*
> @@ -560,7 +647,8 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  		 * transfer supported by the driver (for 400kHz this is
>  		 * 25us) as described in the DesignWare I2C databook.
>  		 */
> -		usleep_range(25, 250);
> +		usleep_range(DW_IC_DISABLE_RETRY_DELAY_MIN,
> +			     DW_IC_DISABLE_RETRY_DELAY_MAX);

The original is much more readable than this one so I suggest dropping
those "constants".

>  	} while (timeout--);
>  
>  	dev_warn(dev->dev, "timeout in disabling adapter\n");
> @@ -635,7 +723,8 @@ int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev)
>  
>  	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
>  				       !(status & DW_IC_STATUS_ACTIVITY),
> -				       1100, 20000);
> +				       DW_IC_BUSY_POLL_TIMEOUT_US,
> +				       DW_IC_BUSY_TOTAL_TIMEOUT_US);
>  	if (ret) {
>  		dev_warn(dev->dev, "timeout waiting for bus ready\n");
>  
> @@ -699,12 +788,14 @@ int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
>  	if (ret)
>  		return ret;
>  
> -	tx_fifo_depth = ((param >> 16) & 0xff) + 1;
> -	rx_fifo_depth = ((param >> 8)  & 0xff) + 1;
> +	tx_fifo_depth = ((param >> DW_IC_TX_FIFO_DEPTH_SHIFT) &
> +			 DW_IC_FIFO_DEPTH_MASK) + DW_IC_FIFO_DEPTH_OFFSET;
> +	rx_fifo_depth = ((param >> DW_IC_RX_FIFO_DEPTH_SHIFT)  &
> +			 DW_IC_FIFO_DEPTH_MASK) + DW_IC_FIFO_DEPTH_OFFSET;

Ditto here. You can use the FIELD_GET() things but try to keep this
readable.

>  	if (!dev->tx_fifo_depth) {
>  		dev->tx_fifo_depth = tx_fifo_depth;
>  		dev->rx_fifo_depth = rx_fifo_depth;
> -	} else if (tx_fifo_depth >= 2) {
> +	} else if (tx_fifo_depth >= DW_IC_MIN_FIFO_DEPTH) {
>  		dev->tx_fifo_depth = min_t(u32, dev->tx_fifo_depth,
>  				tx_fifo_depth);
>  		dev->rx_fifo_depth = min_t(u32, dev->rx_fifo_depth,
> -- 
> 2.43.0

