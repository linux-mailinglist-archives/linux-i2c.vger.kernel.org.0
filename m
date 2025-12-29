Return-Path: <linux-i2c+bounces-14853-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BEBCE7E68
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 19:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 54B533000B70
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 18:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3AD335BC0;
	Mon, 29 Dec 2025 18:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="IyrgbF6F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBDC33555E
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 18:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767033619; cv=none; b=ZKMFWVbRP3ncgQNqql7xh/qycSzYUn4OchldaWXZxicpFOJUq1KIDxu7AoY2TiYLQnzMJZ43r9BQufgOk+lEZ2NffayT060ZrJgyi16MkBjS40fMeXjKBpO27q5l9qXlJix4/emz0TA9I6ekXCkaU6Ss1Xa9z6Q8VTR2Cih7z9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767033619; c=relaxed/simple;
	bh=dZfEjbKU/ouuTZTqPmjhpmJn3Qj+z3eYR6Bl3lD/xyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nXQaD7RNubFoKb+tadGzPtKG7O6AFI4gpmbcRX45MGFuJa69qJgbJIry3XCEz/ISm+dQ4aIeJelOXn1J5HZazILmcHIbZMYPFVOZ1SXIhb8GhE/CK3BlB0z7HxibagBXAbOZz641AsYkkwSlifoYPa9mg9f3Smm/luBpsObY1G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=IyrgbF6F; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so92999335e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 10:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033615; x=1767638415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11UWr6vQeMvr9imUXUNdMnB+gxpMnYAq1afoJQH8nw8=;
        b=IyrgbF6F0u28a5QzqGi50ibLI5sXMnrNs9w2nKZbHvTdLOMtT7fV5tB3XSXxbBin+z
         +F7iemGAgQcoJ9Flf47KNjfQBnI/iqSFjhlwBxAY1TytmO/7e4JOQPrNinsFzbE1kobm
         iwp1El2nfozKqd0uOOOIZy4E7W7vs7yG0bwPi2nR/PX0eYqAfLaqKeMcAVOr1MSg30k8
         YcRIl3dZsgbyi6YROamI3AWybGB52crReQbGZAHW/Wz+ded6FK7NZnz6cmqe3OQd5D4p
         FxFHbwh7lCbyarJxYMPPv6EjTjI0yKAlsapfEw6F7Nul42Yk6T7qVGvrs+Mor4Cok3iG
         uIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033615; x=1767638415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11UWr6vQeMvr9imUXUNdMnB+gxpMnYAq1afoJQH8nw8=;
        b=CXm+AnEfNV7eKad+X1ru+18UgAyUXePDCxulAzY+abfTa30yIousLq22uY5So4gpHC
         UYYyu4HHQBywIHOjbYSSVVCUgaZ2RlZrc5tGxEN3sMlXNyN4D5XXoKDy9hstce2RwULq
         wxXH0J+DJfDYC7RIg7IXO7UggEXu2hZ0Op3eiLK2bdLbwrLMdp6sNBicbrVXUaVMrDp9
         J109mBPGtb7tHY2z3CBHPthmlcUYkCNbmm7G7BMkfDUiJCx4ssLHJyC+remwEmyNpdcZ
         AYOTyzZc2gFyvOEN8hObBKjsr1ZCKYEvj9zR4zkE1+t5mvtcV/51GwB/Y737YPdexWGI
         gIqA==
X-Forwarded-Encrypted: i=1; AJvYcCWitk8agDdT+SUdUf0HjmrNITrZrTM21LeO7/3Vewyl4QjnNkkUmrJvaiJQEhCIK2k8C9K5ZoXk8nM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzynuyp3tphx1vuaa3SW0IFfv+6oe2yGwJc4aeFIT9iE3m8A3A3
	/rY7LapcRY9+Y0mP2/FTa0qe8U4lQKbQamNEGpm819rv08Eiid3iqwqnj0DJYy7eq6Y=
X-Gm-Gg: AY/fxX7QbVfSUOY2+VZBXKonjGoeyklPQXC5pSGIgdsOlic3Renqk/55Yu1L5tg7IaB
	cq5WD5AGmtSpoc7rP/rjl/yMFfnDmYOXYXAUlUJrKSKblhu4GLTnbTCgzZu6ZKKIQ1pfbWVfRqV
	53y9NnNvHPv6H8uIgo7/9VUatdq2nx15oBaox7ZrnR5Oo47C1d+64TOZhY9JWL3WQHlsioKIByd
	qo/nasETG3xHQR+Vo7wXTlsWaH9XJJ6FHnMS/Kl0pEcP81v1/r77ykaRLOm5Ch6N0E60K60dG7c
	0vHNErgR2oIlAaZCI1x0wkABLe98EMiY79mmLNYtjyrCCjnrM22dJ6sCQ2O5G4TN3KRvKHUi8+Y
	PX/55B1GTKIAgcsCyrtimxgH6ZR5bqOMaclIr8hDtMu/SjOgdLEjRgZ3hC2VGQoxeNvVB90AKU6
	4TTFhUUOjmWtGna7zC4IoEdzHhQS189CGStMift0V+GEwNA3IdGFVrzSIVbtY0vkyv6lv9bB848
	Gmpf0Stbd3EmjN4aHu+6g1UyW0hI64YE/MVzRg=
X-Google-Smtp-Source: AGHT+IHLaRW54exoV7d2gj+gL+Rt0y3shCu9zPoBut21wi+sGprCRHwNncaVYYsnvBzR7kb1R2Xvfw==
X-Received: by 2002:a05:600c:1f84:b0:479:3a87:2093 with SMTP id 5b1f17b1804b1-47d338a6109mr230056155e9.37.1767033615044;
        Mon, 29 Dec 2025 10:40:15 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:14 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 01/15] dt-bindings: usb: Add Microchip LAN969x support
Date: Mon, 29 Dec 2025 19:37:42 +0100
Message-ID: <20251229184004.571837-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip LAN969x has DWC3 compatible controller, though limited to 2.0(HS)
speed, so document it.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Fix example indentation

 .../bindings/usb/microchip,lan9691-dwc3.yaml  | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
new file mode 100644
index 000000000000..08113eac74b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,lan9691-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - microchip,lan9691-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - microchip,lan9691-dwc3
+      - const: snps,dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Gated USB DRD clock
+      - description: Controller reference clock
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+allOf:
+  - $ref: snps,dwc3.yaml#
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@300000 {
+        compatible = "microchip,lan9691-dwc3", "snps,dwc3";
+        reg = <0x300000 0x80000>;
+        interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 12>, <&clks 11>;
+        clock-names = "bus_early", "ref";
+    };
-- 
2.52.0


