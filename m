Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1367283E65
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Oct 2020 20:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgJESik (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 14:38:40 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35257 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgJESik (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Oct 2020 14:38:40 -0400
Received: by mail-oi1-f193.google.com with SMTP id w141so9706420oia.2;
        Mon, 05 Oct 2020 11:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FKBuvtLQAdMRryG6abzok93hEZkfxfk1NvbdtZDThTc=;
        b=bDK75CryujMO76IjbGfXVn3NMjUDRV7I4OLzQAONqY7A1asItWuGsGw1ge1m3Wl+tH
         mdm8Vr+7+odoC8NpnKJKmMTRcS9JWvP4c4MFz8HnmqY54UGwUmm7dbSO5DZTVpExMxsd
         ihuo4hUM+0nSKwDlJwZI0TrJmhvY8iVajwhlgNqMd2AG+H7AYpqFq+dJbMnYhezJt37r
         8EaMuOrmOTnyM4NrsmRee0eX7DF24KMgRRhN6PUb0J2tPGOPf0A1QCGHJZZWNy6EyxFs
         3hVssrxSxJ+V7+R+464rXfqvVkG4r0OFuDZ9RBHOEr2HluU8Y0qcSxk+5i6p2+uVJw3I
         4SFQ==
X-Gm-Message-State: AOAM532Z6hwvunkSQ1ckEkZp2o3GvhXNL76YTzTSxp3kYXv2R/csYiSF
        0LActFl2druxp4twqBkV04nTJDUQDGbZ
X-Google-Smtp-Source: ABdhPJwtSa8Y/I6DT15kFb+c+yKVzbdUj3v7XcBfx5+TPJ0mpN3ESYoYQunOScJs66Yn+dcB/iKTAA==
X-Received: by 2002:aca:50d2:: with SMTP id e201mr416333oib.31.1601923115204;
        Mon, 05 Oct 2020 11:38:35 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id z25sm143140otq.31.2020.10.05.11.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 11:38:34 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 0/4] dt-bindings: additional/unevaluatedProperties clean-ups
Date:   Mon,  5 Oct 2020 13:38:26 -0500
Message-Id: <20201005183830.486085-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The default behavior for json-schema is any unknown property is allowed.
That is generally not the behavior we want for DT. In order to disallow
extra properties, schemas need to define 'additionalProperties: false'
typically. Ideally, we'd just add that automatically with the tools, but
there are some exceptions so only making things explicit everywhere
really works. Missing 'additionalProperties' or 'unevaluatedProperties'
has been a constant source of review comments, so a meta-schema check is
really needed here.

Once this series is in place, the meta-schema can be updated with a
check. The rule is if there's a $ref to another schema, then either
'additionalProperties' or 'unevaluatedProperties' is required. If not,
then 'additionalProperties' is required.

Rob


Rob Herring (4):
  dt-bindings: Add missing 'unevaluatedProperties'
  dt-bindings: Use 'additionalProperties' instead of
    'unevaluatedProperties'
  dt-bindings: Explicitly allow additional properties in board/SoC
    schemas
  dt-bindings: Explicitly allow additional properties in common schemas

 Documentation/devicetree/bindings/arm/actions.yaml     |  2 ++
 Documentation/devicetree/bindings/arm/altera.yaml      |  3 +++
 Documentation/devicetree/bindings/arm/amazon,al.yaml   |  2 ++
 Documentation/devicetree/bindings/arm/amlogic.yaml     |  3 +++
 .../devicetree/bindings/arm/arm,integrator.yaml        |  2 ++
 .../devicetree/bindings/arm/arm,realview.yaml          |  2 ++
 .../devicetree/bindings/arm/arm,versatile.yaml         |  2 ++
 .../devicetree/bindings/arm/arm,vexpress-juno.yaml     |  2 ++
 Documentation/devicetree/bindings/arm/atmel-at91.yaml  |  2 ++
 Documentation/devicetree/bindings/arm/axxia.yaml       |  2 ++
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,bcm11351.yaml     |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,bcm21664.yaml     |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,bcm23550.yaml     |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml      |  3 +++
 .../devicetree/bindings/arm/bcm/brcm,cygnus.yaml       |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,hr2.yaml          |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,ns2.yaml          |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,nsp.yaml          |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,stingray.yaml     |  2 ++
 .../devicetree/bindings/arm/bcm/brcm,vulcan-soc.yaml   |  2 ++
 Documentation/devicetree/bindings/arm/bitmain.yaml     |  3 +++
 Documentation/devicetree/bindings/arm/calxeda.yaml     |  2 ++
 .../devicetree/bindings/arm/coresight-cti.yaml         |  2 ++
 Documentation/devicetree/bindings/arm/cpus.yaml        |  2 ++
 Documentation/devicetree/bindings/arm/digicolor.yaml   |  2 ++
 Documentation/devicetree/bindings/arm/fsl.yaml         |  2 ++
 .../devicetree/bindings/arm/hisilicon/hisilicon.yaml   |  3 +++
 .../devicetree/bindings/arm/intel,keembay.yaml         |  3 +++
 .../devicetree/bindings/arm/intel-ixp4xx.yaml          |  2 ++
 .../bindings/arm/keystone/ti,k3-sci-common.yaml        |  2 ++
 .../devicetree/bindings/arm/marvell/armada-7k-8k.yaml  |  2 ++
 Documentation/devicetree/bindings/arm/mediatek.yaml    |  3 +++
 .../devicetree/bindings/arm/microchip,sparx5.yaml      |  2 ++
 Documentation/devicetree/bindings/arm/moxart.yaml      |  1 +
 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml   |  3 +++
 Documentation/devicetree/bindings/arm/mstar/mstar.yaml |  2 ++
 .../bindings/arm/nvidia,tegra194-ccplex.yaml           |  2 ++
 Documentation/devicetree/bindings/arm/nxp/lpc32xx.yaml |  2 ++
 Documentation/devicetree/bindings/arm/qcom.yaml        |  2 ++
 Documentation/devicetree/bindings/arm/rda.yaml         |  2 ++
 Documentation/devicetree/bindings/arm/realtek.yaml     |  3 +++
 Documentation/devicetree/bindings/arm/renesas.yaml     |  2 ++
 Documentation/devicetree/bindings/arm/rockchip.yaml    |  3 +++
 .../bindings/arm/samsung/samsung-boards.yaml           |  2 ++
 Documentation/devicetree/bindings/arm/sirf.yaml        |  3 +++
 .../devicetree/bindings/arm/socionext/milbeaut.yaml    |  3 +++
 .../devicetree/bindings/arm/socionext/uniphier.yaml    |  2 ++
 Documentation/devicetree/bindings/arm/spear.yaml       |  3 +++
 Documentation/devicetree/bindings/arm/sprd/sprd.yaml   |  2 ++
 Documentation/devicetree/bindings/arm/sti.yaml         |  3 +++
 .../devicetree/bindings/arm/stm32/st,mlahb.yaml        |  2 ++
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml |  3 +++
 Documentation/devicetree/bindings/arm/sunxi.yaml       |  2 ++
 Documentation/devicetree/bindings/arm/tegra.yaml       |  2 ++
 Documentation/devicetree/bindings/arm/ti/nspire.yaml   |  3 +++
 .../devicetree/bindings/arm/ti/ti,davinci.yaml         |  3 +++
 Documentation/devicetree/bindings/arm/ux500.yaml       |  2 ++
 Documentation/devicetree/bindings/arm/vt8500.yaml      |  3 +++
 Documentation/devicetree/bindings/arm/xilinx.yaml      |  2 ++
 Documentation/devicetree/bindings/arm/zte.yaml         |  2 ++
 .../devicetree/bindings/ata/faraday,ftide010.yaml      |  2 ++
 Documentation/devicetree/bindings/ata/pata-common.yaml |  2 ++
 Documentation/devicetree/bindings/ata/sata-common.yaml |  2 ++
 Documentation/devicetree/bindings/bus/renesas,bsc.yaml |  2 ++
 .../devicetree/bindings/bus/simple-pm-bus.yaml         |  2 ++
 .../bindings/chrome/google,cros-ec-typec.yaml          |  2 ++
 .../devicetree/bindings/clock/baikal,bt1-ccu-div.yaml  |  6 +++++-
 .../devicetree/bindings/clock/baikal,bt1-ccu-pll.yaml  |  2 +-
 .../devicetree/bindings/clock/imx8m-clock.yaml         |  2 +-
 .../devicetree/bindings/connector/usb-connector.yaml   |  2 ++
 .../bindings/display/bridge/snps,dw-mipi-dsi.yaml      |  2 ++
 .../devicetree/bindings/display/dsi-controller.yaml    |  2 ++
 .../devicetree/bindings/display/panel/lvds.yaml        |  2 ++
 .../bindings/display/panel/panel-common.yaml           |  2 ++
 .../devicetree/bindings/display/panel/tpo,tpg110.yaml  |  2 ++
 Documentation/devicetree/bindings/dma/dma-common.yaml  |  2 ++
 .../devicetree/bindings/dma/dma-controller.yaml        |  2 ++
 Documentation/devicetree/bindings/dma/dma-router.yaml  |  2 ++
 Documentation/devicetree/bindings/dma/ingenic,dma.yaml |  2 ++
 .../devicetree/bindings/dma/st,stm32-dma.yaml          |  2 ++
 .../devicetree/bindings/dma/st,stm32-dmamux.yaml       |  2 ++
 .../devicetree/bindings/dma/st,stm32-mdma.yaml         |  2 ++
 Documentation/devicetree/bindings/dma/ti/k3-udma.yaml  |  2 ++
 .../devicetree/bindings/extcon/wlf,arizona.yaml        |  2 ++
 .../devicetree/bindings/hwmon/baikal,bt1-pvt.yaml      |  4 ++--
 .../devicetree/bindings/i2c/amlogic,meson6-i2c.yaml    |  2 ++
 .../devicetree/bindings/i2c/cdns,i2c-r1p10.yaml        |  2 ++
 Documentation/devicetree/bindings/i2c/i2c-gpio.yaml    |  2 ++
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml    |  2 ++
 .../bindings/i2c/socionext,uniphier-fi2c.yaml          |  2 ++
 .../bindings/i2c/socionext,uniphier-i2c.yaml           |  2 ++
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml          |  2 ++
 .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml   |  2 ++
 .../devicetree/bindings/iio/accel/adi,adis16240.yaml   |  4 ++++
 .../devicetree/bindings/iio/accel/adi,adxl345.yaml     |  4 ++++
 .../devicetree/bindings/iio/accel/adi,adxl372.yaml     |  4 ++++
 .../devicetree/bindings/iio/adc/adi,ad7124.yaml        |  4 ++++
 .../devicetree/bindings/iio/adc/adi,ad7192.yaml        |  4 ++++
 .../devicetree/bindings/iio/adc/adi,ad7292.yaml        |  4 ++++
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml        |  6 ++++++
 .../devicetree/bindings/iio/adc/adi,ad7923.yaml        |  4 ++++
 .../devicetree/bindings/iio/adc/maxim,max1241.yaml     |  4 ++++
 .../bindings/iio/adc/samsung,exynos-adc.yaml           |  5 ++++-
 Documentation/devicetree/bindings/iio/common.yaml      |  2 ++
 .../devicetree/bindings/iio/dac/adi,ad5770r.yaml       | 10 ++++++++++
 .../devicetree/bindings/iio/frequency/adf4371.yaml     |  4 ++++
 .../devicetree/bindings/iio/imu/adi,adis16460.yaml     |  4 ++++
 .../devicetree/bindings/iio/imu/adi,adis16475.yaml     |  2 ++
 .../devicetree/bindings/iio/imu/bosch,bmi160.yaml      |  4 ++++
 .../devicetree/bindings/iio/imu/nxp,fxos8700.yaml      |  4 ++++
 .../devicetree/bindings/input/fsl,mpr121-touchkey.yaml |  2 ++
 Documentation/devicetree/bindings/input/input.yaml     |  2 ++
 .../devicetree/bindings/input/matrix-keymap.yaml       |  2 ++
 .../bindings/input/touchscreen/touchscreen.yaml        |  2 ++
 .../bindings/interrupt-controller/loongson,htpic.yaml  |  2 ++
 .../interrupt-controller/loongson,liointc.yaml         |  2 ++
 .../bindings/interrupt-controller/mti,gic.yaml         |  2 +-
 Documentation/devicetree/bindings/leds/common.yaml     |  2 ++
 .../bindings/leds/leds-class-multicolor.yaml           |  3 +++
 .../devicetree/bindings/leds/trigger-source.yaml       |  2 ++
 Documentation/devicetree/bindings/media/rc.yaml        |  2 ++
 .../bindings/memory-controllers/renesas,rpc-if.yaml    |  2 ++
 .../devicetree/bindings/mfd/cirrus,lochnagar.yaml      | 10 +++++++++-
 Documentation/devicetree/bindings/mfd/syscon.yaml      |  2 +-
 .../bindings/mfd/ti,j721e-system-controller.yaml       |  5 ++++-
 .../devicetree/bindings/mips/ingenic/devices.yaml      |  3 +++
 .../devicetree/bindings/mips/loongson/devices.yaml     |  3 +++
 .../devicetree/bindings/misc/olpc,xo1.75-ec.yaml       |  4 +++-
 .../devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml |  2 ++
 Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml  |  2 ++
 Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml |  2 ++
 .../devicetree/bindings/mmc/mmc-controller.yaml        |  2 ++
 Documentation/devicetree/bindings/mmc/owl-mmc.yaml     |  2 ++
 .../devicetree/bindings/mmc/rockchip-dw-mshc.yaml      |  2 ++
 Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml   |  2 ++
 .../devicetree/bindings/mmc/socionext,uniphier-sd.yaml |  2 ++
 .../bindings/mmc/synopsys-dw-mshc-common.yaml          |  2 ++
 .../devicetree/bindings/mmc/synopsys-dw-mshc.yaml      |  2 ++
 Documentation/devicetree/bindings/mtd/denali,nand.yaml |  2 ++
 .../devicetree/bindings/mtd/ingenic,nand.yaml          |  2 ++
 .../devicetree/bindings/mtd/nand-controller.yaml       |  2 ++
 .../devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml    |  2 ++
 Documentation/devicetree/bindings/net/adi,adin.yaml    |  2 ++
 .../devicetree/bindings/net/amlogic,meson-dwmac.yaml   |  2 ++
 .../devicetree/bindings/net/aspeed,ast2600-mdio.yaml   |  2 ++
 .../devicetree/bindings/net/can/can-transceiver.yaml   |  2 ++
 Documentation/devicetree/bindings/net/dsa/dsa.yaml     |  2 ++
 .../devicetree/bindings/net/ethernet-controller.yaml   |  2 ++
 .../devicetree/bindings/net/ethernet-phy.yaml          |  2 ++
 .../devicetree/bindings/net/marvell,mvusb.yaml         |  2 ++
 Documentation/devicetree/bindings/net/mdio.yaml        |  2 ++
 .../devicetree/bindings/net/mediatek,star-emac.yaml    |  2 ++
 Documentation/devicetree/bindings/net/nxp,tja11xx.yaml |  2 ++
 Documentation/devicetree/bindings/net/qca,ar71xx.yaml  |  2 ++
 Documentation/devicetree/bindings/net/qca,ar803x.yaml  |  2 ++
 .../devicetree/bindings/net/qcom,ipq4019-mdio.yaml     |  2 ++
 .../devicetree/bindings/net/qcom,ipq8064-mdio.yaml     |  2 ++
 .../devicetree/bindings/net/renesas,ether.yaml         |  2 ++
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  |  2 ++
 Documentation/devicetree/bindings/net/stm32-dwmac.yaml |  2 ++
 .../devicetree/bindings/net/ti,davinci-mdio.yaml       |  2 ++
 Documentation/devicetree/bindings/net/ti,dp83867.yaml  |  2 ++
 Documentation/devicetree/bindings/net/ti,dp83869.yaml  |  2 ++
 Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml |  2 ++
 .../devicetree/bindings/nvmem/nvmem-consumer.yaml      |  2 ++
 Documentation/devicetree/bindings/nvmem/nvmem.yaml     |  2 ++
 .../devicetree/bindings/nvmem/qcom,qfprom.yaml         |  2 ++
 .../devicetree/bindings/nvmem/qcom,spmi-sdam.yaml      |  2 ++
 .../devicetree/bindings/nvmem/rockchip-efuse.yaml      |  2 ++
 .../devicetree/bindings/nvmem/st,stm32-romem.yaml      |  2 ++
 .../opp/allwinner,sun50i-h6-operating-points.yaml      |  4 +++-
 .../devicetree/bindings/pci/cdns,cdns-pcie-ep.yaml     |  2 ++
 .../devicetree/bindings/pci/cdns,cdns-pcie-host.yaml   |  2 ++
 .../devicetree/bindings/pci/cdns-pcie-ep.yaml          |  2 ++
 .../devicetree/bindings/pci/cdns-pcie-host.yaml        |  2 ++
 Documentation/devicetree/bindings/pci/cdns-pcie.yaml   |  2 ++
 .../devicetree/bindings/pci/host-generic-pci.yaml      |  2 ++
 Documentation/devicetree/bindings/pci/loongson.yaml    |  2 ++
 Documentation/devicetree/bindings/pci/pci-ep.yaml      |  2 ++
 .../devicetree/bindings/pci/ti,j721e-pci-ep.yaml       |  2 ++
 .../devicetree/bindings/pci/ti,j721e-pci-host.yaml     |  2 ++
 Documentation/devicetree/bindings/pci/versatile.yaml   |  2 ++
 .../devicetree/bindings/pinctrl/cirrus,madera.yaml     |  2 ++
 .../devicetree/bindings/pinctrl/pincfg-node.yaml       |  2 ++
 .../devicetree/bindings/pinctrl/pinmux-node.yaml       |  2 ++
 .../devicetree/bindings/power/pd-samsung.yaml          |  2 ++
 .../devicetree/bindings/power/power-domain.yaml        |  2 ++
 .../devicetree/bindings/power/supply/power-supply.yaml |  2 ++
 Documentation/devicetree/bindings/pwm/pwm.yaml         |  2 ++
 .../devicetree/bindings/regulator/fixed-regulator.yaml |  2 ++
 .../bindings/regulator/google,cros-ec-regulator.yaml   |  2 ++
 .../devicetree/bindings/regulator/gpio-regulator.yaml  |  2 ++
 .../bindings/regulator/qcom-labibb-regulator.yaml      |  2 +-
 .../devicetree/bindings/regulator/regulator.yaml       |  2 ++
 .../bindings/regulator/st,stm32-booster.yaml           |  2 ++
 .../bindings/regulator/st,stm32-vrefbuf.yaml           |  2 ++
 .../bindings/regulator/vqmmc-ipq4019-regulator.yaml    |  2 ++
 .../devicetree/bindings/regulator/wlf,arizona.yaml     |  2 ++
 Documentation/devicetree/bindings/riscv/cpus.yaml      |  2 ++
 Documentation/devicetree/bindings/riscv/sifive.yaml    |  3 +++
 Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml |  2 ++
 Documentation/devicetree/bindings/rtc/rtc.yaml         |  2 ++
 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml     |  2 ++
 .../devicetree/bindings/serial/ingenic,uart.yaml       |  5 +++++
 .../devicetree/bindings/serial/renesas,hscif.yaml      |  2 ++
 .../devicetree/bindings/serial/renesas,sci.yaml        |  2 ++
 .../devicetree/bindings/serial/renesas,scif.yaml       |  2 ++
 .../devicetree/bindings/serial/renesas,scifa.yaml      |  2 ++
 .../devicetree/bindings/serial/renesas,scifb.yaml      |  2 ++
 Documentation/devicetree/bindings/serial/rs485.yaml    |  3 +++
 Documentation/devicetree/bindings/serial/serial.yaml   |  2 ++
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml   |  2 ++
 .../devicetree/bindings/soc/imx/fsl,aips-bus.yaml      |  2 ++
 .../devicetree/bindings/sound/amlogic,aiu.yaml         |  2 ++
 .../devicetree/bindings/sound/cirrus,madera.yaml       |  2 ++
 .../bindings/sound/nvidia,tegra210-ahub.yaml           |  3 +++
 .../devicetree/bindings/sound/wlf,arizona.yaml         |  2 ++
 .../bindings/soundwire/soundwire-controller.yaml       |  2 ++
 .../bindings/spi/amlogic,meson-gx-spicc.yaml           |  2 ++
 .../devicetree/bindings/spi/amlogic,meson6-spifc.yaml  |  2 ++
 .../devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml    |  2 ++
 .../devicetree/bindings/spi/qca,ar934x-spi.yaml        |  2 ++
 .../devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml    |  2 ++
 .../devicetree/bindings/spi/renesas,hspi.yaml          |  2 ++
 .../devicetree/bindings/spi/renesas,rspi.yaml          |  2 ++
 .../devicetree/bindings/spi/renesas,sh-msiof.yaml      |  2 ++
 .../bindings/spi/socionext,uniphier-spi.yaml           |  2 ++
 .../devicetree/bindings/spi/spi-controller.yaml        |  2 ++
 Documentation/devicetree/bindings/spi/spi-gpio.yaml    |  2 ++
 Documentation/devicetree/bindings/spi/spi-mux.yaml     |  2 ++
 Documentation/devicetree/bindings/spi/spi-pl022.yaml   |  2 ++
 .../devicetree/bindings/spi/spi-rockchip.yaml          |  2 ++
 Documentation/devicetree/bindings/spi/spi-sifive.yaml  |  2 ++
 .../devicetree/bindings/spi/st,stm32-qspi.yaml         |  2 ++
 .../devicetree/bindings/spi/st,stm32-spi.yaml          |  2 ++
 Documentation/devicetree/bindings/spmi/spmi.yaml       |  2 ++
 .../bindings/thermal/thermal-cooling-devices.yaml      |  2 ++
 .../devicetree/bindings/thermal/thermal-sensor.yaml    |  2 ++
 .../devicetree/bindings/timer/snps,dw-apb-timer.yaml   |  2 +-
 Documentation/devicetree/bindings/usb/ti,tps6598x.yaml |  2 ++
 Documentation/devicetree/bindings/usb/usb-hcd.yaml     |  2 ++
 .../bindings/watchdog/amlogic,meson-gxbb-wdt.yaml      |  2 ++
 .../devicetree/bindings/watchdog/arm-smc-wdt.yaml      |  2 ++
 .../devicetree/bindings/watchdog/qcom-wdt.yaml         |  2 ++
 .../devicetree/bindings/watchdog/samsung-wdt.yaml      |  2 ++
 .../devicetree/bindings/watchdog/st,stm32-iwdg.yaml    |  2 ++
 .../devicetree/bindings/watchdog/ti,rti-wdt.yaml       |  2 ++
 .../devicetree/bindings/watchdog/watchdog.yaml         |  2 ++
 249 files changed, 570 insertions(+), 14 deletions(-)

--
2.25.1
