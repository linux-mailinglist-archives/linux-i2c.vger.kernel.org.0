Return-Path: <linux-i2c+bounces-14771-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5923CDDF0D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Dec 2025 17:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A231A3000FB0
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Dec 2025 16:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7175E265CA2;
	Thu, 25 Dec 2025 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x7BL1eqg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5F427456
	for <linux-i2c@vger.kernel.org>; Thu, 25 Dec 2025 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766681627; cv=none; b=Oi8IALkJ79DI6RFiMGR95qJXGkgceHFuBNlsAuBxANyqV0/z8DZNFmd2OFEDgWbfY92ebZwfoAH1U+Xo9dJK+6gHFJQp3j6Nu3KmIM6i6iY8Wh5QGkSvfQ0t0gTYYHeNWn9XawSj2K53dJrFU0fWlPr7VqDOgmbuTVEhmxCFdB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766681627; c=relaxed/simple;
	bh=Dyk5KusdMTkoFl1JN6tSgFzsvFGqborzl0/Qs7d6tno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsFKlGtzszML5BW1a5duJFgkyv86SdOgymv9IlxOZrIiCpMmVAXE2ItwRxawzkFcdekY9WE42T+uCC7wAFRqT91SZdL0o+7YGQ8kz6R60e+ydq/8g+z/d9adxaHxo2HXiaYCQ3yMfq9YfVOwL8VJKuVx9NJkMxn8xAX5xLawxiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x7BL1eqg; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5582BC1BE9B;
	Thu, 25 Dec 2025 16:53:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5443E60742;
	Thu, 25 Dec 2025 16:53:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 970C7103C8CAF;
	Thu, 25 Dec 2025 17:53:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766681621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=afdzq0G7wsigzO6RVOGJk2hczbqsJTxZQZ9HcD5yI2M=;
	b=x7BL1eqg+0xLhEmZMN3OS+aGPrn9OBS2gfRbN5PCEBw08tiIZnLhj29tFwQgLxdaL2i496
	AAgEa5BCZXdkEWMDD0A9DzNC6LYehVAjShKwa+HCuqKpbslkANFusCvJK0viyVHLmvxzFw
	jCp4NUnx10MWMoVuYz++hV7A74cgQBRLcQw1Bzp9QjWYzWwG7ccpANpG3Vse5PJc0WQHnT
	/hrJwEepy7h+JoWFgKbib0KW1PYIn1ZQIwjU9gz+uzDYxqmxavGTq4iP2H6yzdQQJ4ixHo
	V6bpKGhvfYHw8jXucie4hRQ596QJfvFTyGI3IWsN5YSQUEwFl4GjZDdkfQBwdg==
Date: Thu, 25 Dec 2025 17:53:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when
 MFD_SPACEMIT_P1 is enabled
Message-ID: <202512251653368b33c7e7@mail.local>
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
X-Last-TLS-Session-Version: TLSv1.3

On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
> caused it to be built-in automatically whenever the PMIC support was
> set to y.
> 
> This is not always desirable, as the RTC function is not required on
> all platforms using the SpacemiT P1 PMIC.

But then, can't people simply change the config? I don't feel like
this is an improvement.

> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
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

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

