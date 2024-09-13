Return-Path: <linux-i2c+bounces-6730-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FEB9788C6
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 21:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD6231F27826
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 19:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03D6146A93;
	Fri, 13 Sep 2024 19:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzLkV6f1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B6F145B01
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 19:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726255115; cv=none; b=ZinlH0n/sYjJgI0A6DaNvXqwbocUtXFCXrEFRodoqzEDhoqzk+FgTMP4LoBXz4k2OYkzwjNMBT3X+VE9FEAOPyThj9T28HWQwDwcNEsBtsvla4lEDOvR6D3X2X7oay+5Pk3i3OZ0xYOCyyvTBWUF1AdMHbF3cONz0Lo//cQhL88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726255115; c=relaxed/simple;
	bh=aPz5O4KfTYLyvzkctvr5tB6iPqB2SKMdLMH66Mngel8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QR39j1T0XWUgxuf6Zpj1PtOAqYQW07Kakm6OZtGGxx07UVP8gSp0r7ofpNIpkO2TjLfz4yOiIrl5ZzXb76OFcN6cl03qWafWYbm8PtboymSYnZovmDtC6uiRLD+8RXpAV+HC28iYCnMroU6h2fQKy2Ybc92AGLp5pankYO9sB3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WzLkV6f1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726255114; x=1757791114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aPz5O4KfTYLyvzkctvr5tB6iPqB2SKMdLMH66Mngel8=;
  b=WzLkV6f1uDfKJHszeZK/uxdACoCfCL7IWPhTJ2Evcn8y/yWrQDVwEAhG
   at5B1pVJuE+0UwiGJuLu3NTRR+IDjD4jfOvrFbBJsv1wDUfQM2LXdf4P/
   drLx2A4B5HlQ/HgASm/lFFpF0Z/8anOaUMOInVxGI5r6fzy78Uj2Jvyi9
   HnMRmZNAH+hMrK6vAnHw91fI9zkyVwQDoPhU5eBKCu+4qqrwMV5lPAVDx
   2LxhHTGQvviku0+2lYR9HyoFNSkAwtdZrE2ptpv3/tRmyKEpdBQmap7hF
   tV0uYmIq4j+M5ngwp0usipWjl57fIMb0nNrdoie1tXOaXJo0jQpo2wqy3
   A==;
X-CSE-ConnectionGUID: P5PSy6u/QPafrnS4AydNJQ==
X-CSE-MsgGUID: VWbN3srWQtqPigPRzSXnDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28082262"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="28082262"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:18:33 -0700
X-CSE-ConnectionGUID: tvbeZNsySBqLHkaWJVk1tg==
X-CSE-MsgGUID: AnbBsNzGTEaH9m3Rruax6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="68147546"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 12:18:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1spBoL-00000008P3o-2zG3;
	Fri, 13 Sep 2024 22:18:29 +0300
Date: Fri, 13 Sep 2024 22:18:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v5 4/8] i2c: amd-asf: Add ACPI support for AMD ASF
 Controller
Message-ID: <ZuSQBcWDOk7gXY4Z@smile.fi.intel.com>
References: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
 <20240913121110.1611340-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121110.1611340-5-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 05:41:06PM +0530, Shyam Sundar S K wrote:
> The AMD ASF controller is presented to the operating system as an ACPI
> device. The AMD ASF driver can use ACPI to obtain information about the
> ASF controller's attributes, such as the ASF address space and interrupt
> number, and to handle ASF interrupts.
> 
> Currently, the piix4 driver assumes that a specific port address is
> designated for AUX operations. However, with the introduction of ASF, the
> same port address may also be used by the ASF controller. Therefore, a
> check needs to be added to ensure that if ASF is advertised and enabled in
> ACPI, the AUX port should not be configured.

...

> +#include <linux/device.h>
> +#include <linux/errno.h>

+ gfp_types.h

> +#include <linux/io.h>
> +#include <linux/i2c.h>

Keep them ordered.

+ ioport.h // you use definitions from there

> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/sprintf.h>

...

> +static const char *amd_asf_port_name = " port 1";

It's a bit counter intuitive to have a leading space in the constants like
this...

...

> +struct amd_asf_dev {
> +	struct i2c_adapter adap;

> +	struct device *dev;

So, this is a dup of adap.dev.parent. Do you really need this shortcut?

> +	struct sb800_mmio_cfg mmio_cfg;
> +	struct resource *port_addr;
> +};

> +static int amd_asf_probe(struct platform_device *pdev)
> +{

With

	struct device *dev = &pdev->dev;

the following lines can be made shorter.

> +	struct amd_asf_dev *asf_dev;
> +
> +	asf_dev = devm_kzalloc(&pdev->dev, sizeof(*asf_dev), GFP_KERNEL);
> +	if (!asf_dev)
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
> +
> +	asf_dev->dev = &pdev->dev;
> +	asf_dev->mmio_cfg.use_mmio = true;

> +	platform_set_drvdata(pdev, asf_dev);

I believe this won't be needed, see the respective email reply in the series.

> +	asf_dev->port_addr = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (!asf_dev->port_addr)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "missing IO resources\n");
> +
> +	asf_dev->adap.owner = THIS_MODULE;
> +	asf_dev->adap.dev.parent = &pdev->dev;
> +
> +	i2c_set_adapdata(&asf_dev->adap, asf_dev);
> +	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name),
> +		 "SMBus ASF adapter%s at 0x%llx", amd_asf_port_name, asf_dev->port_addr->start);
> +
> +	return devm_i2c_add_adapter(&pdev->dev, &asf_dev->adap);
> +}

-- 
With Best Regards,
Andy Shevchenko



