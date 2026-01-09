Return-Path: <linux-i2c+bounces-15012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE18D0C794
	for <lists+linux-i2c@lfdr.de>; Fri, 09 Jan 2026 23:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5A3C300ED8A
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jan 2026 22:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2B5342525;
	Fri,  9 Jan 2026 22:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="R99jXx+X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582D834252A;
	Fri,  9 Jan 2026 22:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767998518; cv=none; b=bMwcSiTm/hlIiYNzl/TgFcPBFMTKUaGiBDQBax1XCGLSNxWMml40czct9b6itml4bEez+BZTIhpnMfYSMJIzr8cp378QxKW6lvV7BE73ZJCyc3bAqCik/fE/f5L5ED8Wf6Sa1XDQwzdDU8sTq0bqrWbTlfaSffhGgSUWRoG/2Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767998518; c=relaxed/simple;
	bh=ewnmzggw4vL+JgalMlOC8ZbOj6qXYjMEUnF5IwDVCRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F96OtgcgjoToWVaoGJBQsstMOtGIZltUHV0ESerlRI6JKKCnfVmSoz3qYPtbMSPpcbP7FxhccitIMuUdTqRyuexMcAu1M9G9gv2FPyvgbx+EV4zU6Zq5WNXJIuUMT5w1JumVYfLWa4YfcBV+Fo8Mqo5RyJOZBQ5SytoAlKNI4OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=R99jXx+X; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C6D7AC1F6E8;
	Fri,  9 Jan 2026 22:41:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD93D606C6;
	Fri,  9 Jan 2026 22:41:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 216C5103C871E;
	Fri,  9 Jan 2026 23:41:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767998511; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=TIRiQ/9qPrMYe45souwMPpzx4Adluli5Fo5XiSxDj8E=;
	b=R99jXx+XP+4vPtOEEGfigxKx8uVgoC7/rDcMSFgAbHGkvdVwY4OFtNYvuzr84eG8rBp+yk
	gtBWCJV2yPWp2hOV0iRnDXU+5tIksWagEIXuvBpuNVT4x8gw6oGd7m3j8P8zotB6Hiplpn
	WAThoJfKpVeQcgeXBs1eIaAh2nIrx+SL23PUKhEtCTjviQorSDKzxBxgoVbyHPE8HAU2Ts
	x4yi7bOt+PNdTiXoy+Q5a5W9K36jGQInV53E6VfJGCENbg0C4yrZ5UYhsYzIVsfFrx9ENz
	W60h8Xbdm0Qby6kxd2GAtAXaDAVp2T2xp7FKzJTd7kvYbmDjDE5gMhLFGB775w==
Date: Fri, 9 Jan 2026 23:41:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 1/3] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Message-ID: <20260109224147267169ba@mail.local>
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-1-6fe19f460269@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-p1-kconfig-fix-v5-1-6fe19f460269@linux.spacemit.com>
X-Last-TLS-Session-Version: TLSv1.3

On 08/01/2026 16:38:54+0800, Troy Mitchell wrote:
> REGULATOR_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.
> 
> Since MFD_SPACEMIT_P1 already depends on I2C_K1, the dependency
> in REGULATOR_SPACEMIT_P1 is now redundant.
> 
> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Change log in v5:
> - nothing
> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-1-44b6728117c1@linux.spacemit.com/
> 
> Change log in v4:
> - default m if MFD_SPACEMIT_P1 instead of default MFD_SPACEMIT_P1
> Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-3-8839c5ac5db3@linux.spacemit.com/
> 
> Changelog in v3:
> - modify commit message
> - change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
> - Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-4-49688f30bae8@linux.spacemit.com/
> ---
>  drivers/regulator/Kconfig | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d2335276cce5ffbd500bbaf251d1761a9116aee9..b51888a9a78f399a6af3294fc19f60792576332c 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1496,9 +1496,8 @@ config REGULATOR_SLG51000
>  config REGULATOR_SPACEMIT_P1
>  	tristate "SpacemiT P1 regulators"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on I2C
> -	select MFD_SPACEMIT_P1
> -	default ARCH_SPACEMIT
> +	depends on MFD_SPACEMIT_P1
> +	default m if MFD_SPACEMIT_P1

default MFD_SPACEMIT_P1 is certainly enough here.


