Return-Path: <linux-i2c+bounces-13800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A54C0730C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 18:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C553D19A7715
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 16:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AB1335BC5;
	Fri, 24 Oct 2025 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bum+Sa70"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E86202F71;
	Fri, 24 Oct 2025 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761322130; cv=none; b=GPbo437U8SZzSddePYquvffGZGteugIAI58dFpsFo9LcJ/emTs8MEt7T4U9AAhe45IdXp9pglKCfdgMK7gXQka8u6JEyxJOaMdXzf7WOLlbhCp0GYoZEJYPWXTheW1tNXxQ4RB7mYI1o8qkNb1p9xYldCDvRnMnN5onwKO3+2yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761322130; c=relaxed/simple;
	bh=RFdw0+g6o/ZVSkbk/hwDX8wPQGif0Krg/jbYleduRas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+X8hQqyLscNlawcaqzLxsbIvLA37wcTBJheEz8S/W4L6Ou3JX9XxHolC1F7x5CqqYp4JIwgQ6myPDA9TSu2ZEQHc7fQ54v4h66bF4bJW7I+aEajrkKcNmu0fAuv2a/yW/6pMmuyauawR25T9pIF1MJFpGsJgy2Off8kZfdbovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bum+Sa70; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E711C4CEF7;
	Fri, 24 Oct 2025 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761322129;
	bh=RFdw0+g6o/ZVSkbk/hwDX8wPQGif0Krg/jbYleduRas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bum+Sa70whSA6rVYrWsUq1W2SBcB00ABYF6MmaIX4jt6NOXRn/VO3LPrKPlp7tEQn
	 LVUQs76cq1kcY5lcEgs19PwSpo8oMyYiTW9xOrqCaaIDEzkJqDB1PqdnTBb5Ys/EWM
	 6XbYRBQVNVE8LiT5V16yg8m5t0XgBNBHOMepDM45CWpDyC1mSQWpBw6xP95b0axo8K
	 NA2cP7b8OvsKFfe5pUP4/dgDUVuWlpDpwJQlSEI9Y1omjCjAndFoO7zt9q4pnUf7Vb
	 YBP70aa0aEBdRs0SJ/0M137EcX6L4g5ukiFt2B+Bis0rPOx3aCxiC3p0zFoJ1dW+Dq
	 Acucw6uwnLosQ==
Date: Fri, 24 Oct 2025 17:08:33 +0100
From: Lee Jones <lee@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guenter Roeck <linux@roeck-us.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Georgi Djakov <djakov@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <joro@8bytes.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <20251024160833.GA2202059@google.com>
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

On Thu, 23 Oct 2025, Rob Herring (Arm) wrote:

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

Acked-by: Lee Jones <lee@kernel.org>

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
>  Documentation/devicetree/bindings/pci/versatile.yaml         | 1 -
>  .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 1 -
>  .../devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml   | 1 -
>  .../devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml        | 1 -
>  .../devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.yaml     | 1 -
>  .../bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml      | 1 -
>  .../devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml        | 1 -
>  .../devicetree/bindings/pinctrl/renesas,rza1-ports.yaml      | 3 ---
>  .../devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml | 1 -
>  .../devicetree/bindings/power/supply/mt6360_charger.yaml     | 1 -
>  .../bindings/power/supply/stericsson,ab8500-charger.yaml     | 1 -
>  .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml     | 1 -
>  .../bindings/regulator/richtek,rt6245-regulator.yaml         | 1 -
>  .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml      | 2 --
>  Documentation/devicetree/bindings/reset/ti,sci-reset.yaml    | 1 -
>  .../bindings/rng/inside-secure,safexcel-eip76.yaml           | 2 --
>  .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml     | 1 -
>  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml     | 1 -
>  .../bindings/soc/microchip/atmel,at91rm9200-tcb.yaml         | 1 -
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml      | 1 -
>  Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml       | 3 ---
>  Documentation/devicetree/bindings/sound/adi,adau1372.yaml    | 1 -
>  Documentation/devicetree/bindings/sound/adi,adau7118.yaml    | 1 -
>  .../devicetree/bindings/sound/rockchip,i2s-tdm.yaml          | 1 -
>  .../devicetree/bindings/sound/rockchip,rk3328-codec.yaml     | 2 +-
>  Documentation/devicetree/bindings/sound/samsung,tm2.yaml     | 1 -
>  .../devicetree/bindings/sound/ti,tlv320dac3100.yaml          | 1 -
>  Documentation/devicetree/bindings/sound/wlf,wm8903.yaml      | 1 -
>  .../devicetree/bindings/timer/nvidia,tegra-timer.yaml        | 1 -
>  .../devicetree/bindings/timer/nvidia,tegra186-timer.yaml     | 1 -
>  Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml   | 1 -
>  116 files changed, 2 insertions(+), 136 deletions(-)

-- 
Lee Jones [李琼斯]

