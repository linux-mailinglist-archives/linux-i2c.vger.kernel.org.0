Return-Path: <linux-i2c+bounces-533-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 883387FD1DC
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 10:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A515B21289
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 09:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E5312B94;
	Wed, 29 Nov 2023 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MrKQXUGI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD5C85
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 01:14:03 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7c4602ad8baso1639343241.3
        for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 01:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701249242; x=1701854042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIMu2gy1DtmikoCfchTvOV2bl6nFUJDXNkFi9sSRetA=;
        b=MrKQXUGIAd0d43mL8cEZleQQ8pxkN5xA2l3zKmPjGDnyo14XmMQR/sjBh4JQQPhWaN
         mNYWSBNiDNivgmLGU5eBHjWpdRJiRHf7w12f2Hx/lVkV/NlZVYcitNqdAx52U+X/M6O3
         j2uo7TCl7VknZbmtoop7U2NqmMZbcbStpk3DrrqtiKEkJnUx4Ol57vXzlkPbCRB1NXis
         BLOUcHaBtTh5XNwKrYzMzspmq7ZuPsH/CXE0Ly8D4YpAdIHk2Xx4KHrVGzYoiTfdbRK0
         1IwU9nfo6QiXlhrnoFRs7JEVMHDmWLjlyxUNVV7N9ny4WUHxDKFXedX7bNKC/40zo/B4
         NAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701249242; x=1701854042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIMu2gy1DtmikoCfchTvOV2bl6nFUJDXNkFi9sSRetA=;
        b=Irz3m/75Xc7crGcioLWrpyrkL8JaYna3qIx6+rVpHtQPTgScodvnR2/rzsqPRlpzss
         wBEbrTFxXQLDYngnlfl4NwlCUvHZB/V6rZ8kkjpoWFSUK1SJpvoQ5ehrxLScEEfeouBS
         V22gFaUors8w6o1tggb5wnph2g8lI0f5YO9J8eftb0yMS9SikPdexyUm2hhWH1oiMkhB
         rVhF/AyijoJzbHLIpMQiqNFyMhvPJhQmo2B68x6dXOm9pkq2j7LZiWLZRsI1GfTyDz+U
         k874M7w6g2KWe/jsYzUreazMwqwwGlh2xDLZ/HO3zMU9ns/yGAKgM7JMT7jTdzBE3mFl
         NMCg==
X-Gm-Message-State: AOJu0YxSFY9/tw7SUw/4NgFU59JVefJNbfIZ8KKp4zJWjIDL1iQqa0HV
	56DYRHwSBkaTt5X6C23s11klc7eUHO8xOrgJaieHmw==
X-Google-Smtp-Source: AGHT+IEWQpF7n/VRP1a03EcSHWgG73bdr7xdU+s/MO65we+YnMT5ycq1KQh5qPJsyWEwKH36YfJn9Sonu9Jdzoxuaok=
X-Received: by 2002:a67:e3ce:0:b0:462:a044:aee0 with SMTP id
 k14-20020a67e3ce000000b00462a044aee0mr16831554vsm.15.1701249242319; Wed, 29
 Nov 2023 01:14:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231123103032.11396-1-brgl@bgdev.pl>
In-Reply-To: <20231123103032.11396-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Nov 2023 10:13:51 +0100
Message-ID: <CAMRc=McTQEcwS6JqRsVoZjPYB=KLCjDW7vqjnvL6np8hSfJP+Q@mail.gmail.com>
Subject: Re: [PATCH v2] eeprom: at24: use of_match_ptr()
To: Wolfram Sang <wsa@the-dreams.de>, Peter Rosin <peda@axentia.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 11:30=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver does not depend on CONFIG_OF so using of_match_ptr() makes
> sense to reduce the size a bit.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> v1 -> v2:
> - use __maybe_unused to avoid warnings about at24_of_match not being used
>
>  drivers/misc/eeprom/at24.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index f61a80597a22..8279adade07e 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -18,6 +18,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/nvmem-provider.h>
> +#include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> @@ -242,7 +243,7 @@ static const struct i2c_device_id at24_ids[] =3D {
>  };
>  MODULE_DEVICE_TABLE(i2c, at24_ids);
>
> -static const struct of_device_id at24_of_match[] =3D {
> +static const struct of_device_id __maybe_unused at24_of_match[] =3D {
>         { .compatible =3D "atmel,24c00",          .data =3D &at24_data_24=
c00 },
>         { .compatible =3D "atmel,24c01",          .data =3D &at24_data_24=
c01 },
>         { .compatible =3D "atmel,24cs01",         .data =3D &at24_data_24=
cs01 },
> @@ -812,7 +813,7 @@ static struct i2c_driver at24_driver =3D {
>         .driver =3D {
>                 .name =3D "at24",
>                 .pm =3D &at24_pm_ops,
> -               .of_match_table =3D at24_of_match,
> +               .of_match_table =3D of_match_ptr(at24_of_match),
>                 .acpi_match_table =3D ACPI_PTR(at24_acpi_ids),
>         },
>         .probe =3D at24_probe,
> --
> 2.40.1
>

Patch applied.

Bart

