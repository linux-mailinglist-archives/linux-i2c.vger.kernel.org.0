Return-Path: <linux-i2c+bounces-6570-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F19CF9756AA
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21A571C231FB
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A5A1A3044;
	Wed, 11 Sep 2024 15:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUC/dvIU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2E51AB6C6
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726067789; cv=none; b=eYLiFQ3G3ozQeMhDjfM3EhGTMykik+ky9CGWqdKeAmE2zNPUsPGfI9VlzX1Iu2AOEZ4MYA1d0PALB7yHX0rjTKF+ggnc3EXHGJGc0vyjrgfPAcEwDXs7q4aXgCGUbajb9AVyR1ahXj0vadwfA5R5ZWOFlpAbGhRukwbOjeJBReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726067789; c=relaxed/simple;
	bh=9KVw9xs8B0qayY066iNLqoKouVbMDZ6MSKGIBkJZs8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfZw8dCW5xZx1yUWq62wftzLsh0rgIV1I82WmTCMMtj0YUysupyWUD5xsPh9Md6OZO/ofnsIbuuydMdIlDOD1ghd+wH/DMtaA3F9Y2VfPa3e8oBrforX7p0R5l2vp5BOVzetvSvrRuyrN68MaUhdWED3n4RT1qOhfwdUBfbtgmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUC/dvIU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726067788; x=1757603788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9KVw9xs8B0qayY066iNLqoKouVbMDZ6MSKGIBkJZs8A=;
  b=hUC/dvIUZaJS4wsw1wfcFOZjHWzvvy2PnB0NpS2O20n3yAgHSa6HDzrx
   ML+22CI/ReyxfnKTc1nwgU0Mgeh208dISy9WMyKs6uIddUlQFbwreOA4H
   BbGw/DqBk24nbMjybHXWyOHc01MyaZApLeBiiXnmDXKdkrrIoJQ9jt54q
   LjhzFRdua1pv/MZ6HGV6ipD8YHf/IV3eCe+IDrOqSBOZeW4kExYx1D32l
   2gtGRkb1z/HYD7WzFdJFHVblfdibVOoEbP+uq5GgfUffpNydJG2JJqyyx
   AVQHOVoMCIbEJqKUWhBXrqAbBF64jDDoo+w1efGlv2KfCg02thYWa41Sg
   w==;
X-CSE-ConnectionGUID: +4mnEnp7RkeDyI4jVJ9J+g==
X-CSE-MsgGUID: IiYfrX7vT1OKVDz928p8Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28652058"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="28652058"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:16:27 -0700
X-CSE-ConnectionGUID: lXhCb8EqSdinWYnQX27Csg==
X-CSE-MsgGUID: cKVvuNFqQiqYeH/3f6ecng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="71775799"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:16:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soP4x-00000007b6t-30kL;
	Wed, 11 Sep 2024 18:16:23 +0300
Date: Wed, 11 Sep 2024 18:16:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
Subject: Re: [PATCH v4 4/8] i2c: amd-asf: Add ACPI support for AMD ASF
 Controller
Message-ID: <ZuG0R6rLes_s3lWt@smile.fi.intel.com>
References: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
 <20240911115407.1090046-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911115407.1090046-5-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 05:24:03PM +0530, Shyam Sundar S K wrote:
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

With brief look this is much better than the previous version(s).
Thank you for rewriting it this way!

Some comments below.

...

> +#include <linux/acpi.h>

No need (see below)

+ device.h
+ errno.h
+ gfp_types.h

> +#include <linux/i2c-smbus.h>

This should be i2c.h

+ mod_devicetable.h
+ module.h

> +#include <linux/platform_device.h>

> +#include <linux/slab.h>

Not in use.

+ sprintf.h

