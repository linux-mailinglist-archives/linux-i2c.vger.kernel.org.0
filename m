Return-Path: <linux-i2c+bounces-12025-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8FDB1075C
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 12:04:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 555445A39F5
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jul 2025 10:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BF425E80B;
	Thu, 24 Jul 2025 10:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqEpHWvh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE06D24E01D;
	Thu, 24 Jul 2025 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351490; cv=none; b=nzChat/Qd7T8yZkGejPfxEptJ507ECpiU7ld30ijRRwbHeJEmpmOHfwO1PoyiI03JpYoAq+3yrBPxoXTTxzkGMSKB1kqO/R0xkRUeyg0EGRGyDwihzvXBrDbMFKwJQJo7a7kXPVG4X8vFRQ/xh4tcAm1vZzYwe69L2NEjBpdtMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351490; c=relaxed/simple;
	bh=dB0n0iSlVZ5AKtNK8uk2suHWKAUZYtSH8+sIis6kxPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ki79qSLNVqYxMoDnNd4KdJo5g5CuxHBq+76ROLJ0KLfB1dIeVDkC4Lml50vJTTBwE36BzbhBigxH32bFCkmRcHjfw73hnt7/yxj0Oydr1NiWvkooRbqdDA2+uPuTZBTVYz0AkpHQYAWtd9db3PUuwxf5XBWUMZfKoMO12ffpfmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqEpHWvh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2773C4CEED;
	Thu, 24 Jul 2025 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753351489;
	bh=dB0n0iSlVZ5AKtNK8uk2suHWKAUZYtSH8+sIis6kxPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqEpHWvhKPb5HP5ZjhOtxwslFq30VBcABOjHySAM/pVyUJ6thjQEXU1bWF14+ivH/
	 rpo8sPAh7IlUvFevGMUhHewRr+36+ym1469hC2nAHX5k0vsosJt4TQSkU4bSkqhBRq
	 RzmOLP03dBsVP7RO9ORiRrFwJxYWATBmqfASFK2aATfDnZAacb5cEBNy+GM/DYP1uD
	 lw7iL2I9kaLr9cem28LJnw5R3MnT87C1pMyGpIdFBs9pvyxKZUEG9YJnlXUs+1YIPy
	 v24o66zSZ6ok7ZfMp+6OKc9NCE29+3eF6CdH6HUW1xHy/EL6pdLIhKIx5KtsjQcysC
	 3WqIDbQWfoTLA==
Date: Thu, 24 Jul 2025 11:04:42 +0100
From: Lee Jones <lee@kernel.org>
To: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, o.rempel@pengutronix.de,
	daniel.machon@microchip.com, Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
Subject: Re: (subset) [PATCH v8 04/10] mfd: at91-usart: Make it selectable
 for ARCH_MICROCHIP
Message-ID: <20250724100442.GX11056@google.com>
References: <20250702183856.1727275-5-robert.marko@sartura.hr>
 <175325995961.1695705.8338983998485530536.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175325995961.1695705.8338983998485530536.b4-ty@kernel.org>

On Wed, 23 Jul 2025, Lee Jones wrote:

> On Wed, 02 Jul 2025 20:36:02 +0200, Robert Marko wrote:
> > LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
> > avoid needing to update depends in future if other Microchip SoC-s use it
> > as well.
> > 
> > 
> 
> Applied, thanks!
> 
> [04/10] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
>         commit: ef37a1e2485724f5287db1584d8aba48e8ba3f41

Reverted as it caused issues in -next.

https://lore.kernel.org/all/20250724115409.030d0d08@canb.auug.org.au/

-- 
Lee Jones [李琼斯]

