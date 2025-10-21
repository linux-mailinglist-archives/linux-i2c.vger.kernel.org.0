Return-Path: <linux-i2c+bounces-13709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B8BBF76F6
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 17:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E94B834556F
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 15:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689F133FE3A;
	Tue, 21 Oct 2025 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7zmUkjP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B29036B;
	Tue, 21 Oct 2025 15:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761061244; cv=none; b=MRspEIQqLmBUXVnlhxBPP57imqhvu01wMx5eqImnceTzRIIV5q4kWPGb0OaWJKO/DCZ4uwp0LMPIFLc97I7eBZMu+gOUTfsJ/gFOye1ogQmqZ9Dly5Z9ANfbsKMtm/8KFdqjqEtcCeW9Q8t8Vy4oaPYBGZ01jEzyuZo444dXQd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761061244; c=relaxed/simple;
	bh=jXHHevnXutwYbrAM7Xm7o+8X5zT561pHMgeB0/ZG2tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sl/UH3RXEpZVCtyObwJ7MTWtum6N8Ik2N1H0lutMFOZowSyu0EGWU9RMNtXjUuc8Sxh/VZA0aWL/K4yaMymliWyVaFRGFpIqCVa+2N+H0xNZoLoW9B+Kbtd+lDHU1LwG3pzEuHdek1no5USwMaAO89iubfk3KybvxHJwQXw6UjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7zmUkjP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761061242; x=1792597242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jXHHevnXutwYbrAM7Xm7o+8X5zT561pHMgeB0/ZG2tA=;
  b=Y7zmUkjPBoUrrdotM+kt3tem+O3Nf9Q32M/FDuJTp5Y2JP7yo6amk0CM
   qhZ0YOGzY/YuXQrZY6QfzdN2+nbhYLr54Wz/opHu68RjcrVupdkwFw9kG
   HypS5PMJ96375aEzU9WowtNIJYAIW1AHG8zv/ezmEDL/EiUeyNrz2yR2P
   xkKC0ZSQTD4fPxViKMfhY3hQEHccxf4uetMQcLIOPljQhY3JHR3BV9cqo
   +89goaIZ1yT2dS0RG4IppQgskg5iSFCZiFQywCMtPtauhx8OFYiMUPB+2
   YW7BujbriycIG2F3QiQRYRqlIuWUtyTAMbLwBKWfZCE0+V4cooXDrk2gX
   Q==;
X-CSE-ConnectionGUID: rbv3ssEDTMuWr0EBAglBew==
X-CSE-MsgGUID: 31EWBK/QSD+ZacTZb8x42g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73862328"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="73862328"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 08:40:42 -0700
X-CSE-ConnectionGUID: 9+lUv9JDQtORIX2jm999Kg==
X-CSE-MsgGUID: gwgrvsiMQjeb0eDVMDZqDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="187657498"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 21 Oct 2025 08:40:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 08C6395; Tue, 21 Oct 2025 17:40:36 +0200 (CEST)
Date: Tue, 21 Oct 2025 17:40:36 +0200
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
Subject: Re: [PATCH 3/3] i2c: designware: Support of controller with
 IC_EMPTYFIFO_HOLD_MASTER disabled
Message-ID: <20251021154036.GR2912318@black.igk.intel.com>
References: <20251017-i2c-dw-v1-0-7b85b71c7a87@bootlin.com>
 <20251017-i2c-dw-v1-3-7b85b71c7a87@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017-i2c-dw-v1-3-7b85b71c7a87@bootlin.com>

Hi,

On Fri, Oct 17, 2025 at 04:59:34PM +0200, Benoît Monin wrote:
> If IC_EMPTYFIFO_HOLD_MASTER_EN parameter is 0, "Stop" and "Repeated
> Start" bits in command register doesn't exist, thus it is impossible to
> send several consecutive write messages in a single hardware batch. The
> existing implementation worked with such configuration incorrectly: all
> consequent write messages joined into a single message without any
> Start/Stop or Repeated Start conditions. For example, the following
> command:
> 
>     i2ctransfer -y 0 w1@0x55 0x00 w1@0x55 0x01
> 
> does the same as
> 
>     i2ctransfer -y 0 w2@0x55 0x00 0x01
> 
> To fix it, for the controllers that behave this way, if the next message
> to the same slave device has the same direction as the previous one, it
> is sent to the controller only after the previous message is sent and
> STOP_DET IRQ flag is raised by the controller.
> 
> This behavior is activated by compatible entries, because the state of
> the IC_EMPTYFIFO_HOLD_MASTER_EN parameter cannot be detected at runtime.
> Add the compatible entries of Mobileye SoCs needing the work-around and
> sort the entries alphabetically.
> 
> There is another possible problem with this controller configuration:
> When the CPU is putting commands to the FIFO, this process must not be
> interrupted because if FIFO buffer gets empty, the controller finishes
> the I2C transaction and generates STOP condition on the bus.
> 
> In a PREEMPT-RT kernel, interrupt handlers are by default executed in
> thread and may be interrupted, which can lead to breaking an I2C message
> by inserting an unwanted STOP.
> 
> To ensure proper operation on realtime kernel, use IRQF_NO_THREAD flag
> when requesting IRQ.

