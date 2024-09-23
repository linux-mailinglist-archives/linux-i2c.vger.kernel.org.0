Return-Path: <linux-i2c+bounces-6942-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 217A5983915
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 23:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 511A41C2199B
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 21:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF3A84A3F;
	Mon, 23 Sep 2024 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2g9hHH9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F181F80BFC
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 21:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727126694; cv=none; b=LnMsS1YhsxGJr6VSUnq4sVH3haYKsfRurQSaiK+boQ2eNiaLt641TCeG3itpc2Lx8D57IiEU0qZS5AeLwayt2pAz6rGCoxL9tUsUiyJGh4cKeD+R95h2BM/1KPbMj//7oMHp1BH0aXKik6ep+SuwuCwssK7p4On1AaVdAw++23s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727126694; c=relaxed/simple;
	bh=Ugx6A9porp5stoRwsdSCS3IeV/g0ImamG6C0qQYYwlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yj1jIJDif+tPW6GDkQQz6kto5yMlfN5PePYgdqbCbUn14Jm0C+AA+z9IFCrQ+O1sH6nrRiYpIFd0nz4elL/8ZPAEWe13KIK1FmivI+0fH/v8xuF19N3QIodOM2U95WhWry/tmH1z5ipGaKQcUxkwjB5lSQ/bzKWl6WV6rlIuvAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2g9hHH9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0186C4CEC4;
	Mon, 23 Sep 2024 21:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727126693;
	bh=Ugx6A9porp5stoRwsdSCS3IeV/g0ImamG6C0qQYYwlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2g9hHH9MN/ELIbUaeir+uaS0cvuY9Y7x3xNUDzqyXG/qyXq2tnhHmsnP7WVn/lj3
	 uhN3443L7AUWpXmztbUP+na7xgLb1Y6RyiDhyKF+B//T7XihVzmwk5oQkQJJg5pb/K
	 b6G/eBuIVAhYVD+YXXXzhmTy96mxMfOpY0PjD0zhkpGzUJhLEKS+dLltgXpLDbYG+h
	 zHH5PYxf6Kc6eRx5QHf4BA/xUoJ4O7/R5CVzc/JXZmSHnyM23RPrpJrbaSupDcnW12
	 WtbvfeDWpmnAvApL01qAum4VHurEHz7xEahfw+D/hmpeKqNstZqhBBAEJ/immB6Tus
	 n81AfdyUsUzgw==
Date: Mon, 23 Sep 2024 23:24:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, Sanket.Goswami@amd.com, 
	Patil.Reddy@amd.com
Subject: Re: [PATCH v7 4/8] i2c: amd-asf: Add ACPI support for AMD ASF
 Controller
Message-ID: <neuhnpyunepaui5cbywmaokb6mkg4oo2ae3337mmj5pgbevld4@nnibemboiv6t>
References: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
 <20240923080401.2167310-5-Shyam-sundar.S-k@amd.com>
 <ZvEqZF7Ijn7XUAQL@smile.fi.intel.com>
 <8b175ba3-ceec-4ced-a1e0-620fb800752b@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b175ba3-ceec-4ced-a1e0-620fb800752b@amd.com>

Hi Shyam,

On Mon, Sep 23, 2024 at 02:31:46PM GMT, Shyam Sundar S K wrote:
> On 9/23/2024 14:14, Andy Shevchenko wrote:
> > On Mon, Sep 23, 2024 at 01:33:57PM +0530, Shyam Sundar S K wrote:
> >> The AMD ASF controller is presented to the operating system as an ACPI
> >> device. The AMD ASF driver can use ACPI to obtain information about the
> >> ASF controller's attributes, such as the ASF address space and interrupt
> >> number, and to handle ASF interrupts.
> >>
> >> Currently, the piix4 driver assumes that a specific port address is
> >> designated for AUX operations. However, with the introduction of ASF, the
> >> same port address may also be used by the ASF controller. Therefore, a
> >> check needs to be added to ensure that if ASF is advertised and enabled in
> >> ACPI, the AUX port should not be configured.
> > 
> > ...
> > 
> >> +static int amd_asf_probe(struct platform_device *pdev)
> >> +{
> >> +	struct device *dev = &pdev->dev;
> >> +	struct amd_asf_dev *asf_dev;
> >> +
> >> +	asf_dev = devm_kzalloc(dev, sizeof(*asf_dev), GFP_KERNEL);
> >> +	if (!asf_dev)
> >> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate memory\n");
> >> +
> >> +	asf_dev->mmio_cfg.use_mmio = true;
> >> +	asf_dev->port_addr = platform_get_resource(pdev, IORESOURCE_IO, 0);
> >> +	if (!asf_dev->port_addr)
> >> +		return dev_err_probe(dev, -EINVAL, "missing IO resources\n");
> >> +
> >> +	asf_dev->adap.owner = THIS_MODULE;
> > 
> >> +	asf_dev->adap.dev.parent = &pdev->dev;
> > 
> > Now can also be
> > 
> > 	asf_dev->adap.dev.parent = dev;
> > 
> > (no need to resend for this only thing, perhaps Andi can amend whilst applying).
> > 
> 
> OK. Thank you for all the valuable feedback and time in reviewing this
> series.
> 
> Hi Andi,
> 
> Please let me if the series needs a respin if the amend fails for you.

for this change you don't need to respin everything.

I haven't been much around my computer lately, but I will check
all your patches once again and then merge them.

Thank you,
Andi

