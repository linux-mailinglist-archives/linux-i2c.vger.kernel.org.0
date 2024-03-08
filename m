Return-Path: <linux-i2c+bounces-2278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FC5875FF6
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 09:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7EB1F24087
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 08:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C323354BFC;
	Fri,  8 Mar 2024 08:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="fgerG7Kw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E932520B35;
	Fri,  8 Mar 2024 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709887422; cv=none; b=h2d9+Ok6VdVumv8oqcLxsWS0bJaTOg4wyCuKyAHYk4E5/wg+/s+80YAdHrLg7XSAmJWhqQkcvVzDbSNu6r7M2Q46WHVjCyXqpsm51e9zO1Pz129H66r4MyC0kPD83gFmB1mwon49WGgSwVs59gHEgI0ByjFWpCzfmt919aSdhNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709887422; c=relaxed/simple;
	bh=aq/DY06lWHUt/eFJo+xen0fLGamPz9fKyECMARilshg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTigA6M4Bv+mut8vtZDkW/9d/uFsH4ViVgKJjupKp5BCFd55P7a3/OzXJW4Gi1VcA0VuzNtPppUZcx1i3v4yiomr16QTH+xcBCRQVd2ab7DiPl5I+zAcTfLWJwHQO8NAwT+1YOkHXjAT79Dl/LjZe+xIT4KJPsWRl0dVzgW9RfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=fgerG7Kw; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 134EF6042D;
	Fri,  8 Mar 2024 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709887419;
	bh=aq/DY06lWHUt/eFJo+xen0fLGamPz9fKyECMARilshg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fgerG7KwfJefNMJNLfcraXoH3qDf0WBpWM/+wFaNdiZvPvVAVU29lsiqjPLfSExw0
	 RfCfw6TWN4Svcb2zWCctQVs2I2hHQvStXzfEJMR8uq78nrHZnWsnVjfbJTToOz8AGy
	 FOezl7jYUUTOs5w80Ph3aryTRe9U4IJsM6Ylv0eYhfVOpKex0N1baXsiPzChY7hWBb
	 BL6IyTmAy1lUVVMYiBIS8EGRE5Q8tsoomQj/zY5pL3E+41HIYAU/BitF3RzYwYYhiJ
	 a6BkG1psPAAYXbZQnlbTk4/lBjhtOp/k4X+3y5Qwrenq/ZPDE0TdkyZdgevSjaNDz4
	 WVFRVdPEAWCLA==
Date: Fri, 8 Mar 2024 10:42:40 +0200
From: Tony Lindgren <tony@atomide.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Vinod Koul <vkoul@kernel.org>,
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
Subject: Re: [PATCH v4 03/18] i2c: omap: wakeup the controller during
 suspend() callback
Message-ID: <20240308084240.GK52537@atomide.com>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-3-6f1f53390c85@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v4-3-6f1f53390c85@bootlin.com>

* Thomas Richard <thomas.richard@bootlin.com> [240304 15:36]:
> A device may need the controller up during suspend_noirq() or
> resume_noirq().
> But if the controller is autosuspended, there is no way to wakeup it during
> suspend_noirq() or resume_noirq() because runtime pm is disabled at this
> time.
> 
> The suspend() callback wakes up the controller, so it is available until
> its suspend_noirq() callback (pm_runtime_force_suspend()).
> During the resume, it's restored by resume_noirq() callback
> (pm_runtime_force_resume()). Then resume() callback enables autosuspend.

Reviewed-by: Tony Lindgren <tony@atomide.com>