But even with that, it is still possible that something else is running
with local interrupt disabled so this may still happen, although likelyhood
is smaller.

You could use ACCESS_POLLING but that too can be preempted.

Perhaps best is to fail the transfer and let the caller retry?

> Based on the work of Dmitry Guzman <dmitry.guzman@mobileye.com>
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/i2c/busses/i2c-designware-core.h    |  1 +
>  drivers/i2c/busses/i2c-designware-master.c  | 45 +++++++++++++++++++++--------
>  drivers/i2c/busses/i2c-designware-platdrv.c |  6 ++--
>  3 files changed, 38 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 347843b4f5dd7..a31a8698e511a 100644
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
> index f9a180b145da8..e5af0439ec832 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -443,18 +443,6 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  	for (; dev->msg_write_idx < dev->msgs_num; dev->msg_write_idx++) {
>  		u32 flags = msgs[dev->msg_write_idx].flags;
>  
> -		/*
> -		 * If target address has changed, we need to
> -		 * reprogram the target address in the I2C
> -		 * adapter when we are done with this transfer.
> -		 * This can be done after STOP_DET IRQ flag is raised.
> -		 * So, disable "TX FIFO empty" interrupt.
> -		 */
> -		if (msgs[dev->msg_write_idx].addr != addr) {
> -			intr_mask &= ~DW_IC_INTR_TX_EMPTY;
> -			break;
> -		}
> -
>  		if (!(dev->status & STATUS_WRITE_IN_PROGRESS)) {
>  			/* new i2c_msg */
>  			buf = msgs[dev->msg_write_idx].buf;
> @@ -470,6 +458,25 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
>  				need_restart = true;
>  		}
>  
> +		/*
> +		 * If target address has changed, we need to
> +		 * reprogram the target address in the I2C
> +		 * adapter when we are done with this transfer.
> +		 * This can be done after STOP_DET IRQ flag is raised.
> +		 * So, disable "TX FIFO empty" interrupt.
> +		 * Also force a stop-then-start between two messages
> +		 * in the same direction if we need to restart on a
> +		 * adapter that does not handle restart.
> +		 */
> +		if (msgs[dev->msg_write_idx].addr != addr ||
> +		    ((need_restart &&
> +		     dev->flags & NO_EMPTYFIFO_HOLD_MASTER &&
> +		     ((msgs[dev->msg_write_idx].flags & I2C_M_RD) ==
> +		      (msgs[dev->msg_write_idx - 1].flags & I2C_M_RD))))) {
> +			intr_mask &= ~DW_IC_INTR_TX_EMPTY;
> +			break;

This, if we want to add it even, needs a helper function. The above is
really hard to parse ;-)

> +		}
> +
>  		regmap_read(dev->map, DW_IC_TXFLR, &flr);
>  		tx_limit = dev->tx_fifo_depth - flr;
>  
> @@ -1062,6 +1069,20 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
>  		irq_flags = IRQF_SHARED | IRQF_COND_SUSPEND;
>  	}
>  
> +	/*
> +	 * The first writing to TX FIFO buffer causes transmission start. If
> +	 * IC_EMPTYFIFO_HOLD_MASTER_EN is not set, when TX FIFO gets empty, I2C
> +	 * controller finishes the transaction. If writing to FIFO is
> +	 * interrupted, FIFO can get empty and the transaction will be finished
> +	 * prematurely. FIFO buffer is filled in IRQ handler, but in PREEMPT_RT
> +	 * kernel IRQ handler by default is executed in thread that can be
> +	 * preempted with another higher priority thread or an interrupt. So,
> +	 * IRQF_NO_THREAD flag is required in order to prevent any preemption
> +	 * during filling the FIFO buffer and possible data lost.
> +	 */
> +	if (dev->flags & NO_EMPTYFIFO_HOLD_MASTER)
> +		irq_flags |= IRQF_NO_THREAD;
> +
>  	ret = i2c_dw_acquire_lock(dev);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 34d881572351c..5e459175dcdb2 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -345,9 +345,11 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id dw_i2c_of_match[] = {
> -	{ .compatible = "snps,designware-i2c", },
> -	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
>  	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
> +	{ .compatible = "mobileye,eyeq6lplus-i2c", .data = (void *)NO_EMPTYFIFO_HOLD_MASTER },
> +	{ .compatible = "mobileye,eyeq7h-i2c", .data = (void *)NO_EMPTYFIFO_HOLD_MASTER },
> +	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
> +	{ .compatible = "snps,designware-i2c", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
> 
> -- 
> 2.51.0

