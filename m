Return-Path: <linux-i2c+bounces-11636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662ACAEB1C9
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65FF53AF6D5
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 08:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601352737F1;
	Fri, 27 Jun 2025 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTCeoC9A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE96272E71;
	Fri, 27 Jun 2025 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751014620; cv=none; b=YT1yBJNlvYr+2cgZcrIL9Wr0LHgKmHJ3rVLNOXyhseLK4qrXF0K38rlORi6NtzCakGWxZjod8HSd+CZCs4sfTfyGYJzZPsBKt2IgUtGWdFeoQfUssrjYhZTSKQwtQBxeTbK9OKj41YBrgD8nUEjt0ykVXtsYxjck6KdUYP1K1L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751014620; c=relaxed/simple;
	bh=pA4wEdMhzhMjD2JQqiDWCLEuHRKldKMncnSAa8oDMek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsx3FkFpcgUKjCzUSeFJa6dph8YQyvaNYeT3LyIcKgxVSgicXf0lKhXCmYHPR37ax7b2VbjyByK322GoI80CsS2TS2bIi1wSimODt7TVZl3p9R+9dPNCmdhr/bml3lFMfmaLNlWUUwxF8XhK8F9kdbWV4fCVvaI+7Yyre7kLyRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTCeoC9A; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751014619; x=1782550619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pA4wEdMhzhMjD2JQqiDWCLEuHRKldKMncnSAa8oDMek=;
  b=BTCeoC9AA0aTSncYB9Tb0ezPYP3VGtcn0ezbnVr5lv6e7xSVzPsTMz3G
   B0v8j+nqbBtrDfy7raWUAT5WJlHOi5CjDiIgzg88ZZ7mLjfPHJS5GCNDX
   DurOUL08vcFWvvrvNPoBd5Ol6xXWjVWxeaIuPBD73b4kPWsf1pOxuFmrJ
   zJ/KVL2TXJTuvMyhWVeAoKwRvmXbbGw7ngtzbJw+kZfnX/oKmUvevwOxD
   pUlSCEOpIoEXFwAUUkYuQ4kiJHOWM1QZfJDaI19ML8ei8Vg8/lcXueKZg
   Tkq0dsySyWdjwHhXCW0Lome/NUAO6s1b1Rcv3rOIEJHtp/O7nqVGqBKTp
   A==;
X-CSE-ConnectionGUID: R7PXNu6LS223BOXCeyBLtA==
X-CSE-MsgGUID: E6tJeZR2Qd2EucXDAxSPnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="40944474"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="40944474"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 01:56:58 -0700
X-CSE-ConnectionGUID: r6ozipmBRMi+gfnWVHw4ug==
X-CSE-MsgGUID: xrsX3PpvQ4qbui3ltnduZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="176431920"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa002.fm.intel.com with SMTP; 27 Jun 2025 01:56:52 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 27 Jun 2025 11:56:51 +0300
Date: Fri, 27 Jun 2025 11:56:51 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] drm/xe: Support for I2C attached MCUs
Message-ID: <aF5c02pfI_3FirXD@kuha.fi.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
 <20250626135610.299943-3-heikki.krogerus@linux.intel.com>
 <aF1XTr2y1EmkRT_8@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF1XTr2y1EmkRT_8@smile.fi.intel.com>

Thanks for the review Andy.

