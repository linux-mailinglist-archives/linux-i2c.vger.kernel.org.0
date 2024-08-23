Return-Path: <linux-i2c+bounces-5748-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FF095D033
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 16:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71F791C212BD
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 14:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CB7187332;
	Fri, 23 Aug 2024 14:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pb7Ej9Nq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28271E4B2;
	Fri, 23 Aug 2024 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724424170; cv=none; b=UISUUH8cvs8VGoxB/sEE5EfTPx2M/sDo7Xyu/CekCDyxzn4BbIWFOEbQBXUQIdGob7RhpwikF6Ucv+zCZrulE5kXwRNgR/wUl3rAqEHBezSORVBQRo8RySlmKSYMAJ6WSyxS8/xjn3vfoeY+7C5Op5cqi7fvx3SihEWB9ryJ1xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724424170; c=relaxed/simple;
	bh=/qfHppgrQzACRGTSJ/t3noBs4cqe1n90vsQH7YIsqSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKDKNq9kkAphl2ys9zbPSTtysPFzEhn5rvTta37bJHVifYvPHTGM2amcSQ86Tz6+65yT2yR+VpQsbsqw30gF9rcQ+tB+nFWHKkSeBw4Fb/+oVnCQBp3DHDK8o72bMonEQwMovab7m5ZJVoEAy/vuSkOUheG3txrNhD6ihNM4v+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pb7Ej9Nq; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5bed83488b6so2683118a12.2;
        Fri, 23 Aug 2024 07:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724424167; x=1725028967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LV5pX2MG/y9Od0ZypEKmss4zCvIjkPOalHMBZaJ1+Ug=;
        b=Pb7Ej9NqeZGwDNzbNnxWiJ4yFZliYcBvNavONphv3a2bdm0ISmJCnRQhkAQd1LlC+c
         g9fXoP+Q+ImCrz9etcERdAV8VwiNs1oFM1b2Gk2Fy5jRlwUVgmq9+B++ganlfX1ZoQUJ
         q/LZWcCKLpx+I+cLPxQLTUrUc7pniuib3lqAGfZ1u8FUrHLa1XsCS1Ik3Ywz7Rx4w4gd
         rrXDXFBLpZ36qpCnMNdRFJmdZJ79OLh3r2Lt14sypJJIoKdD5z2fU8+xAkW27s3BoO0/
         RGqK/rIYuw1/KMjtF1x8Y5rd7xjPaSffO1UWnBB+mBQib5NLeERhUiHDrtQJGZAPg4zm
         bQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724424167; x=1725028967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LV5pX2MG/y9Od0ZypEKmss4zCvIjkPOalHMBZaJ1+Ug=;
        b=XusqAjhYJ2DX2J95q+L/jthpCUJBRDWXGRFGsOMYQTF82jL2tqPaH1WKgr6edqqYTV
         WniqlpR2JyVllGg0fP2eOgvtRstb8b9N1ZTpnmnnphZP/dOsP9iEzP460MyYtoIMT9+v
         pmncdk4ZVyBBo2NGCSvQ18/GRaxkCT9ZUxaZHHe7jMIEny90n83Vc8bQSr7m2tPL3dZj
         GWBvqXcBRTedCQkLs8aGEzi0FNE5BRFgZJoCn7gxDBck9fvnIYMcPViTxsVHvrVrSmPn
         Bj/Iik9f8Dc2nkQm+kl1G64G4lIaI7ZsrR5Nrv6o6fRTYZ7Y3KhbPOiFxWc2SyQGisNU
         cfkw==
X-Forwarded-Encrypted: i=1; AJvYcCVws7j3em6xmeSss3ytKuIadO4H4fR58Rk4lZeMFQFuAPrEclMcKmFJf7T42Fz6dyF1pGQjphTg0lg=@vger.kernel.org, AJvYcCXWVkLMkK4JThR9ySQWLg33NnW6uDsMp7Ofr9KiTfT5L6WbWYeqo1nD9tJaqCofWiDbfyLKuITMkjLzeV+n@vger.kernel.org
X-Gm-Message-State: AOJu0Yygxa1hI9lojuManVSGwyMlIzuGumA7jbJrK0Sb/bfpbgYeEnKk
	pkhUwMuRAKY9lbI9FCwRO994j8Gbc6KG4SWcy157KCSKTVHY3VeO
X-Google-Smtp-Source: AGHT+IGwetwCqXvv36+SgUec6tmmzyF7k13urczzdeBDsGK/FPZM9wWzm9eMTCI/L76tBdldq1w91w==
X-Received: by 2002:a05:6402:278e:b0:5bf:257f:9ee5 with SMTP id 4fb4d7f45d1cf-5c0891a97f4mr1705242a12.34.1724424166808;
        Fri, 23 Aug 2024 07:42:46 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:48ba:80d8:cf77:1f49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a4c6ce9sm2169541a12.72.2024.08.23.07.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 07:42:46 -0700 (PDT)
Date: Fri, 23 Aug 2024 16:42:44 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <Zsif5NYIu4NR5ZfI@eichest-laptop>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
 <Zsbi2xcxBGE7o9uE@eichest-laptop>
 <ZscNO2PKNlK3ru_7@pengutronix.de>
 <2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3>
 <ZsiTMITWF0Tj3o8Q@eichest-laptop>
 <ZsiXCqNOs0dHF379@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsiXCqNOs0dHF379@pengutronix.de>

Hi Oleksij,

On Fri, Aug 23, 2024 at 04:04:58PM +0200, Oleksij Rempel wrote:
> On Fri, Aug 23, 2024 at 03:48:32PM +0200, Stefan Eichenberger wrote:
> > Hi Andi,
> > 
> > On Fri, Aug 23, 2024 at 02:35:54AM +0200, Andi Shyti wrote:
> > > Hi,
> > > 
> > > On Thu, Aug 22, 2024 at 12:04:43PM GMT, Oleksij Rempel wrote:
> > > > On Thu, Aug 22, 2024 at 09:03:55AM +0200, Stefan Eichenberger wrote:
> > > > > Hi Andi,
> > > > > 
> > > > > On Thu, Aug 22, 2024 at 12:21:30AM +0200, Andi Shyti wrote:
> > > > > > Hi Stefan,
> > > > > > 
> > > > > > > @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> > > > > > >  		goto rpm_disable;
> > > > > > >  	}
> > > > > > >  
> > > > > > > +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> > > > > > > +
> > > > > > 
> > > > > > you might also want to add the multi-master boolean property in
> > > > > > the binding.
> > > > > 
> > > > > We discussed this internally and weren't sure when it was required
> > > > > because e.g. i2c-rcar and i2c-tegra don't have it documented in their
> > > > > bindings. Is it still required if it is part of the dt-schema?
> > > > > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
> > > > 
> > > > The i2c-imx.yaml has "unevaluatedProperties: false", which fill discard
> > > > every thing not in this yaml
> > > > 
> > > > > If so, I will add it in the next version.
> > > > 
> > > > Yes, please.
> > > 
> > > sorry for the confusion, please don't add it. I had a chat with
> > > Krzysztof and I will quote him: "this is a core property, coming
> > > with dtschema, so they dont need to update bindings".
> > > 
> > > He also sent a cleanup to remove the only binding using it.
> > 
> > No problem, thanks for the clarification. 
> > 
> > Should I still separate the multi-master patch from the rest of the
> > series, even though it doesn't seem to fix the problem Fabio sees? I did
> > some more testing today and the workarounds he found do not solve the
> > problem I see, so they are definitely not the same.
> 
> I'll try to review your DMA patches next week.

Perfect, thank you, no need to hurry.

Regards,
Stefan

