Return-Path: <linux-i2c+bounces-8659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA4A9F9083
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 11:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73E311896D26
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 10:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F831C4A05;
	Fri, 20 Dec 2024 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="LXQtSCOj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m127157.xmail.ntesmail.com (mail-m127157.xmail.ntesmail.com [115.236.127.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB0919C56D;
	Fri, 20 Dec 2024 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734691437; cv=none; b=PZRUu5qXmLzX5l79DboK37HahVqH1k8xAABbgeA81aJqpeAXMRmh22JFuWdGhfYX+2lg7nGYRt3uoLuCBFFxFX/q2q0DL8n3xYsMXr9BKq5koCQQDEROKZPsiK6cLcaH3gl/Qg3vYSRBd6rx0eQrytIqlQ+OTn4TBj9/qzSRX0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734691437; c=relaxed/simple;
	bh=FLotb8PO7pUbOoGoa3ZcA+IJLn2SEtUGvEV7uvVVTkk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kbln7y/CCeYJY3S9PlwwCdobmOpsBOraPpxJpouwpuGplkxgSESnNkpTn090B/kdHBqxXc2u8p+GLR8k9jPCPAcgbcXdmVGHGw60XNJkwku5wI6zdCunKuGeLKIwIWibwqrXS2c6O1FkrGFO6PM8eUS9WzTk5N0PGR9e7uX1zj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=LXQtSCOj; arc=none smtp.client-ip=115.236.127.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 656820ed;
	Fri, 20 Dec 2024 18:38:26 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Lee Jones <lee@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Zhang Rui <rui.zhang@intel.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-clk@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andy Yan <andyshrk@163.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jose Abreu <joabreu@synopsys.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	linux-mmc@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-i2c@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-watchdog@vger.kernel.org,
	David Wu <david.wu@rock-chips.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-iio@vger.kernel.org,
	linux-pci@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	linux-phy@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Maxime Ripard <mripard@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Mark Brown <broonie@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-serial@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Tim Lunn <tim@feathertop.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH 00/38] rockchip: Add rk3562 support
Date: Fri, 20 Dec 2024 18:37:46 +0800
Message-Id: <20241220103825.3509421-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh9LT1ZJGktPSElKGk8fQxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtNQk
	tVSktLVUpCWQY+
X-HM-Tid: 0a93e3a5af4003afkunm656820ed
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nwg6Kxw6GTIRKggeThEUMR4h
	P0gaCyxVSlVKTEhPTUJKSkpKTElJVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOTUpJNwY+
DKIM-Signature:a=rsa-sha256;
	b=LXQtSCOj5PQ5rmMQS8JUHg+aVmzux+tnR5NnlpILS50US/QWv5VBCTHDsqEiVs5WhSa9UqWxWgKBEnSg0vucKhE8FyZdsUwbc5ZsdiUz76LZqHiim02ORqBuKb413jRYfReSUFy7jfbzAaPEA5wGkuukfoQqA957T+ZIIQC0lqE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=RUJ3VBWN4hJZF+kjNTXL1lSb1odrwauQvfHGVuJDe90=;
	h=date:mime-version:subject:message-id:from;


This patch set adds rk3562 SoC and its evb support.

The patch number is a little bit too big, some of them may need to split
out for different maintainers, please let me know which patch need to
split out.

Test with GMAC, USB, PCIe, EMMC, SD Card.

This patch set is base on the patche set for rk3576 evb1 support.


David Wu (2):
  ethernet: stmmac: dwmac-rk: Add gmac support for rk3562
  ethernet: stmmac: dwmac-rk: Make the phy clock could be used for
    external phy

Finley Xiao (7):
  clk: rockchip: add dt-binding header for rk3562
  clk: rockchip: Add clock controller for the RK3562
  dt-bindings: add power-domain header for RK3562 SoC
  nvmem: rockchip-otp: Add support for rk3568-otp
  nvmem: rockchip-otp: Add support for rk3562
  arm64: dts: rockchip: add core dtsi for RK3562 Soc
  arm64: dts: rockchip: Add RK3562 evb2 devicetree

Frank Wang (1):
  phy: rockchip: inno-usb2: add usb2 phy support for rk3562

Jon Lin (1):
  phy: rockchip-naneng-combo: Support rk3562

