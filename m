Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07463391F8E
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 20:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235596AbhEZSuT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 14:50:19 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:35418 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbhEZSuT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 14:50:19 -0400
Received: by mail-oi1-f171.google.com with SMTP id v22so2520062oic.2;
        Wed, 26 May 2021 11:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qi0dKOR1s2HsAPh6SB1Duf62T3ayP3+tZRUL8AcRwnM=;
        b=P08K41n6/3TKE84O7wv0RPDclHK38YfG/3ji8l1l/1Xs/XA4osPVLunt5G4BVhAUF0
         J7KcbJAh3NAd9goUWIBTmoSqsJibPlKnnlBLNKazWVgLW2v2H06PyWnxkoOzIbrfssG1
         Po6ton9/DEm3SfDg+gIkJIQJ59b8kIueWAqbYJ4jWTgM2LEX6Qwf73yc+X50Q+bz+705
         s87b9EggwQ1e0BOqUTwjaMzEihMyedNrfQHf4UbwE3TT6YcWhph+EkTwyCrKT9rSvwM2
         F/fQLYNg9e5dGL/Xxd7Mc0fAEjapRE+IYHcd5EikMvFhnFtJzbjZdPEabvSH923aA1Fs
         pYXw==
X-Gm-Message-State: AOAM530im0I6NzyZvT45ZimN2H7r/ZWUcuPmByl0KMaUi2jdBZNx0YT/
        TyhefMSpg9DF30k1tzcXzj1TyiXilA==
X-Google-Smtp-Source: ABdhPJxyXhTJ6JY9TcKenfqe+qj63vatOGOTNhpXEHCCLF9TLDgdxmCrqVpw0jgvRCn0Wnew0UEf+g==
X-Received: by 2002:aca:c488:: with SMTP id u130mr2937061oif.0.1622054927076;
        Wed, 26 May 2021 11:48:47 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id x65sm7224otb.59.2021.05.26.11.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 11:48:44 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2 2/6] dt-bindings: rtc: nxp,pcf8563: Convert to DT schema
Date:   Wed, 26 May 2021 13:48:35 -0500
Message-Id: <20210526184839.2937899-3-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526184839.2937899-1-robh@kernel.org>
References: <20210526184839.2937899-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the Philips PCF8563/Epson RTC8564 binding to DT schema format.

Add 'interrupts' and 'wakeup-source' as this device has an interrupt
which was not documented, but in use. Add 'start-year' as well.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Add reference to rtc.yaml and wakeup-source and start-year properties
---
 .../devicetree/bindings/rtc/nxp,pcf8563.yaml  | 56 +++++++++++++++++++
 .../devicetree/bindings/rtc/pcf8563.txt       | 29 ----------
 2 files changed, 56 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/pcf8563.txt

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
new file mode 100644
index 000000000000..a542b6c7ff44
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,pcf8563.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Philips PCF8563/Epson RTC8564 Real Time Clock
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - epson,rtc8564
+      - microcrystal,rv8564
+      - nxp,pcf8563
+      - nxp,pca8565
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  start-year: true
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@51 {
+            compatible = "nxp,pcf8563";
+            reg = <0x51>;
+            #clock-cells = <0>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/rtc/pcf8563.txt b/Documentation/devicetree/bindings/rtc/pcf8563.txt
deleted file mode 100644
index 0a900f7c8977..000000000000
--- a/Documentation/devicetree/bindings/rtc/pcf8563.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-* Philips PCF8563/Epson RTC8564 Real Time Clock
-
-Philips PCF8563/Epson RTC8564 Real Time Clock
-
-Required properties:
-- compatible: Should contain "nxp,pcf8563",
-	"epson,rtc8564" or
-	"microcrystal,rv8564" or
-	"nxp,pca8565"
-- reg: I2C address for chip.
-
-Optional property:
-- #clock-cells: Should be 0.
-- clock-output-names:
-  overwrite the default clock name "pcf8563-clkout"
-
-Example:
-
-pcf8563: pcf8563@51 {
-	compatible = "nxp,pcf8563";
-	reg = <0x51>;
-	#clock-cells = <0>;
-};
-
-device {
-...
-	clocks = <&pcf8563>;
-...
-};
-- 
2.27.0

