Return-Path: <linux-i2c+bounces-7557-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1026F9AEF68
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 20:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93BC41F22354
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 18:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB23920515C;
	Thu, 24 Oct 2024 18:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mowqlSie"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA7D20400A
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 18:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729793476; cv=none; b=ggNZwzspD1aqFg90I35WiwkNjv4KbU7qlS4c2CAHaAoIgy0dEN04BWUiZVxTLOi8Cumrmq/ARRJ24CkM690w/ze0sNWPnIulAw6OePC9zqnM3xynWh7Z03GeLqDKQ656f3v7AmR4E8Fh/E5CKupIOVcI3lo4NE+GymAQ8Six3ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729793476; c=relaxed/simple;
	bh=zqSinmggbyALtFlgHQGiPOP1CMvPeMaz0BwXU0S0Uyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s4L5ZxsSHPiBJgPf4gKW19ZmN/uhUEgrC7JOnx1HIebHQP5sWKWz9gZeK8MTJILOv3vW2KiywrPBm4rfaZ8OwI/0bP6+TA160qFLUV8/1p2Ds3zoMTeD+PDVks8hDWhg6QLsbFdhRyvv469z7oR+Wbk79pTsfghn7lYcQnuR7BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mowqlSie; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso11588805e9.3
        for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 11:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729793470; x=1730398270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urkkRzU5D9fbLL7/NswuGkiZi7jgfQyHM4AVm24QR80=;
        b=mowqlSie//kEyXaQT3cJ7hV/XhpaaB64aiR+gmuMH8SoSiFzZ0tozccSneAnXYJ2bQ
         Ne3fjEKVVTVxQA0W9jHcNUd0SQYNxTw+XTznJPSBzgCZdL2Pf0UdD8yGhKjPOx27zzD7
         /C537SWhF6sfaoxJ1MDPkmMgclaWhm0D+ZvRiEiSYRpBpch2zvfjz0gQMXE6OV41Clc+
         6BzukxX+X3ludpHT5VkkE6ITHwUg53r/4KLsupaak9bbH5vBKNG1+7scCKKGPg2O/QcA
         v4aO2ggtdRVTFSDo1+v5g3a2V89tED10pcESawRz5AVHAB8r2TnfKwOLazsrHiONHunB
         LJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729793470; x=1730398270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urkkRzU5D9fbLL7/NswuGkiZi7jgfQyHM4AVm24QR80=;
        b=nKgBmcW/qR78kYG8DqEk6OVBYLPg+OpUeUsFLKF7QPwjs2NuQw76LlFvgifCeUAcyT
         HDM2KxhJ9JDiLozzH6J7D5XM8gj8dTFTNAOeX7UsP1LqneCvySlQ/qtptH3d0PNc5+2/
         vHr/SJfAC3Uwtnukdr5/pYBI9giLQ5YIG6kHj4D5Qte5Rlv9ifvMWdJRVLOdSbtbIm5+
         wK2LjLGkweYpAc3V0OrFBWT+ovSVEhGZOuJee05URUw7K3jQcj81X/1UuHbnf5aIPXoX
         e78C19tZQOmyJmZUYjDJgWd8e1fhyMo4E9w12bkggPNzVzrUxfu+J2e3lUf50jpFK6f6
         zxHA==
X-Forwarded-Encrypted: i=1; AJvYcCWKs63oOQ9kebMSOh2UTrV4arnALn6/t+mdrh9m48fnk4CgZp/yGQ30zcwPP03ACpOfGO4UMffSB3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMYCjtc2lIBrdPkYn5/cWmXvneFlfU4VGrKT+IJCXkxq2gTIfj
	NKyDs3qzXS7KquUDULpZooZZu7ZtuimzANe0ApxUQ0tSEWNm8z1qagN6nBsr2TY=
