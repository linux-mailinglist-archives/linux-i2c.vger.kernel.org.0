Return-Path: <linux-i2c+bounces-6197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3EE96C127
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 16:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B3AE1C2271D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19771DB53C;
	Wed,  4 Sep 2024 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0yxhuh2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22D339FFE
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461354; cv=none; b=Uixdz96PBOhIKFZKn8pbY4a51u8eKupy9dcX48LO/cAN2ZSNGIc4YvAVsyAeGj/Tu/plcCWMrcCwO9xlCwNNQc4k39bllEtu6mYrBxwpuTpG+iVngIow72X/XsZXxfhloEZdw9hUc2c53Nz6wZEpluwNnoMbodP7wFS48GKJoLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461354; c=relaxed/simple;
	bh=G6k/uLYDvRrg6Cnt3OABqrhbYIIxc3nddP4UzL1dsXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYiS2tvlUOI7yAr8qTqwe6xfHttq66+tOLTixFXv41ZV6ENYBIv5d/FLgrWaiPej7ICiknugEzxGyq1Qgw+ZkB4eZm/Wb84SBVsybgtOqcf22dCRq0BpaDqzvKPH+8RYt8cBD0RZ+CuIP8IfgmZP8ujoJ3MG2E1JnxEHydGgUbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0yxhuh2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725461352; x=1756997352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G6k/uLYDvRrg6Cnt3OABqrhbYIIxc3nddP4UzL1dsXU=;
  b=f0yxhuh2M77G0CXg7KtZqYxITDeo4nxTorxUsMj6zf0uO7/F8ZO0zMWi
   ydasMORo391U4tKaVKGDX9wyW9UkwtOeQL+dI+MS8BUXVv27kU2VqCYo0
   MGUXeXHlBDDfvZOdOPZ6U6stLR7O+X38hufXBcZjj5OjEhO4feCgi3jsV
   wd+ORL2v2boI/jwc6dJ3sZ+GqY1HkcW8vDo3mhzopcWjk8/X2rrTU9r32
   nz4kpC17owqzZ/rkuWLEsFVF48Jl9L49cicrBDO0mStZKLRBAutJWJDS4
   kHYadvPk8B0gLjWfj4Rb8dClAlPBc6NVFqtqnT08+gL5Y1gMYsnETD2aJ
   Q==;
X-CSE-ConnectionGUID: OSyfUNDmQ6mL/kc8Jny7hQ==
X-CSE-MsgGUID: YEMq/HV8QEuilxo+UxMIvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34727865"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="34727865"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:49:12 -0700
X-CSE-ConnectionGUID: mddNPqxeTNaop0RHIEKeTQ==
X-CSE-MsgGUID: BMnDZC47S/OO3ZbHcOL1VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65342286"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 07:49:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slrJj-00000005656-16PJ;
	Wed, 04 Sep 2024 17:49:07 +0300
Date: Wed, 4 Sep 2024 17:49:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
Subject: Re: [PATCH v2 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Message-ID: <ZthzYiFoKyBb4lIq@smile.fi.intel.com>
References: <20240904105731.2246235-1-Shyam-sundar.S-k@amd.com>
 <20240904105731.2246235-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904105731.2246235-4-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 04:27:29PM +0530, Shyam Sundar S K wrote:
> The AMD ASF controller is presented to the operating system as an ACPI
> device. The piix4 driver can obtain the ASF handle through ACPI to
> retrieve information about the ASF controller's attributes, such as the
> ASF address space and interrupt number, and to handle ASF interrupts.
> 
> Currently, the piix4 driver assumes that a specific port address is
> designated for AUX operations. However, with the introduction of ASF, the
> same port address may also be used by the ASF controller. Therefore, a
> check needs to be added to ensure that if ASF is advertised and enabled in
> ACPI, the AUX port is not set up.

> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Use --cc parameter when sending, instead of this, or alternatively move this
line...

> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

...to be somewhere here. It will the same effect for you and me
(in case you use `git send-email`).

>  drivers/i2c/busses/i2c-piix4.c | 166 ++++++++++++++++++++++++++++++++-

...

> +struct sb800_asf_data {
> +	unsigned short addr;
> +	int irq;
> +};


> struct i2c_piix4_adapdata {

>  	struct sb800_mmio_cfg mmio_cfg;
>  	u8 algo_select;
>  	struct i2c_client *slave;
> +	bool is_asf;
> +	struct delayed_work work_buf;
>  };

Side note, always run `pahole` when adding new data structures or modifying
existing ones. It might save memory on the running systems.

...

> +static void sb800_asf_process_slave(struct work_struct *work)
> +{
> +	struct i2c_piix4_adapdata *adapdata = container_of(work, struct i2c_piix4_adapdata,
> +							   work_buf.work);

Better split is

	struct i2c_piix4_adapdata *adapdata =
		container_of(work, struct i2c_piix4_adapdata, work_buf.work);

> +	unsigned short piix4_smba = adapdata->smba;
> +	u8 data[SB800_ASF_BLOCK_MAX_BYTES];
> +	u8 bank, reg, cmd = 0;
> +	u8 len, val = 0;
> +	int i;
> +
> +	/* Read slave status register */
> +	reg = inb_p(ASFSLVSTA);
> +
> +	/* Check if no error bits are set in slave status register */
> +	if (!(reg & SB800_ASF_ERROR_STATUS)) {

Why not use positive conditional? (This will require to swap if/else branches)

> +		/* Read data bank */
> +		reg = inb_p(ASFDATABNKSEL);
> +		bank = (reg & BIT(3)) >> 3;
> +
> +		/* Set read data bank */
> +		if (bank) {
> +			reg = reg | BIT(4);

> +			reg = reg & (~BIT(3));
> +		} else {
> +			reg = reg & (~BIT(4));
> +			reg = reg & (~BIT(2));

In all these three cases the outer parentheses are redundant.

> +		}
> +
> +		/* Read command register */
> +		outb_p(reg, ASFDATABNKSEL);
> +		cmd = inb_p(ASFINDEX);
> +		len = inb_p(ASFDATARWPTR);
> +		for (i = 0; i < len; i++)
> +			data[i] = inb_p(ASFINDEX);
> +
> +		/* Clear data bank status */
> +		if (bank) {
> +			reg = reg | BIT(3);
> +			outb_p(reg, ASFDATABNKSEL);
> +		} else {
> +			reg = reg | BIT(2);
> +			outb_p(reg, ASFDATABNKSEL);
> +		}
> +	} else {
> +		/* Set bank as full */
> +		reg = reg | (BIT(3) | BIT(2));

GENMASK() ?

> +		outb_p(reg, ASFDATABNKSEL);
> +	}
> +
> +	outb_p(0, ASFSETDATARDPTR);
> +	if (!(cmd & BIT(0))) {

	if (cmd & BIT(0))
		return;

?

> +		i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
> +		for (i = 0; i < len; i++) {
> +			val = data[i];
> +			i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_RECEIVED, &val);
> +		}
> +		i2c_slave_event(adapdata->slave, I2C_SLAVE_STOP, &val);
> +	}
> +}

