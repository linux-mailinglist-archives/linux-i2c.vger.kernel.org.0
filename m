Return-Path: <linux-i2c+bounces-13755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D08C01DCC
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 16:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 083C94F00C9
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 14:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2768232ED27;
	Thu, 23 Oct 2025 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFl2/n5v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431B2797B5;
	Thu, 23 Oct 2025 14:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761230411; cv=none; b=HKngLCEoHa8o+ARj7MCjGqLGC8EBomPfRkak7/lZN4DReTBp7TsZt8OjtzvLBhTUaX9rBllzd2DBpmYoAQJ+SMMNQoWtVdTeEb2r8m1c55jD3QkdtpfXJIF/5yIy2REQjcbYmcse76Bdi4ImrMxIl+3qaKqSrK3bLuxjg3u/Zsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761230411; c=relaxed/simple;
	bh=Ps8+zC3lLl6/dWBwPYFhSORbi0QmBbPNNnOHiJldxLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C0HiR3HOmwgygvf5aut34MB8KrDv2FmkbEumRlLfC7dN/ZyC6apH8eXmKwvDEDfmeFKvmFmAxyJnbJCCKUPywtS9/QZh7DkvLFrvCvUJw7cbgaSS5fMsfPlwGxNhx0j1xdi4Fv943g3RPc0Mon9g4gfesNglyD95eO/5v9xuHHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFl2/n5v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2CCC4CEF7;
	Thu, 23 Oct 2025 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761230411;
	bh=Ps8+zC3lLl6/dWBwPYFhSORbi0QmBbPNNnOHiJldxLQ=;
	h=From:To:Cc:Subject:Date:From;
	b=OFl2/n5vcqWzWUqTMssT5qsT6pHg+CJm7N2kCIbsi/BNOaTA0jiEurV2E222I7/Mh
	 ndmVfjYtu+pAfE/uCDRTAfP9A28nP7/b1jCcV2LJh3LeoCUMT6t3Ex341LpNqVv79G
	 WP5YKLT+aMk4eG07GrywGBxweiZPmIketVM23oaBnhiIo5cSA8BLOizmjdNwlmcTfJ
	 sGY2ccrE3Zhtyj46EXHqP0PiZUSVUAUKAWcxs5+01u1qkoyNe3umsHc4ChSLMtupDk
	 F7/NvYe8zHTgCpRKS322X2Sdej4Ahyj5gG5b5lZwiKDmicUveGp+r0yoyuGqVGZaLA
	 g26P35fIS7FKA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
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
	Lee Jones <lee@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: Remove extra blank lines