Kever Yang (24):
  dt-bindings: clock: add rk3562 cru bindings
  dt-bindings: pinctrl: Add rk3562 pinctrl support
  soc: rockchip: power-domain: add power domain support for rk3562
  dt-bindings: rockchip-thermal: Support the RK3562 SoC compatible
  dt-bindings: iio: adc: Add rockchip,rk3562-saradc string
  dt-bindings: net: Add support for rk3562 dwmac
  dt-bindings: nvmem: rockchip,otp: Add support for rk3562 and rk3568
  dt-bindings: phy: rockchip: Add rk3562 naneng-combophy compatible
  dt-bindings: phy: rockchip,inno-usb2phy: add rk3562
  dt-bindings: PCI: dwc: rockchip: Add rk3562 support
  dt-bindings: mmc: Add support for rk3562 eMMC
  dt-bindings: mmc: rockchip-dw-mshc: Add rk3562 compatible string
  dt-bindings: power: rockchip: Add bindings for rk3562
  dt-bindings: i2c: i2c-rk3x: Add rk3562 compatible
  dt-bindings: gpu: Add rockchip,rk3562-mali compatible
  dt-bindings: watchdog: Add rk3562 compatible
  dt-bindings: spi: Add rockchip,rk3562-spi compatible
  dt-bindings: serial: snps-dw-apb-uart: Add support for rk3562
  dt-bindings: usb: dwc3: add compatible for rk3562
  dt-bindings: pwm: rockchip: Add rockchip,rk3562-pwm
  dt-bindings: rockchip: pmu: Add rk3562 compatible
  dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
  dt-bindings: arm: rockchip: Add rk3562 evb2 board
  dt-bindings: mfd: syscon: Add rk3562 QoS register compatible

Shaohan Yao (1):
  thermal: rockchip: Support the rk3562 SoC in thermal driver

Simon Xue (1):
  iio: adc: rockchip_saradc: add rk3562

Steven Liu (1):
  pinctrl: rockchip: add rk3562 support

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
 .../bindings/clock/rockchip,rk3562-cru.yaml   |   62 +
 .../bindings/gpu/arm,mali-bifrost.yaml        |    3 +-
 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |    1 +
 .../bindings/iio/adc/rockchip-saradc.yaml     |    2 +
 .../devicetree/bindings/mfd/syscon.yaml       |    2 +
 .../bindings/mmc/rockchip-dw-mshc.yaml        |    1 +
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |    9 +-
 .../bindings/net/rockchip-dwmac.yaml          |    5 +-
 .../bindings/nvmem/rockchip,otp.yaml          |   49 +-
 .../bindings/pci/rockchip-dw-pcie.yaml        |    1 +
 .../phy/phy-rockchip-naneng-combphy.yaml      |    1 +
 .../bindings/phy/rockchip,inno-usb2phy.yaml   |    3 +-
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |    1 +
 .../power/rockchip,power-controller.yaml      |    1 +
 .../devicetree/bindings/pwm/pwm-rockchip.yaml |    1 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |    7 +
 .../devicetree/bindings/spi/spi-rockchip.yaml |    1 +
 .../bindings/thermal/rockchip-thermal.yaml    |    1 +
 .../bindings/usb/rockchip,dwc3.yaml           |    3 +
 .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  520 ++++
 .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1432 ++++++++++
 drivers/clk/rockchip/Kconfig                  |    7 +
 drivers/clk/rockchip/Makefile                 |    1 +
 drivers/clk/rockchip/clk-rk3562.c             | 1111 ++++++++
 drivers/clk/rockchip/clk.h                    |   39 +
 drivers/iio/adc/rockchip_saradc.c             |   24 +-
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    |  213 +-
 drivers/nvmem/rockchip-otp.c                  |   97 +
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c |   49 +
 .../rockchip/phy-rockchip-naneng-combphy.c    |  152 ++
 drivers/pinctrl/pinctrl-rockchip.c            |  199 +-
 drivers/pinctrl/pinctrl-rockchip.h            |    3 +-
 drivers/pmdomain/rockchip/pm-domains.c        |   48 +-
 drivers/thermal/rockchip_thermal.c            |  112 +-
 include/dt-bindings/clock/rk3562-cru.h        |  733 +++++
 include/dt-bindings/power/rk3562-power.h      |   35 +
 42 files changed, 7269 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi
 create mode 100644 drivers/clk/rockchip/clk-rk3562.c
 create mode 100644 include/dt-bindings/clock/rk3562-cru.h
 create mode 100644 include/dt-bindings/power/rk3562-power.h

-- 
2.25.1


