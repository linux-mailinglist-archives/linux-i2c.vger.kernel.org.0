Return-Path: <linux-i2c+bounces-6316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95596F431
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 14:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158B61C22360
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 12:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADB01CB313;
	Fri,  6 Sep 2024 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/A4NDBd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E55A17C9B
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 12:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725625457; cv=none; b=r5iWg1OxscAImjxn34sOJmAXx7M4BYKyJkR1mVhGOBaksu1IjhvIK3aTXw/6ynHg0R6WCjvWf/1Jl8mzyW37NLO2tSrXdZSuwBmxnTYrtxmJo3vT5dSORiRLin04GJHiYGxHHVh7szKOWOK0u4FTfUwG+h6nDWjYi9glXIAZr9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725625457; c=relaxed/simple;
	bh=bsBPFWqUMpwRaIbWXtlkXM/IrXGwl2WRXlvajy2+BmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlE1NvuN0Rd5VKsgt4IgEeVQFbn+810d+ZkqSRY7NgJAreqq9MRIBGg9HqyMzJDVSyk2S6dZaTmhQfgB7NYKHsDbIaS0p0yM7eC4fOiSdWxEY/1pCddg/RLbRr0EyXcaSNsxUzBZXaBwTxGyA0JjSHSmQnh5a2b98mgTcaIfkio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/A4NDBd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725625455; x=1757161455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bsBPFWqUMpwRaIbWXtlkXM/IrXGwl2WRXlvajy2+BmU=;
  b=J/A4NDBdd2+zKWqsoDPhOMnClCpKOaAraEXd42sd9xyjGsfM1lpcv4A2
   WbFO6dj/FKXHSBb9Q9ofxy1kjeX82wj2qRc8qQqobewhdkBL7l+b+6QJv
   z0NkUVee4Ubj1H8YJWOMy9nAnVgZE7BPgc1LsjQxy7jr+N/7hupxIh+Jg
   CTlfkA1eg/zxfpE3nfJr7Fm3GHi3v3bLZlraXqg9eH/Z4q+g4wI7V0rWb
   iYVp0cm7mwoDuBf0Cca5iYXAz0HjnKsC0EREUH89PXPt4diGH464AdCtk
   RTRyQS0ojG4Y8J+4t53uUTZ/6i5ZihdZgsfw12O6WhTkygD0O59/FxUee
   w==;
X-CSE-ConnectionGUID: dcKqdi2mRZ+Od4NtBVzT6g==
X-CSE-MsgGUID: W4WOWeJ8TMiVeZ0h8w52TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="49796577"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="49796577"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 05:24:14 -0700
X-CSE-ConnectionGUID: uoqzwzMMSz2/LYFK1nlr4A==
X-CSE-MsgGUID: n2PGReF2SdeITC18EFMgnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70355234"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 05:24:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smY0Y-00000005mZm-3vJ9;
	Fri, 06 Sep 2024 15:24:10 +0300
Date: Fri, 6 Sep 2024 15:24:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Message-ID: <Ztr0alsDWrBodtyv@smile.fi.intel.com>
References: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
 <20240906071201.2254354-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906071201.2254354-4-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 06, 2024 at 12:41:59PM +0530, Shyam Sundar S K wrote:
> The AMD ASF controller is presented to the operating system as an ACPI
> device. The piix4 driver can obtain the ASF handle through ACPI to
> retrieve information about the ASF controller's attributes, such as the
> ASF address space and interrupt number, and to handle ASF interrupts.

Can you share an excerpt of DSDT to see how it looks like?

> Currently, the piix4 driver assumes that a specific port address is
> designated for AUX operations. However, with the introduction of ASF, the
> same port address may also be used by the ASF controller. Therefore, a
> check needs to be added to ensure that if ASF is advertised and enabled in
> ACPI, the AUX port is not set up.

> Additionally, include a 'depends on X86' Kconfig entry for
> CONFIG_I2C_PIIX4, as the current patch utilizes acpi_dev_get_resources(),
> which is compiled only when CONFIG_ACPI is enabled, and CONFIG_ACPI
> depends on CONFIG_X86.

Yeah, please don't do that. If it requires ACPI, make it clear, there is
no x86 compile-time dependency.

Second issue with this is that now you require entire ACPI machinery for
the previous cases where it wasn't needed. Imagine an embedded system with
limited amount of memory for which you require +1Mbyte just for nothing.

Look how the other do (hint: ifdeffery in the code with stubs).

> +#define SB800_ASF_ACPI_PATH			"\\_SB.ASFC"

...

