Return-Path: <linux-i2c+bounces-5531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C717956CFD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 16:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D3E281018
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 14:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC3A16CD0E;
	Mon, 19 Aug 2024 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXLSK4k1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B602E15E5D6;
	Mon, 19 Aug 2024 14:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724077048; cv=none; b=uHeamgy4LVxqk2fti1ZIyfWye8ILv/Gn0q2ChV/VE/owXF1FQ0B1UO4dPaYyClxUOVFX9GnDolqLFWw/rMVhYMzhJnd+KUZgc9KrwpOus7ijF542IAbzWxlPt3W4IMV3runFy1l1Lc+x/cNJRtQ/eO4SI8PYWFeUAGy+m3teB9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724077048; c=relaxed/simple;
	bh=fWU4XT+3ULTiivf49oGHazmISXNwMiSlbFNxBr2ahns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A55g5avudDWBhhq+mUALgtYbgbnNPAH/GAbC3hBu2xznU3DTVyNaDvPbC4efR+Q4iU/4NZLSGNU8aTudiQn3mtduo5iYXnfAALArovJl4STO3PoB4Q832VCdCx7fcK6clKvdCwAN57CbF0Jvrkr3b788gMXe3vdtR0SAFDEc1rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXLSK4k1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724077046; x=1755613046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fWU4XT+3ULTiivf49oGHazmISXNwMiSlbFNxBr2ahns=;
  b=SXLSK4k1SZDQD97qfH679VU+RUnHH5VsENdN+nhD2dUV7qgzpJLIXojI
   T1yeK0LqOTRa6HahjZqBJ5AoirXa6LO3onRQuBfUOVhE7ITKbiQjyBa0L
   YmuMFBeFNKZz0hkAOaA3kJVqAM8sktORXRpTJvi72ukMJKDjQsrRvR4Zp
   Wa0z5iPvp+sYfea/Bf4CXuqzUut6xW0DmkO4001qScjombNLw59suICys
   MUKJu3h3q0v5M4vLYLvB7GaYtZsuVZMtD0OvyLhmxTrHdDAedt7aUBtT4
   vhvGzZ5lwGbvdpTwy7GOxb/LwiwnoCKELmSxVKfcSYwjbYQ5wKTQIXVdr
   A==;
X-CSE-ConnectionGUID: A7lJhGtiRqW57AvQj9DQhA==
X-CSE-MsgGUID: swa1x8BgQnO/7KMSv7vT8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21872535"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="21872535"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 07:17:24 -0700
X-CSE-ConnectionGUID: dkkdQmZVR7yTOMNvwECjNw==
X-CSE-MsgGUID: oxgLbXqERBuiHTDnyG+1OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="65348825"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 07:17:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sg3C8-0000000Gx0b-3Ozh;
	Mon, 19 Aug 2024 17:17:16 +0300
Date: Mon, 19 Aug 2024 17:17:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew@codeconstruct.com.au,
	p.zabel@pengutronix.de, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <ZsNT7LPZ7-szrgBJ@smile.fi.intel.com>
References: <20240819092850.1590758-1-ryan_chen@aspeedtech.com>
 <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819092850.1590758-3-ryan_chen@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 19, 2024 at 05:28:49PM +0800, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The new register mode have separate register
> set to control i2c master and slave. This patch is for i2c
> master mode driver.

...

> +struct ast2600_i2c_bus {

Have you run `pahole` to be sure the layout is optimal?

> +	struct i2c_adapter		adap;
> +	struct device			*dev;
> +	void __iomem			*reg_base;
> +	struct regmap			*global_regs;
> +	struct reset_control		*rst;
> +	int				irq;
> +	enum xfer_mode			mode;
> +	struct clk			*clk;
> +	u32				apb_clk;
> +	struct i2c_timings		timing_info;
> +	u32				timeout;
> +	/* smbus alert */
> +	bool			alert_enable;
> +	struct i2c_smbus_alert_setup	alert_data;
> +	struct i2c_client		*ara;
> +	/* Multi-master */
> +	bool				multi_master;
> +	/* master structure */
> +	int				cmd_err;
> +	struct completion		cmd_complete;
> +	struct i2c_msg			*msgs;
> +	size_t				buf_index;
> +	/* cur xfer msgs index*/
> +	int				msgs_index;
> +	int				msgs_count;
> +	u8				*master_safe_buf;
> +	dma_addr_t			master_dma_addr;
> +	/*total xfer count */
> +	int				master_xfer_cnt;
> +	/* Buffer mode */
> +	void __iomem			*buf_base;
> +	size_t				buf_size;
> +};