Date: Thu, 23 Oct 2025 09:37:56 -0500
Message-ID: <20251023143957.2899600-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generally at most 1 blank line is the standard style for DT schema
files. Remove the few cases with more than 1 so that the yamllint check
for this can be enabled.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/.yamllint                  | 2 +-
 Documentation/devicetree/bindings/arm/psci.yaml              | 1 -
 .../bindings/clock/allwinner,sun4i-a10-gates-clk.yaml        | 1 -
 .../devicetree/bindings/clock/renesas,cpg-mssr.yaml          | 1 -
 .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml      | 1 -
 .../display/allwinner,sun4i-a10-display-frontend.yaml        | 1 -
 .../devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml | 1 -
 .../bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml       | 1 -
 .../devicetree/bindings/display/amlogic,meson-vpu.yaml       | 1 -
 .../devicetree/bindings/display/bridge/adi,adv7511.yaml      | 1 -
 .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 -
 .../devicetree/bindings/display/bridge/toshiba,tc358767.yaml | 1 -
 .../devicetree/bindings/display/ilitek,ili9486.yaml          | 1 -
 Documentation/devicetree/bindings/display/msm/gpu.yaml       | 1 -
 .../devicetree/bindings/display/panel/panel-timing.yaml      | 1 -
 .../devicetree/bindings/display/panel/tpo,tpg110.yaml        | 1 -
 .../devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml | 1 -
 .../devicetree/bindings/display/simple-framebuffer.yaml      | 1 -
 .../devicetree/bindings/dma/snps,dma-spear1340.yaml          | 1 -
 Documentation/devicetree/bindings/dma/stericsson,dma40.yaml  | 1 -
 .../devicetree/bindings/dma/stm32/st,stm32-dma.yaml          | 1 -
 Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml   | 1 -
 .../devicetree/bindings/firmware/qemu,fw-cfg-mmio.yaml       | 1 -
 Documentation/devicetree/bindings/fpga/fpga-region.yaml      | 5 -----
 .../devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml        | 1 -
 .../devicetree/bindings/gpio/fairchild,74hc595.yaml          | 1 -
 Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml     | 1 -
 Documentation/devicetree/bindings/hwmon/adi,max31827.yaml    | 1 -
 Documentation/devicetree/bindings/hwmon/national,lm90.yaml   | 1 -
 Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml       | 1 -
 Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml     | 1 -
 Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml     | 1 -
 .../devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml         | 1 -
 Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml  | 2 --
 Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml    | 1 -
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml    | 1 -
 Documentation/devicetree/bindings/iio/adc/adi,ad7949.yaml    | 1 -
 Documentation/devicetree/bindings/iio/adc/adi,ade9000.yaml   | 1 -
 .../devicetree/bindings/iio/adc/cosmic,10001-adc.yaml        | 1 -
 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml  | 1 -
 .../devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml     | 1 -
 .../devicetree/bindings/iio/afe/voltage-divider.yaml         | 1 -
 .../devicetree/bindings/iio/frequency/adi,admv4420.yaml      | 1 -
 .../devicetree/bindings/iio/pressure/murata,zpa2326.yaml     | 1 -
 .../devicetree/bindings/iio/proximity/semtech,sx9324.yaml    | 1 -
 .../devicetree/bindings/iio/temperature/adi,ltc2983.yaml     | 1 -
 Documentation/devicetree/bindings/input/ti,drv266x.yaml      | 1 -
 .../devicetree/bindings/interconnect/qcom,rpmh.yaml          | 1 -
 .../devicetree/bindings/interrupt-controller/arm,gic-v3.yaml | 1 -
 .../bindings/interrupt-controller/aspeed,ast2700-intc.yaml   | 1 -
 .../bindings/interrupt-controller/fsl,vf610-mscm-ir.yaml     | 1 -
 .../bindings/interrupt-controller/loongson,liointc.yaml      | 1 -
 .../bindings/interrupt-controller/mediatek,mtk-cirq.yaml     | 1 -
 .../bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml | 1 -
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml        | 4 ----
 Documentation/devicetree/bindings/mailbox/arm,mhu.yaml       | 1 -
 Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml     | 1 -
 Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml | 1 -
 Documentation/devicetree/bindings/media/amphion,vpu.yaml     | 1 -
 Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml | 2 --
 .../devicetree/bindings/media/i2c/techwell,tw9900.yaml       | 1 -
 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml   | 1 -
 .../devicetree/bindings/media/qcom,sc8280xp-camss.yaml       | 1 -
 .../bindings/media/samsung,exynos4212-fimc-is.yaml           | 1 -
 .../devicetree/bindings/media/samsung,s5pv210-jpeg.yaml      | 1 -
 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml  | 1 -
 .../devicetree/bindings/media/video-interface-devices.yaml   | 4 ----
 .../memory-controllers/qcom,ebi2-peripheral-props.yaml       | 1 -
 Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml | 1 -
 .../devicetree/bindings/mtd/amlogic,meson-nand.yaml          | 1 -
 .../devicetree/bindings/mtd/marvell,nand-controller.yaml     | 1 -
 Documentation/devicetree/bindings/mux/mux-controller.yaml    | 1 -
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml   | 2 --
 Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml     | 1 -
 .../devicetree/bindings/net/brcm,mdio-mux-iproc.yaml         | 1 -
 .../devicetree/bindings/net/cortina,gemini-ethernet.yaml     | 1 -
 Documentation/devicetree/bindings/net/fsl,gianfar.yaml       | 2 --
 .../devicetree/bindings/net/mdio-mux-multiplexer.yaml        | 1 -
 Documentation/devicetree/bindings/net/qcom,ipa.yaml          | 1 -
 Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml    | 1 -
 .../devicetree/bindings/net/wireless/ti,wlcore.yaml          | 1 -
 .../devicetree/bindings/pci/altr,pcie-root-port.yaml         | 1 -
 Documentation/devicetree/bindings/pci/loongson.yaml          | 1 -
 Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml  | 1 -
 .../devicetree/bindings/pci/starfive,jh7110-pcie.yaml        | 1 -
 Documentation/devicetree/bindings/pci/versatile.yaml         | 1 -
 .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 1 -
 .../devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml   | 1 -
 .../devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml        | 1 -
 .../devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.yaml     | 1 -
 .../bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml      | 1 -
 .../devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml        | 1 -
 .../devicetree/bindings/pinctrl/renesas,rza1-ports.yaml      | 3 ---
 .../devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml | 1 -
 .../devicetree/bindings/power/supply/mt6360_charger.yaml     | 1 -
 .../bindings/power/supply/stericsson,ab8500-charger.yaml     | 1 -
 .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml     | 1 -
 .../bindings/regulator/richtek,rt6245-regulator.yaml         | 1 -
 .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml      | 2 --
 Documentation/devicetree/bindings/reset/ti,sci-reset.yaml    | 1 -
 .../bindings/rng/inside-secure,safexcel-eip76.yaml           | 2 --
 .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml     | 1 -
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml     | 1 -
 .../bindings/soc/microchip/atmel,at91rm9200-tcb.yaml         | 1 -
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml      | 1 -
 Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml       | 3 ---
 Documentation/devicetree/bindings/sound/adi,adau1372.yaml    | 1 -
 Documentation/devicetree/bindings/sound/adi,adau7118.yaml    | 1 -
 .../devicetree/bindings/sound/rockchip,i2s-tdm.yaml          | 1 -
 .../devicetree/bindings/sound/rockchip,rk3328-codec.yaml     | 2 +-
 Documentation/devicetree/bindings/sound/samsung,tm2.yaml     | 1 -
 .../devicetree/bindings/sound/ti,tlv320dac3100.yaml          | 1 -
 Documentation/devicetree/bindings/sound/wlf,wm8903.yaml      | 1 -
 .../devicetree/bindings/timer/nvidia,tegra-timer.yaml        | 1 -
 .../devicetree/bindings/timer/nvidia,tegra186-timer.yaml     | 1 -
 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml   | 1 -
 116 files changed, 2 insertions(+), 136 deletions(-)

diff --git a/Documentation/devicetree/bindings/.yamllint b/Documentation/devicetree/bindings/.yamllint
index 532799501800..8f9dd18dfe04 100644
--- a/Documentation/devicetree/bindings/.yamllint
+++ b/Documentation/devicetree/bindings/.yamllint
@@ -30,7 +30,7 @@ rules:
   document-start:
     present: true
   empty-lines:
-    max: 3
+    max: 1
     max-end: 1
   empty-values:
     forbid-in-block-mappings: true
diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 7360a2849b5b..6e2e0c551841 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -163,7 +163,6 @@ examples:
       method          = "smc";
     };
 
-
   - |+
 
     // Case 3: PSCI v0.2 and PSCI v0.1.
diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-gates-clk.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-gates-clk.yaml
index c4714d0fbe07..e588a7e8f260 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-gates-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-gates-clk.yaml
@@ -132,7 +132,6 @@ examples:
                              "ahb_mp", "ahb_mali400";
     };
 
-
   - |
     clk@1c20068 {
         #clock-cells = <1>;
diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
index bc2fd3761328..655154534c0f 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
@@ -99,7 +99,6 @@ properties:
       the datasheet.
     const: 1
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index b44a76a958f4..b497c28e8094 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -22,7 +22,6 @@ properties:
       - xlnx,clocking-wizard-v6.0
       - xlnx,versal-clk-wizard
 
-
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
index 98e8240a05bd..995b3ef408b7 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-frontend.yaml
@@ -121,5 +121,4 @@ examples:
         };
     };
 
-
 ...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
index 895506d93f4c..85a6086cc10e 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-drc.yaml
@@ -121,5 +121,4 @@ examples:
         };
     };
 
-
 ...
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
index 60fd927b5a06..c43b02ec884f 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
@@ -142,7 +142,6 @@ then:
     reset-names:
       minItems: 2
 
