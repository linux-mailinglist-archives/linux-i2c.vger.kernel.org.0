Return-Path: <linux-i2c+bounces-14287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF2AC8B476
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 18:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E9BE35B6A3
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 17:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1CD33ADAA;
	Wed, 26 Nov 2025 17:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="m/lsqM84"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1702B30BF69;
	Wed, 26 Nov 2025 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178703; cv=none; b=kKP8E13xjIkxevhAPsRHPPd4zyVEn+VlWy80KZsgqnMw1bOk7X7yJpnYZO1wtXOZkaVoN1AYlooRrou1NHslw5bM08aiPTP/KhoRNF/2mbK7+d/5aGaA1aVlwlfpESH8h7lBaDNtq5g1N7pVBRJ1h1Fdn9T30c7SxENcOsFu/DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178703; c=relaxed/simple;
	bh=HZ2zj59plR7MYLmDD2b/Zaq0ljbWALyTUquIne+xL34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PxjD1kUNsdgAtlC74nInjznti52frsBfUCo3ytrBTq+cIsqA9jFSK1iruc/bVcLsjYAzVMWV0wt8NrWBwnaaONVlvqeC8OuQbSnKDnWCEyGAHEiAQgE2y2am7WQ7zX9aLxZi2VWYIzoOdIKS2/YngT+STXVSzNzGi/44LaUZsEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=m/lsqM84; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0425991.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ458PV250655;
	Wed, 26 Nov 2025 11:09:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=8NKQD
	5aYefUuHwkSV+4b+jV4DhbhWIKxz42punywKYM=; b=m/lsqM84k5PCEj3Z3RiQ6
	p2PWEg/Aly4f8MfxC6cZLWIXfciZsmeBkuqxyK5yyTqTl72DEQIjiklUPj9GZwTV
	qit7cM7aDZRYv9LP3FOND3Tk92AvJmQgvEWkI/1Ii6w7JP5PuRuY1NZ8NBHSlV9v
	LmXEl4sC2pPo4jEb7AWvwUdUj17iZxgPB/MKdzNrLFtkBIYwEffthZpCjcze25HE
	ywllpW/W3SCqF10Xkfycl+aQDdj7Sk9ZYtDbZFVQDroKL8jGWt7Z5lCfji/Nvfo3
	Z/wCLfQiqzenf5qEKoazXlwFybfPSP0+9QyKrTCEcV0bM8bj4Z41UMEIazDIZMfH
	A==
