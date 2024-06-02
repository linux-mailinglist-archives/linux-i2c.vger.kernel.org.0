Return-Path: <linux-i2c+bounces-3742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B5E8D7416
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 09:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F368E1F2159C
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2024 07:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB455208AF;
	Sun,  2 Jun 2024 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nb00oGGN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769C208A1
	for <linux-i2c@vger.kernel.org>; Sun,  2 Jun 2024 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717312744; cv=none; b=CRR0I2xTFMj6ySbBGMUZpW/iAVchqDHVElPllO/VtEvmOmEelliPTkdPfM1SAEo90v02AFzCRyjRo/OOSpXuxSOhQzNh/oBhAkcid3OhAPZjHEqdVD3pZMEIcFbt42PZmMGqQtsXLhOntukBrJvuZ3Fl5YP6NkhkZYM5LyMfacE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717312744; c=relaxed/simple;
	bh=uNEptbdLc1R/S9H51zqcGRsEkWOQZywcOSMCmMSlj58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMRJ/0/NqH3C6TsbJbLjSosBjkr95bX7Yk4QYTpC73k/+EC0p0f0NjIut+vJ3lKRdSxf6x3wfXwYmQox8/+8JPFLmZvpfty8tpIDkFo86y6lFO2G/VGTsV6BnIaoGh9/kshqpkzuoBnA49TrqKYzBRo/uMyohCjCvhe7ei0kF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nb00oGGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96588C2BBFC;
	Sun,  2 Jun 2024 07:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1717312744;
	bh=uNEptbdLc1R/S9H51zqcGRsEkWOQZywcOSMCmMSlj58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nb00oGGNC2NMmw/X2y/tfzDx9VX2rqcB9q7rSSd8wJltpZ6a3QqXucpjOxdOziEdw
	 WU4gk3o0UHfAYT6l3C/qvW4YPU7Hmx9NM6/NLghdiFEMPgL0yZfc5YADfQ6Wb9zbwC
	 vu7ebDyEvr1O/+D1rErg618wNuZviOHs61ixazSg=
Date: Sun, 2 Jun 2024 09:19:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-i2c@vger.kernel.org, andi.shyti@kernel.org, arnd@arndb.de,
	Gerhard Engleder <eg@keba.com>
Subject: Re: [PATCH 2/2] misc: keba: Add basic KEBA CP500 system FPGA support
Message-ID: <2024060203-impeding-curing-e6cd@gregkh>
References: <20240601192846.68146-1-gerhard@engleder-embedded.com>
 <20240601192846.68146-3-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601192846.68146-3-gerhard@engleder-embedded.com>

On Sat, Jun 01, 2024 at 09:28:46PM +0200, Gerhard Engleder wrote:
> From: Gerhard Engleder <eg@keba.com>
> 
> The KEBA CP500 system FPGA is a PCIe device, which consists of multiple
> IP cores. Every IP core has its own platform driver. The cp500 driver
> registers a platform device for each device and the corresponding
> drivers are loaded by the Linux driver infrastructure.

Please use the aux bus code for this, not the platform driver code.
That's what the aux bus is explicitly for, platform devices are NOT
meant to hang off of a PCIe device at all.

> Currently 3 variants of this device exists. Every variant has its own
> PCI device ID, which is used to determine the list of available IP
> cores. In this first version only the platform device for the I2C
> controller is registered.
> 
> Besides the platform device registration some other basic functions of
> the FPGA are implemented; e.g, FPGA version sysfs file, keep FPGA
> configuration on reset sysfs file, error message for errors on the
> internal AXI bus of the FPGA.
> 
> Signed-off-by: Gerhard Engleder <eg@keba.com>
> ---
>  drivers/misc/Kconfig       |   1 +
>  drivers/misc/Makefile      |   1 +
>  drivers/misc/keba/Kconfig  |  12 +
>  drivers/misc/keba/Makefile |   3 +
>  drivers/misc/keba/cp500.c  | 433 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 450 insertions(+)
>  create mode 100644 drivers/misc/keba/Kconfig
>  create mode 100644 drivers/misc/keba/Makefile
>  create mode 100644 drivers/misc/keba/cp500.c

You create sysfs files for this driver, yet there is no
Documentation/ABI/ entries for it?  Please do so in your next version of
this series.

> +static ssize_t keep_cfg_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct cp500 *cp500 = dev_get_drvdata(dev);
> +	unsigned long keep_cfg = 1;
> +
> +	/* FPGA configuration stream is kept during reset when RECONFIG bit is
> +	 * zero
> +	 */
> +	if (ioread8(cp500->system_startup_addr + CP500_RECONFIG_REG) &
> +		CP500_RECFG_REQ)
> +		keep_cfg = 0;
> +
> +	return sprintf(buf, "%lu\n", keep_cfg);

sysfs_emit() for all sysfs show functions please.

thanks,

greg k-h

