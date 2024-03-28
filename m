Return-Path: <linux-i2c+bounces-2646-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C32E88FAC9
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 10:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AC411C2C118
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Mar 2024 09:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6055F865;
	Thu, 28 Mar 2024 09:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFLlSdaF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405BF3C0B;
	Thu, 28 Mar 2024 09:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711617001; cv=none; b=lbtHWiyLLQa+F4ct5N0vjDYAYFDUsEi0qArHcVoy6YrRKDzIWbId3BF37ZOIz4mUsYfEHue9VLXraYep4Rt5eGVb5TDQOnz6zJuHphr8zFrR5SwPZ5NF4LTKwgLjHhzaaABA1WgRbOJ4DP8rei/Z1HA2NDHCK3oFSFEUP0ct8Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711617001; c=relaxed/simple;
	bh=buN5Ppu9AGNZtC/if8g17RcZZEQzgqGlib2VdnuWvYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llnRjhtlzYMgw9mR22yVZWJIz/eVD+RxtsnbndqRTfr3ths1g80V92Jk4Q8QoNii8e04StK1eEeITfG9bqzhHNWT0IuIOuEcQkyiO9DAVl0CsPwTshgg2Jt2KQpz13Qofgek37N2gpByTQ4i8U2jZCDoUlAISgbzeGst2QfCGj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFLlSdaF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAA8C433F1;
	Thu, 28 Mar 2024 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711617000;
	bh=buN5Ppu9AGNZtC/if8g17RcZZEQzgqGlib2VdnuWvYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OFLlSdaFgLJfwlccYTUQ07QIz60FOyuC8o6pcVV92LZbtE4gq7IAodXVpi6MWqQKD
	 /P4Fl8Qvp5yVtqoZgDTztgedrMv69WkJQHT0+Txctf1PpT/Xt7GN34m4JFuIr7B2Ob
	 ZenIk9jv0ixo23yCmoRslgOW7owKOyIYOaTT9eixAfQmT/MLYqxgdsDEciF2ow33fx
	 8Bp/LnCK2rxFLnCW0HllcXCOe0nR3LyIMLLjxk5pVqhide4zeg+ntfoRA3RYM/BQBD
	 2/XHLh2NMuIq7tdO8199Pn4n+qV0Z9Lu1bznDyMzbl74t5Y9igoKy2SgIRxUTfCqJ8
	 VO6OdnuV01Mcg==
Date: Thu, 28 Mar 2024 10:09:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>, 
	Alex Williamson <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-input@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 01/19] amba: store owner from modules with
 amba_driver_register()
Message-ID: <bm7xoej6ihtzw63mhocvkkb7j5no2wnhztwrvvlogmuxjycviv@7frc2s3dsi5h>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <20240326-module-owner-amba-v1-1-4517b091385b@linaro.org>
 <6p4cdmbhrezm7fqbe3kgrkblqgrhaq4fgiw5x4n5dnptii7kjp@vmbj2pkjglp7>
 <c33833ad-9102-40e6-97bf-9a4e1bf0a3d9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c33833ad-9102-40e6-97bf-9a4e1bf0a3d9@linaro.org>

Hi Krzysztof,

> >>  /**
> >> - *	amba_driver_register - register an AMBA device driver
> >> + *	__amba_driver_register - register an AMBA device driver
> >>   *	@drv: amba device driver structure
> >> + *	@owner: owning module/driver
> >>   *
> >>   *	Register an AMBA device driver with the Linux device model
> >>   *	core.  If devices pre-exist, the drivers probe function will
> >>   *	be called.
> >>   */
> >> -int amba_driver_register(struct amba_driver *drv)
> >> +int __amba_driver_register(struct amba_driver *drv,
> > 
> > ...
> > 
> >> +/*
> >> + * use a macro to avoid include chaining to get THIS_MODULE
> >> + */
> > 
> > Should the documentation be moved here? Well... I don't see any
> > documentation linking this file yet, but in case it comes we want
> > documented amba_driver_register() rather than
> > __amba_driver_register().
> > 
> 
> That's just a wrapper, not API... why would we care to have kerneldoc
> for it?

Because everyone should use the wrapper while the real function
will be used only once or twice.

I see also that this is a common practice which I don't surely
like.

In any case there is no documentation exported for AMBA so that
this discussion does not bring any tangible benefit.

So that, considering that it's a good improvement,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi

