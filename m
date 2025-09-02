Return-Path: <linux-i2c+bounces-12557-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A74B3FBCB
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 12:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38E997B28CA
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 10:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259522F3C29;
	Tue,  2 Sep 2025 10:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8g6WRWj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B0D2EFDB1;
	Tue,  2 Sep 2025 10:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807381; cv=none; b=pzrL4dKyBwMtCc5rbUvwSRw2tIqRz2rVxYyWAW92XxJJBKwUMkkIs6V7dPf9VMZ11TXrDBfqqS7vHzGGAnVldqrzrL5uIf2nEHPsYvi/rNlMc44yqiEgJbFV1pEx8ibDGy1HhvcKw3iQW3T8Wwv1YHIqERvMY8R5QfzNQgo+olQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807381; c=relaxed/simple;
	bh=6GGN+vSC6nAw0rmyQPYra2aimD8RCfZCmVauB2qSJ0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxI7YOwQIyWT6OCAS+9giv9wKBWUhDJ8CXgS+Dl+IAwGe7HuqqNodrqZXEnpJQQ+apBz1iuQrv+ApxSSJ2AGVdPT4tSN+GZtazC/f/rXSoOUvvT6Vp2tN1uOQJHCzoPlkAJOH1o8s7N/jJZdA1tuwme+Yr/KGe7l2+a+WD7qOcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8g6WRWj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52EFC4CEF5;
	Tue,  2 Sep 2025 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756807381;
	bh=6GGN+vSC6nAw0rmyQPYra2aimD8RCfZCmVauB2qSJ0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O8g6WRWjnz00IdBM+0NXEGJFvekqwjMUPlmGg9KMT2A+XuL5Ng9/WXfAc8BOeqRHe
	 wGzkfrgy0RVox5f2jPjW6AvGD47VgGow9LPKn7VetMcjSQfK4iNX2zv81QHCX7/QDl
	 1Cuks4Y3lPUEwH6GDZ5NJbtfwrz60fBFVWBYmzAIjLZg91ynUig6PI0lBAnbiBauPi
	 AO3U3NKeiJmr7h53HrKOOY6BGf4/zQoQpwV3Dr8QGm05RSUbwrMFY2MAPfkkIWFMuk
	 VNOFLgMs2AWCBJNBMpNq3rKsTLL0jmottWFueh5OtiFL2HKTELwPI+MMPwAdPuSoSs
	 cl3IIs1qBlzMw==
Date: Tue, 2 Sep 2025 11:02:54 +0100
From: Lee Jones <lee@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 4/9] mfd: at91-usart: Make it selectable for
 ARCH_MICROCHIP
Message-ID: <20250902100254.GD2163762@google.com>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-5-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813174720.540015-5-robert.marko@sartura.hr>

On Wed, 13 Aug 2025, Robert Marko wrote:

> LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
> avoid needing to update depends in future if other Microchip SoC-s use it
> as well.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/mfd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 425c5fba6cb1..8f11b2df1470 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
>  config MFD_AT91_USART
>  	tristate "AT91 USART Driver"
>  	select MFD_CORE
> -	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
> +	depends on ARCH_MICROCHIP || COMPILE_TEST
>  	help
>  	  Select this to get support for AT91 USART IP. This is a wrapper
>  	  over at91-usart-serial driver and usart-spi-driver. Only one function

Let me know when the deps are in Mainline.

-- 
Lee Jones [李琼斯]

