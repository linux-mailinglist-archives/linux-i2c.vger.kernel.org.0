Return-Path: <linux-i2c+bounces-15097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73955D18F68
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 13:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45CC730A5646
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 12:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EA03921CC;
	Tue, 13 Jan 2026 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnIVFfJw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E618438FEE3;
	Tue, 13 Jan 2026 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308167; cv=none; b=ocm/iuBMpWBfYa6hGgkRuUZIigAae1BkzGgkkj9OkjLLJKOv64otKdl7VyCbItdY6zwUUAfHk7LXEnrUWT/OIawfpm9qXQR4UwtXglSYbhOr8vHRsM2M/np9hwkVG/taTwS0hQ34jumUWQDFbs9TzxDPdE1/F7xRVbVqJRItcVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308167; c=relaxed/simple;
	bh=P2uVOyvO0aRD4x+AWbtaIRkMuZiJS26sqB6OLBNwyiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsqZLi1PDPnFakNekFV15TUhZX8o1JhmRtDwZs9G0zvLKgAnMpW6WsCXk/CbuODReESSfQJoP3RRve1nBgxErIlJ3p1QgxwAJ8VL0iutR2DIm7oE0hGL5Wp/OWu0dL/neJZyW4v+ot0oFiJmeIzURe/kuDLfRF5ydokXiQxWvX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnIVFfJw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460D0C116C6;
	Tue, 13 Jan 2026 12:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768308166;
	bh=P2uVOyvO0aRD4x+AWbtaIRkMuZiJS26sqB6OLBNwyiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnIVFfJwKm6rxZumFVPVq1zTue8z1VtgFnbUgg2XbDd49RMaa2Z6KjHDZi8nXSp4g
	 kfVmKo4xo9sbtlHDtg7L6RRdDJHVfrOEUTNwuV8iEZz5mYpuv/WidxtUCWt/P4bbmx
	 ZHxAJiyx9ShQJ3Ujs4OWCMXyGaZQqNV5ecyVAODAanZUDLr2ByhsrPsNYBUmPqauld
	 vFsWskQcaWrWPfippVT8t4mSDcwMPaLue3lrLcWXs7mZkDaPp5RF5MBRy69FbXVZl/
	 Qh0q6Gfz8XYf5Am1ah08RfRepEx0wnfkIysMMXovx2N6qZ93wpHpxSWLVDYVmkqxyr
	 Fxz7wAlc5s6jA==
Date: Tue, 13 Jan 2026 12:42:41 +0000
From: Lee Jones <lee@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] mfd: simple-mfd-i2c: add default value
Message-ID: <20260113124241.GB2842980@google.com>
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-2-6fe19f460269@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108-p1-kconfig-fix-v5-2-6fe19f460269@linux.spacemit.com>

On Thu, 08 Jan 2026, Troy Mitchell wrote:

> The default value of the P1 sub-device depends on the value
> of P1, so P1 should have a default value here.
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Change log in v5:
> - nothing
> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-2-44b6728117c1@linux.spacemit.com/
> 
> Change log in v4:
> - default m if ARCH_SPACEMIT instead of default ARCH_SPACEMIT
> - Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com/
> ---
>  drivers/mfd/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index aace5766b38aa5e46e32a8a7b42eea238159fbcf..c757bc365029dc794c658fc5b10084a0f29ac9b6 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1276,6 +1276,7 @@ config MFD_SPACEMIT_P1
>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>  	depends on I2C
>  	select MFD_SIMPLE_MFD_I2C
> +	default m if ARCH_SPACEMIT
>  	help
>  	  This option supports the I2C-based SpacemiT P1 PMIC, which
>  	  contains regulators, a power switch, GPIOs, an RTC, and more.

I already applied v4.

-- 
Lee Jones [李琼斯]