...

> +static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	unsigned long base_clk[16];
> +	int baseclk_idx;
> +	u32 clk_div_reg;
> +	u32 scl_low;
> +	u32 scl_high;
> +	int divisor;
> +	u32 data;
> +
> +	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, &clk_div_reg);
> +
> +	for (int i = 0; i < 16; i++) {

unsigned int
ARRAY_SIZE(base_clk) // Will need array_size.h


> +		if (i == 0)
> +			base_clk[i] = i2c_bus->apb_clk;
> +		else if ((i > 0) || (i < 5))
> +			base_clk[i] = (i2c_bus->apb_clk * 2) /
> +				(((clk_div_reg >> ((i - 1) * 8)) & GENMASK(7, 0)) + 2);
> +		else
> +			base_clk[i] = base_clk[4] / (1 << (i - 5));

This is the same as

		if (i == 0)
			base_clk[i] = i2c_bus->apb_clk;
		else if (i < 5)
			base_clk[i] = (i2c_bus->apb_clk * 2) /
				      (((clk_div_reg / BIT((i - 1) * 8)) & GENMASK(7, 0)) + 2);
		else
			base_clk[i] = base_clk[4] / BIT(i - 5);

Alternatively

		if (i == 0)
			base_clk[i] = i2c_bus->apb_clk;
		else if (i < 5)
			base_clk[i] = (i2c_bus->apb_clk * 2) /
				      (((clk_div_reg >> ((i - 1) * 8)) & GENMASK(7, 0)) + 2);
		else
			base_clk[i] = base_clk[4] >> (i - 5);

> +
> +		if ((base_clk[i] / i2c_bus->timing_info.bus_freq_hz) <= 32) {
> +			baseclk_idx = i;
> +			divisor = DIV_ROUND_UP(base_clk[i], i2c_bus->timing_info.bus_freq_hz);
> +			break;
> +		}
> +	}

> +	baseclk_idx = min(baseclk_idx, 15);

If the last conditional inside the loop is never true, you are going to use\
a garbage here.

> +	divisor = min(divisor, 32);

Ditto.

> +	scl_low = min(divisor * 9 / 16 - 1, 15);

Missing minmax.h in the inclusion block.

> +	scl_high = (divisor - scl_low - 2) & GENMASK(3, 0);
> +	data = (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 | baseclk_idx;
> +	if (i2c_bus->timeout) {
> +		data |= AST2600_I2CC_TOUTBASECLK(AST_I2C_TIMEOUT_CLK);
> +		data |= AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
> +	}
> +
> +	return data;
> +}

...

> +static u8 ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	u32 state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	int ret = 0;
> +	u32 ctrl;
> +	int r;
> +
> +	dev_dbg(i2c_bus->dev, "%d-bus recovery bus [%x]\n", i2c_bus->adap.nr, state);
> +
> +	ctrl = readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	/* Disable master/slave mode */
> +	writel(ctrl & ~(AST2600_I2CC_MASTER_EN | AST2600_I2CC_SLAVE_EN),
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	/* Enable master mode only */
> +	writel(readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) | AST2600_I2CC_MASTER_EN,
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	reinit_completion(&i2c_bus->cmd_complete);
> +	i2c_bus->cmd_err = 0;
> +
> +	/* Check 0x14's SDA and SCL status */
> +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_LINE_STS)) {
> +		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +		r = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
> +		if (r == 0) {
> +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> +			ret = -ETIMEDOUT;
> +		} else {
> +			if (i2c_bus->cmd_err) {
> +				dev_dbg(i2c_bus->dev, "recovery error\n");
> +				ret = -EPROTO;
> +			}
> +		}
> +	}

