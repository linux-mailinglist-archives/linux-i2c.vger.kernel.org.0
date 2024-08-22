Return-Path: <linux-i2c+bounces-5645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF06895AE64
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 09:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E6DDB22AC6
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 07:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB0714F9EF;
	Thu, 22 Aug 2024 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXg0flRu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F1C13A244;
	Thu, 22 Aug 2024 07:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724310241; cv=none; b=fUxGEIS7FQVD3CcrWqf4K94FL0sb2QrttbBoQk6yz5KqxCe5o/GjovgN8flCJOEB2nm3JsiVaidfryej4qusCSN7Df4Oq1AtYwpFJKDahpLLEq7NMq4dmsFrTEZEht61Rx3PAGSogl4i4d5jT/0Cypr+fBdyjMklodO26N4N/XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724310241; c=relaxed/simple;
	bh=nCCjJe0NO298qZPYGd28WFSkU7iQ94z0usdgpghLI1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcKvw/Lavd52ZcfeiSTiHPCRrt4+LjoS2yB0HYPDr/Z6d2hzPr+2XSuxmOhF2/S0jEkeYcAYD6SaFcBNsgpPiF6L2SgFr3aIBgjJDKI+yHbk03eGWFgr4tt1pCwVSuUTLuW+5Df7zykQPXTc/sdcLKWhbrTbLqVFXWgkTIh20rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXg0flRu; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a868b8bb0feso69091566b.0;
        Thu, 22 Aug 2024 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724310238; x=1724915038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ykeo+6OejcW3LfPIwBroCbu3h8SlZxm1Q6n/Z4Ckav4=;
        b=EXg0flRuCf7Ylrc4X9gRdp0STK/r5/I3rHaUz2Me5NQH9gMsfV5JHi/xZOo6FAAV8r
         +Ns3rf0OcomfAmuGE2aqxqpnqRKD0q9W883NXWGYPGA2pTWzt3ziGLoHWoLn5TRqg2gV
         w4N9VxJZ7xYkebnQZG6P6tghRgvTQaoP2GpfFy+iMFsi+ykm7Mg87Wsvy1Nta12VJg9N
         U4WSl7SNF6FZ5WNqQUdUW3ibvMIxQUb49l32zPoQ62CFOKRWrUa8tbUjNKc1kACGlCnK
         uq/SuXynchfBq+rqy8XSi/CMVsegxbq1uzyclgZag8oBFs0p3sqaXKygX6NRwYPHlLkm
         BfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310238; x=1724915038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykeo+6OejcW3LfPIwBroCbu3h8SlZxm1Q6n/Z4Ckav4=;
        b=ale9MrjGI7X2T4+q2Qr6TqtqnzqRbMImulQ5J0UUTpbqf8/2Iay0n7/YHsOj2gS6iP
         n7+Mc+ZlC7q6GR9cGsdBxoLsrzsPVQUhOjG7cu5rTt/xkPNO7Fs0qglmnV4oe2GUnYKa
         3b1V9oFLPYTD8/K2pl1DJNgTp+SH2y6rGL+xg1kYiWu1T7WuFTEB5gflp9/1rHRa7qqY
         MWdb49E2I2HNc5YWwHap6rgBbujXkcCxiCO1GRjTqze+3Mmp4PG4srSRxvcrNp/VLOvl
         IkS+d0C1k2YBP7mickMjAvBI4iCr++E3RIAM0ys92HQyGG+IEb6BcrUXq/7CBa7CAJaS
         /2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbCf/XKpFbw23wD3APkCp7sHd10TX9ioQjLRsGBDrQMeN9Wk10BrIPtZ51Zj9bKv/svTQf0z8vtKw=@vger.kernel.org, AJvYcCXw6MQ4n3sv7MMysfmc7wnRq0Xay1fgpOOaEcx+nIibQarfA0MdDtgN4fqlQjyHLhtQ3iuB7QnwlTwk3Mev@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/nC3ehQTubwwb9etw4B3CxH4wjHRY3nkP9uUIAEipdb0YS0W
	OfdEipmllOCafgps6KlD1hS7hpiT1Hu/y5L3wjVGUk21Lv5aggD3
X-Google-Smtp-Source: AGHT+IGSsNf36l7LH2UrwwyDGt/7XMjWeoEqpb8pclMdRI6cqXUAmy7bZ4Hd98389PIbKXU7Hl9JnQ==
X-Received: by 2002:a17:907:968e:b0:a6f:4fc8:266b with SMTP id a640c23a62f3a-a866f135cccmr290948966b.3.1724310237810;
        Thu, 22 Aug 2024 00:03:57 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:daa9:644d:3c2:44bb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f436ccdsm72186166b.104.2024.08.22.00.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:03:57 -0700 (PDT)
Date: Thu, 22 Aug 2024 09:03:55 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com,
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <Zsbi2xcxBGE7o9uE@eichest-laptop>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>

Hi Andi,

On Thu, Aug 22, 2024 at 12:21:30AM +0200, Andi Shyti wrote:
> Hi Stefan,
> 
> > @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> >  		goto rpm_disable;
> >  	}
> >  
> > +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> > +
> 
> you might also want to add the multi-master boolean property in
> the binding.

We discussed this internally and weren't sure when it was required
because e.g. i2c-rcar and i2c-tegra don't have it documented in their
bindings. Is it still required if it is part of the dt-schema?
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml

If so, I will add it in the next version.

Thanks,
Stefan

