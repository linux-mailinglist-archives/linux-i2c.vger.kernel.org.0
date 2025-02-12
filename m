Return-Path: <linux-i2c+bounces-9408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ED3A32ECC
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 19:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B4F5162E4B
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 18:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A3125E450;
	Wed, 12 Feb 2025 18:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxuLxvnq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0627180B;
	Wed, 12 Feb 2025 18:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739385435; cv=none; b=Z23ZNArRBHrxJYVkZtRY8IYx/RjNC8xjEQ2za1c8AACthBgaz8ZHltRFEwAD+q4uCZhjU7S8sta/GoTlmwYkB9Q/+Spn0RaF394Ag+np5zbfNGb29GBKklfyalEOeIG1/+4nMgxkf9W+WD3NZHnPJtVnkECs9MiJtafGLG4Fp6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739385435; c=relaxed/simple;
	bh=MqYIPwPX2fN8FIm6K1ROUFQveHjsiR7V4H6VXdFj48M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMEXZzv2M+eh+ZYQnoZcsQC1cz/5iF47xpMm8zOWRgIKC9VhmzpwP/l1gZBQWX+9H6/AOdlztRlfl5GGgHsSs/T5Em6l5Qo58EZeC56qAIjGBvO20h2106ozbMXYFWvsvAW1BoKzkcpKwK4fXuKv+ER23s/mNpcCP6gf8bNsbfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxuLxvnq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6310C4CEDF;
	Wed, 12 Feb 2025 18:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739385434;
	bh=MqYIPwPX2fN8FIm6K1ROUFQveHjsiR7V4H6VXdFj48M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sxuLxvnqYXvHV2r5iyP2hIHTQFy+b6N6Ao/6tx20f7FpDH3VwCNEm+Z4FSaBJ5mhV
	 PDJ7cG83QT9xDGGYT1VhmIChi9UVRvNmP2mmOrUOdx0N7TrjOE6xnvGdXDoucs3UEa
	 0BzshAx9HiG9rZO3C6a/ozETYKkH7x2TuPJtiSJlhyBpfJVbZLuMJhCKdpFl0VfaaY
	 exJOsphy9AxhVXxyU2zXOIyvMRT1AKDM0sAX0AqKxkSrbUAfRGctKLankRC8EzJrzn
	 hk1Cv72NdUge8xO7ycnz/7Bp/q1sM7iP029fAw4xGS8vmuMj+/6GkncpBkFHHpFvQ4
	 1GU4T1McR0UAg==
Date: Wed, 12 Feb 2025 19:37:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin <zoie.lin@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, teddy.chen@mediatek.com, 
	joseph-cc.chang@mediatek.com, leilk.liu@mediatek.com
Subject: Re: [PATCH v4 0/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <minka4xfg4pymy4hjekooqyqk6xpbgenacsw32u6pdf3llcyyl@eh4u4ohccx3d>
References: <20250211144016.488001-1-zoie.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211144016.488001-1-zoie.lin@mediatek.com>

Hi Zoie,

my comment was on the [PATCH v3 ...], this should have been
[PATCH v4 1/1]. If you use git-format-patch, most probably you
will get it right.

If you have more than one patch, you can use the --cover-letter.
option to get the patch 0/X.

On Tue, Feb 11, 2025 at 10:39:37PM +0800, Zoie Lin wrote:
> Introduce support for runtime PM operations in
> the I2C driver, enabling runtime suspend and resume functionality.
> 
> Although in most platforms, the bus power of i2c is always
> on, some platforms disable the i2c bus power in order to meet
> low power request.
> 
> This implementation includes bus regulator control to facilitate
> proper handling of the bus power based on platform requirements.
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>

Is it possible to have an ack from Qii?

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 73 +++++++++++++++++++++++++++------
>  1 file changed, 61 insertions(+), 12 deletions(-)
> 
> This series is based on linux-next, tag: next-20250210
> 
> Changes in v4:

what about the previous versions?

> - Removed unnecessary variable initialization.
> - Removed unnecessary brackets.
> - Corrected grammar issues in the commit message.
> - Confirmed autosuspend delay is not necessary.
> 

...

> @@ -1472,13 +1507,18 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	ret = clk_bulk_prepare_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> +	ret = clk_bulk_prepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
>  	if (ret) {
> -		dev_err(&pdev->dev, "clock enable failed!\n");

Why have you removed this dev_err? You coulde have rather changed
it to match the error. While at it you could also replace it with
dev_err_probe()

The rest looks good to me, I'll be happy if you can have an ack
from Qii.

Andi

>  		return ret;