ret is set but maybe overridden.

> +	/* Recovery done */

Even if it fails above?

> +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	if (state & AST2600_I2CC_BUS_BUSY_STS) {
> +		dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> +		ret = -EPROTO;
> +	}
> +
> +	/* restore original master/slave setting */
> +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	return ret;
> +}

...

> +static int ast2600_i2c_setup_dma_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len;
> +
> +	cmd |= AST2600_I2CM_PKT_EN;
> +	xfer_len = msg->len - i2c_bus->master_xfer_cnt;
> +	if (xfer_len > AST2600_I2C_DMA_SIZE) {
> +		xfer_len = AST2600_I2C_DMA_SIZE;

> +	} else {
> +		if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)

	else if (...)

> +			cmd |= AST2600_I2CM_STOP_CMD;
> +	}
> +
> +	if (cmd & AST2600_I2CM_START_CMD) {
> +		cmd |= AST2600_I2CM_PKT_ADDR(msg->addr);
> +		i2c_bus->master_safe_buf = i2c_get_dma_safe_msg_buf(msg, 1);
> +		if (!i2c_bus->master_safe_buf)
> +			return -ENOMEM;
> +		i2c_bus->master_dma_addr =
> +			dma_map_single(i2c_bus->dev, i2c_bus->master_safe_buf,
> +				       msg->len, DMA_TO_DEVICE);

> +		if (dma_mapping_error(i2c_bus->dev, i2c_bus->master_dma_addr)) {
> +			i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf, msg, false);
> +			i2c_bus->master_safe_buf = NULL;

> +			return -ENOMEM;

Why is the dma_mapping_error() returned error code shadowed?

> +		}
> +	}
> +
> +	if (xfer_len) {
> +		cmd |= AST2600_I2CM_TX_DMA_EN | AST2600_I2CM_TX_CMD;
> +		writel(AST2600_I2CM_SET_TX_DMA_LEN(xfer_len - 1),
> +		       i2c_bus->reg_base + AST2600_I2CM_DMA_LEN);
> +		writel(i2c_bus->master_dma_addr + i2c_bus->master_xfer_cnt,
> +		       i2c_bus->reg_base + AST2600_I2CM_TX_DMA);
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_buff_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	u32 wbuf_dword;
> +	int xfer_len;
> +	u8 wbuf[4];

> +	int i;

Why signed?

> +	cmd |= AST2600_I2CM_PKT_EN;
> +	xfer_len = msg->len - i2c_bus->master_xfer_cnt;
> +	if (xfer_len > i2c_bus->buf_size) {
> +		xfer_len = i2c_bus->buf_size;

> +	} else {
> +		if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)

	else if (...)

> +			cmd |= AST2600_I2CM_STOP_CMD;
> +	}
> +
> +	if (cmd & AST2600_I2CM_START_CMD)
> +		cmd |= AST2600_I2CM_PKT_ADDR(msg->addr);
> +
> +	if (xfer_len) {
> +		cmd |= AST2600_I2CM_TX_BUFF_EN | AST2600_I2CM_TX_CMD;

> +		/*
> +		 * The controller's buffer register supports dword writes only.
> +		 * Therefore, write dwords to the buffer register in a 4-byte aligned,
> +		 * and write the remaining unaligned data at the end.
> +		 */
> +		for (i = 0; i < xfer_len; i++) {
> +			wbuf[i % 4] = msg->buf[i2c_bus->master_xfer_cnt + i];
> +			if ((i % 4) == 3 || i == xfer_len - 1) {
> +				wbuf_dword = get_unaligned_le32(wbuf);
> +				writel(wbuf_dword, i2c_bus->buf_base + i - (i % 4));
> +			}
> +		}

This is overcomplicated and can be simplified.
Why you can't perform

	get_unaligned_leXX(msg->buf[i2c_bus->master_xfer_cnt + i]);

?

		for (i = 0; i < xfer_len; i += 4) {
			switch (min(xfer_len - i, 4) % 4) {
			case 1:
				wbuf_dword = ...;
				writel(wbuf_dword, i2c_bus->buf_base + i);
				break;
			case 2:
				wbuf_dword = get_unaligned_le16(...);
				writel(wbuf_dword, i2c_bus->buf_base + i);
				break;
			case 3:
				wbuf_dword = get_unaligned_le24(...);
				writel(wbuf_dword, i2c_bus->buf_base + i);
				break;
			default:
				wbuf_dword = get_unaligned_le32(...);
				writel(wbuf_dword, i2c_bus->buf_base + i);
				break;
			}
		}


Now, with this it's can be a helper, with which

		for (i = 0; i < xfer_len; i += 4) {
			switch (min(xfer_len - i, 4) % 4) {
			case 1:
				ast2600_write_data(i2c_bus, i, ...);
				break;
			case 2:
				ast2600_write_data(i2c_bus, i, get_unaligned_le16(...));
				break;
			case 3:
				ast2600_write_data(i2c_bus, i, get_unaligned_le24(...));
				break;
			default:
				ast2600_write_data(i2c_bus, i, get_unaligned_le32(...));
				break;
			}
		}

> +		writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
> +		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}

