Return-Path: <linux-i2c+bounces-1485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE383E44D
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64F432860D0
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D1B24B3B;
	Fri, 26 Jan 2024 21:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LG52CtNc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A051CD34;
	Fri, 26 Jan 2024 21:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706305978; cv=none; b=JluaPOS2k9V+flsqVM9zyWEkK7eOvMHrlWZxQU6jfUQMompfGQtlB48KkvsL3zzeN/zUUD2YUSkxUSZjhoUCNkhTP5TwIGN9ulvPz6AK3imKRZ2WyiwliRR40yG//ZDfb/blKejqf8V5QckoOi980mLUzlBcmNXEpPXuRRwNJOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706305978; c=relaxed/simple;
	bh=UiYEGeSKvmD1AptgnorZy5fQNkEfpWdosA24Vbe8h4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mq05rMIYnxCE89wNBsqGTCY1lVd8m+1j5ZgbpPo8VeQbyIJohyLO9cSuxGzoEcXaOQSNl1w7qIiS7dpaYMRA/Rx3qjaTNnVWSDKZmdC3xFJMIL8KC69ngS9kH5wG58Oi70OH6kGiCmEU+M7Pf8Y4ce+4EMPhKAk7nuBzHVzUTiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LG52CtNc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40eeadb7151so3351875e9.1;
        Fri, 26 Jan 2024 13:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706305974; x=1706910774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwCn1j7lcGKWVrBf99kL7TfgwgawY1TDNPn2McRxeCs=;
        b=LG52CtNcU7t9JG9W2hcxNLhAias7mth8QQwG13lLU/YxzyrVZbNMz7oCr4NuDHTs8D
         zwzGFHaycj0YurMsnOTBTRRT/90lEIhBqrMuajm0karAyVbN114tBRpkHVQMTZ+TToSn
         NUL5XgEAHZtcTQPXR0HlsJRXyC9eAstLP3DUAOMUT0DvnzcvN+oanPaFPNYjxdWGXXUo
         fhrhykqDi6c11ffWa6vRljPCCgSwRsEqIzOF22igRex6NncfZ2d0tpc8FDvYsXAsP2KQ
         XpTCc855Kk59k3lqXc7hZG3Fj/WiJkm4GcT3KngRmHhQ6FU+j/OXdZ858wgMjl/VMieK
         iMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706305974; x=1706910774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwCn1j7lcGKWVrBf99kL7TfgwgawY1TDNPn2McRxeCs=;
        b=mPiGBRuiLYr+KmnBalS7X8tahmVsVDgz4yHurwjt+P73oaWZyLjc2Lpg5ibb8sesuE
         mu8MvDn0UgaB802rlMm7bjnHUnFp2TyUH1O7DbvcllSxUiWimnsh0LzszqexM8/kQEKa
         TfoSaZbl6b0KVE3lsZcFFSCW7mHxsFCcShRLQlE4+bkoEGvwu5kBvTjCJB4tPercPdpv
         AKNx0yoF3bYKbWdDDHnjIIrT2lig3O7+Dq/CG9X7eToe2qAd1NCKR1OknmqbkOGh8M+c
         m/R0TIeOE0+vEHsIJQr7b2PDOHZtT49M7nDd8V2RHu9rXHisbm7boHVVVd+BmCU79APi
         ScGg==
X-Gm-Message-State: AOJu0YwfGrevBBbYgllFcMJPi5y1FUObtrDnHIhzS0ojudBNyIo8zg5R
	F12/uB+weIUyWF+KRrs0dc7wBYi/DDVuWVyfzcGbOWx24oW6Rep+5UcrSXSUJUugf30V60FTQ7h
	mXfhn+czzXGbe4TQaSSKY0S4F0jA+TX9uQ3o=
X-Google-Smtp-Source: AGHT+IE3SFA0KCMxm+4oSxONJ/cUqn4ELR89+v7l0jha8W5oz2rXn+Wjpw8sRwRY94Be8UqpZqINDwOAhPfYMYSbD6I=
X-Received: by 2002:a05:600c:43c5:b0:40e:becd:d5eb with SMTP id
 f5-20020a05600c43c500b0040ebecdd5ebmr312299wmn.185.1706305974596; Fri, 26 Jan
 2024 13:52:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-14-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-14-8e4f7d228ec2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:52:18 +0200
Message-ID: <CAHp75VdTPFKgvBqoNBe55LoqPyAY_EDpCZT30qWuGDNvPJgA4Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/15] PCI: j721e: add reset GPIO to struct j721e_pcie
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 4:38=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> From: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> Add reset GPIO to struct j721e_pcie, so it can be used at suspend and
> resume stages.

...

> +               pcie->reset_gpio =3D devm_gpiod_get_optional(dev, "reset"=
, GPIOD_OUT_LOW);
> +               if (IS_ERR(pcie->reset_gpio)) {
> +                       ret =3D PTR_ERR(pcie->reset_gpio);
>                         if (ret !=3D -EPROBE_DEFER)
>                                 dev_err(dev, "Failed to get reset GPIO\n"=
);

A side note: At some point would be nice to see this being changed to simpl=
y

  ret =3D dev_err_probe(...);
  goto ...;

>                         goto err_get_sync;


--=20
With Best Regards,
Andy Shevchenko

