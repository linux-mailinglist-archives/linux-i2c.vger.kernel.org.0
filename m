Return-Path: <linux-i2c+bounces-3685-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 159F18D1ACF
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 14:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A21211F232C1
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 12:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DB416D4E3;
	Tue, 28 May 2024 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VxkZQ/mB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88D416D4CE
	for <linux-i2c@vger.kernel.org>; Tue, 28 May 2024 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716898396; cv=none; b=UcqsKb074qAQjPxoTgP6I6fy3N2AuY2d78s2PAEqW1h2d+ThBAFttpW773/24fbxvcB9PhwEEjwE+x9tJNrhH4YOoSKRbFAj09jWIXOB8T3yVeZRPotNGRCL7bu0A76K3ChoGNKexXSMGaFLios4EVuL2QYo9Z0lWfvbgwZCqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716898396; c=relaxed/simple;
	bh=zahCqpNAo5PX4J5AmLvaaCc3FUPSG2YcyPhcrnlbkCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ai+VTtc2ow0hxfkMpAgoa9/aZM/r+IIrTfsgqjCq4BT+V4nFXcAuvh4yO0U5gpQi9ZVixH/4A9CkIGa4RkHDj6nB2nHwJp57hpq4i4TpSGnBhQ49xDDsYPL3uqffJz9cI2k+qeHow5pv2m9XE2LfixEW2lpxNBJGB3l/4OqcVhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VxkZQ/mB; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-62a0809c805so7556327b3.0
        for <linux-i2c@vger.kernel.org>; Tue, 28 May 2024 05:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716898394; x=1717503194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+QAYTErS7U2iovpig+AATgQkbKxA71fHEB/B/5/5RI=;
        b=VxkZQ/mBBMCEVa2JZ37DvDROv7D2taI9TfWvhwbPXqRZZGFAqpyFDDigExHqg9EQ0L
         JPaQnGIo1QoNunMnsLC635RA46BpepC33NTj9Vx1EjCt/v1hqUTWBdv15tJPk/wneEJS
         3TgDZ7NwXy/2rst9T/iZP0ScD7zEN27/b2ejaZlFRQ4QnsSG8EIrnWWM1iSe4RGMNByc
         qwESJxOzlS7tme9wp2BqJEzRGCXmlnCIhDpmNBrAxYdalBdZndI3/DLXuJa/N07/ZiK8
         48jyNJCGef2HdMS8EtUgC8pnxQQGR256xct0IEYDvLWvfxOXFosE8lEbIMQEp5UwrEPu
         ctvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716898394; x=1717503194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+QAYTErS7U2iovpig+AATgQkbKxA71fHEB/B/5/5RI=;
        b=Iv03FGc2qzzddSOh3GzocVoFXxJAnLoMM/RKSoUGFbC8MLM4+kKY7F+WwdG6JMPvA9
         dvtYhWzFjDNd0uW4v3CIVUaiFQrWoDzpD0ZRKSbo3pqeYFABJTUQvU2DGHtRIa/QEuk0
         DILZOrf0qwHP+fJ5y5wOn1Ghzyj3KpodgzFrUZGSi9riQB8p8N3RTGkWlAJ2GiFmCCMd
         BKYynb9ePL6CtKBZQoS67zzCx7e2rawBnbIADZ7gtVu31u3hqFYemK3N/ysdfZv1XLCY
         X/dTfS+igKP6SDRhUBX+ZZIXl5bjZy8Jw8bc691do+x8C4iyfvJATIJEu37t2DH6I/kd
         Vluw==
X-Forwarded-Encrypted: i=1; AJvYcCVgHFklk5HhzAUcvbz/LTKT8Lu/3+Oqt32ZP0z2m1AmZY66qWgpVfhtdaVWAsMH5bTGPuZ4wLwXp7jXkDnhGre5h0VNdhVnmxo7
X-Gm-Message-State: AOJu0YyxKPSnMV8cGuQJxZpIaLthz6Wh2qw13m6NpGhPZLNNdefyB9eb
	wZQArDAmt7fqb8hhiNMjWLy7gbN5u8ysYKQNh+i8fiG2K+Ja1UxJ+1BmdCW2qESh1D3+CqIX/So
	iIAj7dIzksYsliFPOMv8ZCwyCiS+hFTZ0W90e1A==
