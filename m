Return-Path: <linux-i2c+bounces-1053-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD7A81F8FA
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 15:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D4C5B20EA1
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 14:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2286CA70;
	Thu, 28 Dec 2023 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bYVPu0Jw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079C6882F
	for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so5754137f8f.0
        for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 06:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703772244; x=1704377044; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mPkijzavdvdOdoaGEBSsLLFk6woqLrK/9VsOdIqUCa0=;
        b=bYVPu0JwyCEQ+me/1C7wRVmxl2Ma6aE6AlWCUAOg3kh8/FWxXmuPV66h7p0po2LyZK
         VnMX2PIpPGA/DdrpV695/VA8VlbtVxl9eapzkjIXXKy16LyT/FevK+Yj3gvipaDWRnwK
         ZY1U61V/xGdk8e29PMq6kTnqWatdp2P3ACZCwF9TEjW8pCXooIYglS7vPKHu4wplgYqr
         igkmpvf/RvVi/Hx9ipQbn8yMz5uANOjIdB0U5+OIhDP7DruacoRYlTAyfdtbhdLtRcF2
         8ySppcwDh7jYkTTThqd6EiffaNRJUJHqvvHnHjqXzrMZHmrKAtZysinWQ9QQdKl1p82T
         ZxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703772244; x=1704377044;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPkijzavdvdOdoaGEBSsLLFk6woqLrK/9VsOdIqUCa0=;
        b=iIofGSKw7fdFZn0lRX5agdPUAtTUrrkkqUTwz2XKQ7ZGnTCYl06IK1DCgahxiQpVC+
         uLiV9K4l+LQifKlR3/tXfIP4407nRkY5yXq+Rfm6jie9eBfE9XJc8V/G1ZYq3SdAoJYl
         8ZyDA8pEeA+0ZmUzZe2DVE7MTQ2u4i8+MzPrjQquzHckmstnkA2HtJdTq3wUoPS3ZqWU
         InIztfkuzuRWAGKcD9Ntg1PbnY6ODW7AnNDKnNWJ8L9ydHEJza2Q/Gk9Jv3bd6wc/UA7
         4OQ4RmeUOMrmZnQpISFQcMV2TCIjAkiNtVPzLkq0tCYKbd9LovyaSkZ/L1FcwPaxn908
         qmwg==
X-Gm-Message-State: AOJu0YxuiMZIzoVnGM1mTBUbAOABN93ftsdjtC0DhoHXBSm2gT+nUzc5
	AVxGvH7EvOydVzcgYhch0PqVNJQCP8tqdg==
X-Google-Smtp-Source: AGHT+IFx1n2uI1NoW+671gtu5x3u/GIM0bqgW0pdaDovQohcs0pKIX6FlwCJutRZLl+Zt/eK41hdWw==
X-Received: by 2002:a5d:5984:0:b0:336:e161:8d with SMTP id n4-20020a5d5984000000b00336e161008dmr2745905wri.78.1703772244272;
        Thu, 28 Dec 2023 06:04:04 -0800 (PST)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id l4-20020a5d6744000000b00336710ddea0sm17155630wrw.59.2023.12.28.06.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 06:04:03 -0800 (PST)
Message-ID: <a40b5d0dc3e151fede14aa00bcb853d1eeb8824b.camel@linaro.org>
Subject: Re: [PATCH v2 11/12] arm64: dts: exynos: gs101: define USI8 with
 I2C configuration
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, peter.griffin@linaro.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com,  sboyd@kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org,  alim.akhtar@samsung.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org,  s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com,  arnd@arndb.de,
 semen.protsenko@linaro.org
Cc: saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, kernel-team@android.com
Date: Thu, 28 Dec 2023 14:04:02 +0000
In-Reply-To: <20231228125805.661725-12-tudor.ambarus@linaro.org>
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
	 <20231228125805.661725-12-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2-1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Tudor,

On Thu, 2023-12-28 at 12:58 +0000, Tudor Ambarus wrote:
> [...]
>=20
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 0e5b1b490b0b..c6ae33016992 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -354,6 +354,35 @@ pinctrl_peric0: pinctrl@10840000 {
> =C2=A0			interrupts =3D <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
> =C2=A0		};
> =C2=A0
> +		usi8: usi@109700c0 {
> +			compatible =3D "google,gs101-usi",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "samsung,exynos850-usi";
> +			reg =3D <0x109700c0 0x20>;
> +			ranges;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
> +				 <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>;
> +			clock-names =3D "pclk", "ipclk";

Given the clock-names, shouldn't the clock indices be the other way around?=
 Also see below.

> +			samsung,sysreg =3D <&sysreg_peric0 0x101c>;
> +			status =3D "disabled";
> +
> +			hsi2c_8: i2c@10970000 {
> +				compatible =3D "google,gs101-hsi2c",
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "samsung,exynosautov9-hsi2c";
> +				reg =3D <0x10970000 0xc0>;
> +				interrupts =3D <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&hsi2c8_bus>;
> +				clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
> +					 <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>;
> +				clock-names =3D "hsi2c", "hsi2c_pclk";

Here, pclk =3D=3D CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK (which is correct=
, I believe), whereas
above pclk =3D=3D CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7

Cheers,
A.


