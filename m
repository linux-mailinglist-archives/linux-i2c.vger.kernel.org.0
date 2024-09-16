Return-Path: <linux-i2c+bounces-6764-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FFF979B63
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 08:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2349F1C20CA0
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 06:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBE553376;
	Mon, 16 Sep 2024 06:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iajKLxqA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1481F5F6;
	Mon, 16 Sep 2024 06:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726469266; cv=none; b=JdVo+o7lGQn4cYAT38fRgclNt8djbw2hxW+r4ilBNa8G04RRqRNmxucGJ5YRCfL07IflmD1LuCg7ocIfSeAz0MWwzroWl35bCs1Ik/Nxh4OI5ByRIXgOfXtMm1OfN4vVHxGo0Iqn5HrEsOgUxtJdtUp83ljpwyaB5pkP2ald3+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726469266; c=relaxed/simple;
	bh=X+Df26JHczAuZOXyuIo4Gw81bNTKkhzqpqkGPSwKLpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVSOZnrWoUmo6tj7nNn82kZ2IhGBMMtIncHdDVLO0o+v/Q7Z6hKlz4aHJy9+SAQwvju9+D0be8ko4E9j/02a6UCrlNuYC9sfbTi8jKIbXoUKXi9q+1b9bGICXwr1SrrOMT1iVEHD3gmSEjmRYMgmQHX+el8pPzODIIiwf6aLRMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iajKLxqA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B267EC4CEC4;
	Mon, 16 Sep 2024 06:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726469265;
	bh=X+Df26JHczAuZOXyuIo4Gw81bNTKkhzqpqkGPSwKLpE=;
	h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
	b=iajKLxqAJ3kAKVWntWkvz/7e94s6mbY87ErViZ8LKRzbYP9r5qo8GmVU6Vv0g2u8l
	 2EyXX7CYc842v/9SNd6Rfw3gls/0JT5S8SUsL5h87gr8i0twHut+mjIjNj7n6lYsZ8
	 OacEvHD/znRHRZjVZoT6SYHhioP1PN0H1z0POIiV9BHY7xYoqmX7m0pZ0Q9x2UfR0D
	 SQdMxqjjQRTeJTS0FilPQnAJS8UnDCpWfBnNzGpH3FnhegRbnN/gcTaMctnbkUfq2d
	 opBzCXDXZRpHBUt062LsKelBBeA5aZPlvqeR9fX//n8/hsQC+doxXnp7pmz9BppTSP
	 OyT6BHL2PxQHw==
Message-ID: <271128c9-cb32-499c-88ab-dcae588a1569@kernel.org>
Date: Mon, 16 Sep 2024 08:47:34 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/21] include: dt-binding: clock: add adi clock header
 file
To: arturs.artamonovs@analog.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Utsav Agarwal <Utsav.Agarwal@analog.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, adsp-linux@analog.com,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-6-458fa57c8ccf@analog.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240912-test-v1-6-458fa57c8ccf@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 20:24, Arturs Artamonovs via B4 Relay wrote:
> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
> 
> Add adi clock driver header file

Useless on its own. This must be part of bindings patch.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> 
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
> ---
>  include/dt-bindings/clock/adi-sc5xx-clock.h | 93 +++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/adi-sc5xx-clock.h b/include/dt-bindings/clock/adi-sc5xx-clock.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..723c11dc44f9741cff49dc2cb6c5232022abf00c
> --- /dev/null
> +++ b/include/dt-bindings/clock/adi-sc5xx-clock.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ADSP SC5xx clock device tree bindings
> + *
> + * Copyright 2022-2024 - Analog Devices Inc.
> + */
> +
> +#ifndef DT_BINDINGS_CLOCK_ADI_SC5XX_CLOCK_H
> +#define DT_BINDINGS_CLOCK_ADI_SC5XX_CLOCK_H
> +
> +#define ADSP_SC598_CLK_DUMMY 0
> +#define ADSP_SC598_CLK_SYS_CLKIN0 1
> +#define ADSP_SC598_CLK_SYS_CLKIN1 2
> +#define ADSP_SC598_CLK_CGU0_PLL_IN 3
> +#define ADSP_SC598_CLK_CGU0_VCO_OUT 4
> +#define ADSP_SC598_CLK_CGU0_PLLCLK 5

That's quite unreadable code. Indent after define name.