-
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index cb0a90f02321..3ae45db85ea7 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -25,7 +25,6 @@ description: |
   M  |-------|______|----|____________|   |________________|    |               |
   ___|__________________________________________________________|_______________|
 
-
   VIU: Video Input Unit
   ---------------------
 
diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
index 5bbe81862c8f..d29a0d06187e 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.yaml
@@ -156,7 +156,6 @@ else:
     adi,input-style: false
     adi,input-justification: false
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 0487bbffd7f7..4f7d3e9cf0c2 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -131,7 +131,6 @@ required:
 
 additionalProperties: false
 
-
 examples:
   - |
     lvds-encoder {
diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
index b78f64c9c5f4..70f229dc4e0c 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
@@ -123,7 +123,6 @@ properties:
       - required:
           - port@1
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
index 9cc1fd0751cd..7d78edc403dc 100644
--- a/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9486.yaml
@@ -54,7 +54,6 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-
             display@0{
                     compatible = "waveshare,rpi-lcd-35", "ilitek,ili9486";
                     reg = <0>;
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3696b083e353..826aafdcc20b 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -133,7 +133,6 @@ properties:
       For GMU attached devices a phandle to the GMU device that will
       control the power for the GPU.
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
index aea69b84ca5d..8c9774458777 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
@@ -41,7 +41,6 @@ description: |
   |       |          |        v                            |          |
   +-------+----------+-------------------------------------+----------+
 
-
   The following is the panel timings shown with time on the x-axis.
   This matches the timing diagrams often found in data sheets.
 
diff --git a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
index 59a373728e62..99db268eb9b3 100644
--- a/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
+++ b/Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml
@@ -38,7 +38,6 @@ description: |+
   The serial protocol has line names that resemble I2C but the
   protocol is not I2C but 3WIRE SPI.
 
-
 allOf:
   - $ref: panel-common.yaml#
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
index a8a008717997..6345f0132d43 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
@@ -125,7 +125,6 @@ examples:
         power-domains = <&power RK3588_PD_VO0>;
         #sound-dai-cells = <0>;
 
-
         ports {
           #address-cells = <1>;
           #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index 296500f9da05..45ffdebc9d86 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -181,7 +181,6 @@ allOf:
       required:
         - amlogic,pipeline
 
-
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml b/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
index c21a4f073f6c..18c0a7c18bc8 100644
--- a/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
@@ -22,7 +22,6 @@ properties:
               - renesas,r9a06g032-dma
           - const: renesas,rzn1-dma
 
-
   "#dma-cells":
     minimum: 3
     maximum: 4
diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
index 7b94d24d5ef4..8b42d9880400 100644
--- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
+++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
@@ -120,7 +120,6 @@ properties:
           - description: LCPA memory base, deprecated, use eSRAM pool instead
         deprecated: true
 
-
   reg-names:
     oneOf:
       - items:
diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma.yaml b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma.yaml
index 11a289f1d505..598903354196 100644
--- a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dma.yaml
@@ -48,7 +48,6 @@ description: |
               by transfer completion. This must only be used on channels
               managing transfers for STM32 USART/UART.
 
-
 maintainers:
   - Amelie Delaunay <amelie.delaunay@foss.st.com>
 
diff --git a/Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml b/Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml
index 9afc78254cc0..9637df7af3c8 100644
--- a/Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml
+++ b/Documentation/devicetree/bindings/edac/apm,xgene-edac.yaml
@@ -97,7 +97,6 @@ patternProperties:
       - reg
       - memory-controller
 
-
   '^edacpmd@':
     description: PMD subnode
     type: object
diff --git a/Documentation/devicetree/bindings/firmware/qemu,fw-cfg-mmio.yaml b/Documentation/devicetree/bindings/firmware/qemu,fw-cfg-mmio.yaml
index 3faae3236665..c6fc1d6e25da 100644
--- a/Documentation/devicetree/bindings/firmware/qemu,fw-cfg-mmio.yaml
+++ b/Documentation/devicetree/bindings/firmware/qemu,fw-cfg-mmio.yaml
@@ -23,7 +23,6 @@ description: |
   The authoritative guest-side hardware interface documentation to the fw_cfg
   device can be found in "docs/specs/fw_cfg.txt" in the QEMU source tree.
 
-
 properties:
   compatible:
     const: qemu,fw-cfg-mmio
diff --git a/Documentation/devicetree/bindings/fpga/fpga-region.yaml b/Documentation/devicetree/bindings/fpga/fpga-region.yaml
index 7d2d3b7aa4b7..4c61461d6247 100644
--- a/Documentation/devicetree/bindings/fpga/fpga-region.yaml
+++ b/Documentation/devicetree/bindings/fpga/fpga-region.yaml
@@ -18,7 +18,6 @@ description: |
    - Supported Use Models
    - Constraints
 
-
   Introduction
   ============
 
@@ -31,7 +30,6 @@ description: |
   document isn't a replacement for any manufacturers specifications for FPGA
   usage.
 
-
   Terminology
   ===========
 
@@ -108,7 +106,6 @@ description: |
   a soft logic bridge (Bridge0-2) in the FPGA.  The contents of each PRR can be
   reprogrammed independently while the rest of the system continues to function.
 
-
   Sequence
   ========
 
@@ -124,7 +121,6 @@ description: |
   When the overlay is removed, the child nodes will be removed and the FPGA Region
   will disable the bridges.
 
-
   FPGA Region
   ===========
 
@@ -170,7 +166,6 @@ description: |
   hardware bridges remain enabled.  The PR regions' bridges will be FPGA bridges
   within the static image of the FPGA.
 
-
   Supported Use Models
   ====================
 
diff --git a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
index c213cb9ddb9f..5cfefbbea6ca 100644
--- a/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/brcm,xgs-iproc-gpio.yaml
@@ -66,5 +66,4 @@ examples:
         interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
     };
 
-
 ...
diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index ab35bcf98101..23410aeca300 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -22,7 +22,6 @@ description: |
                  ___                     ________
   chip select#      |___________________|
 
-
 maintainers:
   - Maxime Ripard <mripard@kernel.org>
 
diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
index 152935334c76..3e3f49cf2f52 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc2947.yaml
@@ -81,7 +81,6 @@ required:
   - compatible
   - reg
 
-
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
index f60e06ab7d0a..c2f7c6ee1a37 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
@@ -93,7 +93,6 @@ allOf:
         adi,fault-q:
           default: 4
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 1b871f166e79..164068ba069d 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -45,7 +45,6 @@ properties:
       - ti,tmp461
       - winbond,w83l771
 
-
   interrupts:
     items:
       - description: |
diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
index cba5b4a1b81f..0fe6ea190f60 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
@@ -20,7 +20,6 @@ description: |
   https://www.ti.com/lit/gpn/tmp513
   https://www.ti.com/lit/gpn/tmp512
 
-
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
index ee7de53e1918..d57e4bf8f65f 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
@@ -15,7 +15,6 @@ description: |
   Datasheets:
   https://www.ti.com/lit/gpn/tps23861
 
-
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml
index b6af924dee2e..d8610daa10cd 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml
@@ -27,7 +27,6 @@ description: |+
       |   '------' |                  | dev |  | dev |  | dev |
       '------------'                  '-----'  '-----'  '-----'
 
-
 allOf:
   - $ref: /schemas/i2c/i2c-mux.yaml#
 
diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
index 17ce39c19ab1..f9a449fee2b0 100644
--- a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
@@ -64,7 +64,6 @@ patternProperties:
     required:
       - reg
 
-
 allOf:
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
index 28139b676661..19cfffb39296 100644
--- a/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
+++ b/Documentation/devicetree/bindings/i2c/tsd,mule-i2c-mux.yaml
@@ -16,7 +16,6 @@ description: |
   can be selected by writing the appropriate device number to an I2C config
   register.
 
-
       +--------------------------------------------------+
       | Mule                                             |
   0x18|    +---------------+                             |
@@ -34,7 +33,6 @@ description: |
       |                        |__/          +--------+  |
       +--------------------------------------------------+
 
-
 allOf:
   - $ref: /schemas/i2c/i2c-mux.yaml#
 
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
index 8dae89ecb64d..b91bfb16ed6b 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
@@ -30,7 +30,6 @@ description: |
   * https://www.analog.com/en/products/adaq4380-4.html
   * https://www.analog.com/en/products/adaq4381-4.html
 
-
 $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 1180d2ffbf84..73c8e9c532f3 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -166,7 +166,6 @@ properties:
       An example of backend can be found at
       http://analogdevicesinc.github.io/hdl/library/axi_ad7606x/index.html
 
-
 patternProperties:
   "^channel@[1-8]$":
     type: object
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7949.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7949.yaml
index 9ee4d977c5ed..238a8c9c4143 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7949.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7949.yaml
@@ -48,7 +48,6 @@ properties:
     enum: [2500000, 4096000]
     default: 4096000
 
-
   '#io-channel-cells':
     const: 1
 
diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ade9000.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ade9000.yaml
index bd429552d568..f22eba0250ee 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ade9000.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ade9000.yaml
@@ -57,7 +57,6 @@ properties:
     description: External clock source when not using crystal
     maxItems: 1
 
-
   "#clock-cells":
     description:
       ADE9000 can provide clock output via CLKOUT pin with external buffer.
diff --git a/Documentation/devicetree/bindings/iio/adc/cosmic,10001-adc.yaml b/Documentation/devicetree/bindings/iio/adc/cosmic,10001-adc.yaml
index 4e695b97d015..9ea44ce63f25 100644
--- a/Documentation/devicetree/bindings/iio/adc/cosmic,10001-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/cosmic,10001-adc.yaml
@@ -36,7 +36,6 @@ properties:
   "#io-channel-cells":
     const: 1
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index 17bb60e18a1c..c4c4575d3fa9 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -456,7 +456,6 @@ patternProperties:
               items:
                 minimum: 40
 
-
       - if:
           properties:
             compatible:
diff --git a/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml b/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
index 1caa896fce82..de91cb03fdc6 100644
--- a/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml
@@ -57,7 +57,6 @@ description: |
    4 | batt_dischrg_i
    5 | ts_v
 
-
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/iio/afe/voltage-divider.yaml b/Documentation/devicetree/bindings/iio/afe/voltage-divider.yaml
index 4151f99b42aa..9752d1450064 100644
--- a/Documentation/devicetree/bindings/iio/afe/voltage-divider.yaml
+++ b/Documentation/devicetree/bindings/iio/afe/voltage-divider.yaml
@@ -29,7 +29,6 @@ description: |
             |
            GND
 
-
 properties:
   compatible:
     const: voltage-divider
diff --git a/Documentation/devicetree/bindings/iio/frequency/adi,admv4420.yaml b/Documentation/devicetree/bindings/iio/frequency/adi,admv4420.yaml
index 64f2352aac3d..ca40359a3944 100644
--- a/Documentation/devicetree/bindings/iio/frequency/adi,admv4420.yaml
+++ b/Documentation/devicetree/bindings/iio/frequency/adi,admv4420.yaml
@@ -37,7 +37,6 @@ required:
   - compatible
   - reg
 
-
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
diff --git a/Documentation/devicetree/bindings/iio/pressure/murata,zpa2326.yaml b/Documentation/devicetree/bindings/iio/pressure/murata,zpa2326.yaml
index c33640ddde58..886f4129c301 100644
--- a/Documentation/devicetree/bindings/iio/pressure/murata,zpa2326.yaml
+++ b/Documentation/devicetree/bindings/iio/pressure/murata,zpa2326.yaml
@@ -12,7 +12,6 @@ maintainers:
 description: |
   Pressure sensor from Murata with SPI and I2C bus interfaces.
 
-
 properties:
   compatible:
     const: murata,zpa2326
diff --git a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
index 48f221463166..8fed45ee557b 100644
--- a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
@@ -78,7 +78,6 @@ properties:
     minItems: 3
     maxItems: 3
 
-
   semtech,ph01-resolution:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [8, 16, 32, 64, 128, 256, 512, 1024]
diff --git a/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
index ee0b558bb866..a22725f7619b 100644
--- a/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
+++ b/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml
@@ -39,7 +39,6 @@ $defs:
       - reg
       - adi,sensor-type
 
-
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/input/ti,drv266x.yaml b/Documentation/devicetree/bindings/input/ti,drv266x.yaml
index da1818824373..1bce389d0e5c 100644
--- a/Documentation/devicetree/bindings/input/ti,drv266x.yaml
+++ b/Documentation/devicetree/bindings/input/ti,drv266x.yaml
@@ -37,7 +37,6 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
-
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
index dad3ad2fd93b..da16d8e9bdc5 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
@@ -122,7 +122,6 @@ allOf:
       required:
         - reg
 
-
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
index f3247a47f9ee..bfd30aae682b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
@@ -305,7 +305,6 @@ examples:
       };
     };
 
