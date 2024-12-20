Return-Path: <linux-i2c+bounces-8665-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4D9F926B
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 13:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9D3E18988D8
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 12:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649432156EE;
	Fri, 20 Dec 2024 12:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZSfMj0bY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240362153CB
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698534; cv=none; b=c55gj4GcXoHgqlMKCw5EaIZgFDRHJiM5MHyQULcaTFBExhuCr8vsgLWTPpLInyIvBV4Tu6UVkiU+EqoK64NPcPCPpSdXvvejIJ+SVk9qgMWYtZsn3TzJ2JbivFI1L0SKv4b0nteF95qhzo+IE3/2I5H2zd6WpVQv1Rmd2xiJlX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698534; c=relaxed/simple;
	bh=HlBOh4jSSPlbfpktzNvwp+qwVjt5nv4jbi7s8EDlL/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKNQPM4AaWai8Vm+GIQqTmpQSP7tEOpK/lXW03WBDFv7lmby2Id7RqnejlRnhTk7WYb/Bo+J2kXq7EO+o0hfh6+F6vXXA1hdT/JrXU7s8IB/QGxkZ3uWhv/ijXF5CITN2lSJ8jHSfNbM6dWr3YSJniwGgqNjvznVqJazuvMk4jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZSfMj0bY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54024ecc33dso2151332e87.0
        for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 04:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698530; x=1735303330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JAaYSv0Ae1yeH34mVXmK+u6UW76Um4Sm/+sIA+YD/I=;
        b=ZSfMj0bYjlPZLWmuWDgA4Da9C1QVUPPwtBC3SiYjXmMD/6V8MGsNjyi743ZCK4cWEH
         ADdHj8y1WE6IG2U1TTb6MqyBGxX5zrf8lI9FmhF4C4wVYRzPDytmjUmu1nDf8IZffLzC
         F8m1NxRDsyejLaLwV5VqD6qe9v/OgOSQE7m8H85NNa3bt0RpMur5sRcPwFbrQS1cBAEo
         6ERxm3vBXfTUCa2xh5bIo5H55QjFiAd5f3nk2+H09b5MAvk1z6Lgl+DQlqjGm7zLN9GE
         QnXi/ijgaaJAOk+1GEKyvwGL6O9yssG8C+2fvDNDwGyQK28onE+Zm/hXrFfUEqWH8tfy
         8B1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698530; x=1735303330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JAaYSv0Ae1yeH34mVXmK+u6UW76Um4Sm/+sIA+YD/I=;
        b=Q1rzvDVp0vjct8FJddD/8wxWRSeYI/2vk6vLPwlwmbJ7hKiA/NQgY44hQ1t5GkFqyh
         8IW5Bg0W/yFcKwfgEwiEfZJMemY3e0+a3Ak5FkDXFfiauP8iOYZlnwMm3WeMnj3p6kYS
         Vwspcrh8Lpt0TL1vJz7tPNDnJHIE9jPPmCdBk4IAC7gFOH3WeXHb80oS9KFSqDr79+c/
         WK7b9a1VCH2xqBJDFOXgUElIvMI71TFNS+1cGLZGEAY+M1LW/eLB9JpMy1y+/+Xl31OA
         1642OHZZ+6rGSGFwNrf7cXt9OXUAZozkc6OkpfstTiaem/Nifg/GgVk9I/zQwrbd7dTk
         bEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqbN4YhDoejgJ2O1pkPZMc9VScglqx1kt1czjngPmY4w8MwgKjffvl1mPVA4RCS0higmNIEp5Y8x8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzQLDmB4dHI5zmjxxLn7W7Q14Nk2z4ydATrN5rXJxw0N1DqMVZ
	t+dbvpOL+Fq5/Z52TPM2usbxg6PDkqGw+SdEsOMf7y3+n3D6+aS4RXqxKfj2ke0o3+86IpQFmvT
	c0tmlBjYM+c+eYtRcYDeK7oDtiZzQ5hftwuGokA==
X-Gm-Gg: ASbGncv9AINOWjR6eHSVbqEk4fUd7/wCVimQ/VFpeS6sP3C8r538IbxOVZzScWB5GXl
	N8y4DrPA+LQHeTFpKPJQWjiE9VRfi0zqdiVhxWw==
X-Google-Smtp-Source: AGHT+IG/0DIpoBQtLX+2xTrpZ52kWuFm4zd5NY5XA3IybGxFiXX/atFeHWgT1av/lrPuINKlOWhHxww9t7kKEEWHrDk=
X-Received: by 2002:ac2:4c48:0:b0:540:3579:f38f with SMTP id
 2adb3069b0e04-542295821afmr969235e87.37.1734698530305; Fri, 20 Dec 2024
 04:42:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-3-tmyu0@nuvoton.com>
In-Reply-To: <20241210104524.2466586-3-tmyu0@nuvoton.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:41:59 +0100
Message-ID: <CACRpkdajLe94novxjsHkCCx3m5raB0DxMnnSegCqkdWxRoWazw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

thanks for your patch!

Some nits below:

On Tue, Dec 10, 2024 at 11:46=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wr=
ote:

> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
(...)
> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

#include <linux/bits.h>
is missing, include it explicitly.

> +       return !(BIT(offset) & data->xmit_buf);

Here you use the BIT() macro from <linux/bits.h>

> +static int nct6694_direction_input(struct gpio_chip *gpio, unsigned int =
offset)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                              NCT6694_GPO_DIR + data->group,
> +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       data->xmit_buf &=3D ~(1 << offset);

data->xmit_buf &=3D ~BIT(offset);

> +static int nct6694_direction_output(struct gpio_chip *gpio,
> +                                   unsigned int offset, int val)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       /* Set direction to output */
> +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                              NCT6694_GPO_DIR + data->group,
> +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       data->xmit_buf |=3D (1 << offset);

data->xmit_buf |=3D BIT(offset);

> +       if (val)
> +               data->xmit_buf |=3D (1 << offset);
> +       else
> +               data->xmit_buf &=3D ~(1 << offset);

Same

> +static void nct6694_set_value(struct gpio_chip *gpio, unsigned int offse=
t,
> +                             int val)
> +{
(...)
> +       if (val)
> +               data->xmit_buf |=3D (1 << offset);
> +       else
> +               data->xmit_buf &=3D ~(1 << offset);

Same

> +static irqreturn_t nct6694_irq_handler(int irq, void *priv)
> +{
> +       struct nct6694_gpio_data *data =3D priv;
> +       unsigned char status;
> +
> +       guard(mutex)(&data->lock);
> +
> +       nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                        NCT6694_GPI_STS + data->group,
> +                        NCT6694_GPIO_LEN, &data->xmit_buf);
> +
> +       status =3D data->xmit_buf;
> +
> +       while (status) {
> +               int bit =3D __ffs(status);
> +
> +               data->xmit_buf =3D BIT(bit);
> +               handle_nested_irq(irq_find_mapping(data->gpio.irq.domain,=
 bit));
> +               status &=3D ~(1 << bit);

Same

Just use BIT() consistently please.

Yours,
Linus Walleij

