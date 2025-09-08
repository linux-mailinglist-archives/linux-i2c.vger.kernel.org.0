Return-Path: <linux-i2c+bounces-12789-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28EDB49CBF
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 00:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8361E3AB75A
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 22:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DC32E0B42;
	Mon,  8 Sep 2025 22:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Avz78ey8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAB32DEA95;
	Mon,  8 Sep 2025 22:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757369839; cv=none; b=PNj6tv8fm3pdmJbYnuZcXFKEfzoidbFBPL2NmmR3irOSH8uCLPNHWWOod/ijzIKdAYGWgUlTXuNapIRWqV8XR3xl9zYNtU0L+br3Q6gdO0gSSo24PtIOrP/Bf2Cp2j54nZlKzdFFqLRUwAcHtIAg4rsg1yg5PKsH1NipeSlRwxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757369839; c=relaxed/simple;
	bh=yH92uhvD40IJiQljLDeAcC7HN4DLj9MU91AIC0wuXmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUfRjevuIj50gmofxdKU64Z+qruFoo6wfDCtgzO680Rt46JfNA2mA8hf0LVIRRco7IQxBcYJUVzLpZrR32d8Tdacxn1qzWfP6BQ3Hze37oLwl+Ou2FeSf/irHeacOZtJValu8KUNIYJqt+QfNoTs9fTjlOTGLcr2HoIr/45PJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Avz78ey8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FB7C4CEF1;
	Mon,  8 Sep 2025 22:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757369838;
	bh=yH92uhvD40IJiQljLDeAcC7HN4DLj9MU91AIC0wuXmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Avz78ey87oevm4M2gMpO+1tOn0ld7UkfYqxtJy9ed6faDlUdFsykj5Kr9XVw8mVSO
	 syCuPLQJB7N94+2uAKkRuD/y+tYQkaBwQ4hXwNQ9L0JAqvwUWnZAS9oDv79cZ5c/Jv
	 +srzb6S9yBh64stcaGUA+QE3NyBwnl50OQIg0T0KAbgkrUmiG5GBLeogNC7GHLLVRY
	 IhdPh/+lwx7M80rzjGYUQVMR/B7cK/9OHnh82gkYCXDhZcU1OxYSnUV8zSdqlGBLmD
	 Bu70SCcANS8ft+GJHT1IP0u1w0T+6FkmQLZWIg4xlbsXGFKnvXyf3y93xb0UdUP4s2
	 Pbt0/DApi0/hg==
Date: Tue, 9 Sep 2025 00:17:14 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@kernel.org>, 
	Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2] i2c: mediatek: fix potential incorrect use of
 I2C_MASTER_WRRD
Message-ID: <zddsit53dwqo27buoxaolgpzvvvd6uvwcyzughv7qfvwg64ces@yrlrur5dkf45>
References: <20250906082652.16864-1-leilk.liu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906082652.16864-1-leilk.liu@mediatek.com>

Hi Leilk,

> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index ab456c3717db..dee40704825c 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1243,6 +1243,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>  {
>  	int ret;
>  	int left_num = num;
> +	bool write_then_read_en = false;
>  	struct mtk_i2c *i2c = i2c_get_adapdata(adap);
>  
>  	ret = clk_bulk_enable(I2C_MT65XX_CLK_MAX, i2c->clocks);
> @@ -1256,6 +1257,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>  		if (!(msgs[0].flags & I2C_M_RD) && (msgs[1].flags & I2C_M_RD) &&
>  		    msgs[0].addr == msgs[1].addr) {
>  			i2c->auto_restart = 0;
> +			write_then_read_en = true;
>  		}
>  	}
>  
> @@ -1280,12 +1282,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>  		else
>  			i2c->op = I2C_MASTER_WR;
>  
> -		if (!i2c->auto_restart) {
> -			if (num > 1) {
> -				/* combined two messages into one transaction */
> -				i2c->op = I2C_MASTER_WRRD;
> -				left_num--;
> -			}
> +		if (write_then_read_en) {
> +			/* combined two messages into one transaction */
> +			i2c->op = I2C_MASTER_WRRD;

i2c doesn't change for the whole loop so that it can be set only
once outside the loop instead of setting it everytime.

Something like this:

	if (i2c->op == I2C_MASTER_WRRD)
		left_num--;
	else if (msgs->flags & I2C_M_RD)
		...
	else

looks cleaner to me and we save the extra flag. Am I missing
anything?

Andi

> +			left_num--;
>  		}
>  
>  		/* always use DMA mode. */
> @@ -1293,7 +1293,10 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
>  		if (ret < 0)
>  			goto err_exit;
>  
> -		msgs++;
> +		if (i2c->op == I2C_MASTER_WRRD)
> +			msgs += 2;
> +		else
> +			msgs++;
>  	}
>  	/* the return value is number of executed messages */
>  	ret = num;
> -- 
> 2.46.0
> 

