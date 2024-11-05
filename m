Return-Path: <linux-i2c+bounces-7790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CE69BD248
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 17:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EFBB2841C6
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 16:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573071D5158;
	Tue,  5 Nov 2024 16:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvMzAnkH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A655417E918;
	Tue,  5 Nov 2024 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730824016; cv=none; b=IDMikczXGl0S52nUrm6kNwvNGDXsLAAEmbB5pd8vsCAUFrUJmAdRv54CuYeyk/5T5h9IlurXFKb2n3uwcT9PaV021wjyJVVHLUk5O4xECi0j6gChz/bQ569tzCHQaJ5jHcmAuzb1ScUSIvOL8u/hitLxpDlTkXOlDu0BgIQxBzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730824016; c=relaxed/simple;
	bh=JVCgDCqfemjeWBOqtNlZq89SrwjUpO8HziLAQJv74vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+Ob615ByZqJ25NPp/O7Ql13zwRMrzNPhaATkl4u8T7/sQeoB9s98uqwP8BtJXJy8ZkftOEpr7pXWO/NJd8P7oVP3aGWydZAhrYg+7Rh0Aa23XgztOAvh0PyDK0LEMREwXirzwilb0TFGMz96s9w4x8imYUyJmvm2e+rUVBjbxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvMzAnkH; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-460c1ba306bso38306641cf.2;
        Tue, 05 Nov 2024 08:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730824013; x=1731428813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDbwmIuBhshERCXYSkPhenLd2Mhjkk5MhETyYNbkb/Q=;
        b=WvMzAnkH0cxoGll2MidJo6owgzrt4mFLF0vB83BjTx2ZonPE4YJ04hmtAWRQXhFz6y
         hx5z24PvBquTUtqNwBAtZuwhGeDevqtjmxGXg62iHI0vXaNViFrZNFQnGVWutKLruyEo
         3y7xtcRZnp2D4C0cG9l5OmXxE0NRRHmWIpPEIGtMgYV2ItU7NIoh0ov/Ga0qRncek1Hg
         NqzfmB0lB9meJW84AO/wX2hLKEptayTAMCHCBR2JdUofKT+14B7WrV8onfUpgPipDmM/
         C1F1yl4S4HrY9bNgCGITLiZ11nKRVwAH9cXkJnTlUjtQ70rl/mzKJAhLk5CvJJglir9M
         Cqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730824013; x=1731428813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDbwmIuBhshERCXYSkPhenLd2Mhjkk5MhETyYNbkb/Q=;
        b=We81cGPGPgKE/uG9/YseBuFHv9FX1M/p0v6e1ScZDCMLeSlg2ir/QMN7af8OfMLcA1
         3XOr+3lGYCHu3sxopKAu1/kdunCxcPHrusMpNBxesC8+M4arKw3EXnrenf36RLEJLJxn
         BDJSwHRpk4Ye6K1HHgRx6TQRX+ANGmXkBswmROfYcW6gievScMNcmrkmsoK7D64YHuqQ
         LrLyEQQax2FlyMQxJiPus+ThiII+lEy4JulAjCa3ZTJMIOfxMMg2ZiOxfbqmbjMElx4n
         wR43DneMI0MyoOnCOHXRFXlaoa5Yx5iyrJcKDregRzZrPuYrs/yvCMD6AM+V/mgh4Mdx
         FsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0zJtIwcUchGfn8ULieu4fycBn99utO1hsvLmj0UqZpruFMaw9i7UzR/Ky/4t+q3Yut7+Ke5JeyLt0rSqK@vger.kernel.org, AJvYcCXz1GKnSHwsp74v5mAhaZ7ACQoDLEz+K/fZxn+2APnmyyVmLmIwQ0UWSagzJUFmu0b7Asx0nMuzZbw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywww6j+1PEQtQEEDHQuVyxP6GWclD2Ybcc12a9GMDW6GiFDdszm
	EIg9FXo8LL5Yq84oaOv+mpzo+dWuuvzJOusVnaJ9JTQ7rTsdFQO4gRjJpuV8Dw1yp+iPo1BaTEy
	L/Ep9JBj/skFa/OfOnQHzjL+7fg4=
X-Google-Smtp-Source: AGHT+IGJ7XLtWYJje82bhRsHQKoOCawC7fDCWpQbhUa9IlTL2mavUPQDVtWKBU6r3gqBrgHI32tivQiaz5RCybz5S4k=
X-Received: by 2002:a05:622a:1446:b0:460:9b2b:e8b5 with SMTP id
 d75a77b69052e-462b86536b2mr197191941cf.4.1730824013485; Tue, 05 Nov 2024
 08:26:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
 <20241104214310.6048-2-jiashengjiangcool@gmail.com> <pyutqiut5yascxkwrv5ozrwdbmb4k4n2vu5jiia3fpgkra4up2@u7nvqpdscb4n>
In-Reply-To: <pyutqiut5yascxkwrv5ozrwdbmb4k4n2vu5jiia3fpgkra4up2@u7nvqpdscb4n>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Tue, 5 Nov 2024 11:26:42 -0500
Message-ID: <CANeGvZXsw-93j7YrHd=aa4bWCLioE-LbT5kakc9gjeHCK6O+qQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: pxa: Add check for clk_enable() and clk_prepare_enable()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, dianders@chromium.org, 
	david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, wsa@kernel.org, 
	manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Tue, Nov 5, 2024 at 9:13=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:

> > Add check for the return values of clk_enable() and clk_prepare_enable(=
)
> > in order to catch the potential exceptions.
> >
> > Fixes: e7d48fa2b5fb ("[I2C] pxa: provide late suspend and early resume =
hooks")
> > Fixes: c3cef3f3c07b ("[ARM] pxa: update pxa i2c driver to use clk suppo=
rt")
>
> I don't think we need the fixes tag here and nowhere else in this
> series.
>
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-pxa.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.=
c
> > index 4d76e71cdd4b..1118a7f5c6bf 100644
> > --- a/drivers/i2c/busses/i2c-pxa.c
> > +++ b/drivers/i2c/busses/i2c-pxa.c
> > @@ -1503,7 +1503,11 @@ static int i2c_pxa_probe(struct platform_device =
*dev)
> >                               i2c->adap.name);
> >       }
> >
> > -     clk_prepare_enable(i2c->clk);
> > +     ret =3D clk_prepare_enable(i2c->clk);
> > +     if (ret) {
> > +             dev_err(&dev->dev, "failed to enable clock: %d\n", ret);
>
> please use dev_err_probe here.

Thanks, I have submitted a v2 series without the above problems.

-Jiasheng

