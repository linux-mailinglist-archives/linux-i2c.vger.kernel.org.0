Return-Path: <linux-i2c+bounces-6321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294D96F713
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 16:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A26E1C21A29
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 14:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888E41D04A0;
	Fri,  6 Sep 2024 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPUOheIa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6747156880
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725633644; cv=none; b=DdRb/9EhzD6ZfQ6xqPQpKYy5vx4GuyeQms+htnAZvaAH6tX+r6gnt7/VDvGJqvTM7Fml2oSyXv3S9StwSIjF1ObSUjYbLCo3gBZu1MYDFQR9kzF2/wx1Y7Ceup5Cc0sG5wuusPzV3EGbJ4vdA8lhLfWYNyv6xSvloeDyJMVvUUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725633644; c=relaxed/simple;
	bh=gZiyf9JawtjJas6XpfwpTMmwMtwLtHAfTSjtmbfBrT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1+3sy0cLKYEQkh3AUjo4JgBB61cP0bP4yYrLmMWBDBJKxT5ObJAS5SHZ8szIel7ePmvzan+C4RwgAiMIuHlOAJjZHR2GS5UtsbgOkwPDIrWzFqPyU1nzeApXT1xqH46dYDnYrkvs0sXNnvAvlTtARAxJXFfSpislrZEJCGwLug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPUOheIa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725633643; x=1757169643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gZiyf9JawtjJas6XpfwpTMmwMtwLtHAfTSjtmbfBrT4=;
  b=SPUOheIaNVvHYUhhq3Sgx7H6cnis6Ai1Xstc7k0LEzZNRmukOcVpaN6c
   Wy2jEj5abt/MlSsME8EWA1Vxh4HRvJPYEgyHYYb53nvrU7S3KDIN7Ndk7
   Rjf02kI0o5JwnTx2/wmFsmH42Z37srRh3tlIUso9H/PZKILc6RUivsfz+
   Hf84hePWk1H4Bzo539IQ7z6+WePYZaqkWU178s3MnrYEQPsDvVfcXwMHv
   KpPRB2wCTEynl1OcbX4ywgu8PK6kblI5+67KeR3J388Zbay1o0UkKGRNV
   b80UqxcJa8eoaQXc01Jq/KAGjZwGtWhLPPYqKv5+zMftpFV7x9tPr7kkJ
   A==;
X-CSE-ConnectionGUID: HKrMENFcTtKd+6xA5xYERw==
X-CSE-MsgGUID: ZKVDGCPtQ+ywGOgdZxjGvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24267137"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="24267137"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 07:40:42 -0700
X-CSE-ConnectionGUID: ai8H05GuS66XZ+RTdtfLOQ==
X-CSE-MsgGUID: Y++zb77XSN2jzOHbDPGWrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="70765998"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 07:40:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sma8b-00000005pbs-2NUy;
	Fri, 06 Sep 2024 17:40:37 +0300
Date: Fri, 6 Sep 2024 17:40:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com
Subject: Re: [PATCH v3 3/5] i2c: piix4: Add ACPI support for ASF SMBus device
Message-ID: <ZtsUZfxeE8Tqf1OD@smile.fi.intel.com>
References: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
 <20240906071201.2254354-4-Shyam-sundar.S-k@amd.com>
 <Ztr0alsDWrBodtyv@smile.fi.intel.com>
 <cdc294e7-a78d-4a3e-a2fd-2122a8ea9660@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdc294e7-a78d-4a3e-a2fd-2122a8ea9660@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 06, 2024 at 06:50:48PM +0530, Shyam Sundar S K wrote:
> On 9/6/2024 17:54, Andy Shevchenko wrote:
> > On Fri, Sep 06, 2024 at 12:41:59PM +0530, Shyam Sundar S K wrote:

First of all, you haven't replied to some of my comments, I assume that you
agree on them and are going to fix as suggested?

...

