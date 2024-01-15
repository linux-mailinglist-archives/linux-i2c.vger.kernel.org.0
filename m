Return-Path: <linux-i2c+bounces-1320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FF82E131
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 21:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E50D71C221E8
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 20:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BDF19475;
	Mon, 15 Jan 2024 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHu8vTJP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009EF1A712;
	Mon, 15 Jan 2024 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a28cc85e6b5so1085481166b.1;
        Mon, 15 Jan 2024 12:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705348959; x=1705953759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fv9XBLOpYPAupVH4VJlqIAgoTeB9qFyrwGApny5s9n4=;
        b=PHu8vTJPRE26Zt5pCNgDk+i5OJ1KW/fJ2GIvRZ5MTnZj3EQRhmOVYmcGhcLXD4lZ6K
         bRq/X4YELInOL3Th7K+zQXsMrVBjuxuWjofZOVQTB22J0dAAhQpxXj2pJSXDb5b092fn
         eUjp4sOqbzbN/Vx85hSZbAOtP6YF48oTg5gaTulmZyoLKra6zoLFE21qOuNo2B0TQzJx
         l12pRoWPmfLDURSf71+RSgU8K4ndWBMIHDNWUE4HuTb+FFh2eOJE94FSjWd6vXhWc/NQ
         5nctcAi/tznlnUJQXFyhj7sha0tdPNS2jDuZ1geaHO/P6TUVxieuWwGJSOLIxhKxvADk
         GKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705348959; x=1705953759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fv9XBLOpYPAupVH4VJlqIAgoTeB9qFyrwGApny5s9n4=;
        b=UgguxIvuIzHcLGqM29HpTPMSjJw+D5b2i6z92ljHY57svtsDwOYMgBalFBYehURJkS
         UX8q0+C2SomysYELY38PXxTqg0jwep4G4wmjBLWRk4/lOkmQJZTTVgwYmOISb2NWS3Ij
         e1PvHzeRRPgQumHaFHekMtdOrnhMT0n5U97+BLVNBIrauCb4LxLK414lhCkuDg9vsYb9
         PRGgUNn6IHabaEj9A+xlzwHJD2HDiApEegTMZoSlyrd9FTNcx1BmXc+JnzD+0Q+kHcj6
         t3vIU7bZkouM7WW72lYyZcJjIboCWfSvwB4+ljF/2QHEidgG6Bga1lvZ3pSHSWpRgPLA
         CwSA==
X-Gm-Message-State: AOJu0YwmNMapzYQDDzrao56vlmcVHzTi8rCaA7C9oaqk+qdrTN63XWoY
	WfIAjskIJ3VmsxtAdIHM5/8fV6X4jQm09j2YYeA=
X-Google-Smtp-Source: AGHT+IFGtkui4lng3GSiRYoHvFlRcvlu7L0C2EI9PWrxqxFGpBJHPQ/cYp9p96ExxQEDsVPdlsgZU/bzCs9OSzxXglE=
X-Received: by 2002:a17:906:b053:b0:a2a:7404:cf5d with SMTP id
 bj19-20020a170906b05300b00a2a7404cf5dmr2017687ejb.114.1705348959235; Mon, 15
 Jan 2024 12:02:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com> <20240102-j7200-pcie-s2r-v1-2-84e55da52400@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v1-2-84e55da52400@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Jan 2024 22:02:01 +0200
Message-ID: <CAHp75Verff06LE0QFaDRoun=ANpGfVU1tHknvvQZd_KyzLVP5Q@mail.gmail.com>
Subject: Re: [PATCH 02/14] pinctrl: pinctrl-single: move suspend/resume to suspend_noirq/resume_noirq
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

On Mon, Jan 15, 2024 at 6:16=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> The goal is to extend the active period of pinctrl.
> Some devices may need active pinctrl after suspend and/or before resume.
> So move suspend/resume to suspend_noirq/resume_noirq to have active
> pinctrl until suspend_noirq (included), and from resume_noirq
> (included).

->...callback...()
(Same comment I have given for the first patch)

...

>         struct pcs_device *pcs;
>
> -       pcs =3D platform_get_drvdata(pdev);
> +       pcs =3D dev_get_drvdata(dev);
>         if (!pcs)
>                 return -EINVAL;

Drop dead code.
This should be simple one line after your change.

       struct pcs_device *pcs =3D dev_get_drvdata(dev);

...

>         struct pcs_device *pcs;
>
> -       pcs =3D platform_get_drvdata(pdev);
> +       pcs =3D dev_get_drvdata(dev);
>         if (!pcs)
>                 return -EINVAL;

Ditto.

...

> +static const struct dev_pm_ops pinctrl_single_pm_ops =3D {
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pinctrl_single_suspend_noirq,
> +                                     pinctrl_single_resume_noirq)
> +};

Use proper / modern macro.

...

>  #endif

Why ifdeferry is needed (esp. taking into account pm_ptr() use below)?

--=20
With Best Regards,
Andy Shevchenko