X-Google-Smtp-Source: AGHT+IF3OL+F0UzaxHr0Sfnd3Ewd6kL8rw3K+W20Q6AByQLyFNPzPgdNIJJk6DqXFhbJtK6bpaM+mwCF04SLpF3w0RI=
X-Received: by 2002:a25:558a:0:b0:de6:482:c7d5 with SMTP id
 3f1490d57ef6-df77222182dmr10262233276.43.1716898393830; Tue, 28 May 2024
 05:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk> <20240517-a2b-v1-6-b8647554c67b@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-6-b8647554c67b@bang-olufsen.dk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2024 14:13:02 +0200
Message-ID: <CACRpkdYKTD=97AfBN69X3BUf+4HjVrFwp-Ht2kf3HA62ud99QA@mail.gmail.com>
Subject: Re: [PATCH 06/13] gpio: add AD24xx GPIO driver
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Emil Svendsen <emas@bang-olufsen.dk>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alvin,

thanks for your patch!

On Fri, May 17, 2024 at 2:58=E2=80=AFPM Alvin =C5=A0ipraga <alvin@pqrs.dk> =
wrote:

> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
> This driver adds GPIO function support for AD24xx A2B transceiver chips.
> When a GPIO is requested, the relevant pin is automatically muxed to
> GPIO mode. The device tree property gpio-reserved-ranges can be used to
> protect certain pins which are reserved for other functionality such as
> I2S/TDM data.
>
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
(...)

>  config A2B_AD24XX_NODE
>         tristate "Analog Devices Inc. AD24xx node support"
>         select REGMAP_A2B
> +       imply GPIO_AD24XX

Maybe it should even be select, if it's hard to think about a case
where this is not desired?

> +config GPIO_AD24XX
> +       tristate "Analog Devies Inc. AD24xx GPIO support"
> +       depends on A2B_AD24XX_NODE
> +       help
> +         Say Y here to enable GPIO support for AD24xx A2B transceivers.
> +
>  config GPIO_ARIZONA
>         tristate "Wolfson Microelectronics Arizona class devices"
>         depends on MFD_ARIZONA

This is grouped with the MFD devices but as I understand it A2B is a
completely new bus type? Is MFD even always selected when A2B is
in use?

To me it's fine to add a new submenu for A2B devices, if there will be
more of them.

> +static int ad24xx_gpio_get_direction(struct gpio_chip *gc, unsigned int =
offset)
> +{
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gc);
> +       unsigned int val;
> +       int ret;
> +
> +       ret =3D regmap_read(adg->regmap, A2B_GPIOOEN, &val);
> +       if (ret)
> +               return ret;
> +
> +       if (val & BIT(offset))
> +               return 0; /* output */
> +
> +       return 1; /* input */

Please use GPIO_LINE_DIRECTION_OUT/GPIO_LINE_DIRECTION_IN
instead of 0/1 here?

Then you don't need the comments because it's evident.

> +static int ad24xx_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gc);
> +       unsigned int val;
> +       int ret;
> +
> +       ret =3D regmap_read(adg->regmap, A2B_GPIOIN, &val);
> +       if (ret)
> +               return ret;
> +
> +       if (val & BIT(offset))
> +               return 1; /* high */
> +
> +       return 0; /* low */

Just

return !!(val & BIT(offset));

> +static int ad24xx_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> +                                            unsigned int child,
> +                                            unsigned int child_type,
> +                                            unsigned int *parent,
> +                                            unsigned int *parent_type)
> +{
> +       *parent =3D child;
> +       return 0;
> +}

This deserves a comment, is IRQ 0 the singular parent of
everything? Then it doesn't seem very hierarchical but rather
cascaded don't you think?

> +static int ad24xx_gpio_irq_set_type(struct irq_data *d, unsigned int typ=
e)
> +{
> +       struct gpio_chip *gpio_chip =3D irq_data_get_irq_chip_data(d);
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gpio_chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +
> +       switch (type) {
> +       case IRQ_TYPE_EDGE_RISING:
> +               adg->irq_invert &=3D ~BIT(hwirq);
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               adg->irq_invert |=3D BIT(hwirq);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }

No need for the "toggling trick" for supporting IRQ on both edges?
Implementing that hack (which is in several drivers) will be nice to
have for e.g. pushbuttons.

> +static void ad24xx_gpio_irq_bus_lock(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio_chip =3D irq_data_get_irq_chip_data(d);
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gpio_chip);
> +
> +       mutex_lock(&adg->mutex);
> +}

Is this mutex needed since there is already a mutex or spinlock
in the regmap? Isn't this the case for A2B?

Yours,
Linus Walleij