> +static void sb800_asf_process_slave(struct work_struct *work)
> +{
> +	struct i2c_piix4_adapdata *adapdata =
> +		container_of(work, struct i2c_piix4_adapdata, work_buf.work);
> +	unsigned short piix4_smba = adapdata->smba;
> +	u8 data[SB800_ASF_BLOCK_MAX_BYTES];

> +	u8 bank, reg, cmd = 0;

Move cmd assignment into the respective branch of the conditional below, in
that case it will be closer and more symmetrical.

> +	u8 len, val = 0;

> +	int i;

Why signed?

> +	/* Read slave status register */
> +	reg = inb_p(ASFSLVSTA);
> +
> +	/* Check if no error bits are set in slave status register */
> +	if (reg & SB800_ASF_ERROR_STATUS) {
> +		/* Set bank as full */
> +		reg = reg | GENMASK(3, 2);
> +		outb_p(reg, ASFDATABNKSEL);
> +	} else {
> +		/* Read data bank */
> +		reg = inb_p(ASFDATABNKSEL);

> +		bank = (reg & BIT(3)) >> 3;

Try
		bank = (reg & BIT(3)) ? 1 : 0;

Probably it doesn't affect the code generation, but at least seems cleaner
to read.

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
> +	}
> +
> +	outb_p(0, ASFSETDATARDPTR);
> +	if (cmd & BIT(0))
> +		return;
> +
> +	i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_REQUESTED, &val);
> +	for (i = 0; i < len; i++) {
> +		val = data[i];
> +		i2c_slave_event(adapdata->slave, I2C_SLAVE_WRITE_RECEIVED, &val);
> +	}
> +	i2c_slave_event(adapdata->slave, I2C_SLAVE_STOP, &val);
> +}

...

> +static irqreturn_t sb800_asf_irq_handler(int irq, void *ptr)
> +{
> +	struct i2c_piix4_adapdata *adapdata = ptr;
> +	unsigned short piix4_smba = adapdata->smba;
> +	u8 slave_int = inb_p(ASFSTA);
> +
> +	if (slave_int & BIT(6)) {
> +		/* Slave Interrupt */
> +		outb_p(slave_int | BIT(6), ASFSTA);
> +		schedule_delayed_work(&adapdata->work_buf, HZ);
> +	} else {
> +		/* Master Interrupt */

Please, start using inclusive non-offensive terms instead of old 'master/slave'
terminology. Nowadays it's a part of the standard AFAIU.

Note, I'm talking only about comments and messages, the APIs is another story
that should be addressed separately.

> +		sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, SMBHSTSTS, true);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

...

> +static int sb800_asf_add_adap(struct pci_dev *dev)
> +{
> +	struct i2c_piix4_adapdata *adapdata;
> +	struct resource_entry *rentry;
> +	struct sb800_asf_data data;

> +	struct list_head res_list;

Why not LIST_HEAD(); as it was in the previous version?

> +	struct acpi_device *adev;
> +	acpi_status status;
> +	acpi_handle handle;
> +	int ret;

> +	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> +	adev = acpi_fetch_acpi_dev(handle);
> +	if (!adev)
> +		return -ENODEV;

This approach I don't like. I would like to see DSDT for that
as I mentioned above.

> +	INIT_LIST_HEAD(&res_list);

See above.

> +	ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
> +	if (ret < 0) {

> +		dev_err(&dev->dev, "Error getting ASF ACPI resource: %d\n", ret);
> +		return ret;

		return dev_err_probe(...);

> +	}
> +
> +	list_for_each_entry(rentry, &res_list, node) {
> +		switch (resource_type(rentry->res)) {
> +		case IORESOURCE_IO:
> +			data.addr = rentry->res->start;
> +			break;
> +		case IORESOURCE_IRQ:
> +			data.irq = rentry->res->start;
> +			break;
> +		default:
> +			dev_warn(&adev->dev, "Invalid ASF resource\n");
> +			break;
> +		}
> +	}
> +
> +	acpi_dev_free_resource_list(&res_list);
> +	ret = piix4_add_adapter(dev, data.addr, SMBUS_ASF, piix4_adapter_count, false, 0,
> +				piix4_main_port_names_sb800[piix4_adapter_count],
> +				&piix4_main_adapters[piix4_adapter_count]);
> +	if (ret) {
> +		dev_err(&dev->dev, "Failed to add ASF adapter: %d\n", ret);
> +		return -ENODEV;

		return dev_err_probe(...);

> +	}
> +
> +	adapdata = i2c_get_adapdata(piix4_main_adapters[piix4_adapter_count]);
> +	ret = devm_request_irq(&dev->dev, data.irq, sb800_asf_irq_handler, IRQF_SHARED,
> +			       "sb800_smbus_asf", adapdata);
> +	if (ret) {
> +		dev_err(&dev->dev, "Unable to request irq: %d for use\n", data.irq);
> +		return ret;

		return dev_err_probe(...);

> +	}
> +
> +	INIT_DELAYED_WORK(&adapdata->work_buf, sb800_asf_process_slave);
> +	adapdata->is_asf = true;
> +	/* Increment the adapter count by 1 as ASF is added to the list */
> +	piix4_adapter_count++;
> +	return 1;
> +}

-- 
With Best Regards,
Andy Shevchenko



