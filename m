Return-Path: <linux-i2c+bounces-13949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F07C2B1FA
	for <lists+linux-i2c@lfdr.de>; Mon, 03 Nov 2025 11:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7C1B04EF1C0
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Nov 2025 10:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518512FF158;
	Mon,  3 Nov 2025 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewQs5UQG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D78D2472BB;
	Mon,  3 Nov 2025 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166618; cv=none; b=G8MXPVxB2ijsK2IGyZIArcnWBi9p0PmDtFwMhE9WQCuw2WMMOveKZOQg8pKeYcFSk7AdGfKvqzz90xO85oIcKUeSoqLi7FMRC9qCEQO7Dlj8Cagmv7LWVqqZvne8nHsUZ5N6exvTxRP7uZkNrbGqVAXaXlk7XpYSVNxeULqKMwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166618; c=relaxed/simple;
	bh=+HZfQNXteVIGhkepx735NQaIEheqrFgyrW9/UPsr+Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnllcSLH/rSkbOIBMcCyBD1wEqMXVJBSj1nxrlWBFQEfS1/WhX2asUUrwim2auVDVD18h81LhWcVH6KwSIPX7/eQCMmCs3dW19x/gtNP86jbMwhSJLA7Ijvn7LzwoTzUeC1bX+M601PW4XAhXUUW7b+xN/8EM6Ia60ev+04mAIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewQs5UQG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762166616; x=1793702616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+HZfQNXteVIGhkepx735NQaIEheqrFgyrW9/UPsr+Mw=;
  b=ewQs5UQG4sIiOVvEJXN6e5nxXlQux+dghj6D6FvBnHrRUY/OH/GTIg9w
   vs5bulUxnD6jTAjEAYLzEx7FrZX8xZU2svuN7CIbM8gd+rVnZ8WGfNTV6
   N2en9za2TdqJMkSe7bZTFgGKCiPhbjOLX2KcIO+yJpd6ww5wlMCM5EX2/
   2lxy8HAJBaerpkqQcZtJdcN+OPODlICSh+NIPtij4MdLw3kLHm86/VQwx
   gZhxP8MZyxW95jdTqjs7TQ20xcwnHfxsgN16+PnGVhRRYPqja1LnisqAr
   UUj8R3HTX+AFcwXgRybo4hx/lCAe5O5O0Q9n+rgRbMj2gZtGslvT94Tun
   Q==;
X-CSE-ConnectionGUID: +0vmr5kZS5O0Cn0vd2jhFw==
X-CSE-MsgGUID: 4wOp2XKGQ82E0f5PkS2Ipw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75685848"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="75685848"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 02:43:36 -0800
X-CSE-ConnectionGUID: 7Y27IqzBQBeLd/4NODM1rg==
X-CSE-MsgGUID: CMdTmpN2Qd2tucDz3o+uGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="187152201"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 03 Nov 2025 02:43:31 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A15EA95; Mon, 03 Nov 2025 11:43:30 +0100 (CET)
Date: Mon, 3 Nov 2025 11:43:30 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Dmitry Guzman <dmitry.guzman@mobileye.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 5/5] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Message-ID: <20251103104330.GG2912318@black.igk.intel.com>
References: <20251031-i2c-dw-v2-0-90416874fcc0@bootlin.com>
 <20251031-i2c-dw-v2-5-90416874fcc0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031-i2c-dw-v2-5-90416874fcc0@bootlin.com>

