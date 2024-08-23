Return-Path: <linux-i2c+bounces-5749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEB395D0AD
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 17:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27F95B262F5
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE2D188A1F;
	Fri, 23 Aug 2024 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="f02wVC+j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E182B188904;
	Fri, 23 Aug 2024 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724425260; cv=pass; b=DXX/Q7rVXd0E/8MVeV9OpUOn8mWNprDfFfkmwrbFuhhnnVp3og1ZaoRHlyOrJhXqSow784QybGiq1+mbVr5RJoVqoziP3CeL1aL+MbvMDWk6iEGT3lU7HSyeC449gScWrnZ2t//5aX76XvbzNvawgo7cmr/hm7XN9pst9WmWUoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724425260; c=relaxed/simple;
	bh=JNCrHEnz2TTmX50Fdf5y/m97VRuA1bJpbf1mLzwmkN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tdtzj/3gb1m9gYQMAhvowTF5TVaR1ND+PXnaL6QecW6bK5TLdpLXN76TFtcrSQfZkhzHSvbX1pgZSizhpmnVDBT6n0/pi58YuLIT1nZGN8jQQNqu2bZqJMjomboFBFHYKkpONcTnEUbSLLDl0G0srYW+v6t1oy4ld7Ddy88m8yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=f02wVC+j; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: detlev.casanova@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724425169; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=no39V9NnxnwNc1WnPDgoT+p7ZUw/z+a8UCFwGESfjxBCX0x5SsSVkOk9X4TFmR1hL+PE+YnwdK75h2b6OfkEtUt154I2/y0YUJ7iiUl139TmSeyE+WOFpKUncU9OT1aZ5j9vgv/+VZGzDXgC0reK6Z0WzzXGZ6dlVDCOMq2GS+o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724425169; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TwlvOdJ7MjOFHk4+IGiyU7dJ6E4gYxvsaSn7FY9AvBU=; 
	b=Pdj+aCDgE4m2PkeUiGx1NRHxbuHRUmEujM+JMIaSk9iI+XRa4d1L0CGBYZ9HXk8C5vfVY1wT2eaBxd5L3gkDzdVLaagQZXH5pK8fnKYiBXTaRQGzHFUomMwGSau3to/5Us7OCAo2uiDZyngd2GwfzTnMwC0Qf4C7zhD0Ol9llJw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724425169;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=TwlvOdJ7MjOFHk4+IGiyU7dJ6E4gYxvsaSn7FY9AvBU=;
	b=f02wVC+jsUJd5qWnUikwuktjSRUkeIjtwaq8U702xiDXQJOSNH2RvrYXx/yR2Lts
	U9nSj0Q+Ar6fGYYuD1bQLxLS/W5Ik06iid5vmf3i1yzjD19MRoHxyLSO/6Y4ORWPl00
	UDpxVmcQqdgpsgqSVq2pEVKou2AfpFThfHDDD84w=
Received: by mx.zohomail.com with SMTPS id 1724425168680168.96164896631421;
	Fri, 23 Aug 2024 07:59:28 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Tim Lunn <tim@feathertop.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Andy Yan <andyshrk@163.com>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Dragan Simic <dsimic@manjaro.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ondrej Jirman <megi@xff.cz>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Elon Zhang <zhangzj@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jamie Iles <jamie@jamieiles.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 00/12] Add device tree for ArmSoM Sige 5 board
Date: Fri, 23 Aug 2024 10:52:27 -0400
Message-ID: <20240823150057.56141-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add device tree for ArmSoM Sige 5 board

Add the rk3576-armsom-sige5 device tree as well as its rk3576.dtsi base
and pinctrl information in rk3576-pinctrl.dtsi.

The other commits add DT bindings documentation for the devices that
already work with the current corresponding drivers.


Note that as is, the rockchip gpio driver needs the gpio nodes
to be children of the pinctrl node, even though this is deprecated.

When the driver supports it, they can be moved out of the pinctrl node.

The power-domain@RK3576_PD_USB is a child of power-domain@RK3576_PD_VOP.
That looks strange but it seems to be how the hardware is.
There has been no confirmation from Rockchip yet.

The other bindings and driver implementations are in other patch sets:
- PMIC: https://lore.kernel.org/all/20240802134736.283851-1-detlev.casanova@collabora.com/ (applied on next)
- CRU: https://lore.kernel.org/all/20240822194956.918527-1-detlev.casanova@collabora.com/
- PINCTRL: https://lore.kernel.org/all/20240822195706.920567-1-detlev.casanova@collabora.com/
- PM DOMAIN: https://lore.kernel.org/all/20240814222824.3170-1-detlev.casanova@collabora.com/ (applied on next)
- DW-MMC: https://lore.kernel.org/all/20240822212418.982927-1-detlev.casanova@collabora.com/
- GMAC: https://lore.kernel.org/all/20240823141318.51201-1-detlev.casanova@collabora.com/

Changes since v1:
- Add eMMC support
- Add gpu node
- Add rtc node
- Add spi compatible dt-bindings
- Add watchdog support
- Dropped timer compatible commit (applied in [0])
- Move ethernet aliases to board dt
- Move mmio nodes to soc node
- Removed cru grf phandle
- Removed gpio aliases
- Removed grf compatibles (applied in [1])
- Removed pinctrl php-grf phandle
- Removed v2-tuning for sdcard
- Renamed clock nodes
- Renamed regulators do match regulator-vcc-<voltage>-<name>
- Renamed the rkvdec_sram node to vdec_sram to match prior generations
- Reorder fields consistently in nodes
- Use correct #power-domain-cells values

[0]: https://lore.kernel.org/all/918bb9e4-02d9-4dca-bed2-28bb123bdc10@linaro.org/
[1]: https://lore.kernel.org/all/172441646605.877570.8075942261050000.b4-ty@sntech.de/

Detlev.

Detlev Casanova (12):
  dt-bindings: arm: rockchip: Add ArmSoM Sige 5
  dt-bindings: arm: rockchip: Add rk3576 compatible string to pmu.yaml
  dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
  dt-bindings: iio: adc: Add rockchip,rk3576-saradc string
  dt-bindings: mfd: syscon: Add rk3576 QoS register compatible
  dt-bindings: serial: snps-dw-apb-uart: Add Rockchip RK3576
  dt-bindings: mmc: Add support for rk3576 eMMC
  dt-bindings: gpu: Add rockchip,rk3576-mali compatible
  dt-bindings: watchdog: Add rockchip,rk3576-wdt compatible
  dt-bindings: spi: Add rockchip,rk3576-spi compatible
  arm64: dts: rockchip: Add rk3576 SoC base DT
  arm64: dts: rockchip: Add rk3576-armsom-sige5 board

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
 .../bindings/gpu/arm,mali-bifrost.yaml        |    1 +
 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |    1 +
 .../bindings/iio/adc/rockchip-saradc.yaml     |    3 +
 .../devicetree/bindings/mfd/syscon.yaml       |    2 +
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |   32 +-
 .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
 .../devicetree/bindings/spi/spi-rockchip.yaml |    1 +
 .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts |  651 ++
 .../boot/dts/rockchip/rk3576-pinctrl.dtsi     | 5775 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 1710 +++++
 14 files changed, 8177 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576.dtsi

-- 
2.46.0