Received: from intranet-smtp.plexus.com ([64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 4ant7as5wp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 11:09:18 -0600 (CST)
Received: from LNDCL34533.neenah.na.plexus.com (unknown [10.255.48.203])
	by intranet-smtp.plexus.com (Postfix) with ESMTP id C26643C87C;
	Wed, 26 Nov 2025 11:09:17 -0600 (CST)
From: Danny Kaehn <danny.kaehn@plexus.com>
Date: Wed, 26 Nov 2025 11:05:24 -0600
Subject: [PATCH v12 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-cp2112-dt-v12-1-2cdba6481db3@plexus.com>
References: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
In-Reply-To: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Danny Kaehn <danny.kaehn@plexus.com>,
        Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ethan Twardy <ethan.twardy@plexus.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Leo Huang <leohu@nvidia.com>,
        Arun D Patil <arundp@nvidia.com>, Willie Thai <wthai@nvidia.com>,
        Ting-Kai Chen <tingkaic@nvidia.com>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764176728; l=3253;
 i=danny.kaehn@plexus.com; s=20251118; h=from:subject:message-id;
 bh=HZ2zj59plR7MYLmDD2b/Zaq0ljbWALyTUquIne+xL34=;
 b=VD4OjURPCEgERc8EF6mzw97eyqSHUJubgm0tITKiI4zxnIh+sW0Uf3hpdjNnIwWIlUz8Elu4n
 FEUkOqb8rPrAOPSnu884oaaVfPbg6GWFPyU7NWTtI5sRFWqEemVJ7E5
X-Developer-Key: i=danny.kaehn@plexus.com; a=ed25519;
 pk=br2sOmMe9QhpVp1uJw6IxgSNRKZO5khHotS2b+/bX14=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0MCBTYWx0ZWRfX03utHbD5tBuS
 Banwmn9XkEa1l0sszAchQDYAF1BrR7hmgzZeV2Pspl30zXmbdYqJ2Z8nCixe2+wemZNHn30k3C0
 V3BaEQGSIzJVa6cfbrsihMLH167kal6RqD8CaZEQKwYiDIyMf5mkiEeJ6Nd8MZ2a7rhupkahGjz
 ri39PDwZ+2hr1LDLBk8/P3rv4GQc7FKfsKAeXLrWPHOa69Zv3Mr3kRlvU6+t4OR156UH5ZaJPJT
 zmNMEyOmRSNh2BPYi130qw1OAPIIWOIxrzkHP6frsvW5B3VJBj9JLYXOA+X1U3lveUGRY4yXdtb
 iAcHIr4mLA+1pA4g4z372Dc7//8RymjgI5NH7AK3A7AfiuaXIgluMwkdL47Ce8UsqtH9rbnYOx8
 9qSyBsmmN32yDhYoblOPpU80yMisQA==
X-Proofpoint-ORIG-GUID: hEQQiYXl4UGJ1d4CHNIvQqyKu6z2NDfl
X-Authority-Analysis: v=2.4 cv=BouQAIX5 c=1 sm=1 tr=0 ts=6927343f cx=c_pps
 a=356DXeqjepxy6lyVU6o3hA==:117 a=356DXeqjepxy6lyVU6o3hA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=Y_joWELsAAAA:8 a=a1k9qEM8g4OboYts1TMA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=g_BQsM8wYJVSTWLOHH1t:22
X-Proofpoint-GUID: WJpUYwx2AWcUYNKq3XPwZAvWHEMJyc4J
X-Proofpoint-Spam-Reason: orgsafe

This is a USB HID device which includes an I2C controller and 8 GPIO pins.

The binding allows describing the chip's gpio and i2c controller in DT,
with the i2c controller being bound to a subnode named "i2c". This is
intended to be used in configurations where the CP2112 is permanently
connected in hardware.

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
---
 .../devicetree/bindings/i2c/silabs,cp2112.yaml     | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
new file mode 100644
index 000000000000..4b5c1af3673d
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/silabs,cp2112.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CP2112 HID USB to SMBus/I2C Bridge
+
+maintainers:
+  - Danny Kaehn <danny.kaehn@plexus.com>
+
+description:
+  The CP2112 is a USB HID device which includes an integrated I2C controller
+  and 8 GPIO pins. Its GPIO pins can each be configured as inputs, open-drain
+  outputs, or push-pull outputs.
+
+properties:
+  compatible:
+    const: usb10c4,ea90
+
+  reg:
+    maxItems: 1
+    description: The USB port number
+
+  interrupt-controller: true
+  "#interrupt-cells":
+    const: 2
+
+  gpio-controller: true
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 8
+
+  i2c:
+    description: The SMBus/I2C controller node for the CP2112
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      sda-gpios:
+        maxItems: 1
+
+      scl-gpios:
+        maxItems: 1
+
+      clock-frequency:
+        minimum: 10000
+        default: 100000
+        maximum: 400000
+
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      cp2112: device@1 {
+        compatible = "usb10c4,ea90";
+        reg = <1>;
+
+        gpio-controller;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        #gpio-cells = <2>;
+        gpio-line-names = "CP2112_SDA", "CP2112_SCL", "TEST2",
+          "TEST3","TEST4", "TEST5", "TEST6";
+
+        fan-rst-hog {
+            gpio-hog;
+            gpios = <7 GPIO_ACTIVE_HIGH>;
+            output-high;
+            line-name = "FAN_RST";
+        };
+
+        i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          sda-gpios = <&cp2112 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+          scl-gpios = <&cp2112 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+          temp@48 {
+            compatible = "national,lm75";
+            reg = <0x48>;
+          };
+        };
+
+      };
+    };

-- 
2.25.1


