Return-Path: <linux-i2c+bounces-9259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E33E3A25368
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 08:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DCDC1884260
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 07:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980201F9F51;
	Mon,  3 Feb 2025 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mH1VjjzF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C721E7C34;
	Mon,  3 Feb 2025 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569428; cv=none; b=aA0cZyGdFQLcnuc9/THy2sBkG5tXss6vFJSX6tRgMs6dOKvAC1lGkGuEJUksl3Vy2bp46D+u8hR5PkXnnYrrG3c/f8s6RWO1oIe80AYkTz60QzKLN6Pbm+78dRZuz7nPHulvyiLyPG3ghapaFjPWD7MavoSbE4VRv55vNBJ+YRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569428; c=relaxed/simple;
	bh=5kJGuiN/HJ5xJyJ8CV/kCat9j7iBCMcYyia9cYykokw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPE32m7ZMXJepl7iClcl5bjIe7H3mj+BQvRF1jvlDDDwxfsdpeIzyxQAgaOVhBB05NeVjgQSjbF8C1fr6IqGt2v9lvtcaoMlGAe0i9q6MPfsgC98iNGTD0X+eTC/WQN4UJo4kWd2YPZ9E70Tm60aQ2f/nKjBwD2YQNvEUBvisPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mH1VjjzF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AE8C4CEE2;
	Mon,  3 Feb 2025 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738569427;
	bh=5kJGuiN/HJ5xJyJ8CV/kCat9j7iBCMcYyia9cYykokw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mH1VjjzFMznyc23SuohffVCndcU3q/YdzYR/SqCthoRVEnF6c5vo/uyAJD4itxzmg
	 AN8S1mOgDCwqjsS1IblK7xZE+IbZ4isReC2oRPp4S5ECn9tVDV+kuLpbVk+jDHR1q8
	 PDXYM8hmJ6B9vMirBDkMETCUHP9yIYAeJoOFyX7yKNhKMaZL2zHqa7N0j1SnfP0TUo
	 Ay1dvF6uilNs/NFgm8T705/fLAp51TEyS4Nay6Jxl6fvxUXl54ekqsNnmhaNbif2PH
	 /fB60l1Zix7lnVrxmUUwFAJaFNVoMb6/foIbVFBeXGj7VlsV9cx8t4u4MVzmEhPcTk
	 gV3AAAwX7rxZA==
Date: Mon, 3 Feb 2025 08:57:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Vivek Gautam <gautam.vivek@samsung.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>, Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 03/33] dt-bindings: clock: document exynos7870 clock
 driver CMU bindings
Message-ID: <20250203-congenial-transparent-horse-cc5d4b@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250202190924.15036-1-kauschluss@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202190924.15036-1-kauschluss@disroot.org>

On Mon, Feb 03, 2025 at 12:39:24AM +0530, Kaustabh Chakraborty wrote:

Subject - drop driver. Bindings are about hardware. This applies to all
your bindings patches

> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: gout_mif_cmu_mfcmscl_mfc
> +            - const: gout_mif_cmu_mfcmscl_mscl
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos7870-cmu-peri
> +

Drop blank line

> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (26 MHz)
> +            - description: CMU_PERI bus clock (from CMU_MIF)
> +            - description: SPI0 clock (from CMU_MIF)
> +            - description: SPI1 clock (from CMU_MIF)
> +            - description: SPI2 clock (from CMU_MIF)
> +            - description: SPI3 clock (from CMU_MIF)
> +            - description: SPI4 clock (from CMU_MIF)
> +            - description: UART0 clock (from CMU_MIF)
> +            - description: UART1 clock (from CMU_MIF)
> +            - description: UART2 clock (from CMU_MIF)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: gout_mif_cmu_peri_bus
> +            - const: gout_mif_cmu_peri_spi0
> +            - const: gout_mif_cmu_peri_spi1
> +            - const: gout_mif_cmu_peri_spi2
> +            - const: gout_mif_cmu_peri_spi3
> +            - const: gout_mif_cmu_peri_spi4
> +            - const: gout_mif_cmu_peri_uart0
> +            - const: gout_mif_cmu_peri_uart1
> +            - const: gout_mif_cmu_peri_uart2
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +  - reg

required block is just after properties.

> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock controller node for CMU_PERI

Drop

> +  - |
> +    #include <dt-bindings/clock/exynos7870.h>
> +
> +    cmu_peri: clock-controller@101F0000 {

Lowercase hex

> +      compatible = "samsung,exynos7870-cmu-peri";
> +      reg = <0x101f0000 0x1000>;
> +      #clock-cells = <1>;
> +
> +      clock-names = "oscclk",
> +                    "gout_mif_cmu_peri_bus",
> +                    "gout_mif_cmu_peri_spi0",
> +                    "gout_mif_cmu_peri_spi1",
> +                    "gout_mif_cmu_peri_spi2",
> +                    "gout_mif_cmu_peri_spi3",
> +                    "gout_mif_cmu_peri_spi4",
> +                    "gout_mif_cmu_peri_uart0",
> +                    "gout_mif_cmu_peri_uart1",
> +                    "gout_mif_cmu_peri_uart2";
> +      clocks = <&oscclk>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_BUS>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI0>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI1>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI2>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI3>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI4>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART0>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART1>,
> +               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART2>;
> +    };
> +
> +...
> -- 
> 2.48.1
> 

