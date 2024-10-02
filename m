Return-Path: <linux-i2c+bounces-7189-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33398DC8E
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 16:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE6C92815D1
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 14:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5141EEE6;
	Wed,  2 Oct 2024 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yu/cu3JZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6E81EA80;
	Wed,  2 Oct 2024 14:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879771; cv=none; b=kN77rL/WKINMJp/BYRMj0IFkThmMrf6R2uWZX1DjXx5ggebNyQGJ2bdSQ5vmFZ1W8lM4CVo4ryhyLUozOOZApj/cf9/gjMrVeluIYoE7NLtsEc+B5oZ2TGmhPLRGV2asHdfgSg9hENuppKYgqMlV6Swgnm14sApCTIS1+pG2ZMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879771; c=relaxed/simple;
	bh=rAm7s1zqbKAlOWxaTEL993+VFrvSzpI1Q4YD+zzwquo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reKIC0MnF9GsnaHNDBqOkL6veXpC63OPKsznlLC+H28F62uoyt7ZxqWAhYPEtm5vD4TzVTuTsMAqerb9yE7jw98bMCIdMameQ6+HOzRreB0F2Ub83FxYpc2/Re6fC4IpZUs6UBcm0t3N6+MJ5RDiSQ/h/yUMESvoC5YPniuEa7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yu/cu3JZ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5398e3f43f3so5035266e87.2;
        Wed, 02 Oct 2024 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727879768; x=1728484568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYBnqtvGiQjaRMTgNULW741gmtqnFsMn0VCfba+rg+A=;
        b=Yu/cu3JZEZ8Rkexy6IbA9n5NphCzlq1Kfy5J9zsODyVdBnTjcDm71TlNPLO4dK+ex2
         4X8IKNYpkyYY3dv0uSBv2c9IDXTtOrXW0FN1RTCRSNOs143yA90L0C2B2IkXw3mTWPai
         5JCF+MK0m/QKoObHcksfS0y5N295FD/iQumpUzWnQKJxY4p0AidSPzrlGp07WjlxGoMr
         CyJVl9Yoy93tMSzB5xtlYoOXQSA6bEuyLRkosLOCjgMb7StFCgYAr5g3+pMvJYdB5z6c
         X8nr2x264fbN1o3d3ExjL73SEvq80tZn6dKbKCn6iYA7zsBgca1iOO5MTttlN4MGGw5D
         nElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879768; x=1728484568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYBnqtvGiQjaRMTgNULW741gmtqnFsMn0VCfba+rg+A=;
        b=RNvCoUDElP0bzJt34qwCWa0zfg3Ah8uVG5feOsKid3DQpR3d+FVxSQ1Mmxj7gGbstd
         cdUI07q/hJF2mwFwfI+pCBIEIXHpH5gGO0d16OJ+NZhAfDTC0BojBc1xsVbDaG/0hAz4
         F6nScxoJwHOwTIAzGiX/PfBs9G+KR46AlFc94UKOnyGEQwBcFZrHo7Br0eBD7kP/qxFn
         BjaKQe3caFTHVGIKDfIqsUDjT51cKKwII/a0YfwtFn9j7T+hbEkoNfyYd65fU5dGFZpB
         dy8LE+wrdwygoMptX6zB+qJq832KHHpbQPKnv50MefJq6GerJQsUqLWR6mhcgsM7l+35
         zrKA==
X-Forwarded-Encrypted: i=1; AJvYcCXcNY54QIj3rlAskyhucc85z7ZBIoMTLp9bBKzVhVbhxDIeJZQmlEqBnTtDU0Gt4UpIFZ3NRE8zTZ0=@vger.kernel.org, AJvYcCXsM2Av0ES463MFnK0uA6JzZbO3aw69pVGqr/wo1/RLwoLW881F8Bp3mRODtkBbMkYkfdHjmdW6N0J8hAoN@vger.kernel.org
X-Gm-Message-State: AOJu0YzLNJly2GkDDE4txG56HKEuRewW6dJw698m002Hjexq/2bHLY41
	RgRwA9Ts+aAS8tXMrHtKxoJq7UKDMBkaC9R6IlEYhd9JRW8NHaOG
X-Google-Smtp-Source: AGHT+IELBe44nDd0xVmrlmK9UvO9iyEJQmLMZHrBr23Zi+FleF6chln+t/rRwOksZLaeO0i19LgsDQ==
X-Received: by 2002:a05:6512:31c8:b0:52c:a5cb:69e4 with SMTP id 2adb3069b0e04-539a07a3603mr2013252e87.54.1727879767296;
        Wed, 02 Oct 2024 07:36:07 -0700 (PDT)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79ff460dsm20084135e9.32.2024.10.02.07.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 07:36:06 -0700 (PDT)
Date: Wed, 2 Oct 2024 16:36:05 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: o.rempel@pengutronix.de,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Message-ID: <Zv1aVatIlToneign@eichest-laptop>
References: <20241002112020.23913-1-eichest@gmail.com>
 <20241002112020.23913-4-eichest@gmail.com>
 <6b070948-cf02-4f13-a220-0f6cfa21c41a@app.fastmail.com>
 <Zv1FuHlpeayZq-Zv@eichest-laptop>
 <a65ddcab-4ba9-4dfe-93ec-352b31845eb4@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a65ddcab-4ba9-4dfe-93ec-352b31845eb4@app.fastmail.com>

On Wed, Oct 02, 2024 at 01:36:04PM +0000, Arnd Bergmann wrote:
> On Wed, Oct 2, 2024, at 13:08, Stefan Eichenberger wrote:
> > On Wed, Oct 02, 2024 at 11:51:22AM +0000, Arnd Bergmann wrote:
> >> On Wed, Oct 2, 2024, at 11:19, Stefan Eichenberger wrote:
> >> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >> >
> >> > Use the relaxed version of readb and writeb to reduce overhead. It is
> >> > safe to use the relaxed version because we either do not rely on dma
> >> > completion, or we use a dma callback to ensure that the dma transfer is
> >> > complete before we continue.
> >> 
> >> I would still consider this a bug in general, you should
> >> never default to the unsafe variants.
> >> 
> >> If there is a codepath that needs the barrierless version,
> >> please add imx_i2c_write_reg_relaxed()/imx_i2c_read_reg_relaxed()
> >> helpers that use those only in the places where it makes
> >> a measurable difference, with a comment that explains
> >> the usage.
> >
> > I added the patch because of the following dicussion:
> > https://lore.kernel.org/linux-i2c/ZpVWXlR6j2i0ZtVQ@lizhi-Precision-Tower-5810/
> >
> > I can't determine if the relaxed version improves performance. The
> > 'normal' version worked well for our use case too. Therefore, dropping
> > the change would be acceptable for us. Another potential solution could
> > be to use the relaxed version only inside the ISR. Would that be an
> > acceptable solution? What is your impression, Frank Li
> > <Frank.Li@nxp.com>?
> 
> I'm pretty sure that Frank meant to use readb_relaxed()/writeb_relaxed()
> inside of the FIFO access loop, not for everything else. This
> makes a lot of sense, since the FIFO read in particular is
> clearly performance sensitive and already serialized by the
> implied control dependency.
> 
> If you can read multiple bytes, the best interface to use
> would in fact be readsb() or possibly readsl() to read
> four bytes with each access.
> 
> It appears that you did not implement the suggestion to
> read the entire FIFO though, so you can probably just skip
> the _relaxed() change entirely.

This makes sense, it appears this was a misunderstanding. If no one
objects, I will drop the patch in the next version. Thank you for the
clarification.

Regards,
Stefan

