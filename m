Return-Path: <linux-i2c+bounces-6913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4575397D975
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 19:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD694283022
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 17:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6994417BEA4;
	Fri, 20 Sep 2024 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6NJLyG2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6A1EBE
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726855083; cv=none; b=m5fiIQUiBQZZ5f8p22Gii/pLQ9aQYF6+a4osWU/2VLxHeAhpfu1NR85wQbVgtlEUdPtYuQvz4bp3cLGQYEztrbYFKel0lcw4t3YalwgRNjLy3j79WBzQyK7NsXOONcaVbcrvqhyee8fQcwsEuSdtFEigAnU4bsGaETInlNsyf28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726855083; c=relaxed/simple;
	bh=fxv8exrgrMNQFa4Y9J8pH7xCaQakJcPNAXzXO2GTZKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooOdRAl3gc3SEwACe52zTufyG6AIqD/2BWg4Qo4NNJUmln3oiIHM1V56cNZoNeGv5ZCq2G086InVG8DNzWFhdfKvvEbhhZWS70+UnLhppbqeHTQ/8QalysL9MPmIWc7c85WZVhrAW45419FLhQN9BoXSPMtyqT+aVHDsUnv4Odk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6NJLyG2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726855081; x=1758391081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fxv8exrgrMNQFa4Y9J8pH7xCaQakJcPNAXzXO2GTZKs=;
  b=h6NJLyG2Uto7T7ibN8gxri4mNeXgwbVmn5Ihbce6qwcf0rVcW9NoT3x4
   xeHU4myhWFPAomG8DDzJ68cIjG8uV7D4ynyaEjDs6tRGVHjKRySlVtQLU
   QcryUjaumyYrImUKGSRU1ajXwejEFtyuuEm7s5EXjIdqdU4mzRlgdzhBt
   vkq02ErSHbg4kEycpmJYM23IMz/qXHYPkQSatakDM1vAAHX8+hOJ5sRpt
   W3DSmaTpJ9270aSs8WqJASXbisV/OPLBWQt+0EW/56gtvZrr2LUNgL9wm
   fy/gA42MNT5cb7UWMwZAcI3FTaB3B+9wdCi1/RlszLmaT9TFOHVohK9q9
   Q==;
X-CSE-ConnectionGUID: z/9ViGOpSuWRAf/pQ9sdeQ==
X-CSE-MsgGUID: YxAM+xBqS6CQogJ8I2VpEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25701875"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25701875"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 10:58:01 -0700
X-CSE-ConnectionGUID: IwhsbSzPQDKYgGya997ntg==
X-CSE-MsgGUID: gshhgMR1TwSrfvTqnPY9cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="101234119"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 10:57:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1srhtE-0000000AztZ-2b0R;
	Fri, 20 Sep 2024 20:57:56 +0300
Date: Fri, 20 Sep 2024 20:57:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v6 6/8] i2c: amd-asf: Add routine to handle the ASF slave
 process
Message-ID: <Zu23pEI5tDRU5BZo@smile.fi.intel.com>
References: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
 <20240919175913.1895670-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919175913.1895670-7-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 19, 2024 at 11:29:11PM +0530, Shyam Sundar S K wrote:
> Add support for handling ASF slave process events as described in the AMD
> ASF databook. This involves implementing the correct programming sequence
> to manage each ASF packet appropriately.

...

> +static void amd_asf_process_target(struct work_struct *work)
> +{
> +	struct amd_asf_dev *dev = container_of(work, struct amd_asf_dev, work_buf.work);
> +	unsigned short piix4_smba = dev->port_addr->start;
> +	u8 data[ASF_BLOCK_MAX_BYTES];
> +	u8 bank, reg, cmd;
> +	u8 len, idx, val;
> +
> +	/* Read target status register */
> +	reg = inb_p(ASFSLVSTA);
> +
> +	/* Check if no error bits are set in target status register */
> +	if (reg & ASF_ERROR_STATUS) {
> +		/* Set bank as full */
> +		cmd = 0;
> +		reg = reg | GENMASK(3, 2);

		reg |= ...

> +		outb_p(reg, ASFDATABNKSEL);
> +	} else {
> +		/* Read data bank */
> +		reg = inb_p(ASFDATABNKSEL);
> +		bank = (reg & BIT(3)) ? 1 : 0;

> +		/* Set read data bank */
> +		if (bank) {
> +			reg = reg | BIT(4);
> +			reg = reg & ~BIT(3);
> +		} else {
> +			reg = reg & ~BIT(4);
> +			reg = reg & ~BIT(2);
> +		}

		/* Set read data bank */
		if (bank) {
			reg |= BIT(4);
			reg &= ~BIT(3);
		} else {
			reg &= ~BIT(4);
			reg &= ~BIT(2);
		}

> +		/* Read command register */
> +		outb_p(reg, ASFDATABNKSEL);
> +		cmd = inb_p(ASFINDEX);
> +		len = inb_p(ASFDATARWPTR);
> +		for (idx = 0; idx < len; idx++)
> +			data[idx] = inb_p(ASFINDEX);

> +		/* Clear data bank status */
> +		if (bank) {
> +			reg = reg | BIT(3);
> +			outb_p(reg, ASFDATABNKSEL);
> +		} else {
> +			reg = reg | BIT(2);
> +			outb_p(reg, ASFDATABNKSEL);
> +		}

		/* Clear data bank status */
		if (bank) {
			reg |= BIT(3);
			outb_p(reg, ASFDATABNKSEL);
		} else {
			reg |= BIT(2);
			outb_p(reg, ASFDATABNKSEL);
		}

> +	}
> +
> +	outb_p(0, ASFSETDATARDPTR);
> +	if (cmd & BIT(0))
> +		return;
> +
> +	/*
> +	 * Although i2c_slave_event() returns an appropriate error code, we
> +	 * don't check it here because we're operating in the workqueue context.
> +	 */
> +	i2c_slave_event(dev->target, I2C_SLAVE_WRITE_REQUESTED, &val);
> +	for (idx = 0; idx < len; idx++) {
> +		val = data[idx];
> +		i2c_slave_event(dev->target, I2C_SLAVE_WRITE_RECEIVED, &val);
> +	}
> +	i2c_slave_event(dev->target, I2C_SLAVE_STOP, &val);
> +}

...


Perhaps it's time to have

	struct device *dev = &pdev->dev;

> +	ret = devm_delayed_work_autocancel(&pdev->dev, &asf_dev->work_buf, amd_asf_process_target);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to create work queue\n");

...and this, in particular, becomes shorter.

	ret = devm_delayed_work_autocancel(dev, &asf_dev->work_buf, amd_asf_process_target);
	if (ret)
		return dev_err_probe(dev, ret, "failed to create work queue\n");

> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(&pdev->dev, irq, "missing IRQ resources\n");
> +
> +	ret = devm_request_irq(&pdev->dev, irq, amd_asf_irq_handler, IRQF_SHARED,
> +			       "amd_asf", asf_dev);

This even can be one line after proposed change.

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Unable to request irq: %d for use\n", irq);

...

With the above changes being applied
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



