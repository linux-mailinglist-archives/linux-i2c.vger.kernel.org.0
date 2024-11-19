Return-Path: <linux-i2c+bounces-8066-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D99D30A3
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 23:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13C902838A3
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 22:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153E31D1E65;
	Tue, 19 Nov 2024 22:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARQjcvwJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6008420ED;
	Tue, 19 Nov 2024 22:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732056373; cv=none; b=D7c4PE1+VThhNJjBSZD8gsh4anslsIWLeVCZFKDpSjJIS/I1s529TO2wvlFPzW+1SnZ2QnxQoMq88vSpKSsMUSkp0F18VHsH9ejvFhpBn4UI24nCBMXOAZtmvQwPdm81AB1a6kAyVdwnQoIuEB9Xito4QV0ke1UVHqLUG1WIQeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732056373; c=relaxed/simple;
	bh=YEh/ER3S/fhvGz1QCQ68KNqN1Uqk6W72WfVce2TuzJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afotcWzBu6SJTht3h4kQRGjPFnrvRye2XdZKKiCaOy4V1rl1hwnGuCd+fpotiD9jjrzq+O0LLQf1zB5aCTRlkabN3gTip9+Y07//i2QXfB7HBCm8iKacnN/ezubCSbpevZk3OplIw+0+OUSJp2hK/f8vKuvkR6/QywLrGmGHOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARQjcvwJ; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4609b968452so40094541cf.3;
        Tue, 19 Nov 2024 14:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732056371; x=1732661171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFlvZUhBTVG/QjGIG47CN+zwdKjfaq1hUpC4OSztlJc=;
        b=ARQjcvwJZYD9e+KfbGBwGsrwz+CAEwapgPFP5gAG/nnI+BriXQuKmyVL68q32lkaED
         yx8Ea8qwDMUDkNdabDwc/JIwrPb8b3BIDNvw4EPj8dAENdb5pMclpYzxDqIxamcn6XXx
         /44ofenqzb+SWJmi4cpZQKuL8ZXcX01E7pA3p/cpSxT4b2Cu03sDySW5y1YWO1mbLt/1
         Lq+iFm7hRFY2jFpEJGFJvUa+2sWLO1n3i3BuAL+h0p05e9SDPafyrliMxNpKa1VDIA5j
         GVKU/RFlTEA61VvvaS79zZUsG9OKYX1nVxl0i0GKxAnfi6QBjqjJ6gu6+RMacb13vIOG
         wJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732056371; x=1732661171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFlvZUhBTVG/QjGIG47CN+zwdKjfaq1hUpC4OSztlJc=;
        b=qWlnVdfx7vcPDcuAcCtyurp8adS+vllFxf6k8OteQ8fxzOT/VXWZohIrCB+F/CJxdj
         RnG0umIF5WPG/0kD4GZwTu6n/XrSzpY8+c9uYnM6FxHgWRRg5YfcAo+tbRUnXfjN68Kb
         OggPaeyvBzTw+xXCOt4IyR1kY+ll5J2qvbP91bay4u6ikW0H3e76IWsUh/g4iaW0Sm4i
         CvrgFHr97vXRMTdBcnrQpVw3ryOyqVHDK8y4VA+P8S14I/tlKtDXpzd1qdVS7wLPUAbe
         ugdu0l8iHjzY6rRupPT4lMD3UHTgNKSSwnUM33z4z8RjNTlpSGWZvDklRzZDUeqObcAo
         VEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUernKcDk8ukBCdKubxjaaDYwK65Yfpj0VPgEbQUnNcXVHCJ6eXHo899I52v7ndMgZuKBh9EJ7iIyA=@vger.kernel.org, AJvYcCW4knEBcskTQkZRUX5btWiq4jzibkYtbHZSQM5GxUOyy23hS2HaeUsTWlgtjYcHVyEPTzHwy7F6CBuGlfiN@vger.kernel.org
X-Gm-Message-State: AOJu0YxgoQfiuNc86/XsLWigHxWne+Enh5sME2GMXyqZcBQtXybtE1u+
	Wt2HoNSRM6KDKCzLCnUjbVoPp+TygCetha+BxJhk2bIS/75aitzJsqyoJclhmZBeAkR83dPEKzN
	1nU2GrSNXQz9dr+/STV90OcJx8cs=
X-Google-Smtp-Source: AGHT+IFftTaj4R1HHwo/Eur2kE1kx/vORWSc0ROFajcQGqwuxJIqnWmgNQ2EMXfRCVrM+p2dKLWz3cRFX0pW3nWlfJA=
X-Received: by 2002:ac8:5e11:0:b0:461:41cb:823c with SMTP id
 d75a77b69052e-464692a1b68mr5307851cf.0.1732056371312; Tue, 19 Nov 2024
 14:46:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107211428.32273-1-jiashengjiangcool@gmail.com>
 <20241107211428.32273-3-jiashengjiangcool@gmail.com> <zd5673eo7kqwg67lsy6h3m4zdpmgp5xzhr355ialwx6zhdopfb@7x3v5b747sqn>
 <CANeGvZVibHOsqdD+zw_u2yswJdvUu=Ssep9eWeAOcqmg6J-zqg@mail.gmail.com> <y4xv4lduinhjbhzt64erjw3er5w3s2tcwzjxxdknoudaefupxq@fbqf4esensnk>
In-Reply-To: <y4xv4lduinhjbhzt64erjw3er5w3s2tcwzjxxdknoudaefupxq@fbqf4esensnk>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Tue, 19 Nov 2024 17:46:00 -0500
Message-ID: <CANeGvZXnu93tXowfOn=+3H0-=dEYuwBOkjytcuMH1m6yxGg9pw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] i2c: rk3x: Add check for clk_enable()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: dianders@chromium.org, rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, 
	david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, wsa@kernel.org, 
	manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Tue, Nov 19, 2024 at 5:03=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Jiasheng,
>
> > > >  static u32 rk3x_i2c_func(struct i2c_adapter *adap)
> > > > @@ -1365,9 +1389,12 @@ static int rk3x_i2c_probe(struct platform_de=
vice *pdev)
> > > >       }
> > > >
> > > >       clk_rate =3D clk_get_rate(i2c->clk);
> > > > -     rk3x_i2c_adapt_div(i2c, clk_rate);
> > > > +     ret =3D rk3x_i2c_adapt_div(i2c, clk_rate);
> > > >       clk_disable(i2c->clk);
> > >
> > > you can't disable a clock that has failed to enable, right?
> > >
> > > BTW, although I like this patch (or at least I don't dislike), I
> > > still want to check whether it's wanted or not.
> > >
> > > Andi
> > >
> >
> > Thank you for your advice. I have carefully reviewed the patch.
> > There are two clocks: "i2c->clk" and "i2c->pclk".
> > The "i2c->clk" is enabled and disabled in rk3x_i2c_probe(),
> > while the "i2c->pclk" is managed within rk3x_i2c_adapt_div().
> > Thus, the "i2c->clk" has already been enabled at this point.
>
> yes, that's correct, that's a fast review and anyway your patch
> doesn't have anything to do with this.
>
> BTW, did you have real failure experience here or is it just
> speculation?

Currently, I have no idea how to trigger this failure.
In fact, I only identified it through static analysis.
However, I believe adding a check here will enhance the
robustness of the code.

-Jiasheng

