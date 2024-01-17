Return-Path: <linux-i2c+bounces-1358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C032830AB9
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 17:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB1FA1F29C9B
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 16:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFA722609;
	Wed, 17 Jan 2024 16:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JudPH6LG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDBF225AD
	for <linux-i2c@vger.kernel.org>; Wed, 17 Jan 2024 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705507962; cv=none; b=JZGH8Z7B2Tpoh64EJeQ6X7xya2yV/MfOCrNeyqrTHP5FrWsFzSrAFLKV362+FC9CTVdLaHSaq2CyrGNf17xJW0gCT9tPbkGgLjNJiFXzbxGgszdIkrWSmUzB6E6E/3NqaSHiALTJe+e74yZjqwGbWdenpWFCMNRlYxkjQVDRFxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705507962; c=relaxed/simple;
	bh=8pP0pZPXq9lZ9dnBrsfOtWnZOB8bSmDCi9SgbNW5rUo=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=PG20Na3QEM8d7x8yWQim3J0OrBj4G6K29tSX1LwqMJajM2JezdtNYC63lwKYwyVSU2vmDM96b0fgG3nNOiS95p7IfwuuMasI7l55m1K9aF4fcWHFFK8HBBFPXCCjR1MytivdzoC9DHJam9QP9Np9rgQrvJo6/d3pWfugn3mf1BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JudPH6LG; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-28b9e9e83b0so6474483a91.2
        for <linux-i2c@vger.kernel.org>; Wed, 17 Jan 2024 08:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705507960; x=1706112760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jk8D0Nm+lCIPdeHpzzgYKxBrrf41aydV20z4eqYwd98=;
        b=JudPH6LGCguUfKWawcHItX0TIf5GaMifO+Pmr5BpH/eC30pBOFoBFDKI7tEbzRKYzA
         l0cymWyTn0rCazRG4340ngCpVJuB+Qwdsk2g7XpKC2Y1rZC9YzwRdN5Sk0qTTuMkVsgF
         Q+mVXWk5bZtGFLXsuB28uvSGUQCCSDa7kHPqtyMwz3uLw2D23YVnWyB6xBUrvDzC1fwS
         vkitQ1LMWvUaUEUPfgAb/OQnA3obn605LbtDqUre4+KmR4+DKtDo+4iF2v8J+ryITfWe
         mXolKQasPFfVx6knkr2J3aokRA7wzsn3QWee2tTC6zhfdN1MZvBLYEHADxa44oDctZ8M
         /12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507960; x=1706112760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jk8D0Nm+lCIPdeHpzzgYKxBrrf41aydV20z4eqYwd98=;
        b=YsTzXguUjoPyUKxG95zLWDmDWpIXmZbblUjnXbwjtkAShzK5gl22ji2Gs2S9QV0fuh
         SV6CBqIVA0Jn71loHgvGPgH/CcTLLRahHas8lXfLmiJN4Swi5iGJBS8QOZqpjcM2OW8l
         KjRQ2XTpOAhQAZULyhoAXWlH1Tc4O1f2PVr1aZM933nSEirQJiUapWj0ftdOa4ONIYIm
         /2xWvYtaG/XRQAAWB8+RIWXdaALA4ksI1vSI8+pKfbO/ExVmqJdfJPJ/4srwJ660C56l
         JE2oxiajxMYy4utxIwcr6JhzLLBCIjkhG8htTPnJ9vxhyJ7OIUNN9aOUpVmCR1UgHToJ
         yZ3A==
X-Gm-Message-State: AOJu0Ywkvmgr2kg2aV013KTeAoRqFc97LNLlFgL0yCFMTycW90OyES/b
	bYtyJE8D7FhpBUO7C14ny6PvTcR7Nc0jO4SbwsO8WnPMkfQZHg==
X-Google-Smtp-Source: AGHT+IGiZ4uEBbqIjMDXfsMXnz11sRVC/bQ5Oy8wG+iTZ84rVi+dz2Q7JsKCe8gGwF4rw5cYilSbWmGASlzgfWzJxsA=
X-Received: by 2002:a17:90a:6e01:b0:290:727:edf3 with SMTP id
 b1-20020a17090a6e0100b002900727edf3mr504146pjk.28.1705507959829; Wed, 17 Jan
 2024 08:12:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
 <20240109125814.3691033-12-tudor.ambarus@linaro.org> <CAPLW+4=U9DBmwgxyWz3cy=V-Ui7s2Z9um4xbEuyax1o=0zB_NA@mail.gmail.com>
 <c72ca8b2-55a6-4ec7-8013-0a563d6dcdfe@linaro.org>
In-Reply-To: <c72ca8b2-55a6-4ec7-8013-0a563d6dcdfe@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 17 Jan 2024 10:12:28 -0600
Message-ID: <CAPLW+4k9TTcp9p3dUOVpx2M-YGy+_V1p3Q3zdBvTcCqw9ytsDA@mail.gmail.com>
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

On Wed, Jan 17, 2024 at 9:08=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
>
>
> On 1/16/24 18:03, Sam Protsenko wrote:
> >> USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
> >> doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
> >> selection of the protocol is intentionally left for the board dts file=
.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> ---
> >> v3: reorder usi8 clock order (thanks Andre'!). Did not make any
> >> difference at testing as the usi driver treats the clocks in bulk.
> >> v2:
> >> - identify and use gate clocks instead of dividers
> >> - move cells and pinctrl properties from dts to dtsi
> >> - move IRQ type constant on the previous line
> >>
> >>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 29 +++++++++++++++++++=
+
> >>  1 file changed, 29 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64=
/boot/dts/exynos/google/gs101.dtsi
> >> index 6aa25cc4676e..f14a24628d04 100644
> >> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> >> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> >> @@ -352,6 +352,35 @@ pinctrl_peric0: pinctrl@10840000 {
> >>                         interrupts =3D <GIC_SPI 625 IRQ_TYPE_LEVEL_HIG=
H 0>;
> >>                 };
> >>
> >> +               usi8: usi@109700c0 {
> >> +                       compatible =3D "google,gs101-usi",
> >> +                                    "samsung,exynos850-usi";
> >> +                       reg =3D <0x109700c0 0x20>;
> >> +                       ranges;
> >> +                       #address-cells =3D <1>;
> >> +                       #size-cells =3D <1>;
> >> +                       clocks =3D <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PE=
RIC0_USI8_USI_CLK>,
> >> +                                <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_T=
OP0_IPCLK_7>;
> >> +                       clock-names =3D "pclk", "ipclk";
> >> +                       samsung,sysreg =3D <&sysreg_peric0 0x101c>;
> > I'd also add samsung,mode for the "default" USI mode here, just to
> > avoid providing it later in the board's dts. But that's a matter of
> > taste I guess.
> >
>
> USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
> doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
> selection of the protocol is intentionally left for the board dts file.
>
> I wanted to emphasize that USI8 doesn't have any HW defaults and its
> mode must be chosen by each particular board.
>
> I mentioned the same in the commit message, please tell if you feel it
> needs updating.
>

No, thanks, everything LGTM, I already added my R-b tag above.

> Cheers,
> ta