-
     device@0 {
       reg = <0 4>;
       interrupts = <1 1 4 &part0>;
diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
index 55636d06a674..c45e97e2f583 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
@@ -53,7 +53,6 @@ properties:
                                |         |---...
                                +---------+---module31
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,vf610-mscm-ir.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,vf610-mscm-ir.yaml
index fdc254f8d013..55b1ae863b91 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,vf610-mscm-ir.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,vf610-mscm-ir.yaml
@@ -14,7 +14,6 @@ description:
   Vybrid SoC's but is only really useful in dual core configurations (VF6xx
   which comes with a Cortex-A5/Cortex-M4 combination).
 
-
 maintainers:
   - Frank Li <Frank.Li@nxp.com>
 
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
index 60441f0c5d72..f63b23f48d8e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,liointc.yaml
@@ -78,7 +78,6 @@ required:
   - '#interrupt-cells'
   - loongson,parent_int_map
 
-
 unevaluatedProperties: false
 
 if:
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
index fdcb4d8db818..20dfffb34f0c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mtk-cirq.yaml
@@ -18,7 +18,6 @@ description:
   flush command is executed. With CIRQ, MCUSYS can be completely turned off
   to improve the system power consumption without losing interrupts.
 
-
 properties:
   compatible:
     items:
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml b/Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml
index 4ff609faba32..d943ea820cdd 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mscc,ocelot-icpu-intr.yaml
@@ -26,7 +26,6 @@ properties:
           - mscc,ocelot-icpu-intr
           - mscc,serval-icpu-intr
 
