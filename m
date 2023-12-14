Return-Path: <linux-i2c+bounces-803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A65813501
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 16:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E624BB21197
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 15:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B245D8F9;
	Thu, 14 Dec 2023 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CjorwqaM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA875136
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:39:47 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d0b2752dc6so74156535ad.3
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 07:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702568387; x=1703173187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdjSPhIyB1xzNvePwzN4Lv4667HwZ9Mo32XFQbt5RU0=;
        b=CjorwqaMiPGQidFhMzoDJnRgw5CvHfMjnV0O3bnJ1c+7nfTT8pBgXYUBAx+xONuqdm
         PoEwNuy8OExz/JPKygfkdgYZqI62xgBpcHptaSsBD7UzDcOdBJ8geEagtvW2x0OisLMc
         2+6C5IWQ3kQRwZ5Ae1bxVUgZC9iqV3sAlbMg5SrmdF8sy9RU8NmZddpgmCMiFX5HGpss
         h/37tCS94e9A5xhiP6TepgZ0EDJP+pgXjAsXs0qxy9eA5LpW2jE2l0HUz2fC8wqWS8jE
         POMnLIdAjrxhbFAlj0BlUYT8iYQvMU5CVKrCpdB+osbkNAP8nswuTOepaVGcC6yfEH0M
         +ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702568387; x=1703173187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdjSPhIyB1xzNvePwzN4Lv4667HwZ9Mo32XFQbt5RU0=;
        b=uUxAdaVCL5m8FcvVkDnaJqtwPEV3cBNAkCYziaM4Ar38hEI1MWIRox31cTr2YV6sNs
         CXIByMUf5l40nlhogAHX0RC54oeslAX7osD2CK921Hh2PLnjWqzscpmTsHjAoeLo+E+H
         +2UIaQyeEx2ymcWEn4IxkvHYNoCjaYs77ul4KHcQYliB+vigGw7YPKIIwPGUuxmqwETk
         dL1pf19zEDX8dpVuZoSsZpWW/I9TacefYyZfSWNydUfj7L60SQbBVwKHnjnqa3ZWV/Cs
         eV+ONqKszj1Axc28EkeQ+ihR/4JUbyQPoaLxMJNslTZE8JvY5bnMyiNh5VgN2jApnciE
         eobQ==
X-Gm-Message-State: AOJu0YxBMh+va3/3YQzua/1oCl6KZ/wFVAZnOE3kAmDDzmL4AltSx0dF
	G2tnPNnxsSI/IBu2YD6j9xkD3ucX16KIklW+OlZMLw==
X-Google-Smtp-Source: AGHT+IGirM4+nryJ8CQwEZU0IegMIG64eLAF/7DoRqfynsZoP/h4uO2l7qynqj6arTSz3lMXlgfoKAyn+JsuJdyqzHo=
X-Received: by 2002:a17:90a:e50:b0:286:964d:c with SMTP id p16-20020a17090a0e5000b00286964d000cmr7480168pja.86.1702568387270;
 Thu, 14 Dec 2023 07:39:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org> <20231214105243.3707730-9-tudor.ambarus@linaro.org>
In-Reply-To: <20231214105243.3707730-9-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 14 Dec 2023 09:39:35 -0600
Message-ID: <CAPLW+4=bfcemh-dd7r9hOe0RbtC01+sNpj3ZMMfc8rMezKQfNA@mail.gmail.com>
Subject: Re: [PATCH 08/13] arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 4:52=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Enable the cmu-peric0 clock controller. It feeds USI and I3c.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 9747cb3fa03a..d0b0ad70c6ba 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -339,6 +339,18 @@ ppi_cluster2: interrupt-partition-2 {
>                         };
>                 };
>
> +               cmu_peric0: clock-controller@10800000 {
> +                       compatible =3D "google,gs101-cmu-peric0";
> +                       reg =3D <0x10800000 0x4000>;
> +                       #clock-cells =3D <1>;
> +                       clocks =3D <&ext_24_5m>,
> +                                <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
> +                                <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
> +                       clock-names =3D "oscclk",
> +                                     "dout_cmu_peric0_bus",

I'd pull this line to the above line. Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +                                     "dout_cmu_peric0_ip";
> +               };
> +
>                 sysreg_peric0: syscon@10820000 {
>                         compatible =3D "google,gs101-peric0-sysreg", "sys=
con";
>                         reg =3D <0x10820000 0x10000>;
> --
> 2.43.0.472.g3155946c3a-goog
>

