Return-Path: <linux-i2c+bounces-14794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9C1CDFE90
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 16:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29B1230022C8
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 15:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C43425A322;
	Sat, 27 Dec 2025 15:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkfL5SOc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC64A2571DD;
	Sat, 27 Dec 2025 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766850766; cv=none; b=mwzVf991AlZozvkIq0KRu30tkrZhrMPcaeXu6Pg+xsgmUIB80kxUbKWJbK7G+vNZKPQc3XBRxfoj04zbkYYAj9sjbEvA03KPqY3fJKNXYx/lJs0FqSQK/L509uLvRLy0LgEyvxe3IdX51d4WVjNdawjJsHY7esFIJIOZ7g4CMJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766850766; c=relaxed/simple;
	bh=75F/qRMWSVMZAvB/EDgH9Mg5dZHlMme18E40OjUuZPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nK6WhjhIVCU/9DBemLh15TWLn5PzgoqWpgwESMGRrYnAw5v2w+xzeHzU2QoHKZEbvCOiLiUXUaSXnfp9Qu6bGY/Ge+ZmSRNSeoJmWaxECbF855Je84IRDIDmlgOd2SRpq8HMN7rcn2+Yhvae4K/TAk2Fq/L0fyDbD1bash+iTCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkfL5SOc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766850764; x=1798386764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=75F/qRMWSVMZAvB/EDgH9Mg5dZHlMme18E40OjUuZPY=;
  b=RkfL5SOcNHITe/4AAWKmYlJ1s/qICsu96ZXQRugEccB8QHMlgOt1dkjA
   cL7mPQfjOY9j13nUijEKdcOu/wGdxWD66FX730G8BbZJI1WmJG6z8cKOa
   yRR2Izxl4raGTl63ql7uIX/OrKFXCJpjPDjPJcreTW9pFM/bYMt9kS8Qh
   sHHlkyJqrSKpZqOHTn2wnRgxCjI/+tFprkvjIKTYTVX96HeagMTHJtc1W
   DipiOdIHH1wKZmj8/qTCjyR1NnXoFe8aWZ1aK8DA/1+HHZ08HuoLDkq9d
   94gykGAGOPcK7/BjUreXadKhenPDapxFyMTQTPE9s+418LlXXjQS20T6S
   Q==;
X-CSE-ConnectionGUID: mpVjKL4USgqi7ck8WPfeEw==
X-CSE-MsgGUID: gWw10xqtQqWLl3VtmJKbnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79664888"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79664888"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 07:52:44 -0800
X-CSE-ConnectionGUID: flMyK6a+Tz+75MfbV1b3uQ==
X-CSE-MsgGUID: IzhL3ci7QSKsF4M0oChMrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205056046"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.211])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 07:52:41 -0800
Date: Sat, 27 Dec 2025 17:52:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] i2c: designware: Combine some of the common
 functions
Message-ID: <aVAAx-Rk4IuLqH6g@smile.fi.intel.com>
References: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
 <20251218151509.361617-4-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218151509.361617-4-heikki.krogerus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Dec 18, 2025 at 04:15:02PM +0100, Heikki Krogerus wrote:
> The adapter can be registered just in the core instead of
> separately in the master and slave drivers. The same applies
> to the interrupt.

...

>  int i2c_dw_probe(struct dw_i2c_dev *dev)
>  {
> +	struct i2c_adapter *adap = &dev->adapter;
> +	unsigned long irq_flags;
> +	int ret;
> +
>  	device_set_node(&dev->adapter.dev, dev_fwnode(dev->dev));
>  
> +	ret = i2c_dw_init_regmap(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = i2c_dw_set_sda_hold(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = i2c_dw_set_fifo_size(dev);
> +	if (ret)
> +		return ret;
> +
>  	switch (dev->mode) {
>  	case DW_IC_SLAVE:
> -		return i2c_dw_probe_slave(dev);
> +		ret = i2c_dw_probe_slave(dev);
> +		break;
>  	case DW_IC_MASTER:
> -		return i2c_dw_probe_master(dev);
> +		ret = i2c_dw_probe_master(dev);
> +		break;
>  	default:
> -		dev_err(dev->dev, "Wrong operation mode: %d\n", dev->mode);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		break;
>  	}
> +	if (ret)
> +		return ret;
> +
> +	ret = dev->init(dev);
> +	if (ret)
> +		return ret;

> +	if (!adap->name[0])
> +		strscpy(adap->name, "Synopsys DesignWare I2C adapter");

Hmm... See below.

> +	adap->retries = 3;
> +	adap->algo = &i2c_dw_algo;
> +	adap->quirks = &i2c_dw_quirks;
> +	adap->dev.parent = dev->dev;
> +	i2c_set_adapdata(adap, dev);
> +
> +	/*
> +	 * REVISIT: The mode check may not be necessary.
> +	 * For now keeping the flags as they were originally.
> +	 */
> +	if (dev->mode == DW_IC_SLAVE)
> +		irq_flags = IRQF_SHARED;
> +	else if (dev->flags & ACCESS_NO_IRQ_SUSPEND)
> +		irq_flags = IRQF_NO_SUSPEND;
> +	else
> +		irq_flags = IRQF_SHARED | IRQF_COND_SUSPEND;
> +
> +	ret = i2c_dw_acquire_lock(dev);
> +	if (ret)
> +		return ret;
> +
> +	__i2c_dw_write_intr_mask(dev, 0);
> +	i2c_dw_release_lock(dev);
> +
> +	if (!(dev->flags & ACCESS_POLLING)) {
> +		ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr,
> +				       irq_flags, dev_name(dev->dev), dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Increment PM usage count during adapter registration in order to
> +	 * avoid possible spurious runtime suspend when adapter device is
> +	 * registered to the device core and immediate resume in case bus has
> +	 * registered I2C slaves that do I2C transfers in their probe.
> +	 */
> +	ACQUIRE(pm_runtime_noresume, pm)(dev->dev);
> +	ret = ACQUIRE_ERR(pm_runtime_noresume, &pm);
> +	if (ret)
> +		return ret;
> +
> +	return i2c_add_numbered_adapter(adap);
>  }

...

> -	snprintf(adap->name, sizeof(adap->name),
> -		 "Synopsys DesignWare I2C Slave adapter");

This patch changes the user visible strings (via `i2cdetect`) or module names
in case we want to find it by name (note, we already have such precedents for
other adapters). Currently we have three variants if I not miss anything:
Generic for master (as in this change), Generic for slave, and AMD platform
driver case. If you think this is okay change, then just drop the AMD case
as well, and hence remove the no more needed conditional. Otherwise I would
somehow group this naming in one place, if possible.

-- 
With Best Regards,
Andy Shevchenko



