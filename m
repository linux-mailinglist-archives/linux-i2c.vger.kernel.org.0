Return-Path: <linux-i2c+bounces-12003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A534B0ED70
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 10:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF731893886
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 08:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431A8280335;
	Wed, 23 Jul 2025 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jx7G0ZLc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A8727FB1F;
	Wed, 23 Jul 2025 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259965; cv=none; b=u7LGnjBm+nEu7xlIWeUW5oG3VdMoYY0D0ba40wG0j03+JNFcmfmET4OaRnp5byt7ztqI2vh7AyAuireegXiM267ro4IOkYPR/3xXoaepUC5n4YSXF5rsE9isGiNYMuj4D3dr/gbNszmAOJ3ZTgh7hRs6T0XM16yxkGKHLOUjtGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259965; c=relaxed/simple;
	bh=40/39jNWpR02zi+1YCzS0Yt7kRfWfNcrgO/p13pf4oQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aRNx+De7s5/eh1B1yBqxApoecZF05hOYIZDQGqmHnDDYshelNVQfqVi3a558Cfn9AONn5umwjVu7iPBk9d9Z2jwp8b/VY4hK0KB494OjjI4Ji8EYYkeQcz/lkNo7pEQk5GQnsSEBgBNzmoGAWk4fbjHm7cPKD0arXqbD4tGwt/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jx7G0ZLc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0EDC4CEE7;
	Wed, 23 Jul 2025 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753259964;
	bh=40/39jNWpR02zi+1YCzS0Yt7kRfWfNcrgO/p13pf4oQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jx7G0ZLcQgFNF3ID5+WoRfdJ0/VnqdgixU/vOpXWSzkDr38afhwveEi50Wk/V7rzB
	 G0zYV/kzhZvALf2nCNkagjKmk7uCJKcGBP/SvFQYFtelQORT/JqBz8wkBzp6TOdtDX
	 0eJ9QFaouvAU7gIQxPxaZAo0QwaFD0WhaG4doWSMnnWHBFov1JtWHCopKZUI9XVvTh
	 lCzqAoYty74Q8N8StWcgqy/geXz/uyUQSxcJ75Wj7Iw0Z01dcITZnEjotZ+h1hGMlx
	 QUS+C+3ojwVVeAWIkVnkyYlNwKqkE68pfnIC1EExylfsEqVOaQvAznfgb3f1LDQFXe
	 Zk3ca9zWN9eBw==
From: Lee Jones <lee@kernel.org>
To: linux@armlinux.org.uk, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com, 
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
 andi.shyti@kernel.org, lee@kernel.org, broonie@kernel.org, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-serial@vger.kernel.org, o.rempel@pengutronix.de, 
 daniel.machon@microchip.com, Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
In-Reply-To: <20250702183856.1727275-5-robert.marko@sartura.hr>
References: <20250702183856.1727275-5-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v8 04/10] mfd: at91-usart: Make it selectable
 for ARCH_MICROCHIP
Message-Id: <175325995961.1695705.8338983998485530536.b4-ty@kernel.org>
Date: Wed, 23 Jul 2025 09:39:19 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Wed, 02 Jul 2025 20:36:02 +0200, Robert Marko wrote:
> LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
> avoid needing to update depends in future if other Microchip SoC-s use it
> as well.
> 
> 

Applied, thanks!

[04/10] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
        commit: ef37a1e2485724f5287db1584d8aba48e8ba3f41

--
Lee Jones [李琼斯]


