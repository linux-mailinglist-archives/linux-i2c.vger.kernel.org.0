Return-Path: <linux-i2c+bounces-8702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AA19FBBBB
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2024 10:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF3DB168EFF
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2024 09:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970A11C3C13;
	Tue, 24 Dec 2024 09:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="B4O+M/Zw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-m32123.qiye.163.com (mail-m32123.qiye.163.com [220.197.32.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D241B3926;
	Tue, 24 Dec 2024 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735033777; cv=none; b=CUhpAF/zrPS5rmhXRysRd4mDjC8LDRs99XvSb8CnQbqdbP/zVN6sVaU78ZdIX7yE7/AtAFSxAeI4W1FKVlyCLCrbeDIHtkMSTKrE+Eyjd1Sv5Rsh0buymwP5QqkjjbVMR6aTTaQ0Dc1Qv/4NmjjakIn7NuqYbEXaeng7kYBG2CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735033777; c=relaxed/simple;
	bh=FyoNrvG944raOlEcqGIAFdzTG2vSx7b14uZG3/FwDOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i+47Ithy00snwT4bOIIazkWcKuIPZWnCYXtAwkKuCar0gE0ar8bzyXgnD8z8e9ZUfKd3+j/DmHrRFZOU7oqdVy0mO8sMVBaPwMTuVB6l1L5S7udNzoXHUw4Lu6dNQEEYyBeZXtZ9kKrmNGHE2g23Puou4U4BfklnA1yAZN0Q4VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=B4O+M/Zw; arc=none smtp.client-ip=220.197.32.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aad4ed7;
	Tue, 24 Dec 2024 17:49:21 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Johan Jonker <jbx6244@gmail.com>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-i2c@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Simona Vetter <simona@ffwll.ch>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	linux-pwm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andyshrk@163.com>,
	linux-serial@vger.kernel.org,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	devicetree@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	linux-watchdog@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Tim Lunn <tim@feathertop.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v2 00/17] rockchip: Add rk3562 support
Date: Tue, 24 Dec 2024 17:49:03 +0800
Message-Id: <20241224094920.3821861-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx1OGFZCHUlLSB0dSx5OTE9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
X-HM-Tid: 0a93f8122e8303afkunm6aad4ed7
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxA6ODo6AjIJHEoJS1EdLD8s
	DxEKCU5VSlVKTEhOS0hITE1PQ0xDVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJTUJDNwY+
DKIM-Signature:a=rsa-sha256;
	b=B4O+M/Zw24LyURNcEw+WhDYJK29iAHTi0p4dShi0/NhEClO4QvsLlaGzwjfu6wmFcSn5fN5xHurXqhfa05Z/V+HFtpARvcipLUAtfEvn/JVqKw3D5bl5WacGOSbQ9WTLN3PzdpWIg/Xxm3+foqpbqwx3bhj89Wvq4UKSq85Zlys=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=oAXD/EvvyZpJMisxlK2FCVt8jBq9aehKbViTNvrjWK8=;
	h=date:mime-version:subject:message-id:from;


This patch set adds rk3562 SoC and its evb support.

Split out patches belong to different subsystem.

Test with GMAC, USB, PCIe, EMMC, SD Card.

This patch set is base on the patche set for rk3576 evb1 support.

Changes in v2:
- Update in sort order
- remove grf in cru
- Update some properties order

Finley Xiao (2):
  arm64: dts: rockchip: add core dtsi for RK3562 Soc
  arm64: dts: rockchip: Add RK3562 evb2 devicetree

Kever Yang (15):
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

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
 .../bindings/gpu/arm,mali-bifrost.yaml        |    3 +-
 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |    1 +
 .../devicetree/bindings/mfd/syscon.yaml       |    2 +
 .../bindings/mmc/rockchip-dw-mshc.yaml        |    1 +
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |    9 +-
 .../bindings/pci/rockchip-dw-pcie.yaml        |    1 +
 .../power/rockchip,power-controller.yaml      |    1 +
 .../devicetree/bindings/pwm/pwm-rockchip.yaml |    1 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |    7 +
 .../devicetree/bindings/spi/spi-rockchip.yaml |    1 +
 .../bindings/usb/rockchip,dwc3.yaml           |    3 +
 .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3562-evb2-v10.dts     |  520 ++++
 .../boot/dts/rockchip/rk3562-pinctrl.dtsi     | 2352 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi      | 1432 ++++++++++
 19 files changed, 4340 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi

-- 
2.25.1


