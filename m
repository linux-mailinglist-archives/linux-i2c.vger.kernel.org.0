Return-Path: <linux-i2c+bounces-5606-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53464958F4E
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 22:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76A581C21D3B
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 20:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5341C3798;
	Tue, 20 Aug 2024 20:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7yI+IRD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260101514FB;
	Tue, 20 Aug 2024 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724186863; cv=none; b=hHi/T0GKovxz7tOTKtdb5aQ7JUYpzckbfqq+fF5aRktTccxJ9oVSaZd7yj7/vrmoHa1mOA8L3swY+MQHKLMk4q+tx+SDM2ZkjpDQcLQaxW0HQIzTemzNUXgMRIHFpQMiDjW/6KxHJNLhXOM3PBAf5Gf8Ask1QPZLF7WSMcTLCeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724186863; c=relaxed/simple;
	bh=20jKGGT+L0EemIZaHolnCYzOefW0OCFwhE2SGr1OXOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEeC49B090JLEnsi+kqlCQsXoVS8ZPAfx8IYg5d5r9Si8xBTKKwtRBDVI+bHEHT8BxulYDTfAtwnLYcL6Vymf+FwnJ+QCslBZ7oNazRhtBqWQZoowiGEsCAo+u7nlyB648SMSGbViwUf2NestOJW3rBT/FpYnnoMWC+Q5JQq2JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7yI+IRD; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53343bf5eddso1486516e87.1;
        Tue, 20 Aug 2024 13:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724186859; x=1724791659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uykUVslv1+/fS0lVXK/wTmxMrj01bPI++FNqDHJmXmQ=;
        b=d7yI+IRDE5uZaNkn5o/djB8WQTY0GvYrl9Lh6nd2ek3ZW1uty9XEro/1pan35fmRFs
         lI1Dxaq04pIWPPu/6RiKY9z357rq+cf3JloUhYxSdyp+E4ExM5nq0o95ER+8mvzZxYyF
         4x5gT6Hdxm7M/dviCeTFBCT2tbnjoQUIn8X+eMneK5Dp5DOfp1UCGaQtmZNTpB/zDxIA
         pwgjHy4aZkWTlSkeciLjrgZkNNjfukIZFQHAlTlOQvaLUPFt8QAN7mvthvdWhVmGJVPQ
         gCepDwH1Wt59IsG3Y0CbCvpRx87Ill/bgH9GEifqMyHUEUdYhIu9ZF5vqJkO6Tr1B1kQ
         kpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724186859; x=1724791659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uykUVslv1+/fS0lVXK/wTmxMrj01bPI++FNqDHJmXmQ=;
        b=r5RNyY8VMkSvirK8ad6fyEiNZQ6qM9cAcW4VsPfa2ZtXQbo2OAbSONwz6THbMFjD4z
         bAAgTi9ki888zxvd4A4ZOilLgeLdR3fvXmT2MtdIGWTBuTi3PuiU/DwJNsRUzjgQFfGo
         DvqHZhMaftB2Z5ozlrgPHeAxC4xiOZFZXtsAi6mBHt7ZXIuW0rUKTBMAPJRwG2HYYJCH
         cAfD2eJhXUI6m3TbHWBzaAj1EAzR1L/TzP7aqHQZT1BvDS2iYOCNjYW1iDSodRjsLMlO
         GXJmy68sVSp0nbQ71KUdlvN2s7pVhyOGE5ysuMe0we2EQe5YH7R3vrP92jlF8/75Qi2L
         1UiA==
X-Forwarded-Encrypted: i=1; AJvYcCV2WgBtO1Pp2EmZajxd0jZw+mXPqFPR2kRFuvsSlNa5fVXQRdPfolnC4BruxKinGp9z5XyZdGltOcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwm7d4gQELKYzNR6MwH/PZciezGAx6zG/ACncsgflmlwKJv9dc
	DMGti/NQnOGXWxKQwvmS/5dbVufDwMP8JgAv7PEcWGnYvj8NB5NnzL1JteAFdRf1p2sArXF+o3p
	o1o8EVMPROj+hhx12ecPHaJVNq6c=
X-Google-Smtp-Source: AGHT+IHk01Un61zxCq+yuKZXrMijzTM+kp6mFCLY0BarTVDvWLm6zKKJx8BxgzrLN0AUKvDQ2F9vOo/qoezSuSKT5tg=
X-Received: by 2002:a05:6512:3da8:b0:530:c1fb:5192 with SMTP id
 2adb3069b0e04-533485516ffmr15292e87.16.1724186858765; Tue, 20 Aug 2024
 13:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
In-Reply-To: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 17:47:27 -0300
Message-ID: <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding the i2c-folks on Cc.

On Tue, Aug 20, 2024 at 5:02=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi,
>
> I am seeing an issue with the PCA935X driver in 6.6.41 and
> 6.11.0-rc4-next-20240820.
>
> The pca953x is getting probed before its I2C parent (i2c-2):
>
> [    1.872917] pca953x 2-0020: supply vcc not found, using dummy regulato=
r
> [    1.889195] pca953x 2-0020: using no AI
> [    1.893260] pca953x 2-0020: failed writing register
> [    1.898258] pca953x 2-0020: probe with driver pca953x failed with erro=
r -11
> [    1.905575] i2c i2c-2: IMX I2C adapter registered
>
> This problem is seen on a custom imx8mp board.
> I am not able to reproduce it on an imx8mm-evk.
>
> If I select the pca953x as a module or insert a delay inside its
> probe() function, it probes successfully.
>
> The drivers/gpio/gpio-pca953x.c has the following comments:
>
> /* register after i2c postcore initcall and before
>  * subsys initcalls that may rely on these GPIOs
>  */
> subsys_initcall(pca953x_init);
>
> but it seems this is not happening.
>
> I have also tried to register it like this:
>
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1369,21 +1369,7 @@ static struct i2c_driver pca953x_driver =3D {
>         .remove         =3D pca953x_remove,
>         .id_table       =3D pca953x_id,
>  };
> -
> -static int __init pca953x_init(void)
> -{
> -       return i2c_add_driver(&pca953x_driver);
> -}
> -/* register after i2c postcore initcall and before
> - * subsys initcalls that may rely on these GPIOs
> - */
> -subsys_initcall(pca953x_init);
> -
> -static void __exit pca953x_exit(void)
> -{
> -       i2c_del_driver(&pca953x_driver);
> -}
> -module_exit(pca953x_exit);
> +module_i2c_driver(pca953x_driver);
> )
>
> but this did not help either.
>
> Does anyone have any suggestions on how to fix this problem when the
> pca953x driver is built-in?

If I register the i2c-imx driver like this:

--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1638,18 +1638,7 @@ static struct platform_driver i2c_imx_driver =3D {
        },
        .id_table =3D imx_i2c_devtype,
 };
-
-static int __init i2c_adap_imx_init(void)
-{
-       return platform_driver_register(&i2c_imx_driver);
-}
-subsys_initcall(i2c_adap_imx_init);
-
-static void __exit i2c_adap_imx_exit(void)
-{
-       platform_driver_unregister(&i2c_imx_driver);
-}
-module_exit(i2c_adap_imx_exit);
+module_platform_driver(i2c_imx_driver);

then the pca953x driver probes correctly.

:~/stable/linux$ git grep subsys_initcall drivers/i2c/ | wc -l
15

:~/stable/linux$ git grep module_platform_driver drivers/i2c/ | wc -l
75

Most of the I2C drivers are registered as module_platform_driver().

