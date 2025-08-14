Return-Path: <linux-i2c+bounces-12293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7375B261EB
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Aug 2025 12:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84EB37B0C28
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Aug 2025 10:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A8E2F83BB;
	Thu, 14 Aug 2025 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l0XR3v0H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216E02F7461;
	Thu, 14 Aug 2025 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166292; cv=none; b=M8xkni4pl3A3nPiUKTEnoihCE32/n4gdYqpx2Az+sLmOcebYa9kaJrxaUU25ZrpnG/fj15hkdVc1OfBR9I4lW76MeFWs9+k3dzzwsMRTA418oEgBggGuGb9/vsJcIfs3BGqDfwX9UjHJYRDact8MUYeDH3+extMBaIFw8Kmp/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166292; c=relaxed/simple;
	bh=kTd9OqRGMiVwknWlc2tHcIgi2pdtVtjjVY49UoxDJjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxaDjYEV8T0zcL+4uh+kROAyu3tq+GwH/XQQijaIlfZcEWxhGxxajZnjXIqG45WOP0+YHyt3ZL8VS2MQYxATFqB2NvDA7tOdo7/YhFMcHPHWDELlpe8JS0chZQdLHC8NtcYLJKeRhOb4gSEzcSbFkIwBh3Eaq3Gfv6eVa/oz1C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l0XR3v0H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4A9C4CEED;
	Thu, 14 Aug 2025 10:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755166291;
	bh=kTd9OqRGMiVwknWlc2tHcIgi2pdtVtjjVY49UoxDJjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l0XR3v0HLfn2c6LbT2X3JEXKhTuY/BLOKRuCamKHn9jijqYxJRzM4BNWjaBSIlUj3
	 67/oD3yyj9cqH0YaFho+6WR684v0PXMvo9YUbHEgh9oDW69KzSslMDZ00jDokTB2/r
	 kdMsrrwdIu2Ea7GMVgXButDw4mzQrjWQ6fukGhHs=
Date: Thu, 14 Aug 2025 12:11:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, lee@kernel.org, broonie@kernel.org,
	jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 5/9] tty: serial: atmel: make it selectable for
 ARCH_MICROCHIP
Message-ID: <2025081421-lapping-same-c2d5@gregkh>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-6-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813174720.540015-6-robert.marko@sartura.hr>

On Wed, Aug 13, 2025 at 07:44:41PM +0200, Robert Marko wrote:
> LAN969x uses the Atmel USART serial, so make it selectable for
> ARCH_MICROCHIP to avoid needing to update depends in future if other
> Microchip SoC-s use it as well.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/tty/serial/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 44427415a80d..724ad4f3cbee 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
>  config SERIAL_ATMEL
>  	bool "AT91 on-chip serial port support"
>  	depends on COMMON_CLK
> -	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
> +	depends on ARCH_MICROCHIP || COMPILE_TEST
>  	select SERIAL_CORE
>  	select SERIAL_MCTRL_GPIO if GPIOLIB
>  	select MFD_AT91_USART
> -- 
> 2.50.1
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

