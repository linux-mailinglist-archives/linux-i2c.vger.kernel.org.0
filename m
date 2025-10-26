Return-Path: <linux-i2c+bounces-13813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE39EC0AC82
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 16:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D8DB189DBD4
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 15:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D1B2D12EC;
	Sun, 26 Oct 2025 15:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMOgmYUh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B236BF9C1;
	Sun, 26 Oct 2025 15:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761492814; cv=none; b=jFJA2oDK+0ALqHN1uGmhIVlPxqj0abKpJXRhdzeJWhygt6DE0tSXe69XLRz2NAwPy9f+ZG4htbgCzq2dWWFq65Liy923K6VBUAZJMris7qEZWrs+gfGzFq+seNzM3peSoZspLzQoVAjI2Q9PIstMEyaj/1wQCyQB8s0nIw5VM0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761492814; c=relaxed/simple;
	bh=xcyneBcmqEXh1gtIGSMH8hZ6blwtbmsHjpXAgiQk4og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBi40C7la0e99wtQN9qJd9atfOEQZLYyChbkC5OT3+TYnTRRqvC/X5BBM3DpoDsJF7hKWbZNrvLZ+FDFnlwgQfbAeXq8lThfNd9UFXpnH5cnuX0tY7Rf+Cg28zsOx38Z+f6gdMyMnZ5uP+Qc0dGmWrp32upcUB5d6PoCq3xbUk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMOgmYUh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08561C4CEE7;
	Sun, 26 Oct 2025 15:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761492813;
	bh=xcyneBcmqEXh1gtIGSMH8hZ6blwtbmsHjpXAgiQk4og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMOgmYUhH5CWiLpmpAcqvE2aJlNaa9a4g/kR0KAf7QFm3VqHWnqDGFH6fiFiRXAM7
	 719RKdGnJaRpD5lYwjB9/+FGx+ADZLfA27ZyDl+Nos3NEnpOzfd+82u1znie4kyKSe
	 ZeWvy7BGLefzertq5pdnKd+TYG5J5Um+zmnxR3uIjWn6yiEJa551R7aZZa14y0K8WO
	 d7ZGFTNbDc10a6h73Aa5T1L5ejIPcXo3g9WBxrp6mfEbYBuGSKF70AzOnB1Vkp0OvV
	 dj/+Pk8065yu30LhoAjkLSPUFLhaPWozHEb6dt0QS2vN8PkeW5pBlRGGfsWvGvs3J8
	 fmkxtoOgOOKWQ==
Date: Sun, 26 Oct 2025 21:03:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck <linux@roeck-us.net>, 
	Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Georgi Djakov <djakov@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Lee Jones <lee@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <hodycue2cqii22epdawn2pqx7twy5mzgrrlb53u7nj4h5w37ek@yvptyb2u6jj2>
References: <20251023143957.2899600-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>