On Thu, Jun 26, 2025 at 05:21:02PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 26, 2025 at 04:56:07PM +0300, Heikki Krogerus wrote:
> > Adding adaption/glue layer where the I2C host adapter
> > (Synopsys DesignWare I2C adapter) and the I2C clients (the
> > microcontroller units) are enumerated.
> > 
> > The microcontroller units (MCU) that are attached to the GPU
> > depend on the OEM. The initially supported MCU will be the
> > Add-In Management Controller (AMC).
> 
> ...
> 
> > +static int xe_i2c_register_adapter(struct xe_i2c *i2c)
> > +{
> > +	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
> > +	struct platform_device *pdev;
> > +	struct fwnode_handle *fwnode;
> > +	int ret;
> > +
> > +	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
> > +	if (!fwnode)
> > +		return -ENOMEM;
> > +
> > +	/*
> > +	 * Not using platform_device_register_full() here because we don't have
> > +	 * a handle to the platform_device before it returns. xe_i2c_notifier()
> > +	 * uses that handle, but it may be called before
> > +	 * platform_device_register_full() is done.
> > +	 */
> > +	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
> > +	if (!pdev) {
> > +		ret = -ENOMEM;
> > +		goto err_fwnode_remove;
> > +	}
> > +
> > +	if (i2c->adapter_irq) {
> 
> > +		struct resource	res = { };
> > +
> > +		res.start = i2c->adapter_irq;
> > +		res.name = "xe_i2c";
> > +		res.flags = IORESOURCE_IRQ;
> 
> 
> 		struct resource	res;
> 
> 		res = DEFINE_RES_IRQ_NAMED(i2c->adapter_irq, "xe_i2c");

I have to check what happened during the internal review round,
because I used that originally. But If there's no real reason not to
continue with it, then yes, I'll use it of course.

> > +		ret = platform_device_add_resources(pdev, &res, 1);
> > +		if (ret)
> > +			goto err_pdev_put;
> > +	}
> > +
> > +	pdev->dev.parent = i2c->drm_dev;
> > +	pdev->dev.fwnode = fwnode;
> > +	i2c->adapter_node = fwnode;
> > +	i2c->pdev = pdev;
> > +
> > +	ret = platform_device_add(pdev);
> > +	if (ret)
> > +		goto err_pdev_put;
> > +
> > +	return 0;
> > +
> > +err_pdev_put:
> > +	platform_device_put(pdev);
> > +err_fwnode_remove:
> > +	fwnode_remove_software_node(fwnode);
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> > +static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
> > +			  irq_hw_number_t hw_irq_num)
> > +{
> > +	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
> 
> Wondering if you need to setup a custom lockdep class here.
> 
> > +	return 0;
> > +}
> 
> ...
> 
> > +static void xe_i2c_remove_irq(struct xe_i2c *i2c)
> > +{
> > +	if (i2c->irqdomain) {
> 
> 	if (!i2c->irqdomain)
> 		return;
> 
> > +		irq_dispose_mapping(i2c->adapter_irq);
> > +		irq_domain_remove(i2c->irqdomain);
> > +	}
> > +}
> 
> ...
> 
> > +static void xe_i2c_remove(void *data)
> > +{
> > +	struct xe_i2c *i2c = data;
> > +	int i;
> 
> unsigned?
> 
> > +	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++)
> > +		i2c_unregister_device(i2c->client[i]);
> > +
> > +	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
> > +	xe_i2c_unregister_adapter(i2c);
> > +	xe_i2c_remove_irq(i2c);
> > +}
> 
> ...
> 
> > +int xe_i2c_probe(struct xe_device *xe)
> > +{
> > +	struct xe_i2c_endpoint ep;
> > +	struct regmap *regmap;
> > +	struct xe_i2c *i2c;
> > +	int ret;
> > +
> > +	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
> > +	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> > +		return 0;
> > +
> > +	i2c = devm_kzalloc(xe->drm.dev, sizeof(*i2c), GFP_KERNEL);
> > +	if (!i2c)
> > +		return -ENOMEM;
> > +
> > +	INIT_WORK(&i2c->work, xe_i2c_client_work);
> > +	i2c->mmio = xe_root_tile_mmio(xe);
> > +	i2c->drm_dev = xe->drm.dev;
> > +	i2c->ep = ep;
> 
> > +	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
> 
> Use of i2c->drm_dev makes harder to maintain and understand the code.
> Managed resources should be carefully attached to the correct device,
> otherwise it's inevitable object lifetime related issues.
> 
> With
> 
> 	struct device *dev = xe->drm.dev;
> 
> and using local dev, it becomes easier to get and avoid such subtle mistakes.

I have to disagree with you on this one. Local dev pointers create
problems because of the assumption that there is only a single device
in the function to deal with (especially if they are named "dev"),
which is almost never the case - this function is no exception.

But I'll add the local variable as you requested - I'll just name it
carefully.

This kinda related but off topic. IMO in cases like this the regmap
should be assigned to the child device that is being created instead
of the parent device. That is currently prevented by the current
regmap API - the device has to be fully registered before the regmap
can be assigned (and I'm not referring to the resource managed devm_*
API), but I'm not convinced that it has to be like that. The problem
is that the parent device may have multiple child devices that each
need a dedicated regmag. So just as a note to self: check if we can
improve the regmap API.

cheers,

-- 
heikki

