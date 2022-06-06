Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5FA353EE06
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 20:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbiFFSoD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 14:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbiFFSoC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 14:44:02 -0400
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EFE12DD56;
        Mon,  6 Jun 2022 11:44:02 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id a10so13131883ioe.9;
        Mon, 06 Jun 2022 11:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4mg14PQUB0NRNPUP48ZZmOWq8GxI88Pp1N6oKyXh8xY=;
        b=L0iIE3urXL/pWmh5JM4pqNGtrnOtnifI9XIo8nfVKoQgX4hGZg32205PaENRYEWZMH
         vXr34JN4s5Lp8m9bHCtyQgfScEUhvRUDHK4oHtNngnwsFNpSyddc6uDxE3PIw+yJsaAu
         Dn2NrZ7woUP+UjQ4xquCRY8WK7Ts+ysBRMyGpIXo41P0B0PGELLx8RVvGLabFWrvlYY3
         9GCIHpktADNq2hebceErGql/IHIV4tNX4Uqdb5hft2MOi+r/DrivFw80oRs+U5VMwRxq
         PsYmcVAtS3yi+NZnsx3fCjsDXXYxcGY2pmo+/s4z/AHLNqzLCjzT6ZaLdvDQOR8MWjn5
         OElg==
X-Gm-Message-State: AOAM5307q591onmKo/DojUZsbKFRlh/JOwmgPMmaB9A/owqQVfddlVwo
        Jlx+vL8QBJbiiFljvR5df+Jjo+yMIw==
X-Google-Smtp-Source: ABdhPJxMVe/Xc7siiCt1gNczRdXAABgZ6GHHgoHZNpaiksIDCW+LDDjUyBg5NHaG3n6BIjR7xTNjrA==
X-Received: by 2002:a5d:9543:0:b0:668:7deb:ee4d with SMTP id a3-20020a5d9543000000b006687debee4dmr12104417ios.181.1654541041439;
        Mon, 06 Jun 2022 11:44:01 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.251])
        by smtp.googlemail.com with ESMTPSA id j21-20020a5e9b15000000b006657621fecesm5736115iok.55.2022.06.06.11.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 11:44:01 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: Convert arm,i2c-versatile to DT schema
Date:   Mon,  6 Jun 2022 13:43:39 -0500
Message-Id: <20220606184339.1058557-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the arm,i2c-versatile binding to DT schema format.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/i2c/arm,i2c-versatile.yaml       | 29 +++++++++++++++++++
 .../devicetree/bindings/i2c/i2c-versatile.txt | 10 -------
 MAINTAINERS                                   |  2 +-
 3 files changed, 30 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/arm,i2c-versatile.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-versatile.txt

diff --git a/Documentation/devicetree/bindings/i2c/arm,i2c-versatile.yaml b/Documentation/devicetree/bindings/i2c/arm,i2c-versatile.yaml
new file mode 100644
index 000000000000..e58465d1b0c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/arm,i2c-versatile.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/arm,i2c-versatile.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C Controller on ARM Ltd development platforms
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: arm,versatile-i2c
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
+...
+
diff --git a/Documentation/devicetree/bindings/i2c/i2c-versatile.txt b/Documentation/devicetree/bindings/i2c/i2c-versatile.txt
deleted file mode 100644
index 361d31c51b6f..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-versatile.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-i2c Controller on ARM Versatile platform:
-
-Required properties:
-- compatible : Must be "arm,versatile-i2c";
-- reg
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Optional properties:
-- Child nodes conforming to i2c bus binding
diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..ecc0907e312a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1520,7 +1520,7 @@ F:	Documentation/devicetree/bindings/arm/arm,versatile.yaml
 F:	Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml
 F:	Documentation/devicetree/bindings/auxdisplay/arm,versatile-lcd.yaml
 F:	Documentation/devicetree/bindings/clock/arm,syscon-icst.yaml
-F:	Documentation/devicetree/bindings/i2c/i2c-versatile.txt
+F:	Documentation/devicetree/bindings/i2c/arn,i2c-versatile.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/arm,versatile-fpga-irq.txt
 F:	Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
 F:	arch/arm/boot/dts/arm-realview-*
-- 
2.34.1