...

> +static int ast2600_i2c_setup_dma_rx(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len;
> +	u32 cmd;
> +
> +	cmd = AST2600_I2CM_PKT_EN | AST2600_I2CM_PKT_ADDR(msg->addr) |
> +	      AST2600_I2CM_START_CMD | AST2600_I2CM_RX_DMA_EN;
> +
> +	if (msg->flags & I2C_M_RECV_LEN) {
> +		xfer_len = 1;

> +	} else {
> +		if (msg->len > AST2600_I2C_DMA_SIZE) {

	} else if (...) {

> +			xfer_len = AST2600_I2C_DMA_SIZE;
> +		} else {
> +			xfer_len = msg->len;
> +			if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
> +				cmd |= MASTER_TRIGGER_LAST_STOP;
> +		}
> +	}
> +	writel(AST2600_I2CM_SET_RX_DMA_LEN(xfer_len - 1), i2c_bus->reg_base + AST2600_I2CM_DMA_LEN);
> +	i2c_bus->master_safe_buf = i2c_get_dma_safe_msg_buf(msg, 1);
> +	if (!i2c_bus->master_safe_buf)
> +		return -ENOMEM;
> +	i2c_bus->master_dma_addr =
> +		dma_map_single(i2c_bus->dev, i2c_bus->master_safe_buf, msg->len, DMA_FROM_DEVICE);
> +	if (dma_mapping_error(i2c_bus->dev, i2c_bus->master_dma_addr)) {
> +		i2c_put_dma_safe_msg_buf(i2c_bus->master_safe_buf, msg, false);
> +		i2c_bus->master_safe_buf = NULL;
> +		return -ENOMEM;
> +	}
> +	writel(i2c_bus->master_dma_addr, i2c_bus->reg_base + AST2600_I2CM_RX_DMA);
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_buff_rx(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len;
> +	u32 cmd;
> +
> +	cmd = AST2600_I2CM_PKT_EN | AST2600_I2CM_PKT_ADDR(msg->addr) |
> +	      AST2600_I2CM_START_CMD | AST2600_I2CM_RX_BUFF_EN;
> +
> +	if (msg->flags & I2C_M_RECV_LEN) {
> +		dev_dbg(i2c_bus->dev, "smbus read\n");
> +		xfer_len = 1;

> +	} else {
> +		if (msg->len > i2c_bus->buf_size) {

	} else if (...) {

> +			xfer_len = i2c_bus->buf_size;
> +		} else {
> +			xfer_len = msg->len;
> +			if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
> +				cmd |= MASTER_TRIGGER_LAST_STOP;
> +		}
> +	}
> +	writel(AST2600_I2CC_SET_RX_BUF_LEN(xfer_len), i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_byte_rx(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	u32 cmd;
> +
> +	cmd = AST2600_I2CM_PKT_EN | AST2600_I2CM_PKT_ADDR(msg->addr) |
> +	      AST2600_I2CM_START_CMD | AST2600_I2CM_RX_CMD;
> +
> +	if (msg->flags & I2C_M_RECV_LEN) {
> +		dev_dbg(i2c_bus->dev, "smbus read\n");

> +	} else {
> +		if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count) {

	} else if (...) {

> +			if (msg->len == 1)
> +				cmd |= MASTER_TRIGGER_LAST_STOP;
> +		}
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}

...

> +static int ast2600_i2c_do_start(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +
> +	/* send start */
> +	dev_dbg(i2c_bus->dev, "[%d] %sing %d byte%s %s 0x%02x\n",

Drop 'ing', no need to have this in the debug message.

> +		i2c_bus->msgs_index, str_read_write(msg->flags & I2C_M_RD),
> +		msg->len, msg->len > 1 ? "s" : "",

str_plural()

> +		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);

> +	i2c_bus->master_xfer_cnt = 0;
> +	i2c_bus->buf_index = 0;
> +
> +	if (msg->flags & I2C_M_RD) {
> +		if (i2c_bus->mode == DMA_MODE)
> +			return ast2600_i2c_setup_dma_rx(i2c_bus);
> +		else if (i2c_bus->mode == BUFF_MODE)
> +			return ast2600_i2c_setup_buff_rx(i2c_bus);
> +		else
> +			return ast2600_i2c_setup_byte_rx(i2c_bus);
> +	} else {
> +		if (i2c_bus->mode == DMA_MODE)
> +			return ast2600_i2c_setup_dma_tx(AST2600_I2CM_START_CMD, i2c_bus);
> +		else if (i2c_bus->mode == BUFF_MODE)
> +			return ast2600_i2c_setup_buff_tx(AST2600_I2CM_START_CMD, i2c_bus);
> +		else
> +			return ast2600_i2c_setup_byte_tx(AST2600_I2CM_START_CMD, i2c_bus);
> +	}
> +}

...

> +master_out:
> +	if (i2c_bus->mode == DMA_MODE) {
> +		kfree(i2c_bus->master_safe_buf);
> +	    i2c_bus->master_safe_buf = NULL;
> +	}

Indentation issues.

> +	return ret;

...


> +MODULE_DEVICE_TABLE(of, ast2600_i2c_bus_of_table);

Why do you need this table before _probe()? Isn't the only user is below?

> +static int ast2600_i2c_probe(struct platform_device *pdev)

...

> +	i2c_bus->global_regs = syscon_regmap_lookup_by_phandle(dev->of_node, "aspeed,global-regs");

dev_of_node(dev)

> +	if (IS_ERR(i2c_bus->global_regs))
> +		return PTR_ERR(i2c_bus->global_regs);

...

> +	if (device_property_read_bool(&pdev->dev, "aspeed,enable-dma"))

You have 'dev' Why not use it?

> +		i2c_bus->mode = DMA_MODE;

...

> +	if (i2c_bus->mode == BUFF_MODE) {
> +		i2c_bus->buf_base = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> +		if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> +			i2c_bus->buf_size = resource_size(res) / 2;
> +		else
> +			i2c_bus->mode = BYTE_MODE;

What's wrong with positive conditional? And is it even possible to have NULL
here?

> +	}

...

> +	strscpy(i2c_bus->adap.name, pdev->name, sizeof(i2c_bus->adap.name));

Use 2-argument strscpy().

...

> +	i2c_bus->alert_enable = device_property_read_bool(dev, "smbus-alert");
> +	if (i2c_bus->alert_enable) {
> +		i2c_bus->ara = i2c_new_smbus_alert_device(&i2c_bus->adap, &i2c_bus->alert_data);
> +		if (!i2c_bus->ara)
> +			dev_warn(dev, "Failed to register ARA client\n");
> +
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER | AST2600_I2CM_SMBUS_ALT,
> +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> +	} else {
> +		i2c_bus->alert_enable = false;
> +		/* Set interrupt generation of I2C master controller */
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> +	}

I2C core calls i2c_setup_smbus_alert() when registering the adapter. Why do you
need to have something special here?

-- 
With Best Regards,
Andy Shevchenko



