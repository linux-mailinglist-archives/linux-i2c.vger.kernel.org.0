Return-Path: <linux-i2c+bounces-477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B837FAC5A
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 22:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2705281D5C
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 21:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C813946426;
	Mon, 27 Nov 2023 21:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B62D63
	for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 13:11:47 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itI-0004lF-8W; Mon, 27 Nov 2023 22:11:40 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itH-00C1px-FB; Mon, 27 Nov 2023 22:11:39 +0100
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itH-00FAHf-1H;
	Mon, 27 Nov 2023 22:11:39 +0100
From: Roland Hieber <rhi@pengutronix.de>
Subject: [PATCH 0/5] ARM: dts: add support for Gossen Metrawatt Profitest
Date: Mon, 27 Nov 2023 22:11:01 +0100
Message-Id: <20231127-b4-imx7-var-som-gome-v1-0-f26f88f2d0bc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUFZWUC/x2N0QqDMAwAf0XyvMDaiZX9ythDWzMN2HYkKIL47
 wt7vIPjTlASJoVnd4LQzsqtGrhbB3mJdSbkyRj83T+c8wFTj1yOgHsU1FZwboXQhTAOrqdhnDJ
 YmqISJok1LxbXbV1NfoU+fPxfr/d1/QAZK/gMewAAAA==
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Li Yang <leoyang.li@nxp.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Roland Hieber <rhi@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: auto@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

This series aims to add initial support for the Gossen Metrawatt
Profitest MF board (internally known as e143_01), as well as the
Variscite VAR-SOM-MX7 System on Module that it is based on.

The resulting device tree has been dt-schema-validated, and the
necessary fixes have been submitted in the following patch series:

http://lore.kernel.org/r/20231127-b4-dt-bindings-serial-v1-1-422a198fd91a@pengutronix.de
http://lore.kernel.org/r/20231127-b4-dt-bindings-mxsfb-v1-1-922e4e71c838@pengutronix.de
http://lore.kernel.org/r/20231127-b4-dt-bindings-timer-v1-1-e06bd6b2370b@pengutronix.de
http://lore.kernel.org/r/20231127-b4-imx7-dt-v1-1-6ecbd0471cc4@pengutronix.de

It builds on top of this series adding MIPI-DSI support to i.MX7:

http://lore.kernel.org/r/20231127-b4-imx7-mipi-dsi-v1-0-7d22eee70c67@pengutronix.de

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
Marco Felsch (2):
      ARM: dts: add Variscite VAR-SOM-MX7 System on Module
      ARM: dts: add support for Gossen Metrawatt Profitest

Philipp Zabel (3):
      dt-bindings: at24: add ROHM BR24G04
      dt-bindings: vendor-prefixes: add Gossen Metrawatt
      ARM: dts: imx7d-pinfunc: add mux for OSC32K_32K_OUT via GPIO1_IO03

 Documentation/devicetree/bindings/arm/fsl.yaml     |   7 +
 Documentation/devicetree/bindings/eeprom/at24.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile                 |   1 +
 arch/arm/boot/dts/nxp/imx/imx7d-gome-e143_01.dts   | 559 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx7d-pinfunc.h          |   1 +
 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7.dtsi   | 607 +++++++++++++++++++++
 7 files changed, 1178 insertions(+)
---
base-commit: 2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
change-id: 20231127-b4-imx7-var-som-gome-1778614e68dc

Best regards,
-- 
Roland Hieber, Pengutronix e.K.          | rhi@pengutronix.de          |
Steuerwalder Str. 21                     | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686         | Fax:   +49-5121-206917-5555 |


