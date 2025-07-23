Return-Path: <linux-i2c+bounces-12008-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16A8B0F24C
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 14:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C968583CF2
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 12:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C0E2E7BC4;
	Wed, 23 Jul 2025 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDKXNKuS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D082E6126;
	Wed, 23 Jul 2025 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753273786; cv=none; b=Osw5x5p+4APDDu4D3U2r+/CPosy5Yx+tahfGqkt5eRuoGPgyieZFIFKJjwAZGfzHJIeFsBaogR5hdM3XP0sIP7i3wIwU2wj2tAp5X8OzhirfBugZGRl//WUvqWhzSdIcz7I1p1elJtM4AXzce5YS60tn+PO3pp2TdB2vFoXxL34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753273786; c=relaxed/simple;
	bh=a4fvJoudeLBpuYC8iOBx3Lt7u9y0axaehN+8SLluXMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QXShBuD/t6pFaaLW7VJH4/hmQqqtjlFqRQT+nw03u0xX7flcZ4qwWwtiv6qjYTa02GtflrMGZOh8MnwnYTDbHWbcG9lYTHp39VXfZEohg2RE+zcqYcsllN5qKnvW8z/+5ZpKdBV0yESU/fF4rhouYJx1ymyRnFvymyGxLsvliog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDKXNKuS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38281C4CEF5;
	Wed, 23 Jul 2025 12:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753273785;
	bh=a4fvJoudeLBpuYC8iOBx3Lt7u9y0axaehN+8SLluXMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BDKXNKuSudGsrwbCFls9lMNbGe3HBVy+R7d3MLycJRWLcWzEYfLnDvyNU4MU3RsPF
	 u+7zPxhRMfOwKd3kfj0WAxcE/L83lYJdVGnlC0Wjd8Xo36b4655zobf8MnN2FVrGRU
	 y+QPZkGGY4QhCmFw+kXE8EdlZiejwd9llsKKPYujKHcc2IF1v8+2TFMtjgLDvAXCIX
	 ydcw72rxfEv/KkLLbGN3Usc8tvgaCOikFKvx+2UZgHJ1MNlAg1QdLDqyDezPrJDsKy
	 hj/Lzvj7apcBLQiy3IxV9yvl+IQMHp0QwDyOWbuPYNPgDC8CVglq+jim+tneF415cw
	 oSWGV//JX1m+A==
From: Vinod Koul <vkoul@kernel.org>
To: linux@armlinux.org.uk, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com, 
 herbert@gondor.apana.org.au, davem@davemloft.net, andi.shyti@kernel.org, 
 lee@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, arnd@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
 o.rempel@pengutronix.de, daniel.machon@microchip.com, 
 Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v8 00/10] arm64: lan969x: Add support for
 Microchip LAN969x SoC
Message-Id: <175327377884.189941.15214972441246653208.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 17:59:38 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 02 Jul 2025 20:35:58 +0200, Robert Marko wrote:
> This patch series adds basic support for Microchip LAN969x SoC.
> 
> It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
> which allows to avoid the need to change dependencies of the drivers that
> are shared for Microchip SoC-s in the future.
> 
> DTS and further driver will be added in follow-up series.
> 
> [...]

Applied, thanks!

[08/10] dma: xdmac: make it selectable for ARCH_MICROCHIP
        commit: e56982021f5303b2523ac247e3c79b063459d012

Best regards,
-- 
~Vinod