-
   '#interrupt-cells':
     const: 1
 
diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 89495f094d52..f8bd24d5949e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -638,7 +638,6 @@ examples:
                      <&smmu1 7>;
     };
 
-
     /* SMMU with stream matching */
     smmu2: iommu@ba5f0000 {
             compatible = "arm,smmu-v1";
@@ -664,7 +663,6 @@ examples:
             iommus = <&smmu2 1 0x30>;
     };
 
-
     /* ARM MMU-500 with 10-bit stream ID input configuration */
     smmu3: iommu@ba600000 {
             compatible = "arm,mmu-500", "arm,smmu-v2";
@@ -685,8 +683,6 @@ examples:
             /* bus whose child devices emit one unique 10-bit stream
                ID each, but may master through multiple SMMU TBUs */
             iommu-map = <0 &smmu3 0 0x400>;
-
-
     };
 
   - |+
diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml b/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml
index d9a4f4a02d7c..e45b661e8b41 100644
--- a/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml
@@ -52,7 +52,6 @@ properties:
           - const: arm,mhu-doorbell
           - const: arm,primecell
 
-
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
index 02f06314d85f..3828d77f6316 100644
--- a/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
+++ b/Documentation/devicetree/bindings/mailbox/arm,mhuv2.yaml
@@ -127,7 +127,6 @@ properties:
         - minimum: 0
           maximum: 124
 
-
   '#mbox-cells':
     description: |
       It is always set to 2. The first argument in the consumers 'mboxes'
diff --git a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
index 8a1369df4ecb..4ca0d5e49c79 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mtk,adsp-mbox.yaml
@@ -26,7 +26,6 @@ properties:
               - mediatek,mt8188-adsp-mbox
           - const: mediatek,mt8186-adsp-mbox
 
-
   "#mbox-cells":
     const: 0
 
diff --git a/Documentation/devicetree/bindings/media/amphion,vpu.yaml b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
index 5a920d9e78c7..fa18013d705d 100644
--- a/Documentation/devicetree/bindings/media/amphion,vpu.yaml
+++ b/Documentation/devicetree/bindings/media/amphion,vpu.yaml
@@ -45,7 +45,6 @@ patternProperties:
       between driver and firmware. Implement via mailbox on driver.
     $ref: /schemas/mailbox/fsl,mu.yaml#
 
-
   "^vpu-core@[0-9a-f]+$":
     description:
       Each core correspond a decoder or encoder, need to configure them
diff --git a/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
index 2dc2829d42a0..f8d9889dbc21 100644
--- a/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml
@@ -154,7 +154,5 @@ examples:
                                     };
                             };
                     };
-
-
             };
     };
diff --git a/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml b/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml
index c9673391afdb..0592d0b9af92 100644
--- a/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml
@@ -70,7 +70,6 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: Video port for the decoder output.
 
-
     required:
       - port@0
       - port@1
diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
index 4cba42ba7cf7..b5aca3d2cc5c 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -79,7 +79,6 @@ allOf:
         power-domains:
           minItems: 2        # Wrapper and 1 slot
 
-
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
index d195f1bfb23d..c99fe4106eee 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
@@ -484,7 +484,6 @@ examples:
                           "gcc_axi_hf",
                           "gcc_axi_sf";
 
-
             iommus = <&apps_smmu 0x2000 0x4e0>,
                      <&apps_smmu 0x2020 0x4e0>,
                      <&apps_smmu 0x2040 0x4e0>,
diff --git a/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
index 71d63bb9abb5..32e72d11bd19 100644
--- a/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
@@ -111,7 +111,6 @@ patternProperties:
       reg:
         maxItems: 1
 
-
       clocks:
         maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/media/samsung,s5pv210-jpeg.yaml b/Documentation/devicetree/bindings/media/samsung,s5pv210-jpeg.yaml
index e28d6ec56c0b..5c969e764d4f 100644
--- a/Documentation/devicetree/bindings/media/samsung,s5pv210-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,s5pv210-jpeg.yaml
@@ -42,7 +42,6 @@ properties:
   reg:
     maxItems: 1
 
-
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml b/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
index 4afa4a24b868..b9f7d84f38c2 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
@@ -21,7 +21,6 @@ description:
     format and copy the result into a part or the whole of a destination image
     with a different color format. (TODO)
 
