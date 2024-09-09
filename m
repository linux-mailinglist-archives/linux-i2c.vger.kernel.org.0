Return-Path: <linux-i2c+bounces-6388-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E799711D2
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 10:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55678287579
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 08:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65991B2503;
	Mon,  9 Sep 2024 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqjGTzEe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BF71B1D7C;
	Mon,  9 Sep 2024 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725870214; cv=none; b=NR8/ZONVSKZ0DRbnTpLm1oIyBzVrfZPZX6K9YSiDx5rdNXZkFi+8T3L+eR5s3MnnpH/qLJWSzgL6Mt56lwq7OWwVsWZahxbSu9145w33f4s6yKNS4j0yvspgyKy6R/8grRAC3LI1GlmsmkLZUecBZSu53K9yydLQaBjMdCkn7r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725870214; c=relaxed/simple;
	bh=O+ISmYvpT2+tn32WzwIbBCpiSCFfEXK9i1j7SOa6m+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hW/kGPYvgqfyGmAtaU1Q6N3YuZTNh/I1QJM46ZXI63iLxGbHK/BEy/ZcbRznJU20quV7AvMoTRDoi//c4ZE22gRgpaZdyIWZUQWKi52yxajGIaGLWCITlM2kDX1mrFnsf/P4wYUWcWUMW8wdpcXDAL+ZkoJkzxPG40hE4h54HaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqjGTzEe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D935C4CEC5;
	Mon,  9 Sep 2024 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725870214;
	bh=O+ISmYvpT2+tn32WzwIbBCpiSCFfEXK9i1j7SOa6m+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqjGTzEefcDA4ZETEYimgr8LKg0UZW1w7FTnJR+NSRdcPeyPGW60c0kvsNk4bLvBW
	 xWmdjQE9Y32QSo8Rw+uhu/r2GosWWxbua1lAAICk5Tpd4dhWx3BXUF7uvbYnL+xI3H
	 KIV40aE/rPXRxSu1fpicFwTVeFj0MjA1ZI9wFxtJDIrvViYt3HQAucGQeCd1xLiRSW
	 g+bR28iZ1u7c1u5aghWog4k0jhwT+isMo/DHETm/5ihYgmr/mkvtC3J0wYpfrAV8H2
	 TFhCBIJ9bYuOSdylUd1KrqGtf0AF0kDFoIWFfPmTOHD5xVwc5AITYXpsnLArA6ZGFR
	 1CZCENMBoWRGQ==
Date: Mon, 9 Sep 2024 10:23:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: andriy.shevchenko@intel.com, biju.das.jz@bp.renesas.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v4 3/3] i2c: jz4780: Use dev_err_probe()
Message-ID: <aqigucchbgq2tblnu7gdkpiw35ezqbmgbl6a5ptzzezngnihsi@iny4xyzkjyz4>
References: <20240827034841.4121-1-rongqianfeng@vivo.com>
 <20240827034841.4121-4-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827034841.4121-4-rongqianfeng@vivo.com>

Hi Rong,

On Tue, Aug 27, 2024 at 11:48:41AM GMT, Rong Qianfeng wrote:
> No more special handling needed here, so use dev_err_probe()
> to simplify the code.
> 
> While at it, use struct dev *dev to replace &pdev->dev to
> further simplify the code.
> 
> Use the macro definition HZ_PER_KHZ to replace the 1000.
> 
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
> ---
>  drivers/i2c/busses/i2c-jz4780.c | 40 ++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
> index 92cc5b091137..72823a0f39c2 100644
> --- a/drivers/i2c/busses/i2c-jz4780.c
> +++ b/drivers/i2c/busses/i2c-jz4780.c
> @@ -23,6 +23,7 @@
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/time.h>
> +#include <linux/units.h>
>  
>  #define JZ4780_I2C_CTRL		0x00
>  #define JZ4780_I2C_TAR		0x04
> @@ -764,14 +765,15 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
>  	unsigned int clk_freq = 0;
>  	unsigned short tmp;
>  	struct jz4780_i2c *i2c;
> +	struct device *dev = &pdev->dev;

I'm not a big fan of this change. There is not much gain in
polluting git bisect in order to shorten pdev->dev to a single
dev.

However, I like the /dev_err/dev_err_probe/.

I will take the first two patches from this series, but I will
leave this if anyone else has a stronger opinion. If you want,
you can send just this one patch with just the dev_err_probe()
change.

Thanks,
Andi