...

> +static irqreturn_t sb800_asf_irq_handler(int irq, void *ptr)
> +{
> +	struct i2c_piix4_adapdata *adapdata = (struct i2c_piix4_adapdata *)ptr;

Unneeded explicit casting.

> +	unsigned short piix4_smba = adapdata->smba;
> +	u8 slave_int = inb_p(ASFSTA);
> +
> +	if ((slave_int & BIT(6))) {

Too many parentheses

> +		/* Slave Interrupt */
> +		outb_p(slave_int | BIT(6), ASFSTA);
> +		schedule_delayed_work(&adapdata->work_buf, HZ);
> +	} else {
> +		/* Master Interrupt */
> +		sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, SMBHSTSTS, true);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

...

> +static int sb800_asf_acpi_resource_cb(struct acpi_resource *resource, void *context)
> +{
> +	struct sb800_asf_data *data = context;
> +
> +	switch (resource->type) {
> +	case ACPI_RESOURCE_TYPE_EXTENDED_IRQ:
> +		data->irq = resource->data.extended_irq.interrupts[0];
> +		break;
> +	case ACPI_RESOURCE_TYPE_IO:
> +		data->addr = resource->data.io.minimum;
> +		break;
> +	}
> +
> +	return 0;
> +}

Why do you still need this callback? What for?

...

> +static int sb800_asf_add_adap(struct pci_dev *dev)
> +{
> +	struct i2c_piix4_adapdata *adapdata;
> +	struct sb800_asf_data data;
> +	struct acpi_device *adev;
> +	LIST_HEAD(res_list);
> +	acpi_status status;
> +	acpi_handle handle;
> +	int ret;
> +
> +	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> +	adev = acpi_fetch_acpi_dev(handle);
> +	if (!adev)
> +		return -ENODEV;
> +
> +	ret = acpi_dev_get_resources(adev, &res_list, sb800_asf_acpi_resource_cb, &data);

	..., NULL, NULL):

> +	if (ret < 0) {
> +		dev_err(&dev->dev, "Error getting ASF ACPI resource: %d\n", ret);
> +		return ret;
> +	}

Here iterate over the resources and take the ones you need by their respective
types.

> +	acpi_dev_free_resource_list(&res_list);
> +	ret = piix4_add_adapter(dev, data.addr, SMBUS_ASF, piix4_adapter_count, false, 0,
> +				piix4_main_port_names_sb800[piix4_adapter_count],
> +				&piix4_main_adapters[piix4_adapter_count]);
> +	if (ret) {
> +		dev_err(&dev->dev, "Failed to add ASF adapter: %d\n", ret);
> +		return -ENODEV;
> +	}
> +
> +	adapdata = i2c_get_adapdata(piix4_main_adapters[piix4_adapter_count]);
> +	ret = devm_request_irq(&dev->dev, data.irq, sb800_asf_irq_handler, IRQF_SHARED,
> +			       "sb800_smbus_asf", adapdata);
> +	if (ret) {
> +		dev_err(&dev->dev, "Unable to request irq: %d for use\n", data.irq);
> +		return ret;
> +	}
> +
> +	INIT_DELAYED_WORK(&adapdata->work_buf, sb800_asf_process_slave);
> +	adapdata->is_asf = true;
> +	/* Increment the adapter count by 1 as ASF is added to the list */
> +	piix4_adapter_count += 1;

++ also suffice.

> +	return 1;
> +}

-- 
With Best Regards,
Andy Shevchenko



