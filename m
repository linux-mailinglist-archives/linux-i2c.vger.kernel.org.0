Return-Path: <linux-i2c+bounces-15011-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36246D0C77F
	for <lists+linux-i2c@lfdr.de>; Fri, 09 Jan 2026 23:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19A23301FC0C
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jan 2026 22:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93DD830CD87;
	Fri,  9 Jan 2026 22:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ffoPX5Ke"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E570A2FD1C5;
	Fri,  9 Jan 2026 22:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767998326; cv=none; b=HO+p+MJ7S7KzwwYsR9JTx934ZK7d9TwacMuoP/mHLf54zNod/vNdFlGyb2BQsDgjY5Atj64vIfP1TbYt6Dl0FTdxicjVpzwxNa5vr7IXJsumExdjfsJ7b4MZ3q0RvrMGM0znBmoTgcH0ssGNcPcsPIm4sF7Gjz3EBotcD5sDIhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767998326; c=relaxed/simple;
	bh=O9fUj7xDY7ohwHFxe9WzQ4tiWzYIZiUTE5oX4lIfzJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7GnaNLUBVbZg8zphHBBhgzhVbXVByLyVpOctMAkQSqgY5qC58ujZZjuyy77F+aKAEmx6iNaLPLvzPofJW/sakbTI185jZIKuyxmysLErPHlNzhQkwmVyWjRbs9R7qAkm8WTNKvi5FigHZ2ABCBSctYKmIhbpluNkYs/8cXLWJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ffoPX5Ke; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 68EE21A2759;
	Fri,  9 Jan 2026 22:38:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D0FF606C6;
	Fri,  9 Jan 2026 22:38:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0C5F103C871E;
	Fri,  9 Jan 2026 23:38:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767998322; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Hx7WIiWE3EK2oEUgKzf5pfMAPP9G4Qkm7NyF+IC7TSU=;
	b=ffoPX5Ke+/yLP6QLjTb2DgXr1j7Po6SMkZgS4fdBAXFSkQDV3R7bCqqXlh6A3YXMKMn3XA
	iQ17fNj7UlqCsc7VE0RrsUhHeRorUC0WuR1J2iGAeWnhE69Noz0828nfKss8Ev+aEJJjG4
	ZKSBLG8+R6vbW6gnsuixuoGL29OFGwDNdN58d8jl5tkRF4z6z1bADP/H4AV3aIjqIGbeow
	IfEmwarsbQ9/hxoPceyuIPVS6edleJkp8NpxYbTjC8u8+jdwGHvvppWBCFZXjVO5tYVFwv
	SwctKRn/hzRnRmTNAxnVJWMebvPwu3xaxLcM/yzcmFZlnPFc87ZHTg01UfaAIw==
Date: Fri, 9 Jan 2026 23:38:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 3/3] rtc: spacemit: default module when
 MFD_SPACEMIT_P1 is enabled
Message-ID: <20260109223839b59ca7ce@mail.local>
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-3-6fe19f460269@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-p1-kconfig-fix-v5-3-6fe19f460269@linux.spacemit.com>
X-Last-TLS-Session-Version: TLSv1.3

On 08/01/2026 16:38:56+0800, Troy Mitchell wrote:
> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
> caused it to be built-in automatically whenever the PMIC support was
> set to y.
> 
> This is not always desirable, as the RTC function is not required on
> all platforms using the SpacemiT P1 PMIC.
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Change log in v5:
> - add Alex's tag
> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com/

See my reply on v4, this is still a NAK for me, I don't believe this
change is necessary as soon as the default for MFD_SPACEMIT_P1 is m.

> ---
>  drivers/rtc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
>  	tristate "SpacemiT P1 RTC"
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>  	depends on MFD_SPACEMIT_P1
> -	default MFD_SPACEMIT_P1
> +	default m if MFD_SPACEMIT_P1
>  	help
>  	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>  	  This driver can also be built as a module, which will be called
> 
> -- 
> 2.52.0
> 

