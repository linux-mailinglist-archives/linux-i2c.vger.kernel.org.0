Return-Path: <linux-i2c+bounces-4572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E6E923BA3
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 12:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91B0F28587F
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 10:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A84158DDD;
	Tue,  2 Jul 2024 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="SQsI/dWY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0B158A3D;
	Tue,  2 Jul 2024 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719916916; cv=none; b=HAM0iiLp6foTyxcfBWSw4KGRX7Bdd6cedgrwcwAUJxYE5vveKmH8CrsKGux3Y6QAmKcczkAfFuV9VC72VMJSeJ2pERWLoFlFBQWf/ZclflSJcD15xKk06rNf9ErUnA9RRMjLC/P/pQ6aYGUHv0X2JfiuFWnCpNUKunNXkQeN8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719916916; c=relaxed/simple;
	bh=elBbal48p86/kZHBof/VjLRnd3BGmbEnAawFg4N0H8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VA3Y9Rqjf9+CUeBvyIGrtfa3npZ/Wu0SQBSaVqpHCvzV2/MrGi+PPPCUPe9k0fmVdRpQjP88rhA6CPxQR14tCymAODE7POCmlvv78LSm/sJMp/iI6r6dHMNuNRo4IvFZNJKgQ/ibpIDHg88zSMp1nkRkUMsA+GYQilocWDEWnf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=SQsI/dWY; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53BA8BFB39;
	Tue,  2 Jul 2024 12:32:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1719916373; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=FWOSDRgRrfQHpSWqoIecrwtJ3fiVFmkYNSiqz7G5o8M=;
	b=SQsI/dWY01BypXms4ywHrv4INPF+88zC/OaWHajNQCirUa9e0QpaAbGAB3d4y1nb2GjFzf
	K/XudMZ8tjFSQGBNXPX5tf8XqBG5Ph3zTq7aoEXcf6fBxkWdKlL+ZnyBm4hSj+ttGTZb1J
	GUlUaYxfRvvrFmcxIZn+w7fjANMx8QPVLIgoRXNTm9AR5n4RIDtc4ahyOdrb3w+wsmm9Pw
	etRHKn4yMcsDJs2TbXCPEeGAZLHqOMVngL2eUkvyq89LjElWkFizmMFmCBpyeuwQ/M2fN3
	zYushx/mevT0+mUd1s7aYEPrMFNSV4qRI4n2dnBdPjLK3eNzc8xUNV4zGQJ/Eg==
From: Frieder Schrempf <frieder@fris.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Li Yang <leoyang.li@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Agner <stefan@agner.ch>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bo Liu <liubo03@inspur.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH 0/7] Add support for Kontron OSM-S i.MX93 SoM and carrier board
Date: Tue,  2 Jul 2024 12:31:12 +0200
Message-ID: <20240702103155.321855-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Patch 1-4: small DT binding fixups
Patch 5: board DT bindings
Patch 6: support PMIC driver without IRQ
Patch 7: add devicetrees

Frieder Schrempf (7):
  dt-bindings: eeprom: at24: Move compatible for Belling BL24C16A to
    proper place
  dt-bindings: eeprom: at24: Add compatible for ONSemi N24S64B
  dt-bindings: gpio: vf610: Allow gpio-line-names to be set
  dt-bindings: regulator: pca9450: Make interrupt optional
  dt-bindings: arm: fsl: Add Kontron i.MX93 OSM-S based boards
  regulator: pca9450: Make IRQ optional
  arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier
    board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 .../devicetree/bindings/eeprom/at24.yaml      |  10 +-
 .../devicetree/bindings/gpio/gpio-vf610.yaml  |   1 +
 .../regulator/nxp,pca9450-regulator.yaml      |   1 -
 .../dts/freescale/imx93-kontron-bl-osm-s.dts  | 165 ++++++
 .../dts/freescale/imx93-kontron-osm-s.dtsi    | 547 ++++++++++++++++++
 drivers/regulator/pca9450-regulator.c         |  41 +-
 7 files changed, 744 insertions(+), 27 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi

-- 
2.45.2


