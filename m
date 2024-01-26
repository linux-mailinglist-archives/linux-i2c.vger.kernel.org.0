Return-Path: <linux-i2c+bounces-1478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CE383E415
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58EEE1C241A8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 21:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F84224B2A;
	Fri, 26 Jan 2024 21:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3aGxsmI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E9724A02;
	Fri, 26 Jan 2024 21:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706305173; cv=none; b=T4xSW2qvTf/3Y5SXfR+15va5K2jMlT6whyliMdGmtUAdfeY1ITdunW0UvpJuwwLPDIbEttqgLOlqmWDnJCw5AZ1hJ3fa/Gpq2E4m1JfWJsPSpatmbaUU+LjEy/m9JhN58KAF8O0fBA5ywBZikDXfFTWT3A513ODeNfHQZNDk3+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706305173; c=relaxed/simple;
	bh=aYWtVCS6UzhbIOesoYUujKfoyGoA1lZ5lx3aq+McpdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/cdEHDvEpUhMCZB0PBaiINxDzj5cT0Sq3bVk/qcI5+Ke9IA58Bqq1ct2V83kpP9oPm5Ty+tVC38QKT6GjyJc8UZdn5E/n29NY+xyEDMWLs651vEU7XAmQPJb0Dpc438D+yyum+rQWdcBmHYMrUxR2Z6o2RWwGgcv83+1hPdGdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3aGxsmI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40ee705e9bfso10821985e9.0;
        Fri, 26 Jan 2024 13:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706305170; x=1706909970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnBIN51Yx/Gln0h3onAB09YxTVH+h1KGIKBHmAivbD8=;
        b=Y3aGxsmIm8WawNZ/2Xw6aU0JLcXIMNKVjPp0oBi1iwnUbjVpBqDyRkJ7d/NmriWw5R
         7qFiaW3HqsPxT184DaNP2dib9Yy5fKVN/6QJ2x9Rw2I4VGvr2eURxz133GOCpe8O/HIS
         OW1AFChcMh4k44r+vOQ4kguCA2MoL6jYR28UOA8EBPa6pWvUUTU9NX1vN5mbHrE8jQZP
         leNyypuCyxHdvzsW12FQvZ7OZmuaQPJGAg/Fyi4EZihHscldF6l0ZsxV+RtvHyPEJhaK
         AWUhoE4bfc6pKsLKL2Jar7XJSKL5SUK2+RzkZRjesakXVtaIN5hEeqwko23qnzfhHId+
         9G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706305170; x=1706909970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnBIN51Yx/Gln0h3onAB09YxTVH+h1KGIKBHmAivbD8=;
        b=ZBor17dcDpBbugXi5Wv/cLXYLXNgvtjJP4cWWOLXysa+n0FrmrsLNdTF70xCEyJXY6
         iXBAFeWwTioiccVnLhURiqqY6HirflTra06S+uA9f3VWIZh8lPl5UF91wqIRgTc0+WMb
         cWflfEQuryuSrC0E8jb9/tbNSvKEF6lF8nZ3HJpklz8Q5swjlI6gMtxHXhIH84FOL8O6
         15uI6lpu7Tls2m+MqULFbrfUunNRtepvk4UZ9muLpUeF1zeNBGSRoIHDAMPVBDMlvf5Q
         FKWSJNEIy7LeEAGMh1rn1a6/sSl8AZuhRmslENxN1pviYnlKN6vlybJdopYClYQCMPp2
         xyDw==
X-Gm-Message-State: AOJu0YxoGwrZbOt2HHChaJstHUFZPcbV6Ymw3e4bAzO+2KBb2BDwbhN2
	3COrS6sRJt5Nzc56ELg7Gx+NHLw/gEmxHtDazKuYQ5jVuSOzhZGd3A6YL6B9Y5v74QydfdlolDx
	telqwEgbmjEfOJFZMJwOyKhmJPzA=
X-Google-Smtp-Source: AGHT+IHiW3MbwP6aH63LCEQhb4YdM2qAZyh5A1b/7Pw7GKAhh+9plvsj/9UMyWlCV+hjplNvyLCO6hkMeQTB1ba3/ZA=
X-Received: by 2002:a05:600c:5123:b0:40d:8c4d:c0b3 with SMTP id
 o35-20020a05600c512300b0040d8c4dc0b3mr293884wms.94.1706305169591; Fri, 26 Jan
 2024 13:39:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com> <20240102-j7200-pcie-s2r-v2-6-8e4f7d228ec2@bootlin.com>
In-Reply-To: <20240102-j7200-pcie-s2r-v2-6-8e4f7d228ec2@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2024 23:38:53 +0200
Message-ID: <CAHp75VcUY5_gB=VVWF2pAa4iEo_9Lt5itNH5RAy6NjnTk5PZWA@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] phy: ti: phy-j721e-wiz: make wiz_clock_init
 callable multiple times
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

On Fri, Jan 26, 2024 at 4:37=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> For suspend and resume support, wiz_clock_init needs to be called multipl=
e

wiz_clock_init()

> times.
>
> Add a parameter to wiz_clock_init to be able to skip clocks registration.

Ditto.

...to skip the registration of the clocks.

...

> -static int wiz_clock_init(struct wiz *wiz, struct device_node *node)
> +static int wiz_clock_init(struct wiz *wiz, struct device_node *node, boo=
l probe)

So, why not refactor this to two functions first?

...

> +               clk =3D devm_clk_get(dev, "core_ref_clk");
> +               if (IS_ERR(clk)) {

> +                       dev_err(dev, "core_ref_clk clock not found\n");
> +                       ret =3D PTR_ERR(clk);
> +                       return ret;

This is wrong and has to be fixed in the original code.
The correct approach is to use `return dev_err_probe(...)` or open
code it, but since we have a helper, open coding is highly
discouraged.

> +               }

...

> +               if (wiz->data->pma_cmn_refclk1_int_mode) {
> +                       clk =3D devm_clk_get(dev, "core_ref1_clk");
> +                       if (IS_ERR(clk)) {
> +                               dev_err(dev, "core_ref1_clk clock not fou=
nd\n");
> +                               ret =3D PTR_ERR(clk);
> +                               return ret;

Ditto.

> +                       }

...

> +               clk =3D devm_clk_get(dev, "ext_ref_clk");
> +               if (IS_ERR(clk)) {
> +                       dev_err(dev, "ext_ref_clk clock not found\n");
> +                       ret =3D PTR_ERR(clk);
> +                       return ret;

Ditto.

> +               }

...

> +       /* What follows is about registering clocks. */
> +       if (!probe)
> +               return 0;

Just refactor properly, no need to have this ugly mix of devm_*() for
probe stage, parameter and HW related things.

--=20
With Best Regards,
Andy Shevchenko

