Return-Path: <linux-i2c+bounces-12341-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA2FB2CE60
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 23:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 961E77A7A2B
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 21:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB523115A7;
	Tue, 19 Aug 2025 21:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="thCYtja2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D719A3101AA;
	Tue, 19 Aug 2025 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755637801; cv=none; b=uttpgFX8TwCNHUOVujq3DkxUaC26AvbHOCOJf5arDsnDL6E9lmmk7Qv8PSeoRoF1OaHcUit39Vs6xB+kmuFElibByug68fZmHN8sDQJ2gZ1plenVnzGoUxHGw5VcDQC071LKFtxU7kVx/nu7yrgOMeGCOQiMeo9CZOR5bsQeS/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755637801; c=relaxed/simple;
	bh=V4rSZobOG7FpaYQDoGuuNjzv1YSuHyGLCK7LLSVzUOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yon35YH/Qw9fEyYFQ2DE1q7e/XpMsXyu6z5RNNhXbilLJxZIdp3Iq3X9bLFUBAsotgqwFYlfE4R/aY37W5K4233gSFTKZEOUUhmpudDSI4NOktWZ/MMsVm7UnJspzDC6v137IW/3+gjwkJk9cFKxLeNFYWGHBJ06cApn61O5uZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=thCYtja2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D18C4CEF1;
	Tue, 19 Aug 2025 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755637801;
	bh=V4rSZobOG7FpaYQDoGuuNjzv1YSuHyGLCK7LLSVzUOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=thCYtja21lUCQto/XtSxT9corknakG5qz6lpKP/K4wUjJs3/kMDqfxL2Tl21gWLKy
	 wtRmbwonV+WsfBYpt1o6aPIkq3OpZqDaqtDL0srux6zKqCGNgMCuY+ULNgE2uUPM/g
	 OJl81QrxCpvL6rbm+VbahV0kte3eP8S/Ir9aUn52s/ERLlJ/vNDewrVvbeshxnxxjm
	 MxeAHfpPkmQtNs2duT2AKbodr6IOX0sV9tynWgmLBr37v0VCb4qZfK874Mj7iHVDKp
	 Q27kYIZ8xQc/fdVpXf/YtDOpu7Qae9xHz1CKBZJfZFH2nreVNcp6HlQHEOfGChL5dZ
	 /LkdzawHJlhbA==
Date: Tue, 19 Aug 2025 20:09:48 -0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@kernel.org>, 
	Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] i2c: mediatek: fix potential incorrect use of
 I2C_MASTER_WRRD
Message-ID: <cf5wxalhd2536cxnj7zn2jngly5dmvoknjnb2gbq6mzqff4tgp@4syhblgi35yu>
References: <20250816075434.31780-1-leilk.liu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250816075434.31780-1-leilk.liu@mediatek.com>

Hi Leilk,

On Sat, Aug 16, 2025 at 03:53:54PM +0800, Leilk Liu wrote:
> From: "Leilk.Liu" <leilk.liu@mediatek.com>
> 
> The old IC does not support the I2C_MASTER_WRRD (write-then-read)
> function, but the current code’s handling of i2c->auto_restart may
> potentially lead to entering the I2C_MASTER_WRRD software flow,
> resulting in unexpected bugs.

do you mean unexpected behaviour?

> Instead of repurposing the auto_restart flag, add a separate flag
> to signal I2C_MASTER_WRRD operations.
> 
> Also fix handling of msgs. If the operation (i2c->op) is
> I2C_MASTER_WRRD, then the msgs pointer is incremented by 2.
> For all other operations, msgs is simply incremented by 1.
> 
> Fixes: 173b77e8d8fe ("i2c: mediatek: add i2c first write then read optimization")
> 

No need for blank line here. BTW, this doesn't look the commit
that is introducing the issue.

> Signed-off-by: Leilk.Liu <leilk.liu@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
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

why don't we set "i2c->op = I2C_MASTER_WRRD" here and avoid an
extra flag?

Thanks,
Andi

>  		}
>  	}
>  

