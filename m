Return-Path: <linux-i2c+bounces-12581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD036B420DF
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 15:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 469797B58EB
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 13:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B652FDC3D;
	Wed,  3 Sep 2025 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="Mi40bUy3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6FF2E4257;
	Wed,  3 Sep 2025 13:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756905398; cv=none; b=tTGXlf4/fgkDEDKn144ePxoxrjo4WAQjcRHw87aFliG9/ngrvwOI3W2BThmI6yLonxabVTiuDATMgu5mKvyBZ8SDcMlePAAXhmZSj9UxtpRfCrylA/LAiXk/YXAN9uYPMXRqY7IOGKGw8LYXqBJsN1Gk3MTgUdgK7u2y3DJP+wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756905398; c=relaxed/simple;
	bh=nh/Jvj+3PfiFDjRFpwIMNEZfJ4VoTazjot8RleOlFQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbjbBLawTWlEFjEt1hvXjnszJibpQKISg+76OkGxyFv8GLX477kyTwWXFFx+CgMgvd3SPSNmF3s8a3mtjWbZrEDUZw++2hKtdsNfx+xf0bA1aXlf/+WfYvQba+smGnlCceipagfZva5sgbHOm1dOdAtwVQJO3s1zNq9968z/OT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=Mi40bUy3; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4D4D1487E25;
	Wed,  3 Sep 2025 15:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1756905386; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=aHqRa8jsx4scxQoHsogOHYRV2hwQ6tQgcKa606SaBXY=;
	b=Mi40bUy3Qk6XWegkRfPM2jnv4dDk/bMr2lj8J/pF4Gri48WBAkFX2c8VfueH8QqgCf2Ng8
	j5AcfYSFfVjl6qZmg4jeiz3c6SMpf4oy8SG4v5oJmU7JXVKjlUK0bGcYIOJWNDqUGyZcms
	Sff7vKAfUKeT6nvfJzbKbjFGimAEMj1wL7WqwQ3CZM5jPi07ldAlfZilQmSE3wtlrNL8Gv
	OYP7T1CFZSdYRfuoHH7n6uRcTI+N6s7ysLFA6qazlJP/eibZT1JQi7uKBLnEPtQqfcfvvh
	qz6NHVk6ppVZmLyBYDYcwkHh/+haGNIMfW6/g/QOTfw6wH67NV3Kug8C4llwIQ==
Date: Wed, 3 Sep 2025 15:16:10 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Vinod Koul <vkoul@kernel.org>, linux@armlinux.org.uk,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, lee@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, o.rempel@pengutronix.de,
	daniel.machon@microchip.com, Robert Marko <robert.marko@sartura.hr>,
	luka.perkov@sartura.hr
Subject: Re: (subset) [PATCH v8 00/10] arm64: lan969x: Add support for
 Microchip LAN969x SoC
Message-ID: <20250903-gratify-sustained-9acc011bc3c9@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Vinod Koul <vkoul@kernel.org>, linux@armlinux.org.uk,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, lee@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, o.rempel@pengutronix.de,
	daniel.machon@microchip.com, Robert Marko <robert.marko@sartura.hr>,
	luka.perkov@sartura.hr
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <175327377884.189941.15214972441246653208.b4-ty@kernel.org>
 <bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello,

Am Thu, Jul 31, 2025 at 11:05:07AM +0300 schrieb Claudiu Beznea:
> Hi, Vinod,
> 
> On 23.07.2025 15:29, Vinod Koul wrote:
> > 
> > On Wed, 02 Jul 2025 20:35:58 +0200, Robert Marko wrote:
> >> This patch series adds basic support for Microchip LAN969x SoC.
> >>
> >> It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
> >> which allows to avoid the need to change dependencies of the drivers that
> >> are shared for Microchip SoC-s in the future.
> >>
> >> DTS and further driver will be added in follow-up series.
> >>
> >> [...]
> > 
> > Applied, thanks!
> > 
> > [08/10] dma: xdmac: make it selectable for ARCH_MICROCHIP
> >         commit: e56982021f5303b2523ac247e3c79b063459d012
> 
> As this one depends, as well, on the first 3 patches in the series (Robert,
> please correct me if I'm wrong), and there are still discussions ongoing,
> can you please drop it until all is clear on the first 3 patches?
> 
> Otherwise, applying only this patch will lead to AT91 XDMAC driver not
> being built for SAMA5{D2, D3, D4}, SAMA7{G5, D65} SoCs. Linux is not
> booting on SAMA7G5 SoC only with this patch applied.

Second that.  Just tested v6.17-rc4 on sam9x60 and DMA is not working
at all because this driver can not be selected anymore.  This must be
fixed before v6.17 release please!

Greets
Alex