-
 maintainers:
   - Dillon Min <dillon.minfei@gmail.com>
 
diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
index 3ad1590b0496..a81d2a155fe6 100644
--- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
+++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
@@ -128,7 +128,6 @@ properties:
 
       0 degrees camera rotation:
 
-
                     Y-Rp
                      ^
               Y-Rc   !
@@ -145,7 +144,6 @@ properties:
              0 +------------------------------------->
                0               X-Rc
 
-
                                 X-Rc                0
                <------------------------------------+ 0
                            X-Rp                 0   !
@@ -228,7 +226,6 @@ properties:
                V
               X-Rc
 
-
       Example one - Webcam
 
       A camera module installed on the user facing part of a laptop screen
@@ -273,7 +270,6 @@ properties:
       optical inversion, the two reference systems will not be aligned, with
       'Rp' being rotated 180 degrees relatively to 'Rc':
 
-
                         X-Rc                0
        <------------------------------------+ 0
                                             !
diff --git a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2-peripheral-props.yaml
index 29f8c30e8a88..aec88cd2df76 100644
--- a/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/qcom,ebi2-peripheral-props.yaml
@@ -62,7 +62,6 @@ properties:
     minimum: 0
     maximum: 15
 
-
   # FAST chip selects
   qcom,xmem-address-hold-enable:
     $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
index b2cfa4120b8a..ce5e845ab5c5 100644
--- a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
+++ b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
@@ -444,7 +444,6 @@ properties:
 
     additionalProperties: false
 
-
   regulator-external:
     description: Node describing the AB8500 external regulators. This
       concerns the autonomous regulators VSMPS1, VSMPS2 and VSMPS3
diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index 284f0f882c32..fa2aa29be794 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -88,7 +88,6 @@ patternProperties:
       amlogic,boot-pages: [nand-is-boot-medium, "amlogic,boot-page-step"]
       amlogic,boot-page-step: [nand-is-boot-medium, "amlogic,boot-pages"]
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
index 1ecea848e8b9..bc89cbf8193a 100644
--- a/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/marvell,nand-controller.yaml
@@ -145,7 +145,6 @@ allOf:
         clock-names:
           minItems: 1
 
-
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/mux/mux-controller.yaml b/Documentation/devicetree/bindings/mux/mux-controller.yaml
index 571ad9e13ecf..78340bbe4df6 100644
--- a/Documentation/devicetree/bindings/mux/mux-controller.yaml
+++ b/Documentation/devicetree/bindings/mux/mux-controller.yaml
@@ -20,7 +20,6 @@ description: |
   space is a simple zero-based enumeration. I.e. 0-1 for a 2-way multiplexer,
   0-7 for an 8-way multiplexer, etc.
 
-
   Mux controller nodes
   --------------------
 
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index fc62fb2a68ac..323a669fa982 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -201,7 +201,6 @@ allOf:
                     - clocks
                     - resets
 
-
             mdio@2:
               $ref: mdio.yaml#
               unevaluatedProperties: false
@@ -251,7 +250,6 @@ allOf:
           maxItems: 1
         power-domains: false
 
-
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml b/Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml
index 0e3fb4e42e3f..a1119c47e29b 100644
--- a/Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml
+++ b/Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml
@@ -31,7 +31,6 @@ properties:
       - description: RX and TX rings interrupt line
       - description: Wake-on-LAN interrupt line
 
-
   clocks:
     minItems: 1
     items:
diff --git a/Documentation/devicetree/bindings/net/brcm,mdio-mux-iproc.yaml b/Documentation/devicetree/bindings/net/brcm,mdio-mux-iproc.yaml
index 3f27746d9a56..d544f785e6b9 100644
--- a/Documentation/devicetree/bindings/net/brcm,mdio-mux-iproc.yaml
+++ b/Documentation/devicetree/bindings/net/brcm,mdio-mux-iproc.yaml
@@ -29,7 +29,6 @@ properties:
     maxItems: 1
     description: core clock driving the MDIO block
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
index 44fd23a5fa2b..a930358f6a66 100644
--- a/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
+++ b/Documentation/devicetree/bindings/net/cortina,gemini-ethernet.yaml
@@ -100,7 +100,6 @@ examples:
       };
     };
 
