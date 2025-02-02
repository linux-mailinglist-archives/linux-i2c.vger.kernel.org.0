Return-Path: <linux-i2c+bounces-9253-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6807A24FC1
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2025 20:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82FB13A34C1
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Feb 2025 19:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAF51FECA2;
	Sun,  2 Feb 2025 19:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdGcrfwb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34771FDE29;
	Sun,  2 Feb 2025 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738523609; cv=none; b=A4e/NwUJd79olXpdqljuyz8Fi+tcsgL6f+ktV6QV2PkIT/RsfUB7hPQ25UTKRwcOzK7/S6vZlzySjVZhJqvsH5PUUJPoXPhJva2BPxdrPh7CmJu4IvCrbPoL073SCPVD5hQcTZtkqaNth3VNrIm3CnvEbVAMS4evwve1egu6OSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738523609; c=relaxed/simple;
	bh=qp85f6lVtyFufftLcvm0KtTkfgTx1E2OjGrzMRYdJYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IdOBlGpYkqWATD3Z1YYBlmOBs+5bW5373cgSMaaNeCyUYn5b7M3bhieFRmQW9VoC+gW/kwkgsQayasVHQwaHdkGhQSlmB2JkOnnGB75Gde1IrRZnK0XeBNRkFh9VWbn98Taz4k4dT3fWcXlitNcsR+acIUy/nBhNSYGT6LQWJuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdGcrfwb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D208CC4CED1;
	Sun,  2 Feb 2025 19:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738523608;
	bh=qp85f6lVtyFufftLcvm0KtTkfgTx1E2OjGrzMRYdJYQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pdGcrfwboB3rD+kxQfruN+ONEzE/H0slRWflqRFQugTFLh6rRmf+SaG8i3l4YEIXh
	 LinmJZwsi3NK7Y8/6aJCrLZOIAy48FyVey4pVb6vZBNwL2sCRB1YYfzktAg4wTjSNM
	 2JyA+MGnaZg1kfbeQpq/AKgiXUWIC/pXP1h24HMSZpKmnc6kVHG1NLbFZqAJwDwXEM
	 CXYBHqQd+BUZDewXD0UVhlPgmWi1lYJSOBn+03/4GYpgKQSjGl4Td8IFyS8zfsKXTZ
	 SgcUZL4TB70C/GqhP7mZXzcNzI/nK8hX2iXPw8WaOvot5f+3nCC3KOuWXExfoiZUpJ
	 JAr75MtBwZhyg==
Message-ID: <54d9a2ef-baaa-4d09-afc8-974bd9bd9daa@kernel.org>
Date: Sun, 2 Feb 2025 20:13:11 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] Add support for the Exynos7870 SoC, along with
 three devices
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Vivek Gautam <gautam.vivek@samsung.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/02/2025 19:36, Kaustabh Chakraborty wrote:
> Samsung Exynos 7870 (codename: Joshua) is an ARM-v8 system-on-chip that was
> announced in 2016. The chipset was found in several popular mid-range to
> low-end Samsung phones, released within 2016 to 2019.
> 
> This patch series aims to add support for Exynos 7870, starting with the
> most basic yet essential components such as CPU, GPU, clock controllers,
> PMIC, pin controllers, etc.
> 
> Moreover, the series also adds support for three Exynos 7870 devices via
> devicetree. The devices are:
>  * Samsung Galaxy J7 Prime     - released 2016, codename on7xelte
>  * Samsung Galaxy J6           - released 2018, codename j6lte
>  * Samsung Galaxy A2 Core      - released 2019, codename a2corelte
> 
> Additional features implemented in this series include:
>  * I2C     - touchscreen, IIO sensors, etc.
>  * UART    - bluetooth and serial debugging
>  * MMC     - eMMC, Wi-Fi SDIO, SDCard
>  * USB     - micro-USB 2.0 interface
> 
> The series has commits from me and Sergey, who has given me permission
> to upstream their patches with proper attribution.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Kaustabh Chakraborty (26):
>       dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid compatible
>       dt-bindings: clock: document exynos7870 clock driver CMU bindings
>       dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
>       dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
>       dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible
>       dt-bindings: serial: samsung: add exynos7870-uart compatible
>       dt-bindings: mfd: samsung,s2mps11: add compatible for s2mpu05-pmic

This is not related at all to this patchset.

>       regulator: dt-bindings: add documentation for s2mpu05-pmic regulators

Neither is this.

>       dt-bindings: phy: samsung,usb3-drd-phy: add exynos7870-usbdrd-phy compatible
>       dt-bindings: usb: samsung,exynos-dwc3: add exynos7870 support
>       dt-bindings: gpu: arm,mali-midgard: add exynos7870 mali compatible
>       dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c compatible
>       dt-bindings: i2c: exynos5: add exynos7870-hsi2c compatible
>       dt-bindings: mmc: samsung,exynos-dw-mshc: add exynos7870 support
>       dt-bindings: soc: samsung,boot-mode: add boot mode definitions for exynos7870
>       dt-bindings: arm: samsung: add compatibles for exynos7870 devices
>       soc: samsung: exynos-chipid: add support for exynos7870
>       clk: samsung: add exynos7870 CLKOUT support
>       tty: serial: samsung: add support for exynos7870

This goes to different patchset. Don't mix with SoC changes or pure
bindings. Your CC list is too big.

>       phy: exynos5-usbdrd: fix MPLL_MULTIPLIER and SSC_REFCLKSEL masks in refclk
>       phy: exynos5-usbdrd: use GENMASK and FIELD_PREP for Exynos5 PHY registers

Different patchset.

>       usb: dwc3: exynos: add support for exynos7870

As well, with bindings.

Please organize your patchset according to standard SoC upstream
guidelines - don't mix SoC with non-Soc upstreaming or other subsystems.
While putting entire SoC in one patchset is tempting, you added here
totally unrelated changes like PMIC drivers. Result: 33 patches and huge
cc-list bouncing from mailing lists.

https://lore.kernel.org/linux-samsung-soc/CADrjBPq_0nUYRABKpskRF_dhHu+4K=duPVZX==0pr+cjSL_caQ@mail.gmail.com/T/#m2d9130a1342ab201ab49670fa6c858ee3724c83c

https://lore.kernel.org/all/20231121-topic-sm8650-upstream-dt-v3-0-db9d0507ffd3@linaro.org/

Best regards,
Krzysztof

