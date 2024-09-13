Return-Path: <linux-i2c+bounces-6729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCDB9788BB
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 21:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 639C81F27166
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 19:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C5B146580;
	Fri, 13 Sep 2024 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8vevi/i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334ACBA38
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 19:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726255077; cv=none; b=HWl6COGODIyqLQai+A0hQ3h7oyasNBFRXgQKe35XUnUGqFOE6tStHWBYVCR6ERQjv30LQxlA/3IC8GMP6vcYMBQYYBtBmKBtmJN3v6gHWmHM2KpnK2IK0j5aaSUTnxVd0yyQ78XmqzhdA4XH4iEJHEbNORpYLFIZeV9e2iWrP48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726255077; c=relaxed/simple;
	bh=G3KTtbDW3vxqfo9/dPfZrS2VgAks1w2oO93PwBxPPjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVphJ4FE+KY8NeqGY2aXhWeITHsojMXFKYyCrgbFXJ4qOoqFBgpKDmatTZumx3MYv1BaGtVSERMnQYX9LF89PwVkOa8P/EPSHevtZPPdpNgMvntPmV09JOzOx2m2bwtw5yK7Gp/fhBzhGXZWgN7RaXigzalKHQrrd/5iSgqOxC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8vevi/i; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726255076; x=1757791076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G3KTtbDW3vxqfo9/dPfZrS2VgAks1w2oO93PwBxPPjo=;
  b=W8vevi/iRdZi0trrt30jv90Xjmh7eo77pkDZjjdJOwKeCr70T8lL5fq8
   EeTKUiNQ08t+UYxhW0QGBl0qJiPax2byIGbaNUOVVDa9whPupfH/YqIjT
   hRU2KJHY5dQtLWVzgsC1Drhsqlg84I/xd/SFMlxtJtYZrOwH4dF1LDwVR
   Y5nXxB3sqNoAL5lDZbjsBC4ZYg8ommVVL55DeZyIB7Q2Nu1eL59TbcXlI
   H7ajXahXonkqIA79leT3GvQUhGQIAxgeMimaLOVXJAn0lhQBWXP66Y/rx
   ButRtRlieq5+SkHP8VJ46I48QAnirjFxNH8ht/yAYZ2p4TLYoD83Ha/3H
   Q==;
X-CSE-ConnectionGUID: gYajuqF7ThW2O9Zlr3ZnPw==
X-CSE-MsgGUID: LYisdEbjTD201CMaQhwuEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36517175"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="36517175"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:17:56 -0700
X-CSE-ConnectionGUID: unzXRzZsSJSo/sijK5FgfA==
X-CSE-MsgGUID: 7wN9vAaQT56Skwpvy5ca7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="98838398"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:17:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1spBnj-00000008P33-2EOh;
	Fri, 13 Sep 2024 22:17:51 +0300
Date: Fri, 13 Sep 2024 22:17:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 6/8] i2c: amd-asf: Add routine to handle the ASF slave
 process
Message-ID: <ZuSP3ztZ9G5-Y7G0@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121110.1611340-7-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 05:41:08PM +0530, Shyam Sundar S K wrote:
> Add support for handling ASF slave process events as described in the AMD
> ASF databook. This involves implementing the correct programming sequence
> to manage each ASF packet appropriately.

...

>  /* ASF address offsets */
> +#define ASFINDEX	(7 + piix4_smba)

0x07

...

> +#define ASF_ERROR_STATUS		0xE

So, according to the usage this seems to be a mask, then perhaps GENMASK(3, 1) ?

...

> +static void amd_asf_process_target(struct work_struct *work)
> +{
> +	struct amd_asf_dev *dev = container_of(work, struct amd_asf_dev, work_buf.work);
> +	unsigned short piix4_smba = dev->port_addr->start;
> +	u8 data[ASF_BLOCK_MAX_BYTES];

> +	u8 len, idx, val = 0;

Hmm... Does val = 0 assignment is due to false positive (or missing error check)?

> +	u8 bank, reg, cmd;
> +
> +	/* Read target status register */
> +	reg = inb_p(ASFSLVSTA);
> +
> +	/* Check if no error bits are set in target status register */
> +	if (reg & ASF_ERROR_STATUS) {
> +		/* Set bank as full */
> +		cmd = 0;
> +		reg = reg | GENMASK(3, 2);
> +		outb_p(reg, ASFDATABNKSEL);
> +	} else {
> +		/* Read data bank */
> +		reg = inb_p(ASFDATABNKSEL);
> +		bank = (reg & BIT(3)) ? 1 : 0;
> +
> +		/* Set read data bank */
> +		if (bank) {
> +			reg = reg | BIT(4);
> +			reg = reg & ~BIT(3);
> +		} else {
> +			reg = reg & ~BIT(4);
> +			reg = reg & ~BIT(2);
> +		}
> +
> +		/* Read command register */
> +		outb_p(reg, ASFDATABNKSEL);
> +		cmd = inb_p(ASFINDEX);
> +		len = inb_p(ASFDATARWPTR);
> +		for (idx = 0; idx < len; idx++)
> +			data[idx] = inb_p(ASFINDEX);
> +
> +		/* Clear data bank status */
> +		if (bank) {
> +			reg = reg | BIT(3);
> +			outb_p(reg, ASFDATABNKSEL);
> +		} else {
> +			reg = reg | BIT(2);
> +			outb_p(reg, ASFDATABNKSEL);
> +		}
> +	}
> +
> +	outb_p(0, ASFSETDATARDPTR);
> +	if (cmd & BIT(0))
> +		return;
> +
> +	i2c_slave_event(dev->target, I2C_SLAVE_WRITE_REQUESTED, &val);

Can this fail / return an error code? (I haven't checked)

> +	for (idx = 0; idx < len; idx++) {
> +		val = data[idx];
> +		i2c_slave_event(dev->target, I2C_SLAVE_WRITE_RECEIVED, &val);
> +	}
> +	i2c_slave_event(dev->target, I2C_SLAVE_STOP, &val);
> +}

...

> +	irq = platform_get_irq(pdev, 0);
> +	if (!irq)

Incorrect check.

> +		return dev_err_probe(&pdev->dev, -EINVAL, "missing IRQ resources\n");

Shadower real error code.

...

> +static void amd_asf_remove(struct platform_device *pdev)
> +{
> +	struct amd_asf_dev *dev = platform_get_drvdata(pdev);
> +
> +	cancel_delayed_work_sync(&dev->work_buf);
> +}

Wouldn't devm-helpers.h APIs help with avoiding ->remove() creation?

-- 
With Best Regards,
Andy Shevchenko



