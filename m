Return-Path: <linux-i2c+bounces-7780-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E928A9BCFA4
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 15:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 459D2B22039
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 14:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4911A1D9669;
	Tue,  5 Nov 2024 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSsM1A6p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031CE1D27B1;
	Tue,  5 Nov 2024 14:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730817879; cv=none; b=MmcJmL0jiBNjBTTcx5w8Ck06Da4VNKSpLT0g7eFu9PRcYoSKkmVRhUAwSlcBj8M7x4tMiEO5kJGcItth55lZaXMuu7f6AYgPtt9OH8bs0gt8lDfFPaS5RsuUloa4bgysEFa0g5ODbbMvUi5of2t1mFzsFjMxpZ9gV250DVmjQJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730817879; c=relaxed/simple;
	bh=zXUkm9yOlaC1/qaAot86GmN2zLZoWN/bH0d7qdfXGMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOK08pf6c1VrWgL6JuCgVnsot3pXgJ8ovPDPaJU6Mmo8dzjzz7mXkqjbbkZ8VaBn/MGCg/I5/KQMantmU+2m0/7RKIlaw0ByCfPaPqNDV1W8yCWV4ZPcaOzGcKYbGa9kpTHf1e1sf0QLMMkRRY910TKks0pKTT6DGCRTuUkrGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSsM1A6p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17703C4CED0;
	Tue,  5 Nov 2024 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730817878;
	bh=zXUkm9yOlaC1/qaAot86GmN2zLZoWN/bH0d7qdfXGMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FSsM1A6ptN/Hfe5RJjxt+PiVyrqPujnZtQSenxWqx9sH5w57HbTrF31ewCuYLKlVB
	 ATV5gJW/bMW6y+MQFyRc4utOT3BnhRO/PFpsHon+7i65uEyS7x+RUXLRxJ6/0zDP7s
	 u2PKLbI45WXPhdkK7j9aUFimHi9eluDOxYaCGIqbsUAorSuofUZc6M5GichqIYw6C0
	 nLimG2nZnh6nrSY09uL8OemkCcpILez/J0rUDBWS1LelfHNnEeTV5Qp6g4jXtQNkZg
	 r74RRcpwjRgLVlmHWa3p58kySDq2OgySJMPGQhuv0nwY1rRAzQBePz9Wnh7pH/y/Oc
	 0CBYcr85t069w==
Date: Tue, 5 Nov 2024 15:44:34 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: busses: Use *-y instead of *-objs in Makefile
Message-ID: <l75w7qvvw34u3vwvd7ddnka2q3fcrvzpxbfwrh22niggndrp2s@fctmlyvdfiqm>
References: <20241104103935.195988-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104103935.195988-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 04, 2024 at 12:39:14PM +0200, Andy Shevchenko wrote:
> *-objs suffix is reserved rather for (user-space) host programs while
> usually *-y suffix is used for kernel drivers (although *-objs works
> for that purpose for now).
> 
> Let's correct the old usages of *-objs in Makefiles.

...

> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index bf79628a789d..20a8c88e854a 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -431,7 +431,7 @@ config I2C_AT91
>  	  are facing this situation, use the i2c-gpio driver.
>  
>  config I2C_AT91_SLAVE_EXPERIMENTAL
> -	tristate "Microchip AT91 I2C experimental slave mode"
> +	bool "Microchip AT91 I2C experimental slave mode"
>  	depends on I2C_AT91
>  	select I2C_SLAVE
>  	help
> @@ -440,7 +440,7 @@ config I2C_AT91_SLAVE_EXPERIMENTAL
>  	  been tested in a heavy way, help wanted.
>  	  There are known bugs:
>  	    - It can hang, on a SAMA5D4, after several transfers.
> -	    - There are some mismtaches with a SAMA5D4 as slave and a SAMA5D2 as
> +	    - There are some mismatches with a SAMA5D4 as slave and a SAMA5D2 as

Although these changes are related and I'm OK also with the typo
fix, could you please propose here a couple of lines that I can
add to the commit message?

Thanks,
Andi

