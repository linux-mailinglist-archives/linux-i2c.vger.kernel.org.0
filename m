Return-Path: <linux-i2c+bounces-1373-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A583227A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 01:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A522F1C2292D
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 00:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B902638E;
	Fri, 19 Jan 2024 00:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMSJJ9Z/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7947A389
	for <linux-i2c@vger.kernel.org>; Fri, 19 Jan 2024 00:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705622923; cv=none; b=gv8RjJfik3HXQWgKeuNja+up5PIvmw3ZYXbFFwMkLV4QNi9qwiz4P+LDEpCA1Y3lgLN05aElTzHUuJiONgyWGUN2emKV06tly5NUcuArFU6A5lbc9mRra7rkA1zB+RnlyQksfXHL3YART6AMlhyR7kM3Ztae6W4tcVoqYNrjt20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705622923; c=relaxed/simple;
	bh=JnyMN2JCFw6dHPX6twrd+p21RtcI/y0dsgjq3JuT9Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grR4zBAKHM1ozBZZIMUD19XC1fQePHiht6Ru8ihpuONtBsyttsuZBBUR3PVP8AcAEkIjJScQcE5QaIMdTV+tYldVqLtHiUOX9S6trjLvhRSsqX1MMbzfAPPXCogjVkEj40gCjpaRC3dQSE/R4b176vrBl6YGNgJ1m0StilI8XlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMSJJ9Z/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597DBC433C7;
	Fri, 19 Jan 2024 00:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705622923;
	bh=JnyMN2JCFw6dHPX6twrd+p21RtcI/y0dsgjq3JuT9Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMSJJ9Z/1RPMMKt7KYAO8Mqrq+LVMYI96zMD4o4chXdS8z91A9TtbyqNbYFl3FE/s
	 amMu4Ofo3Tqp5odNfjAJuBYbgprnUZUvDjQAqAub1wz6ZoayMpmoiwhlsRfpOD/GvW
	 lsZKtKkTnodTgr/dO63xwXIE+BnJEOI9QlBzmzhG0XV5OD/LM+UkDVCcVucGPGGwoF
	 Ru4JQ46RY/UmE8GDIxe9CA9scsFZfVKxPzbgqpjKIeVFFZVsWnbotHcMxA09mIpQ4K
	 DGsGM5LMokqYJs8yV0Ko4ffCkMXOkxSaG0IM5nx6Hsctj/Q6qKhrB44RAp8+eGkkbg
	 adQ0RDagJQGKg==
Date: Fri, 19 Jan 2024 01:08:37 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: lpi2c: Avoid calling clk_get_rate during
 transfer
Message-ID: <jv7nc7bu7llhwek7r3kk4dog2c5zfsje5c64v4kft74x4tnd3s@6cu5hqefz4ql>
References: <20240118074332.3633533-1-alexander.stein@ew.tq-group.com>
 <ugdaycvznwcnlbwsgkakzkhnqrhwqloqablsmavngo5sgsalml@cfywhcglkctj>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ugdaycvznwcnlbwsgkakzkhnqrhwqloqablsmavngo5sgsalml@cfywhcglkctj>

Hi,

> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 678b30e90492a..6cbcb27a3b280 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -99,6 +99,7 @@ struct lpi2c_imx_struct {
> >  	__u8			*rx_buf;
> >  	__u8			*tx_buf;
> >  	struct completion	complete;
> > +	unsigned long		rate_per;
> >  	unsigned int		msglen;
> >  	unsigned int		delivered;
> >  	unsigned int		block_data;
> > @@ -207,7 +208,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct *lpi2c_imx)
> >  
> >  	lpi2c_imx_set_mode(lpi2c_imx);
> >  
> > -	clk_rate = clk_get_rate(lpi2c_imx->clks[0].clk);
> > +	clk_rate = lpi2c_imx->rate_per;
> >  	if (!clk_rate)
> >  		return -EINVAL;
> 
> After the things you did in lpi2c_imx_probe() you can assume that
> clk_rate is not zero, so you could drop the if here.
> 
> Otherwise looks good to me (if you want even if you keep the if which is
> only a minor optimisation).
> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

you're finding users already... :-)

Looks better than the original version.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