On Thu, Oct 23, 2025 at 09:37:56AM -0500, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/.yamllint                  | 2 +-
>  Documentation/devicetree/bindings/arm/psci.yaml              | 1 -
>  .../bindings/clock/allwinner,sun4i-a10-gates-clk.yaml        | 1 -
>  .../devicetree/bindings/clock/renesas,cpg-mssr.yaml          | 1 -
>  .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml      | 1 -
>  .../display/allwinner,sun4i-a10-display-frontend.yaml        | 1 -
>  .../devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml | 1 -
>  .../bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml       | 1 -
>  .../devicetree/bindings/display/amlogic,meson-vpu.yaml       | 1 -
>  .../devicetree/bindings/display/bridge/adi,adv7511.yaml      | 1 -
>  .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 -
>  .../devicetree/bindings/display/bridge/toshiba,tc358767.yaml | 1 -
>  .../devicetree/bindings/display/ilitek,ili9486.yaml          | 1 -
>  Documentation/devicetree/bindings/display/msm/gpu.yaml       | 1 -
>  .../devicetree/bindings/display/panel/panel-timing.yaml      | 1 -
>  .../devicetree/bindings/display/panel/tpo,tpg110.yaml        | 1 -
>  .../devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml | 1 -
>  .../devicetree/bindings/display/simple-framebuffer.yaml      | 1 -
>  .../devicetree/bindings/dma/snps,dma-spear1340.yaml          | 1 -
>  Documentation/devicetree/bindings/dma/stericsson,dma40.yaml  | 1 -
>  .../devicetree/bindings/dma/stm32/st,stm32-dma.yaml          | 1 -
>  Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml   | 1 -
>  .../devicetree/bindings/firmware/qemu,fw-cfg-mmio.yaml       | 1 -
>  Documentation/devicetree/bindings/fpga/fpga-region.yaml      | 5 -----
>  .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml        | 1 -
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml          | 1 -
>  Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml     | 1 -
>  Documentation/devicetree/bindings/hwmon/adi,max31827.yaml    | 1 -
>  Documentation/devicetree/bindings/hwmon/national,lm90.yaml   | 1 -
>  Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml       | 1 -
>  Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml     | 1 -
>  Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml     | 1 -
>  .../devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml         | 1 -
>  Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  | 2 --
>  Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml    | 1 -
>  Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml    | 1 -
>  Documentation/devicetree/bindings/iio/adc/adi,ad7949.yaml    | 1 -
>  Documentation/devicetree/bindings/iio/adc/adi,ade9000.yaml   | 1 -
>  .../devicetree/bindings/iio/adc/cosmic,10001-adc.yaml        | 1 -
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 1 -
>  .../devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml     | 1 -
>  .../devicetree/bindings/iio/afe/voltage-divider.yaml         | 1 -
>  .../devicetree/bindings/iio/frequency/adi,admv4420.yaml      | 1 -
>  .../devicetree/bindings/iio/pressure/murata,zpa2326.yaml     | 1 -
>  .../devicetree/bindings/iio/proximity/semtech,sx9324.yaml    | 1 -
>  .../devicetree/bindings/iio/temperature/adi,ltc2983.yaml     | 1 -
>  Documentation/devicetree/bindings/input/ti,drv266x.yaml      | 1 -
>  .../devicetree/bindings/interconnect/qcom,rpmh.yaml          | 1 -
>  .../devicetree/bindings/interrupt-controller/arm,gic-v3.yaml | 1 -
>  .../bindings/interrupt-controller/aspeed,ast2700-intc.yaml   | 1 -
>  .../bindings/interrupt-controller/fsl,vf610-mscm-ir.yaml     | 1 -
>  .../bindings/interrupt-controller/loongson,liointc.yaml      | 1 -
>  .../bindings/interrupt-controller/mediatek,mtk-cirq.yaml     | 1 -
>  .../bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml | 1 -
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml        | 4 ----
>  Documentation/devicetree/bindings/mailbox/arm,mhu.yaml       | 1 -
>  Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml     | 1 -
>  Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml | 1 -
>  Documentation/devicetree/bindings/media/amphion,vpu.yaml     | 1 -
>  Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml | 2 --
>  .../devicetree/bindings/media/i2c/techwell,tw9900.yaml       | 1 -
>  Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml   | 1 -
>  .../devicetree/bindings/media/qcom,sc8280xp-camss.yaml       | 1 -
>  .../bindings/media/samsung,exynos4212-fimc-is.yaml           | 1 -
>  .../devicetree/bindings/media/samsung,s5pv210-jpeg.yaml      | 1 -
>  Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml  | 1 -
>  .../devicetree/bindings/media/video-interface-devices.yaml   | 4 ----
>  .../memory-controllers/qcom,ebi2-peripheral-props.yaml       | 1 -
>  Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml | 1 -
>  .../devicetree/bindings/mtd/amlogic,meson-nand.yaml          | 1 -
>  .../devicetree/bindings/mtd/marvell,nand-controller.yaml     | 1 -
>  Documentation/devicetree/bindings/mux/mux-controller.yaml    | 1 -
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml   | 2 --
>  Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml     | 1 -
>  .../devicetree/bindings/net/brcm,mdio-mux-iproc.yaml         | 1 -
>  .../devicetree/bindings/net/cortina,gemini-ethernet.yaml     | 1 -
>  Documentation/devicetree/bindings/net/fsl,gianfar.yaml       | 2 --
>  .../devicetree/bindings/net/mdio-mux-multiplexer.yaml        | 1 -
>  Documentation/devicetree/bindings/net/qcom,ipa.yaml          | 1 -
>  Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml    | 1 -
>  .../devicetree/bindings/net/wireless/ti,wlcore.yaml          | 1 -
>  .../devicetree/bindings/pci/altr,pcie-root-port.yaml         | 1 -
>  Documentation/devicetree/bindings/pci/loongson.yaml          | 1 -
>  Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml  | 1 -
>  .../devicetree/bindings/pci/starfive,jh7110-pcie.yaml        | 1 -


Acked-by: Manivannan Sadhasivam <mani@kernel.org> # For PCI controller bindings

- Mani

-- 
மணிவண்ணன் சதாசிவம்

