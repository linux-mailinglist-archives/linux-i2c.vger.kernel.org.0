Return-Path: <linux-i2c+bounces-8605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5039F6CCF
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 19:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01BF67A2C6E
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 18:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45DC1F9A84;
	Wed, 18 Dec 2024 18:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lmyd+Qm7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6F61F63EE;
	Wed, 18 Dec 2024 18:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734544851; cv=none; b=haaV8lew4v/Oc3mEl42WB70P5XuvsBavzxGkyn6f9pd+iYcPjgqswjdIrXe1eppN3xxEPGVV1a91K5A25NH6xH95FX0E+RRWA7gg5es6gwdL6K+87bcgivboFaeixsFUixULQkS2mu7RbX2y4DYWRgF197QM6kotzyxP1Oh/PbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734544851; c=relaxed/simple;
	bh=jDqywiClxZaBJPC/86Ml/BE+k0/1EIzLQXuK0uDXbKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDfKUYc0dhwjBFr5VyM3eEQceLjqv9l3/TV2owgr1CLa6MOhA+HA3+U+IVNSdJOqB6Z1z0WR9mQqvXlTkYUvsR3EPTko29UoYcViEB0dXWQ9GwigIhRC4Ba83ru4+2voBiOJPGpApOJqZvT4fW8EJuSk5k0PuwP3pIc4FMKq/RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lmyd+Qm7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D738C4CECD;
	Wed, 18 Dec 2024 18:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734544851;
	bh=jDqywiClxZaBJPC/86Ml/BE+k0/1EIzLQXuK0uDXbKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lmyd+Qm7SOUYdiWVxYmyxOo3vZMGC1iwSrpqmFB92xfIYg1NQIoRB5pjp7nSXb+Xy
	 O7OlgePpM9+IRSkpUUTmig8bvrWlmwqgt1Xqm8BFjvyD2gsRrS1bjvuJQKG91xRoEe
	 NGVbu9CSzIVTDVMxn6CxvZC6S7SFzckNS22wgkthSGabkq9f5IBx16lY57bzHdcZxb
	 fmzGY6rEbhiNg/0cCmeUP1BohVTSy4u4OLKnb8TZk+TGwgczbKtjfA9yVE3WKyOhRS
	 467AogImHBXBQXREx3V7/Q1QzfWa1zYP7XhEGPioU5HA/x3BhLyrL1XCvkJZZo+Yqo
	 ti5pE5/WzpX+Q==
Date: Wed, 18 Dec 2024 19:00:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Stefan Eichenberger <eichest@gmail.com>, o.rempel@pengutronix.de, 
	kernel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: fix missing stop condition in single-master
 mode
Message-ID: <i5b2b622jmp2daco62wljolnjz5p35e67ldpkiqd3jv2z4ruqo@go2b4znun6z7>
References: <20241216151829.74056-1-eichest@gmail.com>
 <Z2BWtjPT1sTUCZ82@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2BWtjPT1sTUCZ82@lizhi-Precision-Tower-5810>

Hi,

...

> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index f751d231ded8..cbf66a69e20b 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -534,20 +534,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
> >  {
> >  	unsigned long orig_jiffies = jiffies;
> >  	unsigned int temp;
> > -
> > -	if (!i2c_imx->multi_master)
> > -		return 0;
> > +	bool multi_master = i2c_imx->multi_master;
> 
> Move "bool multi_master = i2c_imx->multi_master;" before
> "unsigned long orig_jiffies = jiffies;" to keep reverse christmas tree
> order.

I will take care of it.

Thanks, Stefan.

Andi

