Return-Path: <linux-i2c+bounces-10648-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195A5A9E73E
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 06:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75D3D178799
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 04:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8508519AD5C;
	Mon, 28 Apr 2025 04:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnHHXPYj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71734A00;
	Mon, 28 Apr 2025 04:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745816281; cv=none; b=bKrX1x499RUnZ44FcSaX5IR0U1EZd07nYfUP4zT+0kNS33yUcH2PO+zy/yWxJR0ut0/wuYQl1yZJ6OS9J9fQ1erekPb7AEDVtxVEdGIoHyF0ToFI9fdCqZE/EqVrQNuLzKC5QVBhR2iQSIff/a4dP50JDDW0HDa0p+JNE81DeQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745816281; c=relaxed/simple;
	bh=1Pd7BEe/5QE2amsE/bVBdnxt7TNs1q6JsqYcbWm4USg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E043Cy9s5ysUKPYU//PcsWbUVaHuv5zcl2zAAjnixoL1SPS1MkG3wg7HaQvONL5fpy1We9NfH22nLJulBUr0caBiXENyZTrWTYgV3hM2EG0lpjHT7IZ6NEjxKwrHQARWCSD6JfJiMYofFYOf9xXp0nZ1Df9CeQyLU/xsy5sV0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnHHXPYj; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-af579e46b5dso2980586a12.3;
        Sun, 27 Apr 2025 21:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745816279; x=1746421079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iPBvAyUU311bbG2aZ0BYl5mxeYY4FqGUEKf9879Dmxk=;
        b=hnHHXPYj/X6vLTGIVEpVhjeLP9AXDWTMFaZmWAxBGiYzYQQmE0ENrXz9fdIvn99EnF
         KrYg/T/S6Y4973gCxZGtED1vRpotTxR0iYFATW0JuO3qx/LJOXmGKH9ql8ZTH1Y+P0As
         HbKROSeCuNNGRE2xr8wSFGDe4LsV5bLBc9uUiFxLd0u1Pnbjd9uPAPWxAy0cToXrKjW+
         2SIUuQ9xytA9x+4Z2QtRmDfPVi7y5Ix9z2CY3cWgVvsN9DfGH/2EiFDu9eT303fB1Eg5
         Jaqcom9m8+c6MsVuZyLmJsERFStUUePnUkmY108+685y3GUs43TpkNs2fQT01Odlbl7s
         ZEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745816279; x=1746421079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPBvAyUU311bbG2aZ0BYl5mxeYY4FqGUEKf9879Dmxk=;
        b=L+1vP3zpzDPoFlJJtSnFn2Dm7ZO0Kfij/E7oGz8pBXO/R9J4xoACpH8j330HzWc4qz
         XkaH7RYj+X7SK+7KO4SLanEFwWCYU21Cu3i6YbgbsU96u6SCJf/35WmNdC1zKeExvaID
         RY0x7WmzFqL5Ug+h1jj5ULrWWlBkmF22a05TX9DK7ll08hiLXQ9yxuF5XrI/p1Sib2uJ
         ZU2SwB4cyLpmyrYMuAYTg2nTcCg+1ZzahF2UkEcmAXxiBDqWJwhgw1nMAD1TIrb2pCZd
         n7i1I64L2ocHkUdd9wP9eQrl+p+M/pSvYLdpDhE5jnGq1C8wxwTIIv9tLUkTatBbGH8z
         l5mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc8IXTjDaNuBM8xif3VGfbEQ/OJQpbSDl+zTZktFf8Zh9i0y+/Me//y3GQAoQjzmsSnDX75P9bqYGEJU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBo44Y7L6cYskb3DpDL3fvX1y6K7xEDmxBwC0KYdiBKmYbkTEL
	Tn+L4KawPNQBiSGradAIk0K7CqDp3Lq5Qj9cpcS3nfxIXfD6rG7b
X-Gm-Gg: ASbGncvHZkqpGW4dlgAY3txrDbyK+/MAapGHEvsWKR7EYOCwjxMiBFnhqRB6QuBGMrW
	3skFqbYTC84yqReuBjk4pLKkv1pBxpSiCedBrnQnBoVnJPjDgG+9JPNNBQl8k2Wtdl7JOAbD63A
	KgGlaPCMUhDbLt1s+7G2QGgKaPGIjkKD+Fy/AKZPM3X1N9Ur2QRl/Uh0gyQK1W4IB68wHPkozf4
	y9K7xxKKJ0T5FNcPGUa90ylpVWgJ1XLXTmpCMlsUkd+NDYu6uqpNTUYBGFKr6E9iXEF9QW3ZVEY
	MBtOZkNx9mZU48sWoK7v0Q==
X-Google-Smtp-Source: AGHT+IHPWV68kDNnvcDOp3GF0LPKpG/CEzy0Pv2JiYWY15R9zmn4YM/P6w+2bnJu6lNJanewXlFw5g==
X-Received: by 2002:a05:6a20:9d94:b0:204:4573:d855 with SMTP id adf61e73a8af0-2045b6b0383mr14404423637.9.1745816278754;
        Sun, 27 Apr 2025 21:57:58 -0700 (PDT)
Received: from localhost ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1b82c7adedsm2775300a12.75.2025.04.27.21.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 21:57:58 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:57:54 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Peng Fan <peng.fan@nxp.com>, Troy Mitchell <troymitchell988@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Yongchao Jia <jyc0019@gmail.com>, Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v2 1/2] i2c: imx: use guard to take spinlock
Message-ID: <20250428045754.glgyfhp2zn3l7wkj@troy-wujie14-pro>
References: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
 <20250427-i2c-imx-update-v2-1-d312e394b573@gmail.com>
 <PAXPR04MB8459E722812D2B11D57AA17F88812@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459E722812D2B11D57AA17F88812@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Mon, Apr 28, 2025 at 12:55:48AM +0000, Peng Fan wrote:
> > Subject: [PATCH v2 1/2] i2c: imx: use guard to take spinlock
> > 
> > Use guard to automatically release the lock after going out of scope
> > instead of calling it manually.
> > 
> > i2c_imx_slave_handle() can safely be entered with the lock held.
> > 
> > Refactored the i2c_imx_isr function so that i2c_imx_master_isr does
> > not participate in the guard scope
> > 
> > So Using guard(spinlock_irqsave) simplifies the control flow by
> > ensuring consistent and automatic unlock, which improves readability
> > without affecting correctness.
> > 
> > Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
> > Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 39 ++++++++++++++++++---------------------
> >  1 file changed, 18 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index 9e5d454d8318..a98bf01c5dde 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
...
> > @@ -1125,32 +1126,28 @@ static irqreturn_t i2c_imx_isr(int irq, void
> > *dev_id)  {
> >  	struct imx_i2c_struct *i2c_imx = dev_id;
> >  	unsigned int ctl, status;
> > -	unsigned long flags;
> > 
> > -	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
> > -	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > -	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +	{
> > +		guard(spinlock_irqsave)(&i2c_imx->slave_lock);
> 
> Use 
> scoped_guard(spinlock_irqsave, & i2c_imx->slave_lock) {
>  ...
> }
>
Ok, I'll use it in the next version,
and if no one has other suggestions, I'll send v3 ASAP.
> 
> Regards,
> Peng