-
     ethernet@60000000 {
         compatible = "cortina,gemini-ethernet";
         reg = <0x60000000 0x4000>, /* Global registers, queue */
diff --git a/Documentation/devicetree/bindings/net/fsl,gianfar.yaml b/Documentation/devicetree/bindings/net/fsl,gianfar.yaml
index f92f284aa05b..0d8909770ccb 100644
--- a/Documentation/devicetree/bindings/net/fsl,gianfar.yaml
+++ b/Documentation/devicetree/bindings/net/fsl,gianfar.yaml
@@ -167,8 +167,6 @@ allOf:
             - description: Receive interrupt
             - description: Error interrupt
 
-
-
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/mdio-mux-multiplexer.yaml b/Documentation/devicetree/bindings/net/mdio-mux-multiplexer.yaml
index 282987074ee4..23947ba6aeaf 100644
--- a/Documentation/devicetree/bindings/net/mdio-mux-multiplexer.yaml
+++ b/Documentation/devicetree/bindings/net/mdio-mux-multiplexer.yaml
@@ -14,7 +14,6 @@ description: |+
   of a mux producer device. The mux producer can be of any type like mmio mux
   producer, gpio mux producer or generic register based mux producer.
 
-
 allOf:
   - $ref: /schemas/net/mdio-mux.yaml#
 
diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index b4a79912d473..c7f5f2ef7452 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -24,7 +24,6 @@ description:
   iommu/iommu.txt and iommu/arm,smmu.yaml for more information about SMMU
   bindings.
 
-
   - |
     --------             ---------
     |      |             |       |
diff --git a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
index d14ca81f70e0..8b5da602a2e8 100644
--- a/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
+++ b/Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml
@@ -156,7 +156,6 @@ patternProperties:
       CPSW MDIO bus.
     $ref: ti,davinci-mdio.yaml#
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/wireless/ti,wlcore.yaml b/Documentation/devicetree/bindings/net/wireless/ti,wlcore.yaml
index 75c9489f319b..9de5fdefcbcc 100644
--- a/Documentation/devicetree/bindings/net/wireless/ti,wlcore.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/ti,wlcore.yaml
@@ -50,7 +50,6 @@ properties:
       Points to the node of the regulator that powers/enable the wl12xx/wl18xx
       chip.  This is required when connected via SPI.
 
-
   ref-clock-frequency:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Reference clock frequency.
diff --git a/Documentation/devicetree/bindings/pci/altr,pcie-root-port.yaml b/Documentation/devicetree/bindings/pci/altr,pcie-root-port.yaml
index 5d3f48a001b7..f516db47ab20 100644
--- a/Documentation/devicetree/bindings/pci/altr,pcie-root-port.yaml
+++ b/Documentation/devicetree/bindings/pci/altr,pcie-root-port.yaml
@@ -93,7 +93,6 @@ allOf:
         reg-names:
           minItems: 3
 
-
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/pci/loongson.yaml b/Documentation/devicetree/bindings/pci/loongson.yaml
index 1988465e73a1..e5bba63aa947 100644
--- a/Documentation/devicetree/bindings/pci/loongson.yaml
+++ b/Documentation/devicetree/bindings/pci/loongson.yaml
@@ -32,7 +32,6 @@ properties:
     minItems: 1
     maxItems: 3
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
index 6c6d828ce964..def513d29d26 100644
--- a/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml
@@ -121,7 +121,6 @@ allOf:
             - const: dma2
             - const: dma3
 
-
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
index 5f432452c815..33c80626e8ec 100644
--- a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
@@ -16,7 +16,6 @@ properties:
   compatible:
     const: starfive,jh7110-pcie
 
-
   reg:
     maxItems: 2
 
diff --git a/Documentation/devicetree/bindings/pci/versatile.yaml b/Documentation/devicetree/bindings/pci/versatile.yaml
index 294c7cd84b37..d30b8849db91 100644
--- a/Documentation/devicetree/bindings/pci/versatile.yaml
+++ b/Documentation/devicetree/bindings/pci/versatile.yaml
@@ -90,5 +90,4 @@ examples:
           <0x0000 0 0 4 &sic 28>;
     };
 
-
 ...
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index a1b55168e050..863a1a446739 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -35,7 +35,6 @@ properties:
       - qcom,sm8350-qmp-usb3-uni-phy
       - qcom,x1e80100-qmp-usb3-uni-phy
 
-
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
index 1283a588416d..a2e609b066ee 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
@@ -116,7 +116,6 @@ patternProperties:
                 input-schmitt-enable: false
                 input-schmitt-disable: false
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
index a438db8884f2..96e7b6995273 100644
--- a/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx9-pinctrl.yaml
@@ -58,7 +58,6 @@ patternProperties:
             - description: |
                 "pad_setting" indicates the pad configuration value to be applied.
 
-
     required:
       - fsl,pins
 
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.yaml
index 4009501b3414..63e96d60bfaa 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.yaml
@@ -142,7 +142,6 @@ examples:
         interrupt-controller;
         #interrupt-cells = <2>;
 
-
         blsp1-i2c1-default-state {
             pins = "gpio24", "gpio25";
             function = "blsp_i2c1";
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
index f4cf2ce86fcd..d3e4926034a7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
@@ -66,7 +66,6 @@ $defs:
           Specify the alternative function to be configured for the specified
           pins.
 
-
 allOf:
   - $ref: qcom,lpass-lpi-common.yaml#
 
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml
index ddeaeaa9a450..5a57a59cc1e5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-tlmm.yaml
@@ -88,7 +88,6 @@ $defs:
                 uim2_present, uim2_reset, unused1, unused2, usb_phy, vfr_1, vsense_trigger,
                 wlan1_adc0, wlan1_adc1, wlan2_adc0, wlan2_adc1, wsa_clk, wsa_data ]
 
-
     required:
       - pins
 
diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
index 737eb4e14090..8203c3c46cc7 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
@@ -65,7 +65,6 @@ patternProperties:
       - '#gpio-cells'
       - gpio-ranges
 
-
 additionalProperties:
   anyOf:
     - type: object
@@ -150,7 +149,6 @@ examples:
                     pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
             };
 
-
             /*
              * I2c master: both SDA and SCL pins need bi-directional operations
              * Pin #4 on port #1 is configured as alternate function #1.
@@ -162,7 +160,6 @@ examples:
                     pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
             };
 
-
             /*
              * Multi-function timer input and output compare pins.
              */
diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
index f3258f2fd3a4..3f14eab01c54 100644
--- a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
@@ -32,7 +32,6 @@ description: |
     | | |     |   |   |          -------
     UART0     UART1 --
 
-
   The big MUX in the diagram only has 7 different ways of mapping peripherals
   on the left to pins on the right. StarFive calls the 7 configurations "signal
   groups".
diff --git a/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
index 4c74cc78729e..3e8689019251 100644
--- a/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
+++ b/Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml
@@ -21,7 +21,6 @@ properties:
     description: Maximum CHGIN regulation voltage in uV.
     enum: [ 5500000, 6500000, 11000000, 14500000 ]
 
-
   usb-otg-vbus-regulator:
     type: object
     description: OTG boost regulator.
diff --git a/Documentation/devicetree/bindings/power/supply/stericsson,ab8500-charger.yaml b/Documentation/devicetree/bindings/power/supply/stericsson,ab8500-charger.yaml
index 994fac12c8da..4f19744844e9 100644
--- a/Documentation/devicetree/bindings/power/supply/stericsson,ab8500-charger.yaml
+++ b/Documentation/devicetree/bindings/power/supply/stericsson,ab8500-charger.yaml
@@ -65,7 +65,6 @@ properties:
           - const: vbus_v
           - const: usb_charger_c
 
-
 required:
   - compatible
   - monitored-battery
diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 1b192e197b11..1197858e431f 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -55,7 +55,6 @@ properties:
   resets:
     maxItems: 1
 
-
 allOf:
   - $ref: pwm.yaml#
 
diff --git a/Documentation/devicetree/bindings/regulator/richtek,rt6245-regulator.yaml b/Documentation/devicetree/bindings/regulator/richtek,rt6245-regulator.yaml
index b73762e151bb..84546fec3b18 100644
--- a/Documentation/devicetree/bindings/regulator/richtek,rt6245-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/richtek,rt6245-regulator.yaml
@@ -55,7 +55,6 @@ properties:
       delay time 0us, 10us, 20us, 40us. If this property is missing then keep
       in chip default.
 
