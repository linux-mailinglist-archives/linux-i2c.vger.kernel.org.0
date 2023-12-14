Return-Path: <linux-i2c+bounces-806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9D0813561
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 16:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCFB31C20ED9
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 15:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9345E0D5;
	Thu, 14 Dec 2023 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LUyqbVXO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B45910F
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:55:15 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5c690c3d113so6881319a12.1
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702569314; x=1703174114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3dEU5MDIKfW+qCgC0PdqFKd7O+g3bLPZxWTXEaaam8=;
        b=LUyqbVXObIzpamKp0fyTc+Rjv3sguhqfdpED9TmePWCZv+DQG/dqABjbEk0V9Q+uRg
         nD0pZis1uUfhbvMV5ZpUNXnIWzvwEmssJkxnzs5vknuwPWCN1CQFOmtEBppmxh4xVxS6
         KcrEUnjnK8ll51DompifLrq+hhtrACZorfqCrAFgGokXqwzz/3AkrYjEhKgdJLf8TKHD
         WNqSuGRt/DTZNcxdV6vGL5bfJKU6P5WWvmwqoz12BOSNydE17EfFC/y6fSisGB7bCKks
         uDImIVJsm27r8qyePzoYzOkSF4SS9POTHWtJC1EWaCCwdjeQhG+t67dnl1Ft3Bi+gBue
         fr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569314; x=1703174114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3dEU5MDIKfW+qCgC0PdqFKd7O+g3bLPZxWTXEaaam8=;
        b=tkhI9fWcP5+HkJrHlNh74VTTylTAc24a2rQKqwfyq4q3fije2JzSzBTGQKU0iQz+O/
         KHXbdDll1eBP8TSsynt0/GQOWs3WfqxaDgnHJVY5+UXJ/+WeoXA6RFaEvIHaOB/C9Yvc
         pH2tL5kqACtxCfapvU5g6ZKghb0O3JZTXlzLG5QD30PYD7K6aqW1C95b+VffkCn8usvN
         +BWDmYSN2TfS7mZ9LAevo7hgnPc88QzRGLPjesc3HglNTQeQa45oLjGTd6ru0wt9H/pM
         j9mM0+y5S5nhRfBRWtJPUoNGnjPeWwf+p8ZnQZ4XU9xeVlFrApTBHDGrOafNNW+RjrVj
         oI1A==
X-Gm-Message-State: AOJu0Yx2yHmShkkZNoX/NRaf7XEIfhbB37Ra0FQZEioton0dZJp/nsLW
	NXaaAkIdKmNyekasYFyV0eJGpRNCf2W/mtD+Cy2g9g==
X-Google-Smtp-Source: AGHT+IGkTnLdOtrqyXltKJs1dUID0ysgTZE7BI1PV4SJTjovnObU8OGLzeMvBOaKswBq0xLjC9rksw67hcvGeMcAL24=
X-Received: by 2002:a17:90b:948:b0:28a:e356:459b with SMTP id
 dw8-20020a17090b094800b0028ae356459bmr2009364pjb.34.1702569314569; Thu, 14
 Dec 2023 07:55:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org> <20231214105243.3707730-12-tudor.ambarus@linaro.org>
In-Reply-To: <20231214105243.3707730-12-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 14 Dec 2023 09:55:03 -0600
Message-ID: <CAPLW+4nTgam4jZ+s5m5E05jWO_kfSy=fMS0Ywp3yQEEn-UESbg@mail.gmail.com>
Subject: Re: [PATCH 11/13] arm64: dts: exynos: gs101: enable eeprom on gs101-oriole
To: Tudor Ambarus <tudor.ambarus@linaro.org>, krzysztof.kozlowski+dt@linaro.org
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, 
	alim.akhtar@samsung.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, s.nawrocki@samsung.com, 
	tomasz.figa@gmail.com, cw00.choi@samsung.com, arnd@arndb.de, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 4:53=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Enable the eeprom found on the battery connector.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  .../boot/dts/exynos/google/gs101-oriole.dts    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/ar=
m64/boot/dts/exynos/google/gs101-oriole.dts
> index 4a71f752200d..11b299d21c5d 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -63,6 +63,19 @@ &ext_200m {
>         clock-frequency =3D <200000000>;
>  };
>
> +&hsi2c_8 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&hsi2c8_bus>;
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;

Not sure if those 4 above properties belong in board's dts or in SoC's
dtsi. Krzysztof, what do you think?

Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +       status =3D "okay";
> +
> +       eeprom: eeprom@50 {
> +               compatible =3D "atmel,24c08";
> +               reg =3D <0x50>;
> +       };
> +};
> +
>  &pinctrl_far_alive {
>         key_voldown: key-voldown-pins {
>                 samsung,pins =3D "gpa7-3";
> @@ -99,6 +112,11 @@ &usi_uart {
>         status =3D "okay";
>  };
>
> +&usi8 {
> +       samsung,mode =3D <USI_V2_I2C>;
> +       status =3D "okay";
> +};
> +
>  &watchdog_cl0 {
>         timeout-sec =3D <30>;
>         status =3D "okay";
> --
> 2.43.0.472.g3155946c3a-goog
>

