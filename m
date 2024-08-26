Return-Path: <linux-i2c+bounces-5810-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E4795F4B1
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 17:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D6C0B20C2A
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 15:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30B41925B6;
	Mon, 26 Aug 2024 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CSj5PyP2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFE81946B9
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684932; cv=none; b=AH/quGhcUBLFxgP3vpZkcFVTmklXRGqnmimbmvlyH3xctXnD3TGzKzrfydD4PUxsT3k5KdB50TpJ3FHTsZRU/+mafuE9LmMxm0MdW8+d/4ZNn9IRtWEjWg4uO97LexdABeIoeiUTpsJT2M+iRIRsn/XO2q/6IpIPZAPaG4Od8UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684932; c=relaxed/simple;
	bh=NBeNYYXU9LbD4I6hqDD6KM5/RGIVaM1YbCpPgru+4qI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxADrliAS27W7tl2iJkQOiWJPtAa/5Mu6xDymhScncxWjNwwtVawk8HQubt07DikFpyGQwSibeWdGhxpLamhQVFaabVg+ajTcyxcX6jmGLYuG99D+UJt+qPoMppodTxBnXC/obRXSKXQUCyd/sl90T4PoMtYJkXRhxKgSi1aU+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CSj5PyP2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=mIL/QjJ4uzfVePZcLU4Wv7d+CfbOuEG3CCOgjzaQuHM=; b=CSj5Py
	P2rM+UXtr6ENfKYuZB3/HyD7ifsT/GNm++6LKOg3vb03pRJlkYKcHGCl0RFrGNyS
	NI9cT4+EZuIT4jlvunta9Q/7lyDj263QNVFgLv1lRCfkj5Ot1X0Vye6W2Z6DnsEn
	YCBuuyd2DkegZMaXjSoJymUS5XX9+ahyra5zbHYgfbWaW/Wk0jX4CqFh9CmXwzIW
	cftcoeURe9Am/BtWPTQ5lEzheDTY4AzqjAyGOcIKW3fOw89x+5IqeLdgWfm3QmnM
	AKOwZWvh4Z0yTmofxRvOb3Ye/kk+2MHUtXbfDcFQLZ2Uvr11ubCWOMHyN6fJSVUO
	qwjloJfMJQBYDlAg==
Received: (qmail 2032464 invoked from network); 26 Aug 2024 17:08:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2024 17:08:46 +0200
X-UD-Smtp-Session: l3s3148p1@mrVbgJcgfI0gAwDPXwdRANgvu6DX4+2c
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 1/2] dt-bindings: i2c: renesas,rcar-i2c: document SMBusAlert usage
Date: Mon, 26 Aug 2024 17:08:42 +0200
Message-ID: <20240826150840.25497-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826150840.25497-4-wsa+renesas@sang-engineering.com>
References: <20240826150840.25497-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Question: Should I remove 'smbus_alert' from the enum of
'interrupt-names'? It is already documented here:

https://github.com/devicetree-org/dt-schema/commit/c51125d571cac9596048e888a856d70650e400e0


 .../bindings/i2c/renesas,rcar-i2c.yaml         | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
index 6cc60c3f61cd..2eed3ae7c57d 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
@@ -60,7 +60,20 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+    description:
+      Without interrupt-names, the first interrupt listed must be the one
+      of the IP core, the second optional interrupt listed must handle
+      SMBALERT#, likely a GPIO.
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - main
+        - smbus_alert
 
   clock-frequency:
     description:
@@ -155,7 +168,8 @@ examples:
     i2c0: i2c@e6508000 {
         compatible = "renesas,i2c-r8a7791", "renesas,rcar-gen2-i2c";
         reg = <0xe6508000 0x40>;
-        interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts-extended = <&gic GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>, <&gpio5 1 IRQ_TYPE_EDGE_FALLING>;
+        interrupt-names = "main", "smbus_alert";
         clock-frequency = <400000>;
         clocks = <&cpg CPG_MOD 931>;
         power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
-- 
2.43.0


