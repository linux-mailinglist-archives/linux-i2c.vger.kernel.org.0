Return-Path: <linux-i2c+bounces-6059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9A696A806
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BA081C24366
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 20:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE08813DBBC;
	Tue,  3 Sep 2024 20:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDboLI7r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24E71DC725
	for <linux-i2c@vger.kernel.org>; Tue,  3 Sep 2024 20:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725394012; cv=none; b=BG5d3utNjfaZ87DK/Nrl54lqFbxn65+62ZKoV86BQhjUfyNdxOvAtFhXXAgGfTtxFSCH+5LWtIOvTp07dDcfB65UhhYNRYn+9LsyRVFJqcAY7XWmePpIPMPMGEBp9KZIR2+yYuPkyo08Ee5//06mUHf6/13t3ZCnpNPT/WNk02U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725394012; c=relaxed/simple;
	bh=7xc5FmAzzvyxMAfVqol9tR9PfkV+T1yXe2sd+YPjYkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUnFi2m10tiSwIu299auvisZC9FLCrQ4SGwaT2YySxQP2GM20SqxYTP/vm6WqVCwTzUkh/jxk6kBPqEPpei/9ft17UgjEG5TuVfB/PGMu6WLzJ7et0hifYYrmLbA1Nj6K/GOuxiSjBF/qXQTXWQvZrf6FTY+okWi29m05Ge5c58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDboLI7r; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725394011; x=1756930011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7xc5FmAzzvyxMAfVqol9tR9PfkV+T1yXe2sd+YPjYkA=;
  b=UDboLI7rYQVSQ2gCZoNMCOnjlHu7iR4lBrB/0cMt6eIJ3c/TOYDrZCiT
   uTEe/5xQv7JRzxRPysmlzt2CtI2srbGjM0N0lgqswM2zuedIAqxQNmSGn
   J0ZrPCw+ZHxY0rGiLhaV93+8lwWQ7MKqJ9ixL9w0f/c8YANLtXmjBXUIz
   CNmBYc0hdf6CqtPfT5S2SRubQwmmzuOmoGErGSUQMf6HjlIKiYEZVxSwM
   olPgpDca9sGBVkTltMv4gUCrnnjLfdDiljBSIeaRGTi53u9gI/S0vxwqr
   DdtAbHzkNnMyQDSJPfcnj4c+8rQlJNhYZ1MzOuUc0/ehXxFChDe5Yjt0N
   A==;
X-CSE-ConnectionGUID: B37OB9WiRz21xUqv+wnyeA==
X-CSE-MsgGUID: i0yNn60ITqCJfo2PYugV7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41493525"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="41493525"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 13:06:50 -0700
X-CSE-ConnectionGUID: rZPQOBk3S6+ZBF4GZ/qOcg==
X-CSE-MsgGUID: hnDcnjReR8+vofd7EYkgYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="69656353"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 13:06:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slZna-00000004prO-26w9;
	Tue, 03 Sep 2024 23:06:46 +0300
Date: Tue, 3 Sep 2024 23:06:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
Subject: Re: [PATCH 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Message-ID: <ZtdsVvU90WOgyBNr@smile.fi.intel.com>
References: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
 <20240822142200.686842-4-Shyam-sundar.S-k@amd.com>
 <34a01d4c-cf05-45e4-924c-e2453ff5f6a3@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34a01d4c-cf05-45e4-924c-e2453ff5f6a3@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 01:06:16AM +0530, Shyam Sundar S K wrote:
> +Andy (this has some ACPI handling that adds AMD ASF support to the
> existing piix4 driver for SMBus)

Thanks.

> On 8/22/2024 19:51, Shyam Sundar S K wrote:
> > The AMD ASF controller is presented to the operating system as an ACPI
> > device. The piix4 driver can obtain the ASF handle through ACPI to
> > retrieve information about the ASF controller's attributes, such as the
> > ASF address space and interrupt number, and to handle ASF interrupts.
> > 
> > Currently, the piix4 driver assumes that a specific port address is
> > designated for AUX operations. However, with the introduction of ASF, the
> > same port address may also be used by the ASF controller. Therefore, a
> > check needs to be added to ensure that if ASF is advertised and enabled in
> > ACPI, the AUX port is not set up.

...

> > +static acpi_status sb800_asf_acpi_resource_cb(struct acpi_resource *resource, void *context)
> > +{
> > +	struct sb800_asf_data *data = context;
> > +
> > +	switch (resource->type) {
> > +	case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
> > +		data->irq = resource->data.extended_irq.interrupts[0];
> > +		break;
> > +	case ACPI_RESOURCE_TYPE_IO:
> > +		data->addr = resource->data.io.minimum;
> > +		break;
> > +	}
> > +
> > +	return AE_OK;
> > +}
> > +
> > +static int sb800_asf_add_adap(struct pci_dev *dev)
> > +{
> > +	struct i2c_piix4_adapdata *adapdata;
> > +	struct sb800_asf_data *data;
> > +	acpi_status status;
> > +	acpi_handle handle;
> > +	int ret;

> > +	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
> > +	if (ACPI_FAILURE(status))
> > +		return -ENODEV;

> > +	data = devm_kzalloc(&dev->dev, sizeof(struct sb800_asf_data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;

Why can't it be on stack?

> > +	status = acpi_walk_resources(handle, METHOD_NAME__CRS, sb800_asf_acpi_resource_cb, data);
> > +	if (ACPI_FAILURE(status))
> > +		return -EINVAL;
> > +
> > +	if (!data->addr)
> > +		return -EINVAL;

This is reinvention of acpi_dev_get_resources(). Many drivers are using it, you
may found a lot of examples.

> > +	ret = piix4_add_adapter(dev, data->addr, SMBUS_ASF, piix4_adapter_count, false, 0,
> > +				piix4_main_port_names_sb800[piix4_adapter_count],
> > +				&piix4_main_adapters[piix4_adapter_count]);
> > +	if (ret) {
> > +		dev_err(&dev->dev, "Failed to add ASF adapter: %d\n", ret);
> > +		return -ENODEV;
> > +	}
> > +
> > +	adapdata = i2c_get_adapdata(piix4_main_adapters[piix4_adapter_count]);
> > +	ret = devm_request_irq(&dev->dev, data->irq, sb800_asf_irq_handler, IRQF_SHARED,
> > +			       "sb800_smbus_asf", adapdata);
> > +	if (ret) {
> > +		dev_err(&dev->dev, "Unable to request irq: %d for use\n", data->irq);
> > +		return ret;
> > +	}
> > +
> > +	INIT_DELAYED_WORK(&adapdata->work_buf, sb800_asf_process_slave);
> > +	adapdata->is_asf = true;
> > +	/* Increment the adapter count by 1 as ASF is added to the list */
> > +	piix4_adapter_count += 1;
> > +	return 1;
> > +}

-- 
With Best Regards,
Andy Shevchenko