-
   richtek,switch-freq-select:
     $ref: /schemas/types.yaml#/definitions/uint8
     enum: [0, 1, 2]
diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
index a492f74a8608..a927551356e6 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
@@ -79,7 +79,6 @@ properties:
       It should be set as 3 (Single-Core mode) which is also the default if
       omitted.
 
-
 # R5F Processor Child Nodes:
 # ==========================
 
@@ -167,7 +166,6 @@ patternProperties:
           - description: region reserved for firmware image sections
         additionalItems: true
 
-
 # Optional properties:
 # --------------------
 # The following properties are optional properties for each of the R5F cores:
diff --git a/Documentation/devicetree/bindings/reset/ti,sci-reset.yaml b/Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
index 1db08ce9ae27..68640abacd95 100644
--- a/Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
@@ -40,7 +40,6 @@ properties:
       Please see https://software-dl.ti.com/tisci/esd/latest/index.html for
       protocol documentation for the values to be used for different devices.
 
-
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml b/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml
index 0877eb44f9ed..f501fc7691c6 100644
--- a/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml
+++ b/Documentation/devicetree/bindings/rng/inside-secure,safexcel-eip76.yaml
@@ -44,7 +44,6 @@ properties:
       - const: core
       - const: reg
 
-
 allOf:
   - if:
       properties:
@@ -58,7 +57,6 @@ allOf:
       required:
         - interrupts
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml
index cf0f38dbbe0d..2c06d869fdb5 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-muram.yaml
@@ -30,7 +30,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     enum: [host, slave]
 
-
 patternProperties:
   '^data\-only@[a-f0-9]+$':
     type: object
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index a10326a9683d..5267cfe92572 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -91,7 +91,6 @@ allOf:
       required:
         - clocks
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml b/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
index abf1adca0773..668b943db173 100644
--- a/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/atmel,at91rm9200-tcb.yaml
@@ -105,7 +105,6 @@ patternProperties:
 
     additionalProperties: false
 
-
 allOf:
   - if:
       properties:
diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index dca5e27b8233..0b8e3294c83e 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -317,7 +317,6 @@ allOf:
       properties:
         clocks: false
 
-
 examples:
   - |
     #include <dt-bindings/clock/rk3399-cru.h>
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
index b5336bcbfb01..d97e88433d2f 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
@@ -11,7 +11,6 @@ maintainers:
   - Suman Anna <s-anna@ti.com>
 
 description: |+
-
   The Programmable Real-Time Unit and Industrial Communication Subsystem
   (PRU-ICSS a.k.a. PRUSS) is present on various TI SoCs such as AM335x, AM437x,
   Keystone 66AK2G, OMAP-L138/DA850 etc. A PRUSS consists of dual 32-bit RISC
@@ -44,7 +43,6 @@ description: |+
   integration within the IP and the SoC. These nodes are described in the
   following sections.
 
-
   PRU-ICSS Node
   ==============
   Each PRU-ICSS instance is represented as its own node with the individual PRU
@@ -54,7 +52,6 @@ description: |+
 
   See ../../mfd/syscon.yaml for generic SysCon binding details.
 
-
 properties:
   $nodename:
     pattern: "^(pruss|icssg)@[0-9a-f]+$"
diff --git a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
index ea62e51aba90..9a7ff50a0a22 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
@@ -4,7 +4,6 @@
 $id: http://devicetree.org/schemas/sound/adi,adau1372.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-
 title: Analog Devices ADAU1372 CODEC
 
 maintainers:
diff --git a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
index 12f60507aed7..11f59c29b575 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
@@ -4,7 +4,6 @@
 $id: http://devicetree.org/schemas/sound/adi,adau7118.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-
 title: Analog Devices ADAU7118 8 Channel PDM to I2S/TDM Converter
 
 maintainers:
diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
index 7bb6c5dff786..9435f395403a 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -135,7 +135,6 @@ properties:
       the direction (input/output) needs to be dynamically adjusted.
     type: boolean
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
index 5cdb8bcc687b..52e3f1f900c4 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
@@ -8,10 +8,10 @@ title: Rockchip rk3328 internal codec
 
 maintainers:
   - Heiko Stuebner <heiko@sntech.de>
+
 allOf:
   - $ref: dai-common.yaml#
 
-
 properties:
   compatible:
     const: rockchip,rk3328-codec
diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
index cbc7ba37362a..67586ba3e0a0 100644
--- a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
@@ -30,7 +30,6 @@ properties:
       - items:
           - description: Phandle to the HDMI transmitter node.
 
-
   samsung,audio-routing:
     description: |
       List of the connections between audio components; each entry is
diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml
index 85e937e34962..10299064cbc6 100644
--- a/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320dac3100.yaml
@@ -84,7 +84,6 @@ properties:
     description: gpio pin number used for codec reset
     deprecated: true
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
index 4cfa66f62681..089b67384797 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
@@ -75,7 +75,6 @@ properties:
   DCVDD-supply:
     description: Digital core supply regulator for the DCVDD pin.
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/timer/nvidia,tegra-timer.yaml b/Documentation/devicetree/bindings/timer/nvidia,tegra-timer.yaml
index 9ea2ea3a7599..adf208b7a5b9 100644
--- a/Documentation/devicetree/bindings/timer/nvidia,tegra-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/nvidia,tegra-timer.yaml
@@ -100,7 +100,6 @@ properties:
     items:
       - const: timer
 
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml b/Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml
index 76516e18e042..1d0bd36907ed 100644
--- a/Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/nvidia,tegra186-timer.yaml
@@ -15,7 +15,6 @@ description: >
   reference generated by USEC, TSC or either clk_m or OSC. Each TMR can be
   programmed to generate one-shot, periodic, or watchdog interrupts.
 
-
 properties:
   compatible:
     oneOf:
diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
index 6d3ef364672e..6d3fa2bc9cee 100644
--- a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -28,7 +28,6 @@ properties:
               - qcom,pm4125-typec
           - const: qcom,pmi632-typec
 
-
   connector:
     type: object
     $ref: /schemas/connector/usb-connector.yaml#
-- 
2.51.0


