Return-Path: <linux-i2c+bounces-481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4B07FAC68
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 22:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84B79281D50
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 21:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C814345C0B;
	Mon, 27 Nov 2023 21:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E505F1BC6
	for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 13:12:06 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itI-0004lG-8Q; Mon, 27 Nov 2023 22:11:40 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itH-00C1pz-Fi; Mon, 27 Nov 2023 22:11:39 +0100
Received: from rhi by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <auto@pengutronix.de>)
	id 1r7itH-00FAHk-1K;
	Mon, 27 Nov 2023 22:11:39 +0100
From: Roland Hieber <rhi@pengutronix.de>
Date: Mon, 27 Nov 2023 22:11:03 +0100
Subject: [PATCH 2/5] dt-bindings: vendor-prefixes: add Gossen Metrawatt
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231127-b4-imx7-var-som-gome-v1-2-f26f88f2d0bc@pengutronix.de>
References: <20231127-b4-imx7-var-som-gome-v1-0-f26f88f2d0bc@pengutronix.de>
In-Reply-To: <20231127-b4-imx7-var-som-gome-v1-0-f26f88f2d0bc@pengutronix.de>
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
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: auto@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

Add vendor prefix for Gossen Metrawatt GmbH:

https://www.gossenmetrawatt.de/en/

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 309b94c328c8..5c9adc1e2ef2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -538,6 +538,8 @@ patternProperties:
     description: Global Mixed-mode Technology, Inc.
   "^goldelico,.*":
     description: Golden Delicious Computers GmbH & Co. KG
+  "^gome,.*":
+    description: Gossen Metrawatt GmbH
   "^goodix,.*":
     description: Shenzhen Huiding Technology Co., Ltd.
   "^google,.*":

-- 
2.39.2