On Fri, Oct 31, 2025 at 03:35:43PM +0100, Benoît Monin wrote:
> If IC_EMPTYFIFO_HOLD_MASTER_EN parameter is 0, "Stop" and "Repeated Start"
> bits in command register does not exist, thus it is impossible to send
> several consecutive write messages in a single hardware batch. The
> existing implementation worked with such configuration incorrectly:
> all consecutive write messages are joined into a single message without
> any Start/Stop or Repeated Start conditions. For example, the following
> command:
> 
>     i2ctransfer -y 0 w1@0x55 0x00 w1@0x55 0x01
> 
> does the same as
> 
>     i2ctransfer -y 0 w2@0x55 0x00 0x01
> 
> In i2c_dw_xfer(), we ensure that we do not have such sequence of messages
> requiring a RESTART, aborting the transfer on controller that cannot
> emit them explicitly.
> 
> This behavior is activated by compatible entries because the state of
> the IC_EMPTYFIFO_HOLD_MASTER_EN parameter cannot be detected at runtime.
> Add the compatible entry for Mobileye SoCs needing the workaround.
> 
> There is another possible problem with this controller configuration:
> When the CPU is putting commands to the FIFO, this process must not be
> interrupted because if FIFO buffer gets empty, the controller finishes
> the I2C transaction and generates STOP condition on the bus.
> 
> If we continue writing the remainder of the message to the FIFO, the
> controller will start emitting a new transaction with those data. This
> turns a single a single message into multiple I2C transactions. To
> ensure that we do not keep processing a message after a FIFO underrun,
> checks are added in two places.
> 
> First in i2c_dw_xfer_msg() we check the raw interrupt status register to
> see if a STOP condition was detected while filling the FIFO, and abort
> if so. This can happen with threaded interrupt on a PREEMPT_RT kernel
> if we are preempted during the processing of each bytes of the message.
> 
> Second in i2c_dw_process_transfer(), we abort if a STOP is detected
> while a read or a write is in progress. This can occur when processing
> a message larger than the FIFO. In that case the message is processed in
> parts, and rely on the TW EMPTY interrupt to refill the FIFO when it gets
> below a threshold. If servicing this interrupt is delayed for too long,
> it can trigger a FIFO underrun, thus an unwanted STOP.
> 
> Originally-by: Dmitry Guzman <dmitry.guzman@mobileye.com>
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/i2c/busses/i2c-designware-core.h    |  1 +
>  drivers/i2c/busses/i2c-designware-master.c  | 51 +++++++++++++++++++++++++++++
>  drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
>  3 files changed, 53 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 347843b4f5dd..a31a8698e511 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -311,6 +311,7 @@ struct dw_i2c_dev {
>  #define ACCESS_NO_IRQ_SUSPEND			BIT(1)
>  #define ARBITRATION_SEMAPHORE			BIT(2)
>  #define ACCESS_POLLING				BIT(3)
> +#define NO_EMPTYFIFO_HOLD_MASTER		BIT(4)
>  
>  #define MODEL_MSCC_OCELOT			BIT(8)
>  #define MODEL_BAIKAL_BT1			BIT(9)
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index da1963d25def..329bb69485f4 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -463,6 +463,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  		rx_limit = dev->rx_fifo_depth - flr;
>  
>  		while (buf_len > 0 && tx_limit > 0 && rx_limit > 0) {
> +			unsigned int raw_stat;
>  			u32 cmd = 0;
>  
>  			/*
> @@ -487,6 +488,21 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  				need_restart = false;
>  			}
>  
> +			/*
> +			 * With threaded interrupt on a PREEMPT-RT kernel, we may
> +			 * be interrupted while filling the FIFO. Abort the
> +			 * transfer in case of a FIFO underrun on controller that
> +			 * emits a STOP in that case.
> +			 */
> +			if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER) {
> +				regmap_read(dev->map, DW_IC_RAW_INTR_STAT,
> +					    &raw_stat);
> +				if (raw_stat & DW_IC_INTR_STOP_DET) {
> +					dev->msg_err = -EIO;
> +					goto done;
> +				}
> +			}
> +
>  			if (msgs[dev->msg_write_idx].flags & I2C_M_RD) {
>  
>  				/* Avoid rx buffer overrun */
> @@ -526,6 +542,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  			dev->status &= ~STATUS_WRITE_IN_PROGRESS;
>  	}
>  
> +done:
>  	/*
>  	 * If i2c_msg index search is completed, we don't need TX_EMPTY
>  	 * interrupt any more.
> @@ -706,6 +723,14 @@ static void i2c_dw_process_transfer(struct dw_i2c_dev *dev, unsigned int stat)
>  	if (stat & DW_IC_INTR_TX_EMPTY)
>  		i2c_dw_xfer_msg(dev);
>  
> +	/* Abort if we detect a STOP in the middle of a read or a write */
> +	if ((stat & DW_IC_INTR_STOP_DET) &&
> +	    (dev->status & (STATUS_READ_IN_PROGRESS | STATUS_WRITE_IN_PROGRESS))) {
> +		dev_err(dev->dev, "spurious STOP detected\n");
> +		dev->rx_outstanding = 0;
> +		dev->msg_err = -EIO;
> +	}
> +
>  	/*
>  	 * No need to modify or disable the interrupt mask here.
>  	 * i2c_dw_xfer_msg() will take care of it according to
> @@ -872,6 +897,21 @@ __i2c_dw_xfer_unlocked(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
>  	return ret;
>  }
>  
> +/*
> + * Return true if the message needs an explicit RESTART before being sent.
> + * Without an explicit RESTART, two consecutive messages in the same direction
> + * will be merged into a single transfer.
> + * The adapter always emits a RESTART when the direction changes.
> + */
> +static inline bool i2c_dw_msg_need_restart(struct i2c_msg msgs[], int idx)

This can take const parameters.

> +{

Please move the dev->flags & NO_EMPTYFIFO_HOLD_MASTER here too.

> +	/* No need for a RESTART on the first message */
> +	if (idx == 0)
> +		return false;

That's

	if (!idx) 

But why not pass the actual message instead of the index?

> +
> +	return (msgs[idx - 1].flags & I2C_M_RD) == (msgs[idx].flags & I2C_M_RD);

You don't need the outer parens.

> +}
> +
>  static int
>  i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  {
> @@ -918,6 +958,17 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>  				goto done;
>  			}
>  
> +			/*
> +			 * Make sure we don't need explicit RESTART for
> +			 * controllers that cannot emit them.
> +			 */
> +			if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER &&
> +			    i2c_dw_msg_need_restart(msg, cnt - 1)) {
> +				dev_err(dev->dev, "cannot emit RESTART\n");
> +				ret = -EINVAL;
> +				goto done;
> +			}
> +
>  			if ((msg[cnt - 1].flags & I2C_M_STOP) ||
>  			    (msg + cnt == msgs + num))
>  				break;
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index d7d764f7554d..4aad3dc51fbc 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -346,6 +346,7 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id dw_i2c_of_match[] = {
>  	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
> +	{ .compatible = "mobileye,eyeq6lplus-i2c", .data = (void *)NO_EMPTYFIFO_HOLD_MASTER },
>  	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
>  	{ .compatible = "snps,designware-i2c" },
>  	{}
> 
> -- 
> 2.51.1

