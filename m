Return-Path: <linux-i2c+bounces-1805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CF68575CC
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 07:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64F70B22B3D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 06:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58C213ADA;
	Fri, 16 Feb 2024 06:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THXyeRci"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9076063CF;
	Fri, 16 Feb 2024 06:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708063356; cv=none; b=uHIfdb6S3cpIIF2EUwzV/0AbLqdEep5MJKvsS+kGAvRU4k8l2P1QRVyvhx8IyOgcDyJlGmtJYA9gluWOYRh0ll167DxNWTvCCJyqNmpXiokUbYheHsIRK5RJ86SGgrGOwzJdNnSxa8Z1cB95VM8lJTclxL3EwMi4QV+yC0qv3LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708063356; c=relaxed/simple;
	bh=xLbg9CJsDugebWTcD0p7oHppt3/BIZOhQtv1Tcg/emU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6wnicCmN85jxHLESXiPFVzwH6c4L6/UHtE8f3T2Ne4aURJ+mxQVwMtM3ZmOl0be5I8xk2Iv5jtv69uyFqrkps8pVWH0plh8BfCt93tADp3aZuTckqRpCntDgj7fBM0rr1mhA3C4tFG8tAM/Pf5YSyoPiOZY6pj6gebFoBygLwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THXyeRci; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6DFC433C7;
	Fri, 16 Feb 2024 06:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708063356;
	bh=xLbg9CJsDugebWTcD0p7oHppt3/BIZOhQtv1Tcg/emU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THXyeRcij7KtomuLH6sUqnXn8UU7L7Hte6T9jzC5fFgVNlU3zQKtDaRdHKmQbcgAN
	 CRhnLUVsiOag7GJykwVBqAHhbNekbvdJn2iTZr3hWMoippmFXyEWEJXGt6XEtrcA5T
	 gWtVwASk5StZBaoXwTP1sDuRPOBBYT2w1d1Ubgd4rwjDtL064eHSRhxJ3A3LYwgpRF
	 AXuNnzln5/R5Frx7J9tRu5PklVyvd7GMXIXtfXEstV29hrLzwnpYCSIvBEq0KuSaSD
	 6RJEcQBJ4KPZfh8oe5/P6hxicMI/Rw5+2L17q/fcIcbmzsIbNukbmK1OaO6KrkpQsH
	 xdirAFy6zk3hw==
Date: Fri, 16 Feb 2024 11:32:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
Subject: Re: [PATCH v3 08/18] phy: ti: phy-j721e-wiz: split wiz_clock_init()
 function
Message-ID: <Zc76d4B4hjTC3xum@matsya>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-8-5c2e4a3fac1f@bootlin.com>
 <Zc4xJtLl3zo_YrBC@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zc4xJtLl3zo_YrBC@smile.fi.intel.com>

On 15-02-24, 17:43, Andy Shevchenko wrote:
> On Thu, Feb 15, 2024 at 04:17:53PM +0100, Thomas Richard wrote:
> > The wiz_clock_init() function mixes probe and hardware configuration.
> > Rename the wiz_clock_init() to wiz_clock_probe() and move the hardware
> > configuration part in a new function named wiz_clock_init().
> > 
> > This hardware configuration sequence must be called during the resume
> > stage of the driver.
> 
> ...
> 
> (Side note, as this can be done later)
> 
> >  	if (rate >= 100000000)
> 
> > +		if (rate >= 100000000)
> 
> > +	if (rate >= 100000000)
> 
> I would make local definition and use it, we may get the global one as there
> are users.
> 
> #define HZ_PER_GHZ	1000000000UL

Better to define as:
#define HZ_PER_GHZ 1 * GIGA

-- 
~Vinod

