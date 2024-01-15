Return-Path: <linux-i2c+bounces-1324-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF8F82E164
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 21:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EAB01F22DB7
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jan 2024 20:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02B018E10;
	Mon, 15 Jan 2024 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSNJhFI2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429D018EB2;
	Mon, 15 Jan 2024 20:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a28b2e1a13fso955521366b.3;
        Mon, 15 Jan 2024 12:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705349642; x=1705954442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5Ok4CQAPkpysNJkJjEPQdxy0iDAuR07BorZIgMZAwk=;
        b=eSNJhFI2HC3yags6sB4AhEGf5FSISrPystjo2EVRZjn+vsZq98eD/Nt2g67m5JQIwe
         GEOeJCgTLZhQtczML86nPfgnf5fmHR9ly+l79DM7eS+dG6hA766mAiN/L59p1jY9vD2p
         Uu6/NlFRZaNlg/ANmVjU1zC86MJ7wvny7uVXQB2SJIksNKUBpPEOicgDVzf4N4gsdXD1
         dCmJpo2ekYok5tmyNJS5HrUWqQwcNy8ojcG5Q2YrsZblEXekGNhIPU7o1Esbtvd9AQaY
         iDjaMOQQnxyvVrgqXFQtCcIaUSsuZ7tYWngNuDXkyFe/5AydaVwOE281GRDTt1uiSAHU
         TRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705349642; x=1705954442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5Ok4CQAPkpysNJkJjEPQdxy0iDAuR07BorZIgMZAwk=;
        b=WKwa9KvlewsK4SgdcEgwyw6j9aUvZZYVx93UyrUmi1kh1dWjziI50XUJ2g8HnUAauW
         2Crp1bH8MDeJdgNmV4IHKg3ZQ1Lpj7QY3yRq3+ZN2edpC/xOAsgXshhigFUztE7E23nQ
         wIwX3E6ghOwYeAa+E2pOR4dZv1D8NO6gtUr1XXGfHU0x8Oo61qrLJjXwcRPpsT+54JTN
         Rma9NVG03Ku1PFI5BUAjkGE25YxV0fcpO/2ROiSKdrBclxvsFYXPBvHcyeqSEKFpohGX
         vtpr+GukD7lZ0HVWHITZ3b1taj6GK64ygjdluZS6iuCobjjonxBqSSEuJKbrpfVBJLOg
         9UYw==
X-Gm-Message-State: AOJu0YyUs54ibGrX9OXvSy855xVV8MhKrgmCGxcMC0PNrvYOaMgutwLt
	WGlNG/XpTJ57I79Rx8Nlpd1A+K/Akpm/HaXSY6I=
X-Google-Smtp-Source: AGHT+IF9hVIc0IofPq072tyoQiEbT9WWWMhwNrqZiDf3VofbR8YwcHsdBo838dWQyfyviH1gTOzEGh3uQ+XWN1I60MM=
X-Received: by 2002:a17:906:39c6:b0:a27:bac8:1000 with SMTP id
 i6-20020a17090639c600b00a27bac81000mr2579905eje.96.1705349642324; Mon, 15 Jan
 2024 12:14:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com> <20240102-j7200-pcie-s2r-v1-14-84e55da52400@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v1-14-84e55da52400@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Jan 2024 22:13:25 +0200
Message-ID: <CAHp75VfPQz4PWdzFUU_n+R=XohBjyXM0zsjD-bUD2jmb42ds8Q@mail.gmail.com>
Subject: Re: [PATCH 14/14] PCI: j721e: add suspend and resume support
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
> From: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>
> Add suspend and resume support for rc mode.

Same comments as for earlier patches.
Since it's wide, please, check the whole series for the same issues
and address them.

...

> +               if (pcie->reset_gpio)

Dup, why?

> +                       gpiod_set_value_cansleep(pcie->reset_gpio, 0);

...

> +               if (pcie->reset_gpio) {
> +                       usleep_range(100, 200);

fsleep() ?
Btw, why is it needed here, perhaps a comment?

> +                       gpiod_set_value_cansleep(pcie->reset_gpio, 1);
> +               }

...

> +               ret =3D cdns_pcie_host_setup(rc, false);
> +               if (ret < 0) {
> +                       clk_disable_unprepare(pcie->refclk);
> +                       return -ENODEV;

Why is the error code being shadowed?

> +               }

...

> +#define cdns_pcie_to_rc(p) container_of(p, struct cdns_pcie_rc, pcie)

Is container_of.h included in this file?

...

> @@ -381,7 +383,6 @@ struct cdns_pcie_ep {
>         unsigned int            quirk_disable_flr:1;
>  };
>
> -
>  /* Register access */
>  static inline void cdns_pcie_writel(struct cdns_pcie *pcie, u32 reg, u32=
 value)
>  {

Stray change.

--=20
With Best Regards,
Andy Shevchenko