> +#include "i2c-piix4.h"
> +
> +static const char *sb800_asf_port_name = " port 1";
> +
> +struct amd_asf_dev {
> +	struct device *dev;
> +	struct i2c_adapter adap;

Make it first member, it might help if we ever do a container_of() against
this.

> +	struct sb800_mmio_cfg mmio_cfg;
> +	unsigned short port_addr;

What you probably want is to have

	void __iomem *addr;

and use devm_ioport_map() somewhere (see
drivers/pinctl/intel/pinctrl-lynxpoint.c, for example)

> +};

> +static int amd_asf_probe(struct platform_device *pdev)
> +{
> +	struct resource_entry *rentry;
> +	struct amd_asf_dev *asf_dev;
> +	struct acpi_device *adev;
> +	LIST_HEAD(res_list);
> +	int ret;

> +	adev = ACPI_COMPANION(&pdev->dev);
> +	if (!adev)
> +		return dev_err_probe(&pdev->dev, -ENODEV, "Failed to get ASF device\n");

No need. You will get here only if enumerated via ACPI (or if it's out-of-tree
board file which we do not care about at all).

> +	asf_dev = devm_kzalloc(&pdev->dev, sizeof(*asf_dev), GFP_KERNEL);
> +	if (!asf_dev)
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
> +
> +	asf_dev->dev = &pdev->dev;

> +	platform_set_drvdata(pdev, asf_dev);

Is it used?

> +	asf_dev->adap.owner = THIS_MODULE;
> +	asf_dev->mmio_cfg.use_mmio = true;
> +	asf_dev->adap.class = I2C_CLASS_HWMON;

> +	ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Error getting ASF ACPI resource: %d\n", ret);
> +
> +	list_for_each_entry(rentry, &res_list, node) {
> +		switch (resource_type(rentry->res)) {
> +		case IORESOURCE_IO:
> +			asf_dev->port_addr = rentry->res->start;
> +			break;
> +		default:
> +			dev_warn(&adev->dev, "Invalid ASF resource\n");
> +			break;
> +		}
> +	}
> +
> +	acpi_dev_free_resource_list(&res_list);

Now this is a duplicate of what ACPI glue layer does. You have these already
available as platform device resources.

> +	/* Set up the sysfs linkage to our parent device */
> +	asf_dev->adap.dev.parent = &pdev->dev;
> +
> +	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name),
> +		 "SMBus ASF adapter%s at %04x", sb800_asf_port_name, asf_dev->port_addr);

> +	i2c_set_adapdata(&asf_dev->adap, asf_dev);

Is it used?

> +	ret = i2c_add_adapter(&asf_dev->adap);

Use devm variant of this casll.

> +	if (ret) {

> +		release_region(asf_dev->port_addr, SMBIOSIZE);

Why?

> +		return ret;
> +	}
> +
> +	return 0;

	return devm_i2c_add_adapter(...);

> +}
> +
> +static void amd_asf_remove(struct platform_device *pdev)
> +{
> +	struct amd_asf_dev *dev = platform_get_drvdata(pdev);

> +	if (dev->port_addr) {

Redundant.

> +		i2c_del_adapter(&dev->adap);

With devm this should be removed.

> +		release_region(dev->port_addr, SMBIOSIZE);

Why?

> +	}
> +}
> +
> +static const struct acpi_device_id amd_asf_acpi_ids[] = {
> +	{"AMDI001A", 0},

	{ "AMDI001A" },

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_asf_acpi_ids);
> +
> +static struct platform_driver amd_asf_driver = {
> +	.driver = {
> +		.name = "i2c-amd-asf",
> +		.acpi_match_table = amd_asf_acpi_ids,
> +	},
> +	.probe = amd_asf_probe,
> +	.remove_new = amd_asf_remove,
> +};
> +module_platform_driver(amd_asf_driver);

...

> +	status = acpi_get_handle(NULL, (acpi_string)SB800_ASF_ACPI_PATH, &handle);

Does it compile with CONFIG_ACPI=n?

Also don't you need to include acpi.h for this? Or is it already there?
(I haven't checked).

> +	if (ACPI_SUCCESS(status))
> +		is_asf = true;

-- 
With Best Regards,
Andy Shevchenko



