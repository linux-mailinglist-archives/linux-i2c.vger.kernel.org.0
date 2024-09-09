Return-Path: <linux-i2c+bounces-6415-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC89971E36
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2976C2838B6
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 15:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8054B44C64;
	Mon,  9 Sep 2024 15:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mAkKvtI3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3692F481B4
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 15:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725896362; cv=none; b=bXszqKJQ9lJRTnZw15z/vClFSXnzS21zvjeZnHUl6MdXDXdZdmpl8RBDrw2MT+qEwJvNhyGxBswIs2fN0jtkMcbLkCx69sIkVTwDlWP+9I4B1Jl6yXDcxreZ8y8ykoWzlQKE8xYrT5kQLJr3Zae9yxbGF6BooE9Bi8k14QmmgJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725896362; c=relaxed/simple;
	bh=MbQam2qxm3Rqs7R5Unkd0xpWMZCqWsf25GFP4NDn8YY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2VbI7AEM2WsTazZjXPJ9ywglEzuWbyLntJcSZCw6rSxagl3iyE7zZikrMLgb0eU73MRn29czGX+UbvsCGG0a7VJbOmYzKI2SVaN1p1BeL3qYcawBpu/L7cKinE7JEVT19XWHs+u5dvj80HdrUlF/hW5/WJjEQgSd5d3KdLwmUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mAkKvtI3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso22053645e9.2
        for <linux-i2c@vger.kernel.org>; Mon, 09 Sep 2024 08:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725896358; x=1726501158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1CCslGvH+cEKiqCreHe62tX9+GxMbBnRRD70n4wPSQ=;
        b=mAkKvtI3KTAlgMeDtq+wGbNZ6id1FuY0/ZbL/5kGxQAtjMJk3jH8IkRPZQKFMfpnCT
         Q1HjgvY5iilVHGq40nK9M6YxLODbm3bOilaWEHIar5xmI5t8zVoegHnLEC8sJL0/fpQ2
         oth/Bq5Ria5rUN613/FrarDVaS4asm+ACA0stMFJEadAXr2u6/SWbbDAlkeyaO62+6O0
         R8cd+gLD7R2Q+WM80HzM/19GUC9+mc+WQNfW3a6Lfw8ek6BMsokdB3uYsmw8HlJoJkkZ
         xIQS00rz7iThfNNYT/7CZCT+ajoFyGxk9XwhNLw4Yr+JL9TiR+5Qhl9tw5ef0LYGGZ6H
         N9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725896358; x=1726501158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1CCslGvH+cEKiqCreHe62tX9+GxMbBnRRD70n4wPSQ=;
        b=OClPJ2zE7k83+mJerCsJ4AdNbng7ECRjpj3VXL7CwI+7qxGy2DKGiqepNMkdsZqhIc
         FjjdRXkv/C7YNFZh7/s9+bSgWgFtmw/7xCw0ruEZe9A6i6aAkkv0708FcdQzhOxChOyf
         wdek/hQiTB+MZTb+9ziBcfZpHbEiKSDgmaSv4+RlFJH5NOM/fsBxG0LBTKf1xbY59tov
         Z+y7z0y0b5Efjz9v7aknnAaqCB8GvtaSd4yD3ybgsdPLFzYHD1k4Zgm511ywUjeRRbXX
         98UqSbTcZdYOa2N9LxiPF/DZJfJU/2qHD417rAZXzKrpnHW66qjecFyT5H85TR2vG00u
         dwfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxv4SwRLQCqW5u0ocjTd4I+Nvp/L5pDJ+REdhvIyJjUopknXrsCav4TE5Woj3DgB5LJp1mqqpgPM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZqA1CYDFAEcFVIspYrwH3HI+mkaoTA+nWE+7JiXihxQGsAiFL
	yby6g9SmE12FFxtF9ORQEX6g4a1yqZxn85iONkukq8nAljBveTJ6QIK9qYCcivU4QOOFTlkUdBK
	W
X-Google-Smtp-Source: AGHT+IFMwpVD9rZcOmHzGbymeIWKFLLsAnXiyFTa8tkM95t4s2kgxxLmeLfwoD9X32FksjzSqR2wNg==
X-Received: by 2002:a5d:5547:0:b0:374:c31e:971a with SMTP id ffacd0b85a97d-378922b81f4mr4759396f8f.0.1725896358378;
        Mon, 09 Sep 2024 08:39:18 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:788a:4542:ae86:67f4])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3789564af1asm6305145f8f.18.2024.09.09.08.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 08:39:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 09 Sep 2024 17:39:03 +0200
Subject: [PATCH 1/3] dt-bindings: hwmon: pmbus: add ti tps25990
 documentation
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-tps25990-v1-1-39b37e43e795@baylibre.com>
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
In-Reply-To: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-i2c@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2319; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=MbQam2qxm3Rqs7R5Unkd0xpWMZCqWsf25GFP4NDn8YY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm3xahmW3hnq9FSBBkKIx7xDnCI6AofwQtzIjcD
 7ySiMZRekyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZt8WoQAKCRDm/A8cN/La
 hSOpD/4xMK9dZ851o6Q01h8xpWmPdIxDZFzaL3tNEuyOKJbskvL8PjZHD2y2J+MrtkkEoFxvnlw
 nZDbfzjlpEI+QAhNrOpA+xzogiKryYIytJWOVEdl4LkTvzHpqyoudMHlW10aWXGmB2v6MLPxQyE
 4FEdbhXWPY1GOLB//Z8rr7Akx0sYonvu82QVHo90wS1UFD4eNtDGRrfwXVzwWbbGmXO/bphmj4e
 QVkI7o3Ef3XqT3A/Xu4jcdCEfGO5MNjxKEdk5iSz7hDIDxxWj/DTBKAkmO9MEeRgOVIRUIGkJY1
 USo0HShLwu1HvYtW0AjlC3MYLAXhmMhJE0+q2EWP9rKePCQjIZLd9l0pyLHxxn1oO++c1jmLm44
 AaARV5lMHMFGFmeTOKQAdbfBGrkaZ2zHXPHkxUQ+GSzmbHhZSbFbu6qGOv96r3QjNGBcttpBanX
 ijw63q33Rbp/qXyRmz2fxFcqAV1uuVjqS5YLPUCzxayo7DOo6xsk/XXjP3/o5B45V4ymvMqwOBB
 55C+pP1PQE0aOFUOSrIbgNI4mlfRQfsuy2Q4OcrBNxgc/HinI+gLGsLBK9+Q8qJMjtFkxWw3r9B
 4XwyO4n5JwSNopVyGwiqjBej+nNX9FxwqiFX4Qr7gbbybG/eqHrHgBQaKRvYxursY+aiQxTHDpb
 DzCaJ0eRkfB4Oug==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add DT binding documentation for the Texas Instruments TPS25990 eFuse

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/hwmon/pmbus/ti,tps25990.yaml          | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
new file mode 100644
index 000000000000..e717942b3598
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -0,0 +1,73 @@
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
+description: |
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
+  ti,rimon-milli-ohms:
+    description:
+      milli Ohms value of the resistance installed between the Imon pin
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
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - ti,rimon-milli-ohms
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
+            ti,rimon-milli-ohms = <1370000>;
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


