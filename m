Return-Path: <linux-i2c+bounces-7798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6669BD3F9
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 19:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7126A2845D4
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 18:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2632A1EC008;
	Tue,  5 Nov 2024 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M6Q25mjp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81771E9082
	for <linux-i2c@vger.kernel.org>; Tue,  5 Nov 2024 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730829554; cv=none; b=QTY9ATGbgcT5lxe3zfeQmlPm8WdZXwUGTKpL0g3yWrGWGiqylz3bWt7Y8lWx8SCLXyi5Nh02/qe/qiwgL8aVQfPhRr6edPuAtsq+iiRzebj8WV0OLQuk5A9DWzGIgzlA9VkfqFVchnp09mNnfn8NBXbsl+pmXaZ3k6tDwsmEKKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730829554; c=relaxed/simple;
	bh=4qS+gFi5nKp/GGt3OYkpTJvCjfNdC5khoZpxCsaCS3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iaKhCYXPtmMSnJk0h63QW6gNGuUALL4VtHpZwOecgvIvAGFpGmfamptCEQdAWLaf/KA8DDZcsPtytxnaAHrWtn8OpOFZz3iOY69G0Th62LENNY3DsDMnjP8FUDcD5CGyj1+DrRk8NCU26mR5jgZzGFYHcWHy1tGGpfPjwovaY/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M6Q25mjp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so3836796f8f.0
        for <linux-i2c@vger.kernel.org>; Tue, 05 Nov 2024 09:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730829551; x=1731434351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hzGnF74fKvSxleWYkjh3q2LhCWSn4JOo48Ee3jEMF4=;
        b=M6Q25mjpuxAZtyeO2xoFaugkB5KmuipSi3ofF2tBs4vOwkdWCsZwTrZaUGaU+E7Srb
         URYyRM3gsOp4T0Zzin797BqhgjkBq5NrXDMoY/IFxCpEAsGhf8z256vRqX/gHBIRMCU7
         pbFCnJWzmhjrMZpdNuMrZconFACHZ9YyB8skMrbg/lFswZ3EJk/mBv8BZDkAzHm7Pxaq
         eF0STdFEL/2qX89VPL4H0Hgxwbd0baudnbkBCd5ifNosTMzWfsrjs4jI9G1UN1LPx1wD
         D5iQsyWQMLWSq8AnXZBqwUcmU1WYO8tb8uki8eMNk0Vf4V/XOuiiAmJHc01AsAk+8nDI
         nygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829551; x=1731434351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hzGnF74fKvSxleWYkjh3q2LhCWSn4JOo48Ee3jEMF4=;
        b=eJhY7GSUgjCKvFcf6DNruHBNTwDm5wFPgPzhEB59SY3pU3oz307RsieYQ0ru2SF3t/
         +zNr5kovH76rq+MVXe6d2JrR9ldYlzmMYgEHaEAJGGELwHH3AuQYgt4XqoAaf6SWwf3N
         3QjmKHllculihWlYZrDL4CDkz5OO3t59VU+qowbhPDvcEsuDhaMffloGRRUDt4G+qIrB
         flX3Hs6fWITHSPyuGiibjchdrYu7ZP3LUHS7PmxqojtzIfb9IX/dgsginjhm3H/GYSHI
         f3skTHLHJSbHPB2dq9887PKvFsnYLsOyjsuKI9Bo/puW5lSVFVe76/pGzZoKHi0R5PFk
         6dWw==
X-Forwarded-Encrypted: i=1; AJvYcCXFwsuXdRLDd/oTqK3jj+B18L6+aUNAMSFjw7qPuRkMrUpIlnxxtUHD3Ubg7yan9USdxsyIsA+FAIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYjHj6SdC9aZgMdT+2BwFKPMjjwI9q8Pvrj4xwBUBZ1ye5Qga
	3NkTtX+XoJqODef+RVBuWIN/ONQB4oN6eVAI1M8/wH7+8lEDExWEHrme128X6hc=