> >> The AMD ASF controller is presented to the operating system as an ACPI
> >> device. The piix4 driver can obtain the ASF handle through ACPI to
> >> retrieve information about the ASF controller's attributes, such as the
> >> ASF address space and interrupt number, and to handle ASF interrupts.
> > 
> > Can you share an excerpt of DSDT to see how it looks like?
> 
> Device (ASFC)
> {
> 	...

Can you put the necessary bits for the enumeration (you may replace some IDs if
they are not public yet to something like XX..XX or xx..xx)?

>     Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>     {
>         Name (ASBB, ResourceTemplate ()
>         {
>             Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
>             {
>                 0x00000014,
>             }
>             IO (Decode16,
>                 0x0B20,             // Range Minimum
>                 0x0B20,             // Range Maximum

Typo in value? Shouldn't this be 0x0b3f?

>                 0x00,               // Alignment
>                 0x20,               // Length
>                 )
>             Memory32Fixed (ReadWrite,
>                 0xFEC00040,         // Address Base
>                 0x00000100,         // Address Length
>                 )
>         })
>         Return (ASBB) /* \_SB_.ASFC._CRS.ASBB */
>     }
> 	...
> }

...

> >> Additionally, include a 'depends on X86' Kconfig entry for
> >> CONFIG_I2C_PIIX4, as the current patch utilizes acpi_dev_get_resources(),
> >> which is compiled only when CONFIG_ACPI is enabled, and CONFIG_ACPI
> >> depends on CONFIG_X86.
> > 
> > Yeah, please don't do that. If it requires ACPI, make it clear, there is
> > no x86 compile-time dependency.
> 
> You mean to say make the dependencies as:
> 
> depends on PCI && HAS_IOPORT && ACPI
> 
> instead of:
> 
> depends on PCI && HAS_IOPORT && X86

Yes, but see below as well about the stubs

~~~vvv
> > Second issue with this is that now you require entire ACPI machinery for
> > the previous cases where it wasn't needed. Imagine an embedded system with
> > limited amount of memory for which you require +1Mbyte just for nothing.
> > 
> > Look how the other do (hint: ifdeffery in the code with stubs).

___^^^

...

> >> +	u8 bank, reg, cmd = 0;
> > 
> > Move cmd assignment into the respective branch of the conditional below, in
> > that case it will be closer and more symmetrical.
> 
> meaning, make the cmd assignment only in the if() case.

Yes.

> Not sure if I understand your remark completely.

	if (...) {
		cmd = 0;
	} else {
		cmd = ...
	}

...

> >> +	if (slave_int & BIT(6)) {
> >> +		/* Slave Interrupt */
> >> +		outb_p(slave_int | BIT(6), ASFSTA);
> >> +		schedule_delayed_work(&adapdata->work_buf, HZ);
> >> +	} else {
> >> +		/* Master Interrupt */
> > 
> > Please, start using inclusive non-offensive terms instead of old 'master/slave'
> > terminology. Nowadays it's a part of the standard AFAIU.
> 
> OK. I get it ( tried to retain the names as mentioned in the AMD ASF
> databook).
> 
> Which one would you advise (instead of master/slave)?

As per official I2C specification. :-)

> Primary/secondary
> Controller/Worker
> Requester/Responder

See, e.g., a93c2e5fe766 ("i2c: reword i2c_algorithm according to newest specification").

> > Note, I'm talking only about comments and messages, the APIs is another story
> > that should be addressed separately.
> > 
> >> +		sb800_asf_update_bits(piix4_smba, SB800_ASF_SLV_INTR, SMBHSTSTS, true);
> >> +	}

...

> >> +	status = acpi_get_handle(NULL, SB800_ASF_ACPI_PATH, &handle);
> >> +	if (ACPI_FAILURE(status))
> >> +		return -ENODEV;
> >> +
> >> +	adev = acpi_fetch_acpi_dev(handle);
> >> +	if (!adev)
> >> +		return -ENODEV;
> > 
> > This approach I don't like. I would like to see DSDT for that
> > as I mentioned above.
> 
> I have posted the DSDT. Can you please elaborate your remarks?

Not that parts that affect this...

...

> >> +	ret = acpi_dev_get_resources(adev, &res_list, NULL, NULL);
> >> +	if (ret < 0) {
> > 
> >> +		dev_err(&dev->dev, "Error getting ASF ACPI resource: %d\n", ret);
> >> +		return ret;
> > 
> > 		return dev_err_probe(...);
> 
> I thought dev_err_probe(...); is called only from the .probe
> functions. Is that not the case?

I assume you call this due to use of devm_*(). Either devm_*() should be
replaced to non-devm_*() analogues, or these moved to dev_err_probe().

> In the current proposed change, sb800_asf_add_adap() gets called from
> *_probe().
> 
> Or you mean to say, no need for a error print and just do a error return?

No. It's also possible, but this is up to you.

> if (ret < 0)
> 	return ret;
> 
> Likewise for below remarks on dev_err_probe(...);

-- 
With Best Regards,
Andy Shevchenko



