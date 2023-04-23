Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3D36EC065
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Apr 2023 16:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjDWOab (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Apr 2023 10:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjDWOa3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Apr 2023 10:30:29 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BFEE3;
        Sun, 23 Apr 2023 07:30:28 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f182d745deso34729575e9.0;
        Sun, 23 Apr 2023 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682260227; x=1684852227;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hmz02kgYSIPTVGE2YzP1t9u5jmmiCjYgtKyhAhJJpAU=;
        b=KQ/354GpPjBr/GF7Ev1Y2jkdF14nbEgnAMPYLzm9bKofG5mQa5wPu0OqnZpy2RISao
         jddj2N/u1Pgifdz/7vD+2GGfWX2vyZb4b/dU5bqFzOEJ14qsT/nj4GUBPYVoLMEaHh5P
         KGYEjpRYP641hmbk94/umFPA9aWC4DLHs1yUCjSTzNtDYGuYVBqQnOfyAGuhH9Ym+XBM
         4uPy7yRRL3Xplm1kP3esQU5ean/nImylay62lRzRHMT1PYrqwDCRX3QMfMXmegkAY08f
         cBnjbrcA4mGqFa0fLDNpa7+wvU/wkBRYAoUucZK65utrhWF76aJXqn2K8qGpctVApO0Q
         B3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682260227; x=1684852227;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hmz02kgYSIPTVGE2YzP1t9u5jmmiCjYgtKyhAhJJpAU=;
        b=IP0w2NXNEHVwzASK3Pm73iSQ6RS9UXLDUT7kldn31uDsls0+G/uDytnaAwWANu0RRu
         yB5XzWyL132ZGhNMEfglwsu5KW5EaggYT8ZvihYS31kwBwdG48yLD4iuppKtVZ9A0Y38
         j0+OrDNVcJrmKVNaqu2PeJ1xh3kdXkfHgzEPMH6pIRKu+dZmOolaWYgTbXNZSSOTR2RS
         CHa9/bKnn9pVV2ocf/KPAJA0Vvn1qZR79VoseOELLlu6wSYUSUncdqaRJC7lIFwn4PQJ
         5PcaSPbIVhiPYdgfM2vRx/wMEDRvJA7YOxTF7QccIeWg+M3x5NnDrkH3NKP6h1cSjNhd
         g4RQ==
X-Gm-Message-State: AAQBX9fJtqlD0ATmbTaqgrUXOVAPiQHRqPpCmMElDQ5HpEG8t3MEGk3K
        NMQFd4nlwmpUipm2nCFDpNAbDYqkc924Lw==
X-Google-Smtp-Source: AKy350YFG1XWLlzDerdjqq1cTqz6QsInPmJyhb5q+UOAbjM1BuxXV+707QxfrCa3w8mGQbVrwAluNA==
X-Received: by 2002:a7b:c5c7:0:b0:3f1:75d0:6151 with SMTP id n7-20020a7bc5c7000000b003f175d06151mr5878554wmk.1.1682260226832;
        Sun, 23 Apr 2023 07:30:26 -0700 (PDT)
Received: from standask-GA-A55M-S2HP ([188.123.113.247])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c000900b003f0aa490336sm13068176wmc.26.2023.04.23.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 07:30:26 -0700 (PDT)
Date:   Sun, 23 Apr 2023 16:30:24 +0200
From:   Stanislav Jakubek <stano.jakubek@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: brcm,kona-wdt: convert to YAML
Message-ID: <20230423143024.GA10503@standask-GA-A55M-S2HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert Broadcom Kona family watchdog timer bindings to DT schema.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 .../bindings/watchdog/brcm,kona-wdt.txt       | 15 --------
 .../bindings/watchdog/brcm,kona-wdt.yaml      | 37 +++++++++++++++++++
 2 files changed, 37 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt b/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt
deleted file mode 100644
index 2b86a00e351d..000000000000
--- a/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Broadcom Kona Family Watchdog Timer
------------------------------------
-
-This watchdog timer is used in the following Broadcom SoCs:
-  BCM11130, BCM11140, BCM11351, BCM28145, BCM28155
-
-Required properties:
-  - compatible = "brcm,bcm11351-wdt", "brcm,kona-wdt";
-  - reg: memory address & range
-
-Example:
-	watchdog@35002f40 {
-		compatible = "brcm,bcm11351-wdt", "brcm,kona-wdt";
-		reg = <0x35002f40 0x6c>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml
new file mode 100644
index 000000000000..5de1b022847b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/brcm,kona-wdt.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/brcm,kona-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom Kona family watchdog timer
+
+maintainers:
+  - Florian Fainelli <f.fainelli@gmail.com>
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,bcm11351-wdt
+      - const: brcm,kona-wdt
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog@35002f40 {
+        compatible = "brcm,bcm11351-wdt", "brcm,kona-wdt";
+        reg = <0x35002f40 0x6c>;
+    };
+...
-- 
2.25.1

