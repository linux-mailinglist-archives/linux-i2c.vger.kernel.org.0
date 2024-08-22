Return-Path: <linux-i2c+bounces-5663-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFCE95B486
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4883B1F23D56
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 12:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210EB1C8FC9;
	Thu, 22 Aug 2024 12:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY7SHzWL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541FC183CB7;
	Thu, 22 Aug 2024 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724328238; cv=none; b=nmm61gXOTZnZ1U/YCzhihkxo8Ohs52CoY50tvuVuKPb7pBr8pQ9Z5vF4MrsorkzWRQjmOe9U61fi/HMhp9QQh6B7La7woc1Bz/pGQlsOgh3c0ZUe4cLh86UAX38tMgrdnrhyG3KnRpCf60jBdpvfZdCNRX/akaPyrAgduvlq6L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724328238; c=relaxed/simple;
	bh=/7JxRU4cpPBTZFx1w71DWizOwcTnSWrV3CmQH03IfkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQrsG6kKD7CumoRHLRfVw/yickolivVWEckCzgDxKwiWc6RWfFL/Pv8/E/ORhjy18DXtrg9JA4FvXUDYSuk3MmnLXZUH5xAK8rlpv1fdZ9ej0TJlLo8dwM+yM/yb8XCHLSi9YpxdIJPfUX8APc+9nmIGJ1hHBrMWOWuf+deX3Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY7SHzWL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so5537235e9.0;
        Thu, 22 Aug 2024 05:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724328236; x=1724933036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AY16LwIBghLKS2thXS/HdTgvr57cr8ORfO+2U5rpJTM=;
        b=lY7SHzWLoQJZEBGU6XMZhIDOnG+9qKxc3puCbYG+gKfsbXnFThO7RiUR1eXB0j1mn8
         IbJDwKAO/NAOPbXdqz4oYoME/nDgSwteJyGrOZPwEePoTIPl04+uNfhmLTmARLsNAhhs
         SwBvg+Uv8XLK+CZiAkYlj5aO0ibXtSzqJMAUyw6Au85/bxb5WOxHIzms7HEq0IWaKQHn
         Vsanz5s2LJNpQVdOAekoaIR2qfaKbjI/FnTbkIC7wN2OmCn/vbmEqs+vfdHN8LCh8DS/
         47TPUReQrQ7duEqExN8rERlf5J6Vvc8pknnOa6lDMQxT22y1uljuunEHdrY9WngNTtL3
         GzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724328236; x=1724933036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AY16LwIBghLKS2thXS/HdTgvr57cr8ORfO+2U5rpJTM=;
        b=TVmIiIeFDGFRZ/C16/AEW0JHTPBSCJ0lNbcrGF2/Rxn6AkrExETy1bHU2YIQzeoVXk
         LJ5Q511dffpXLhyJ111T7Pmtix9HsUkmdOXr+5G/pJ1ty1KIjSEKlOFV4LGCluh66F9L
         eVIAvDIqa2aGvZryO85BD1Y4ocvoH/xBcq2DkyysWrpDDukGwsaZGoaUoW5Q2XF9VsuC
         mEGb8MjPNVhFMR2dvvo+MB+4DABm0rA6dxkPVIGnIbg5bp0szl9e5+Pd0VTm1hSgvC5u
         TsFFC6Fxm6rOYxet4KtU7fY49Vr3pWBgpG0Rd9Ys+Qe85r5ml7Gj/UaufSO8jfHNaDD3
         RPsw==
X-Forwarded-Encrypted: i=1; AJvYcCUI6wDbla3TLFqBVYjv9cQxH2QS1QaEoiPWd8NMbyjQ5kk88Ibec24MMgGccJUuyOfdddCdWaKIQLk=@vger.kernel.org, AJvYcCWvFs6othLPOPzuoFpJZL8ClJkTuEB7U5u8mqoGyAdTv586bfMqL2eyvq5mM6EWNYUqby+wOpcacLz6Ie3/@vger.kernel.org
X-Gm-Message-State: AOJu0YyQxxFAAuqaSiYMM7QSW4avcLFHOsjhoThcKcn/oQ7eNAUWqS3D
	Fjl2LCBHJ+7r9GtEEOkzCFFOokeQ0TGHgvpXaS0PrXBQurR8AXdt
X-Google-Smtp-Source: AGHT+IEFxPFmRaY+PNp14y1u8ekMx5ha3DFQw+w7+iWj6isuIlJVoOIiRVhai99HMnCgTpLp5x6Kjw==
X-Received: by 2002:a05:600c:310c:b0:428:ec2a:8c94 with SMTP id 5b1f17b1804b1-42abd11e2famr45807665e9.10.1724328235478;
        Thu, 22 Aug 2024 05:03:55 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:daa9:644d:3c2:44bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac51860e8sm21974725e9.48.2024.08.22.05.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 05:03:55 -0700 (PDT)
Date: Thu, 22 Aug 2024 14:03:53 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <ZscpKSzdYklxIkjZ@eichest-laptop>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
 <Zsbi2xcxBGE7o9uE@eichest-laptop>
 <ZscNO2PKNlK3ru_7@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZscNO2PKNlK3ru_7@pengutronix.de>

On Thu, Aug 22, 2024 at 12:04:43PM +0200, Oleksij Rempel wrote:
> On Thu, Aug 22, 2024 at 09:03:55AM +0200, Stefan Eichenberger wrote:
> > Hi Andi,
> > 
> > On Thu, Aug 22, 2024 at 12:21:30AM +0200, Andi Shyti wrote:
> > > Hi Stefan,
> > > 
> > > > @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> > > >  		goto rpm_disable;
> > > >  	}
> > > >  
> > > > +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> > > > +
> > > 
> > > you might also want to add the multi-master boolean property in
> > > the binding.
> > 
> > We discussed this internally and weren't sure when it was required
> > because e.g. i2c-rcar and i2c-tegra don't have it documented in their
> > bindings. Is it still required if it is part of the dt-schema?
> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
> 
> The i2c-imx.yaml has "unevaluatedProperties: false", which fill discard
> every thing not in this yaml
> 
> > If so, I will add it in the next version.
> 
> Yes, please.

Perfect, thanks for the explanation.

Regards,
Stefan

