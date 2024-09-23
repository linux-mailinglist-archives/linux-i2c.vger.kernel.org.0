Return-Path: <linux-i2c+bounces-6934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 401CE97E7C9
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 10:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 547D81C212A9
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 08:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B82C19408D;
	Mon, 23 Sep 2024 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWLitkPF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ADB2F2D
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 08:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727081074; cv=none; b=ftdh9+r+EtHkrTPETui/3cM9QMk+B5yyZvWKWVmd8jjuWobjzoGFYu3A+y3g365jAjfrDhnVaRxM5iuxSIYpwMSCXnTjRZX8s/u1aBLE0AdmfS/nOl3L1L2V7E4m6XB/MiB4Wdkd2imm2mjfWq22MPtwnIVxOqX2Py8q4cvrjE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727081074; c=relaxed/simple;
	bh=x/17DotZUTmHZKlbaIEKKLFhuH4qdv60EH4u38PS0UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFrdQBn4H5OzXTPXVR6oEAAyWbB6oHNXCiUjI7VhkgYX/hd37zwJmw3InHhfDz+cSoDTUQ1pPVCSCUnIIMBZ2MH1jBunnotTiYvadTYnWJyMQ+3ouYH+3pkfrClihnr2pMz5QF/eFzuTHs96Gv018mFM9YiSYpDKuCsdFWVmDzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWLitkPF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727081073; x=1758617073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x/17DotZUTmHZKlbaIEKKLFhuH4qdv60EH4u38PS0UM=;
  b=EWLitkPFOcRV7VAaJD0Oq7y7Kf1BQu68HgXdrV9Om18IwhhUDlupM0yE
   ggVKY6NLrLPXmVftU2TniDGbi4q2MX0mAgAS+vDa8iJ0bGl3SKAQ6/oRq
   T7XSWHoehCx9OJIFxj85A8yJ5FYWMH6QxbAOs5QsFLOSddfWlOHUog8Jl
   ea4pfIBZvLGDbeZFnkVh8XVTjpY6Dj7f8HF2yOUZ1maFdm2kueuSm3qu+
   vulLd4FQV2MYwTMOPflFhmjv1TTHMG75wUNuyU198k+IFPFOXw1baXa8F
   sk0SlZOhcMU9DmUB3pzLmbq7hrBR6SP4ogTYejQBKk5IOfX9slo5td1ij
   w==;
X-CSE-ConnectionGUID: vTaTYbi8QgO4peaJ2kb8Kg==
X-CSE-MsgGUID: wwkhupwqQAuwDe7nEg06ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="43534501"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="43534501"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:44:25 -0700
X-CSE-ConnectionGUID: ULLx6gYXS0iFRixfuGYN7w==
X-CSE-MsgGUID: TSp17lBZSbeWP4/Yft7M8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="75944765"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:44:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sseg8-0000000Btek-3uq0;
	Mon, 23 Sep 2024 11:44:20 +0300
Date: Mon, 23 Sep 2024 11:44:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com,
	Patil.Reddy@amd.com
Subject: Re: [PATCH v7 4/8] i2c: amd-asf: Add ACPI support for AMD ASF
 Controller
Message-ID: <ZvEqZF7Ijn7XUAQL@smile.fi.intel.com>
References: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
 <20240923080401.2167310-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923080401.2167310-5-Shyam-sundar.S-k@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 23, 2024 at 01:33:57PM +0530, Shyam Sundar S K wrote:
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

> +static int amd_asf_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct amd_asf_dev *asf_dev;
> +
> +	asf_dev = devm_kzalloc(dev, sizeof(*asf_dev), GFP_KERNEL);
> +	if (!asf_dev)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate memory\n");
> +
> +	asf_dev->mmio_cfg.use_mmio = true;
> +	asf_dev->port_addr = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (!asf_dev->port_addr)
> +		return dev_err_probe(dev, -EINVAL, "missing IO resources\n");
> +
> +	asf_dev->adap.owner = THIS_MODULE;

> +	asf_dev->adap.dev.parent = &pdev->dev;

Now can also be

	asf_dev->adap.dev.parent = dev;

(no need to resend for this only thing, perhaps Andi can amend whilst applying).

> +	i2c_set_adapdata(&asf_dev->adap, asf_dev);
> +	snprintf(asf_dev->adap.name, sizeof(asf_dev->adap.name), "AMD ASF adapter");
> +
> +	return devm_i2c_add_adapter(dev, &asf_dev->adap);
> +}

-- 
With Best Regards,
Andy Shevchenko



