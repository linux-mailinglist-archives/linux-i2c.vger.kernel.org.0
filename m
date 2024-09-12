Return-Path: <linux-i2c+bounces-6622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E67976DD4
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 17:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B6BC28167C
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 15:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B031AD25F;
	Thu, 12 Sep 2024 15:34:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5193C126BF9
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 15:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726155242; cv=none; b=HrAfYgD0UWMux4fhshwxEYZ9paP7J27Ved38ZPPqGFl3n7Q9LQVDgEwTlEJMgkzKBbcnWTOVeGULzZstT7qAo1EKL8sXOc6iH2doW3FomDYkmyq2lcVngBHY/D3nv1cER9pxgIeidh5s3fBdaidMso5kDgEFLs2n4137FP2ooL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726155242; c=relaxed/simple;
	bh=cNYPBVr/teqVwfz8xwf6ff2IRxwpQtJ3I2/wzzi9T40=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XW0Wmsce3ozKo8CEcEufmLgc++jDmAdObPyr2ZdvQ3YWbZ2YtaRpxkS5Z6yAK0yRwqdYJxvt3rTFuhg9OYrZTiFLpWhdNxkzXYNMoJYMn+xAMoX/RNzxf4RkxeHYYulp9V6QaDUG4Xq20G8lR0huTBk4kuAtll0kmRa1vAoR0dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 4431e80b-711c-11ef-b409-005056bd6ce9;
	Thu, 12 Sep 2024 18:32:49 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Sep 2024 18:32:48 +0300
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Message-ID: <ZuMJoHWLU1FIznZR@surfacebook.localdomain>
References: <cd5f6b0a57adf6fdff7bf3c24cb319bf778d61d6.1726121009.git.kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd5f6b0a57adf6fdff7bf3c24cb319bf778d61d6.1726121009.git.kimriver.liu@siengine.com>

Thu, Sep 12, 2024 at 02:11:12PM +0800, Kimriver Liu kirjoitti:
> It was observed that issuing ABORT bit (IC_ENABLE[1]) will not
> work when IC_ENABLE is already disabled.
> 
> Check if ENABLE bit (IC_ENABLE[0]) is disabled when the controller
> is holding SCL low. If ENABLE bit is disabled, the software need
> to enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.
> 
> These kernel logs show up whenever an I2C transaction is
> attempted after this failure.
> i2c_designware e95e0000.i2c: timeout waiting for bus ready
> i2c_designware e95e0000.i2c: timeout in disabling adapter

> The patch can be fix the controller cannot be disabled while
> SCL is held low in ENABLE bit is already disabled.

There are English words but a complete nonsense together.

  Fix the condition when controller cannot be disabled while SCL
  is held low and ENABLE bit is already disabled.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

> +		if (!(enable & DW_IC_ENABLE_ENABLE)) {
> +			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
> +			/*
> +			 * Wait 10 times the signaling period of the highest I2C
> +			 * transfer supported by the driver (for 400KHz this is
> +			 * 25us) to ensure the I2C ENABLE bit is already set
> +			 * as described in the DesignWare I2C databook.
> +			 */
> +			fsleep(DIV_ROUND_CLOSEST_ULL(10 * MICRO, t->bus_freq_hz));

> +			/* Keep ENABLE bit is already set before Setting ABORT.*/

			/* Set ENABLE bit before setting ABORT */


> +			enable |= DW_IC_ENABLE_ENABLE;
> +		}

...

> +/*
> + * This functions waits controller idling before disabling I2C

s/functions/function/

> + * When the controller is not in the IDLE state,
> + * MST_ACTIVITY bit (IC_STATUS[5]) is set.
> + * Values:
> + * 0x1 (ACTIVE): Controller not idle
> + * 0x0 (IDLE): Controller is idle
> + * The function is called after returning the end of the current transfer
> + * Returns:
> + * False when controller is in IDLE state.
> + * True when controller is in ACTIVE state.
> + */
> +static bool i2c_dw_is_controller_active(struct dw_i2c_dev *dev)
> +{
> +	u32 status;
> +
> +	regmap_read(dev->map, DW_IC_STATUS, &status);
> +	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> +		return false;
> +
> +	return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> +				       !(status & DW_IC_STATUS_MASTER_ACTIVITY),
> +					1100, 20000) != 0;

	return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
					!(status & DW_IC_STATUS_MASTER_ACTIVITY),
					1100, 20000) != 0;

(in the second line replaced 7 spaces by a single TAB to fix the indentation)

> +}

...

> +	/*
> +	 * This happens rarely (~1:500) and is hard to reproduce. Debug trace
> +	 * showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
> +	 * if disable IC_ENABLE.ENABLE immediately that can result in
> +	 * IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low. Check if
> +	 * controller is still ACTIVE before disabling I2C.
> +	 */
> +	if (i2c_dw_is_controller_active(dev))
> +		dev_err(dev->dev, "controller active\n");

-- 
With Best Regards,
Andy Shevchenko