> +#define ADSP_SC598_CLK_CGU1_IN 6
> +#define ADSP_SC598_CLK_CGU1_PLL_IN 7
> +#define ADSP_SC598_CLK_CGU1_VCO_OUT 8
> +#define ADSP_SC598_CLK_CGU1_PLLCLK 9
> +#define ADSP_SC598_CLK_CGU0_CDIV 10
> +#define ADSP_SC598_CLK_CGU0_SYSCLK 11
> +#define ADSP_SC598_CLK_CGU0_DDIV 12
> +#define ADSP_SC598_CLK_CGU0_ODIV 13
> +#define ADSP_SC598_CLK_CGU0_S0SELDIV 14
> +#define ADSP_SC598_CLK_CGU0_S1SELDIV 15
> +#define ADSP_SC598_CLK_CGU0_S1SELEXDIV 16
> +#define ADSP_SC598_CLK_CGU0_S1SEL 17
> +#define ADSP_SC598_CLK_CGU1_CDIV 18
> +#define ADSP_SC598_CLK_CGU1_SYSCLK 19
> +#define ADSP_SC598_CLK_CGU1_DDIV 20
> +#define ADSP_SC598_CLK_CGU1_ODIV 21
> +#define ADSP_SC598_CLK_CGU1_S0SELDIV 22
> +#define ADSP_SC598_CLK_CGU1_S1SELDIV 23
> +#define ADSP_SC598_CLK_CGU1_S0SELEXDIV 24
> +#define ADSP_SC598_CLK_CGU1_S1SELEXDIV 25
> +#define ADSP_SC598_CLK_CGU1_S0SEL 26
> +#define ADSP_SC598_CLK_CGU1_S1SEL 27
> +#define ADSP_SC598_CLK_CGU0_CCLK2 28
> +#define ADSP_SC598_CLK_CGU0_CCLK0 29
> +#define ADSP_SC598_CLK_CGU0_OCLK 30
> +#define ADSP_SC598_CLK_CGU0_DCLK 31
> +#define ADSP_SC598_CLK_CGU0_SCLK1 32
> +#define ADSP_SC598_CLK_CGU0_SCLK0 33
> +#define ADSP_SC598_CLK_CGU1_CCLK0 34
> +#define ADSP_SC598_CLK_CGU1_OCLK 35
> +#define ADSP_SC598_CLK_CGU1_DCLK 36
> +#define ADSP_SC598_CLK_CGU1_SCLK1 37
> +#define ADSP_SC598_CLK_CGU1_SCLK0 38
> +#define ADSP_SC598_CLK_CGU1_CCLK2 39
> +#define ADSP_SC598_CLK_DCLK0_HALF 40
> +#define ADSP_SC598_CLK_DCLK1_HALF 41
> +#define ADSP_SC598_CLK_CGU1_SCLK1_HALF 42
> +#define ADSP_SC598_CLK_SHARC0_SEL 43
> +#define ADSP_SC598_CLK_SHARC1_SEL 44
> +#define ADSP_SC598_CLK_ARM_SEL 45
> +#define ADSP_SC598_CLK_CDU_DDR_SEL 46
> +#define ADSP_SC598_CLK_CAN_SEL 47
> +#define ADSP_SC598_CLK_SPDIF_SEL 48
> +#define ADSP_SC598_CLK_SPI_SEL 49
> +#define ADSP_SC598_CLK_GIGE_SEL 50
> +#define ADSP_SC598_CLK_LP_SEL 51
> +#define ADSP_SC598_CLK_LP_DDR_SEL 52
> +#define ADSP_SC598_CLK_OSPI_REFCLK_SEL 53
> +#define ADSP_SC598_CLK_TRACE_SEL 54
> +#define ADSP_SC598_CLK_EMMC_SEL 55
> +#define ADSP_SC598_CLK_EMMC_TIMER_QMC_SEL 56
> +#define ADSP_SC598_CLK_SHARC0 57
> +#define ADSP_SC598_CLK_SHARC1 58
> +#define ADSP_SC598_CLK_ARM 59
> +#define ADSP_SC598_CLK_CDU_DDR 60
> +#define ADSP_SC598_CLK_CAN 61
> +#define ADSP_SC598_CLK_SPDIF 62
> +#define ADSP_SC598_CLK_SPI 63
> +#define ADSP_SC598_CLK_GIGE 64
> +#define ADSP_SC598_CLK_LP 65
> +#define ADSP_SC598_CLK_LP_DDR 66
> +#define ADSP_SC598_CLK_OSPI_REFCLK 67
> +#define ADSP_SC598_CLK_TRACE 68
> +#define ADSP_SC598_CLK_EMMC 69
> +#define ADSP_SC598_CLK_EMMC_TIMER_QMC 70
> +#define ADSP_SC598_CLK_3PLL_PLL_IN 71
> +#define ADSP_SC598_CLK_3PLL_VCO_OUT 72
> +#define ADSP_SC598_CLK_3PLL_PLLCLK 73
> +#define ADSP_SC598_CLK_3PLL_DDIV 74
> +#define ADSP_SC598_CLK_DDR_SEL 75
> +#define ADSP_SC598_CLK_DDR 76
> +#define ADSP_SC598_CLK_CGU0_VCO_2_OUT 77
> +#define ADSP_SC598_CLK_CGU1_VCO_2_OUT 78
> +#define ADSP_SC598_CLK_3PLL_VCO_2_OUT 79
> +#define ADSP_SC598_CLK_END 80

Drop this one. Not a binding.


Best regards,
Krzysztof


