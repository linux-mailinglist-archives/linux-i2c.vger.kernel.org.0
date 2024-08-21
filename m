Return-Path: <linux-i2c+bounces-5614-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A57DB9593E8
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 07:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7C691C20D1D
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 05:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF1D165EF7;
	Wed, 21 Aug 2024 05:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqSxDBzP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410E9132106;
	Wed, 21 Aug 2024 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724217197; cv=none; b=QTrPS0lNs+t5XKYFHsYLjd9rrjwXwj20W6JOr0ij630LvY5+SIwM3Szk9+pYYV+CL7oL2jALmfDY7WNbufTUc4+gBCpqC6oFzK+qKly7NRdZPDORiauzM6oNnL9t1W5CtsJ0xyY/JmRSGypIATxjcC7j6JZpnZKrV1nZT7a2Hq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724217197; c=relaxed/simple;
	bh=Ew6twpKhHdsfTJITQO6Pu+V1ZRLtgHH7YjCR0wKtYtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CdCjXjeGhtWbEbFtJvrxe2kA8kQ5lf48uM0Q2XNcBgGlxzu5+XOMzcZlBYEPnlf8USdv0h6aRr92W0SUOxgnZ/GmDsAXukM/tJw2Q1OKxU+DVd6mmGsLzDrRTkSLiOlMV86OvrY1PfsknPHwS4ojYjesS57klODpmdA2kRvELDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqSxDBzP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so460269066b.1;
        Tue, 20 Aug 2024 22:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724217194; x=1724821994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTpscGSXiapfgInJdFUfK26eoAjrQMiQG2o80nXvv5c=;
        b=bqSxDBzPnCh8SD2K+Z/PrBQE8ddj3Ht+MkowboL252AFIC3+vEH+11dXGZ7GCtKmMa
         kHgl91OvxOV5DVVHm+McBxLisqqrmQDBe6uWCW9U5JZCtollVegylAyTSnGuXloLgaPE
         wKGvdy/E/+TIezdOiRP9LFPWZTcKxW7HOyPArJMUN4CYF+8huwT2hL222AX0IBXdgDu9
         67ZvokfsAtuKFXH5thWrtrPLfYFYyjMcB5OariEc1kiLXJbdina6pyLmHN3Qu9tsc92F
         SrAqm6BM40QBCrQ8O81nD0xUO/3JcRupm1Js1gSP3uknyYwNwaYHUf+/XMXrYgtiLW/R
         tISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724217194; x=1724821994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTpscGSXiapfgInJdFUfK26eoAjrQMiQG2o80nXvv5c=;
        b=KeVW5a4rVobe9fKIPb06TUtklN9Fe7MiU3W0GvSHT24Ud81QzpOJGdHQeemmFC3FZm
         0lCSJ8xHm3PDrqWuGrrCDui+WzMahztOsZ8H9VTm0j6RZxqzWVmmoTV+/lllJvVFgKtU
         u4DmqCqNZZ3y2sWYGRFcwNAiEuxjGY6PnH3x7mNJr6JLoE4dBjUmPvwcWmzRlSS3/oVz
         /CsC71Ey97vSq6+sQkElBvhAsy102OQl9sduW9QhWmJ2yYF8dlfFdL/695RWl3VRe4qB
         GdpwuWLb8t6O/0y+aJJnfHlJcBJTbISUKVMBfR57IHtrr8yoAky5Rxw8vRJ2Oj+wvYwK
         Aj0g==
X-Forwarded-Encrypted: i=1; AJvYcCW+5fnecKpYr+8M7dIpnPNBl7w37iZjn5NcPCbXq5ndXh8+l7Fezfm1ehgYRvNu2qxrRLiNNm9d4chq@vger.kernel.org, AJvYcCX162RPLdE5nyz6LIG/oj3MhZxJaj3OoV7egKTFjo1GBXOHXKJYwmU5VPDRuLRmZxVPEbnn5+dukqNv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuz16lEbnQaFDuhdi4Cxcynh6axQT982OEgjxYTVj/NNocWKbL
	p+3ybU65MQ2xIbyz1kf0D7ha7gRTEoXH4NqRgXAaVDb3GyL5cY3BQHHecrQ9ez/CeUaVMavUBzP
	oYTQbbSLCcyHrwLeNvPoO59NWmB8=
X-Google-Smtp-Source: AGHT+IHZ9je7Q4wNIeQHcyNcnaJnhhnOodLilsyRMuSV1JE3fXLLki02TIaeEvqoYWw7EJtjaXhTvWijRC/VtLe64zk=
X-Received: by 2002:a17:907:f1d1:b0:a77:c0f5:69cc with SMTP id
 a640c23a62f3a-a866f8bf4f3mr92233966b.61.1724217194063; Tue, 20 Aug 2024
 22:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
 <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch> <ZsUXEkc5A5IBLpJv@shell.armlinux.org.uk>
 <CAOMZO5CymmmUUhBrYwyCJ54sj=55wAVMqWpuYRbJOhoaroCUXA@mail.gmail.com> <CAOMZO5DUmw=PZ_v32Y_xkbOTkQiR-9BPmNH7992YSV0m3Yhbfw@mail.gmail.com>
In-Reply-To: <CAOMZO5DUmw=PZ_v32Y_xkbOTkQiR-9BPmNH7992YSV0m3Yhbfw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Aug 2024 08:12:37 +0300
Message-ID: <CAHp75VfQx8TrCxV7KkrdsiNp63gYArJ=e2zy9__r8aCaXWW0Lg@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Fabio Estevam <festevam@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 3:50=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
> On Tue, Aug 20, 2024 at 8:18=E2=80=AFPM Fabio Estevam <festevam@gmail.com=
> wrote:
>
> > The pca953x driver tries to write to the i2c-2 bus before i2c-2 is regi=
stered.
> >
> > This is the point I don't understand: how can the pca953x driver get
> > probed before its I2C bus parent?

It's just messages. The clients are getting probed inside the
adapter's probe phase.

> Disconsider what I wrote above.
>
> I'm trying to recover from the arbitration lost like this:
>
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -491,6 +491,8 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct
> *i2c_imx, int for_busy, bool a
>                 /* check for arbitration lost */
>                 if (temp & I2SR_IAL) {
>                         i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
> +                       pr_err("******* Arbitration lost\n");
> +                       i2c_recover_bus(&i2c_imx->adapter);
>                         return -EAGAIN;
>                 }
>
> @@ -1487,6 +1489,7 @@ static int i2c_imx_probe(struct platform_device *pd=
ev)
>         i2c_imx->adapter.nr             =3D pdev->id;
>         i2c_imx->adapter.dev.of_node    =3D pdev->dev.of_node;
>         i2c_imx->base                   =3D base;
> +       i2c_imx->adapter.retries        =3D 5;
>         ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->d=
ev));
>
> but still get pca953x probe failure:
>
> [    1.756761] pca953x 2-0020: supply vcc not found, using dummy regulato=
r
> [    1.766564] pca953x 2-0020: using no AI
> [    1.775333] ******* Arbitration lost
> [    1.783811] ******* Arbitration lost
> [    1.793701] ******* Arbitration lost
> [    1.797455] ******* Arbitration lost
> [    1.801209] ******* Arbitration lost
> [    1.804964] ******* Arbitration lost
> [    1.808562] pca953x 2-0020: failed writing register
> [    1.813602] pca953x: probe of 2-0020 failed with error -11
> [    1.819222] i2c i2c-2: IMX I2C adapter registered

I think you should check that the adapter is powered on, to me it
sounds like you get 0xffffffff in temp or so.

--=20
With Best Regards,
Andy Shevchenko

