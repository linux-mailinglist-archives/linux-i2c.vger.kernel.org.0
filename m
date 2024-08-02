Return-Path: <linux-i2c+bounces-5109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AFE946540
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 23:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 589B61C211B0
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 21:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E0C139D16;
	Fri,  2 Aug 2024 21:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="y5v+B+Mc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD631ABEB6;
	Fri,  2 Aug 2024 21:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722635122; cv=none; b=IGt8xJiNYacYwo05xnO+ZNnMwBMK/GDRTJHmPvMGeS0/r/Hc7U8R56MnfNnIn8WT5cMvtZj8nrBqOQYMYeXkbby4g4hZ2WI9enpeIqcx6CCDh83JrwuBYg3yUdalEJEC5jVCwKZhWN8+QFS/yBv6oKTFzou7unVtIihoL1iWQDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722635122; c=relaxed/simple;
	bh=OeKajZuaytCAh2Uk8TrK0/Fy7goIybMGcEEMGnPG4GM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sQidy8JrBWcdM84hU4xBY9IYHtdDLPQr9ANImPeu9N/21rFdVaqo0uShzBNTo7G3WUSf9l+K8vA4qvuZFZfJZLw3DYsrvhmaNh9Y+HZdud5ruhIHzCmEpxnffPMy6BCZNiblOktmnA0QZNcOgDF7/6stocbJJc62G6alxNmsRrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=y5v+B+Mc; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722635118;
	bh=OeKajZuaytCAh2Uk8TrK0/Fy7goIybMGcEEMGnPG4GM=;
	h=From:To:Cc:Subject:Date:From;
	b=y5v+B+McR6xRSVnDmeTREf0m1Ohyx7eabCJ+ZG+8T6EBNvhfvbRPYKRolq60bEvh8
	 Bd41fkZ+IfVZS7P4aj03qVxWVNTuXEdY3Thy6fczyO+AZPyiWPQSkd/cSsTBqpCtwm
	 IUMPgB56dyVzyE+OKNIfevXUzj6o25wZjYYo/0GIG3gaGzFqcaW24B4/R8i0GkZpVY
	 oBcQq4ds3nSMrPrahZxw1yBl99xoJ9faC5zPi6d4WXgzvH4+sSbM5zH2yFKttvPcvq
	 ke0hJBQ9njGMEhlUrf79RqYtbwGNVU6MHaefsNXyZGLxrv4LSJ3CSjDnxgELrCT1pe
	 Ve2sMyI5pl6vg==
Received: from trenzalore.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 62A273782215;
	Fri,  2 Aug 2024 21:45:13 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Tim Lunn <tim@feathertop.org>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Andy Yan <andyshrk@163.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Dragan Simic <dsimic@manjaro.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Ondrej Jirman <megi@xff.cz>,
	Weizhao Ouyang <weizhao.ouyang@arm.com>,
	Alexey Charkov <alchark@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 00/10] Add device tree for ArmSoM Sige 5 board
Date: Fri,  2 Aug 2024 17:45:27 -0400
Message-ID: <20240802214612.434179-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the rk3576-armsom-sige5 device tree as well as its rk3576.dtsi base
and pinctrl information in rk3576-pinctrl.dtsi.

The other commits add DT bindings documentation for the devices that
already work with the current corresponding drivers.

The other bindings and driver implementations are in other patch sets:
- PMIC: https://lore.kernel.org/lkml/20240802134736.283851-1-detlev.casanova@collabora.com/
- CRU: https://lore.kernel.org/lkml/20240802214053.433493-1-detlev.casanova@collabora.com/
- PINCTRL: https://lore.kernel.org/lkml/20240802145458.291890-1-detlev.casanova@collabora.com/
- PM DOMAIN: https://lore.kernel.org/lkml/20240802151647.294307-1-detlev.casanova@collabora.com/
- DW-MMC: https://lore.kernel.org/lkml/20240802153609.296197-1-detlev.casanova@collabora.com/
- GMAC: https://lore.kernel.org/lkml/20240802173918.301668-1-detlev.casanova@collabora.com/

Detlev Casanova (10):
  dt-bindings: arm: rockchip: Add ArmSoM Sige 5
  dt-bindings: arm: rockchip: Add rk576 compatible string to pmu.yaml
  dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
  dt-bindings: iio: adc: Add rockchip,rk3576-saradc string
  dt-bindings: mfd: syscon: Add rk3576 QoS register compatible
  dt-bindings: serial: snps-dw-apb-uart: Add Rockchip RK3576
  dt-bindings: soc: rockchip: Add rk3576 syscon compatibles
  dt-bindings: timer: rockchip: Add rk3576 compatible
  arm64: dts: rockchip: Add rk3576 SoC base DT
  arm64: dts: rockchip: Add rk3576-armsom-sige5 board

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
 .../devicetree/bindings/i2c/i2c-rk3x.yaml     |    1 +
 .../bindings/iio/adc/rockchip-saradc.yaml     |    3 +
 .../devicetree/bindings/mfd/syscon.yaml       |    2 +
 .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |   16 +
 .../bindings/timer/rockchip,rk-timer.yaml     |    1 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts |  613 ++
 .../boot/dts/rockchip/rk3576-pinctrl.dtsi     | 5775 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 1635 +++++
 12 files changed, 8055 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576.dtsi

-- 
2.46.0


