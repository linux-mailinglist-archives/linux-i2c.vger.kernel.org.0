Return-Path: <linux-i2c+bounces-6837-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3096E97B458
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 21:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB5EB28652B
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 19:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5FF189B8C;
	Tue, 17 Sep 2024 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g9s4tI9I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A9D18893F
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726601172; cv=none; b=qjb0EIIh0ppXNVMDqoPcTuOQ1DysnC77ycIljUBWrr6sa85bCeCRXeUeXu/DrhcmiiobcUPdAMC0KwpISqMuoxtQG8QSbZAvuxFbrFE0Q4BUWzWgcYPDQhO2MpUh2mX08k5lH26jGkeWbNf4F9kKJkLno0V41xFbQr4/f63smZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726601172; c=relaxed/simple;
	bh=liMe9iwi93+dpSBeURQnc46wVTHZXxB/uxVXVNf+IDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3QaFrWN53+MHvayRnvCYu2wq5ofOIOg2Q0d6Q31qWijppOSMalVKdNg4OWRsxhqvOhXxnxO3s4ZwDf1tPM9LUBH9Q4TIbst2C2qPn9dZjzW0nNBLDggPSZE5Fr4LtImGXbU0QR4zcEepKqZAIhvUeR0xJsxe24L2gBxg85nUbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g9s4tI9I; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f74b6e1810so53589701fa.2
        for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726601169; x=1727205969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LShiWHIg+F4swBTJEPuCgmaykDqizVljoM2XVKJ6JmU=;
        b=g9s4tI9IJP0+UuIqaaUvM5QJURq+k78HH70rq6TdZgXm0zbU0QA8dbpeZOK+Uqw6e6
         TzbeEGOLBc9UXSLANDDeRhZE9e1pkCP3K94NWmRDjYqwXYMQ63enZRmLF8jgg8ZrI4Nu
         8b/8v5zsJY598IhYx3A7MquOz432MeVqM8N1l8jP0+kN7yMPeInWLz/dmQc3xAoB4RON
         AqsYm5EW2s8HrxcO8b3KaeggZf4Ktw1WNwA/xXUWbALDAewFSjddXGGY0R0hjliAtlR4
         LBdSZ1pES9jgFUtFYIpZtsab06NSa1J31ZguA2F7diohagbFWUI++SxqHOXA0hhbMNIi
         sXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726601169; x=1727205969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LShiWHIg+F4swBTJEPuCgmaykDqizVljoM2XVKJ6JmU=;
        b=GfEZwMKRU2yw8LUGCzI/a4vJ0QlAh8JauBKm2RcwPtGtsm9hRtp6ziJh5rCwE4CpM1
         iOVsKM+4kJoU2bUbyqPoKPgOJWaUfzU7wNxlt2FZGC5ndmQrcF4M9i71xjsaqY8Y01Dw
         clQwfx43VIOIEXd2WbFtQ1zSyErYu4q584D7W3/xRcZZPKSFMaNoW7xamamYRpBC7GDO
         sb6h1ch2sucIR+tBFLDdCNUTENwc6Bha4Ax6yaHjG9tIVQEhSC+s9FVv+ow34fbKwpGr
         PapVsaiU3pyGpSNODjSKzRb9++jaxsupNkZyjgBcG1i5H06z0qF3qd8fcD3JRJu0sVNx
         5yJg==
X-Forwarded-Encrypted: i=1; AJvYcCUzBCz70DkqzPsDcOUF+XJghHPEaZ8Ng8q3vSNvxkopelwv+KIBimj12TuPCoR2wdPQ8M4QdyfE6tQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP4L46qShV4d5pil4HxugUmtphP3hyzk35xY8AMdA14ngJl2Yt
	Ep1K3EZSOWsC/WXGJ0jD062fYcwqTCkk9o0WBnbGNrWjzD5V7WwYI7K5sxdCyOp3kLnWbA3E7er
	q06HUuY6b2Qxtbygr7QirdE8570Y1sVbGnwdEHA==
X-Google-Smtp-Source: AGHT+IHp7mvP4Yiy062HmDCtGTcMl9uLDuiOfffwb5UzggCbfmiXWDAlopJqHwK8zUo4d3iwjlUhXSsgQoKP/vCx7ec=
X-Received: by 2002:a05:651c:1992:b0:2ef:251f:785 with SMTP id
 38308e7fff4ca-2f787da4fc2mr116438661fa.1.1726601168627; Tue, 17 Sep 2024
 12:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com> <20240503-congatec-board-controller-v2-2-681511a01c8f@bootlin.com>
In-Reply-To: <20240503-congatec-board-controller-v2-2-681511a01c8f@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Sep 2024 21:25:56 +0200
Message-ID: <CACRpkdbtwF-k3fHFvpXD+m8KN2XCt56X=iOXbideds0v+LWqWw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpio: Congatec Board Controller gpio driver
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

thanks for your patch!

Some comments:

On Tue, Sep 17, 2024 at 7:00=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Add gpio support for the Congatec Board Controller.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

That's a bit terse commit message. At least mention that it sits under
the MFD.

> @@ -233,6 +233,16 @@ config GPIO_CADENCE
>         help
>           Say yes here to enable support for Cadence GPIO controller.
>
> +config GPIO_CGBC
> +       tristate "Congatec Board Controller GPIO support"
> +       depends on MFD_CGBC
> +       help
> +         Select this option to enable GPIO support for the Congatec Boar=
d
> +         Controller.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll be
> +         called gpio-cgbc.
> +
>  config GPIO_CLPS711X

This is in the middle of the memory-mapped GPIO drivers.

This is not a memory-mapped driver.

Move it down in the menu to the submenu for MFD GPIO
drivers please.

> +static void __cgbc_gpio_set(struct gpio_chip *chip,
> +                           unsigned int offset, int value)
> +{
> +       struct cgbc_gpio_data *gpio =3D gpiochip_get_data(chip);
> +       struct cgbc_device_data *cgbc =3D gpio->cgbc;
> +       u8 val;
> +       int ret;
> +
> +       ret =3D cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_GET, (offset > 7) ? 1 :=
 0, 0, &val);
> +       if (ret)
> +               return;
> +
> +       if (value)
> +               val |=3D BIT(offset % 8);
> +       else
> +               val &=3D ~((u8)BIT(offset % 8));

Is that cast really needed? (If you tried without and it
cause compilation problems, I believe you, if someone
smarter than me said it should be there, ignore me.)

> +       if (direction =3D=3D GPIO_LINE_DIRECTION_IN)
> +               val &=3D ~((u8)BIT(offset % 8));

Dito.

Apart from this it looks very nice, so with the above
addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