X-Google-Smtp-Source: AGHT+IFwYi40XB5lkPBV0kIJQvlY450vcar/Ftp28V95b/qWnB423ETtHbKWltn4MFsqSTWOVjPiTA==
X-Received: by 2002:a05:600c:1d27:b0:431:57d2:d7b4 with SMTP id 5b1f17b1804b1-43184189bf9mr63441695e9.26.1729793470523;
        Thu, 24 Oct 2024 11:11:10 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c04c:f30a:b45c:dbb])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c0f248sm52551275e9.37.2024.10.24.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:11:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 24 Oct 2024 20:10:39 +0200
Subject: [PATCH v3 5/6] dt-bindings: hwmon: pmbus: add ti tps25990 support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-tps25990-v3-5-b6a6e9d4b506@baylibre.com>
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
In-Reply-To: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <naresh.solanki@9elements.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2682; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zqSinmggbyALtFlgHQGiPOP1CMvPeMaz0BwXU0S0Uyc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnGo2zzvMa4LhaAd7cvZuyPbrarjWEtJKxEkfg5
 J9sFTWmMN+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZxqNswAKCRDm/A8cN/La
 hfSdD/48DvCbKe7R8NGvLbLx+lm0Ie/2fZ1S/mKVBNWcOoUnNNqaDk9h1a42EfsL8pPHFqJEBt2
 eIdnwln/u5sbCRwc1lomu6wG0xc+sO2ri4E1zO/PY6W7OsBfGxCF1ua9PkPiUoTRJTfa+lrpMdG
 ke0QMimf/XGXH+3Wi+ulZj3a3/8Sb+XCRUBtL3d/6mb0HzwSTZn9J70BqLEad+++0fqzAxj1wR6
 Gw9pYShLgWJuvIiVFrsrODNwnh4zGRIB2Wmmbr+SGPx2pg1zv9a8mZaGuyC4TsCliaeRehwW/wu
 klwgOXDfYwpIRLyfVLwRfnyLFKDXUDWz51PbDMhrsZy5YUpHqiIHSoon2qiaidBvkNjTJm1kRx9
 wXTShnVo4eONUW3aSYy0SCt0I6F+ZNTivqjLHmBwvXyUn5Yee1ZpZ3ePxGg2PCPgyNLUdL95ES6
 Hnbo4zEOeEcbVMBKEhe7ROjdf7ct8WI2SPccwHBRdWgXIn43IU7NDwCNL77SpGBzgloPDoI7bfx
 7CMy3ko84m3YZJ/jjwWaVBlB2X6eFUnWgTg6+JoevxpSXzFuZ2HiIW3g1/SVYE1VilWhdmP7Xiy
 fgimdAfXhQgV7pAY+NKBLpIoQC/THU2HP5OwPZ5AjHTVijCT/xMnjE4b0npX1Zt0LJKobWDMB08
 oPLBZl63Z76PjBw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add DT binding for the Texas Instruments TPS25990 eFuse

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/hwmon/pmbus/ti,tps25990.yaml          | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f4115870e4509425e88c913f350789ffc8d396c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TPS25990 Stackable eFuse
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+description:
+  The TI TPS25990 is an integrated, high-current circuit
+  protection and power management device with PMBUS interface
+
+properties:
+  compatible:
+    const: ti,tps25990
+
+  reg:
+    maxItems: 1
+
+  ti,rimon-micro-ohms:
+    description:
+      micro Ohms value of the resistance installed between the Imon pin
+      and the ground reference.
+
+  interrupts:
+    description: PMBUS SMB Alert Interrupt.
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      list of regulators provided by this controller.
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+      gpdac1:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+      gpdac2:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - ti,rimon-micro-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hw-monitor@46 {
+            compatible = "ti,tps25990";
+            reg = <0x46>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <42 IRQ_TYPE_LEVEL_LOW>;
+            ti,rimon-micro-ohms = <1370000000>;
+
+            regulators {
+                cpu0_vout: vout {
+                    regulator-name = "main_cpu0";
+                };
+            };
+        };
+    };

-- 
2.45.2


