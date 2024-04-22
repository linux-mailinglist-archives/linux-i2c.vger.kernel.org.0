Return-Path: <linux-i2c+bounces-3044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FD58AD50E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 21:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0774B2214F
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 19:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326C315535E;
	Mon, 22 Apr 2024 19:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMBO7gB5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C315534B;
	Mon, 22 Apr 2024 19:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713815066; cv=none; b=BLJDJmjz1aQPOqu9QNa1jl/doFa8CHOhbkn5j6tTOV9bB2IGv4TKtzglej6QTqVhDl6Qg3UIX7vMjqm53HmLErfUGGEwM3K+v8g99zeOe9MuezuLIFARkmfvbueG6NOOEeN9FXxyAVmePaPKQnPbgG+U+O4CUtjwW8QzC68KMtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713815066; c=relaxed/simple;
	bh=K8WN8aubdBUdpq2B/uKYg69yANymGJsXmW3941zGW1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=FpqNPGh4lS60cKG1o0KxOtSbPzII9X57pTfHsri2bQSjENadhInjyIjD+aBRSWt/XkxQ56M2NaigrhbKaWmx5Vv4U+eHh/fRc04FODHLyy4/9PKk5FNCWXsVeXceAHsAVejfs4bW7ICCxk6XHmgBtxDWxkgCI2UJrbKTFFlpYOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMBO7gB5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFF1C116B1;
	Mon, 22 Apr 2024 19:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713815065;
	bh=K8WN8aubdBUdpq2B/uKYg69yANymGJsXmW3941zGW1s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GMBO7gB5pjdjM0klxQpfKSPZbshoJO0PuGP/01h9ETcM6twO2atsJALTuh+zPMT38
	 OtIGcuxHm2VtBWIzQNCoiOMNyr6zdoObSloYFSjblqoLnbRBLQXjyFlp/OFQ+DdYNz
	 r6xb2t/OSk2DG5KCgZYH8sfUy7ppbw0o/lBI58Smy+QewkeKumlPSw6Ki3qLI/0N5b
	 26Z1hij8g8+RVqSYAYIBmo0mSuJzKVsGpo/T+n8iYgIMTk11Gw3d635aisJOwmLND7
	 xpQXKqIB1Q9fvJRrIL+yQyZKoPijFAg9rBtf8C8dCm213am27yKB2DXaIo5mkWT88r
	 8yKoVYGpWI2Ig==
Date: Mon, 22 Apr 2024 14:44:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Tony Lindgren <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Vignesh R <vigneshr@ti.com>, Peter Rosin <peda@axentia.se>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com,
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v5 02/11] i2c: omap: wakeup the controller during
 suspend() callback
Message-ID: <20240422194423.GA414623@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd5d0aa5-ca0c-47a5-8e40-4742bc939cfa@bootlin.com>

On Mon, Apr 22, 2024 at 11:40:02AM +0200, Thomas Richard wrote:
> On 4/19/24 10:47, Andi Shyti wrote:
> > Hi Thomas,
> > 
> >> +static int omap_i2c_suspend(struct device *dev)
> >> +{
> >> +	/*
> >> +	 * If the controller is autosuspended, there is no way to wakeup it once
> >> +	 * runtime pm is disabled (in suspend_late()).
> >> +	 * But a device may need the controller up during suspend_noirq() or
> >> +	 * resume_noirq().
> >> +	 * Wakeup the controller while runtime pm is enabled, so it is available
> >> +	 * until its suspend_noirq(), and from resume_noirq().
> >> +	 */
> >> +	return pm_runtime_resume_and_get(dev);
> >> +}
> >> +
> >> +static int omap_i2c_resume(struct device *dev)
> >> +{
> >> +	pm_runtime_mark_last_busy(dev);
> >> +	pm_runtime_put_autosuspend(dev);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static const struct dev_pm_ops omap_i2c_pm_ops = {
> >>  	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> >>  				      pm_runtime_force_resume)
> >> +	SET_SYSTEM_SLEEP_PM_OPS(omap_i2c_suspend, omap_i2c_resume)
> > 
> > If you don't have CONFIG_PM_SLEEP, though, this doesn't compile.
> 
> Hello Andi,
> 
> Yes indeed, the __maybe_unused attribute is missing for
> omap_i2c_suspend() and omap_i2c_resume().

Isn't there a way to avoid having to use the __maybe_unused attribute?

E.g., use DEFINE_SIMPLE_DEV_PM_OPS() as is done by these:

  82f9cefadac4 ("serial: 8250_exar: switch to DEFINE_SIMPLE_DEV_PM_OPS()")
  f243df0a0be0 ("media: platform: rzg2l-cru: rzg2l-csi2: Switch to RUNTIME_PM_OPS()")
  6ccc22a5afcb ("net: ravb: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and pm_ptr()")

Bjorn

