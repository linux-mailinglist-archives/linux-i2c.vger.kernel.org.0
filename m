Return-Path: <linux-i2c+bounces-1340-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B682F3AA
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 19:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07D31B21990
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 18:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64E21CD26;
	Tue, 16 Jan 2024 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e6I0w8cq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3F31CD0C
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jan 2024 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705428250; cv=none; b=G/0JcvhU6OhVPcGWgYQhwAVUv2s9/RFwYEZZrCRiarLkBnHI4vvxKeRDCrEhxfYzvrEUl8b0aCvEt7jfoJNec+z4jSWDDodbibI1AodvS7VRFayR5X9MfqI20s+qm+QyG6AK3rNGlphObYigY7NDy+YYHaxRFEKshOROtKL69jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705428250; c=relaxed/simple;
	bh=Os2qv2Q2j2Nayzw/NO5KHMLTyZsH3lpmBso6vy9XZ1s=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=fB0iwq/2c7Ux5YoxziAQd6PdYvaofyROFT5ocwJx74CvNNNa/OlEle0AvQSNBEopVB0FgzHxU+XFHC/VU1aig+FRU0w0qORdj5s8tbBRkbwNNIoFORJulTPaBZkmiiJ5yfrUcZMxCaOCiTFmnizDNo1994JVaehiX+LSRrEqAUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e6I0w8cq; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d5b87ef0d3so24185875ad.3
        for <linux-i2c@vger.kernel.org>; Tue, 16 Jan 2024 10:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705428248; x=1706033048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe8/o4TF5FBLUMkdKTODJOX218WpgftaiR3H9M62SnY=;
        b=e6I0w8cqZQqdWBQhxTzXMaiue062AfpILjSIXUSiP1fR2Pg2Up1ZEbNpWkcXelkRm2
         c79JWJ/lzun+Q21hPIHpXi2BWvw3TmLh5x/KkviOs9q0FG8yycW1Ndd3Fr0kSVFVHdt9
         PevSVCuRkjV71wFqdBHpLCrGby8XFCwf6fwz89Si4cGqtjmbZohi3yMAvw9xgaWbOkBn
         CTxDWgdG39OdIgOGhQYfC1R4IVRnL2vCgzdINS+kbz4ynue8OC6mQnfe+1h7LJdIsEYm
         MzdcXnp02h8wKG/qbPqYJ6xUqDlGm/MOrI7iAnlCU/Tavqs/votCiX/lu096E6qni85m
         D5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705428248; x=1706033048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pe8/o4TF5FBLUMkdKTODJOX218WpgftaiR3H9M62SnY=;
        b=rpnSM7wbR3jHViUMLSt4pNdBQNl8xNDOH92ljBnNyVASWLwESYDBP9YxFe87KId22C
         yTcZANXpCUyzlzbR33kHcZxQBSN08CPnDNwc4dElCJyC7GS170ykOhTvbj9VB8rSRaiJ
         POjKBnoMr5LZqK+MlvIeBZ8iWgR8pnPZ986dDucJHfs3dt0Bl/Rz3CtlzwF1X9SbqDvi
         mianqGepMZIRy2dOmarIuE4PGRrb4jj1Mh0JYREpfuDLQdL8ChDaG6hTYbU8Ixn66j07
         nvg0ArnpjXJZOr8KRHrj/Hkv6C0nD4QMbjHTIVtZAxoVM94mJOZjRbihungqc85I72lc
         eK9A==
X-Gm-Message-State: AOJu0YzQYBbq2fICdq5rVDyL9gw2acm2oQOxSlEB47wI/lpUgT0wuJpD
	0LkJweFPlQD+k3viu2h9mdEkxfGTCyKnLZP0Sl8DUNk4/R5Bzw==
X-Google-Smtp-Source: AGHT+IHTwCfy8Hjuw6p1Hld3+SjDHNo7RzF6Oh4JalL87WHk2X4DOB9TTzfdw3L1gadUCh3PVsDQDSIpCL3FSsxKtsQ=
X-Received: by 2002:a17:902:cec2:b0:1d5:4c65:6f67 with SMTP id
 d2-20020a170902cec200b001d54c656f67mr10059965plg.111.1705428247896; Tue, 16
 Jan 2024 10:04:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org> <20240109125814.3691033-12-tudor.ambarus@linaro.org>
In-Reply-To: <20240109125814.3691033-12-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 16 Jan 2024 12:03:56 -0600
Message-ID: <CAPLW+4=U9DBmwgxyWz3cy=V-Ui7s2Z9um4xbEuyax1o=0zB_NA@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: exynos: gs101: define USI8 with I2C configuration
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org, 
	alim.akhtar@samsung.com, jirislaby@kernel.org, s.nawrocki@samsung.com, 
	tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 7:01=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> USI8 I2C is used to communicate with an eeprom found on the battery
> connector. Define USI8 in I2C configuration.
>
> USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
> doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
> selection of the protocol is intentionally left for the board dts file.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> v3: reorder usi8 clock order (thanks Andre'!). Did not make any
> difference at testing as the usi driver treats the clocks in bulk.
> v2:
> - identify and use gate clocks instead of dividers
> - move cells and pinctrl properties from dts to dtsi
> - move IRQ type constant on the previous line
>
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 29 ++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 6aa25cc4676e..f14a24628d04 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -352,6 +352,35 @@ pinctrl_peric0: pinctrl@10840000 {
>                         interrupts =3D <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                 };
>
> +               usi8: usi@109700c0 {
> +                       compatible =3D "google,gs101-usi",
> +                                    "samsung,exynos850-usi";
> +                       reg =3D <0x109700c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC=
0_USI8_USI_CLK>,
> +                                <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_7>;
> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&sysreg_peric0 0x101c>;

I'd also add samsung,mode for the "default" USI mode here, just to
avoid providing it later in the board's dts. But that's a matter of
taste I guess.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +                       status =3D "disabled";
> +
> +                       hsi2c_8: i2c@10970000 {
> +                               compatible =3D "google,gs101-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10970000 0xc0>;
> +                               interrupts =3D <GIC_SPI 642 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               pinctrl-names =3D "default";
> +                               pinctrl-0 =3D <&hsi2c8_bus>;
> +                               clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_P=
ERIC0_TOP0_IPCLK_7>,
> +                                        <&cmu_peric0 CLK_GOUT_PERIC0_CLK=
_PERIC0_USI8_USI_CLK>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
>                 usi_uart: usi@10a000c0 {
>                         compatible =3D "google,gs101-usi",
>                                      "samsung,exynos850-usi";
> --
> 2.43.0.472.g3155946c3a-goog
>
>