X-Google-Smtp-Source: AGHT+IHmHzqgujp0oLgMa5LYyUv1JpGusD09X4051kObgpHOgBb1wazAwy+bT+RCClKnh942uofhFA==
X-Received: by 2002:a05:6000:2a8a:b0:37d:47b3:7b82 with SMTP id ffacd0b85a97d-381bea27d6amr17176334f8f.57.1730829550844;
        Tue, 05 Nov 2024 09:59:10 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5b9b:df02:2761:7a57])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381c113dd7fsm16959481f8f.70.2024.11.05.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 09:59:10 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 05 Nov 2024 18:58:43 +0100
Subject: [PATCH v4 6/7] dt-bindings: hwmon: pmbus: add ti tps25990 support
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-tps25990-v4-6-0e312ac70b62@baylibre.com>
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
In-Reply-To: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3392; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4qS+gFi5nKp/GGt3OYkpTJvCjfNdC5khoZpxCsaCS3U=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnKlzmpazkOrtvEzPBePlhaB62J/qGxrV2Flczp
 2VCxcuvB0GJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZypc5gAKCRDm/A8cN/La
 hTL5D/99j/aVkMx0yWsZoKMy1hzOBqS/DHbLauJRozIieek3ykySemjg7d5NxQj7u6cLAMbaAKr
 WQLKNAh2wEZNTKIBO9EcQGUy+GKwa5U3wS00gl0WdTUwN21AuI+fSkfgW7gCRQrqqA8axseknXW
 yZrsfKqdKDKfR7414xfYtHhfrTNdlKqSLBTjbGmKqFN3i1w5W9lcQYTjDNDuSMrygYIjfue7LSV
 EPUXljEGVkQCF/0RM7cD9Y64FKh2UR5wGFX6Lju+JurOMllLD3DYo+XdR40MoQjVK4/PdwU0h44
 r7apQQpm0X98xH1gkJrRBPB1bRr5n+MBsvf/YgAdIasLrWFuPFnO2P3jBDu/9sozWbVkHpAB8uV
 vFMJjp+kh3ldbu5fz/8X5sgDXpE8/V7MAbgTAE86Y0jBgXK64lK/VcV1j6OWoXIHBGilNcle++E
 D3eBN4hKXoQfZmL2/tZ4T6LM6FfPbvHBPhAyri+aAkXcRUtG4E0EdCQ/u7MD7FGLGk18PUoGCgP
 9GNxu/lCSM4CbB0wLzpTJsLPzwEzhfbKC4UvfMdTlRqEWLBDO/WA5XMdWI/w0u1lEadqttVmaZC
 r1OiMts4q4jA+xouokVIqOmsGM00sEgSXiKl6m/FO6SC8HmHih3q9qzlcczKKY9YF33nhtzon9+
 xmkb7wJY7lcqksA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add DT binding for the Texas Instruments TPS25990 eFuse

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/hwmon/pmbus/ti,tps25990.yaml          | 83 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 89 insertions(+)

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
diff --git a/MAINTAINERS b/MAINTAINERS
index 1b56b163f1219b73085cb5a45b130e2c96a2cb2b..4f21d7d2ce992f14d8c533f0c8742edb22a0db3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22811,6 +22811,12 @@ F:	include/linux/dma/k3-udma-glue.h
 F:	include/linux/dma/ti-cppi5.h
 X:	drivers/dma/ti/cppi41.c
 
+TEXAS INSTRUMENTS TPS25990 HARDWARE MONITOR DRIVER
+M:	Jerome Brunet <jbrunet@baylibre.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+
 TEXAS INSTRUMENTS TPS23861 PoE PSE DRIVER
 M:	Robert Marko <robert.marko@sartura.hr>
 M:	Luka Perkov <luka.perkov@sartura.hr>

-- 
2.45.2


