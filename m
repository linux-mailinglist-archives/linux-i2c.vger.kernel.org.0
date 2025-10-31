Return-Path: <linux-i2c+bounces-13922-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 525C0C236EC
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 07:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7380D1A20660
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 06:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38262301495;
	Fri, 31 Oct 2025 06:47:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011AC2512DE;
	Fri, 31 Oct 2025 06:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761893222; cv=none; b=uq1Zwov0nvuYmHVzV6dQ6ZP2w4DQLp7AmdWrlxh3oJYxZy5MlDJaaOZ6xCRxO/0sxAgZGhmnNjINuZoqQMdfXSEyyaGRPREBIzgHd9MTy9BZRWvttHlZSFkvkndwNSo1gyZj9xb3i0biscgdxo9PyLVoXVlKz1IV2Ru270lAIYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761893222; c=relaxed/simple;
	bh=JZ4d4kYh8rfhRKOmG05eahnty61ao/DjaXEzL0J39VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TskgaPVQJsUCUuHXplTXXLo5eukzUN6/Q7Wkl7H7QqPVPsZEkVxtSyvpZ9hLtQbI00b+JikGCQ9r5etgDgA4AVRoE3uzfS/kUMkVb5aXHKnLdOQ1mcVfG/U7REJOiDvSqXLK5YMgJ8zFJwpCYXnQOj1EYgo4xBq+LVuMpAXgCsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=linux.starfivetech.com; spf=none smtp.mailfrom=linux.starfivetech.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=linux.starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.starfivetech.com
X-QQ-mid: esmtpgz13t1761893210tf21d82f4
X-QQ-Originating-IP: R90kadoSj/Lu9jhXDo3EOBK+P2zoChp7ZYtBXxB6TvQ=
Received: from [192.168.125.98] ( [113.104.140.154])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 31 Oct 2025 14:46:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1332421492275545379
Message-ID: <99841AD0EE6A35D4+4a6afacb-4d1c-4727-9a75-134190350aca@linux.starfivetech.com>
Date: Fri, 31 Oct 2025 14:46:46 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Xu Yilun <yilun.xu@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Georgi Djakov <djakov@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
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
References: <20251023143957.2899600-1-robh@kernel.org>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.starfivetech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: NqcI9G0mljVPHlZnLQw3xgw2kf/d9aF5s5+EcmMZEbvVRyQ1odkgRlRl
	+jfT0Sidt0LxlobAov/UuxBi7zRZKcElztA9akkk9Jf1GOBzPvaDZtXD1xMUd81p8kJ6Hyz
	EN4m3vx2HO1Fwx2f4zwGdxxIIr0yNkbGB9nRsdeno4MwsCzUWVRSm89jzWz4XgU20HkG+Bi
	EPCLTEsgN0e6YwsD28Vn798fqTi1nH1xPULtv5+oRStTactxEaWhGZ2Ea5jBoUwrZPjNtCl
	KtfL9Qpnl3gXMqJqPed9mGaRPgLTO2XV2K87xBoIqx3DA51puzSQPjSlObK+/xTi+aMlW+1
	fDLmbrQzCBVwNaUic9Z8uTC1Bc5gtQH/TLs5kJLqlQtag514tIVBJ04QCs6pYonYaXsn6EG
	2LkGw7y0X8Tz1HhEDDhPtVPtvJP8M+kzO5W0vWf21JiLG7CaQngncyqWLVa8A9d9txFIZA9
	mQ/f6LwS2FZ4ICsdNKbWWMurhR3mHY9yTYmGXSyppy1nWpdPr2EO5e3E1qUiNnOYNd5d5jd
	V8f6CYeN9xuI7DbWGhxoFhTuLoiEUL7CoMogQUNnAMO4plqO2VK0rrkAMIrU083OlyS4Onf
	SMz/dzDKfGjsc4u1rGGYqfoxA8FZMK93gzdQnr8u4sIunrUJv98dX4cl/riclCVvACp6OtH
	jda0HrhrC9NhVU2bZ5DXK8oo2xlp0AOtGom3D0Gyy9+hhP8aTeIapuUsEPRRj4wpv8bUJ2I
	18qWpi3KC9XqEbK70FwErh4xBL/cMBO5VVI5Aw6D6Rk4AFHfvowV70/fTA2jml6v7I2r4t0
	eiG3Vjo9wCe0n8sghLiMzSE1/U0XvJ2VNLkgbIBi2T2lBzPOGRIkM9glJMylFwKODsCC89V
	aSwAkvc3R1W62fELjrfWLA3iIocfsjXatYoevXlYA+XazhCRU0XMTyH2HunXOrXP2xWqB9d
	k9mhj/irc/bGlw7QrR84hCAHmWEp5hG8WgWM=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On 10/23/2025 10:37 PM, Rob Herring (Arm) wrote:
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
> 

...

> diff --git a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> index 5f432452c815..33c80626e8ec 100644
> --- a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> @@ -16,7 +16,6 @@ properties:
>    compatible:
>      const: starfive,jh7110-pcie
>  
> -
>    reg:
>      maxItems: 2
>  

...

> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> index f3258f2fd3a4..3f14eab01c54 100644
> --- a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> @@ -32,7 +32,6 @@ description: |
>      | | |     |   |   |          -------
>      UART0     UART1 --
>  
> -
>    The big MUX in the diagram only has 7 different ways of mapping peripherals
>    on the left to pins on the right. StarFive calls the 7 configurations "signal
>    groups".

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Best regards,
Hal

