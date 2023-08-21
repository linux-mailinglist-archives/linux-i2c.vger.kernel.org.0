Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3A1782396
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 08:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbjHUGVK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Aug 2023 02:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbjHUGVJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Aug 2023 02:21:09 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D2CBE
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 23:21:04 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4ff8cf11b90so4458130e87.1
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 23:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692598863; x=1693203663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIjrnEwaKeqGTU5grAtJfqf2YP8aALmcmlloCUUh95k=;
        b=glceY5R7NLTH1At17OhMFATBfpYlKbRgzThJz1rQhvSb+8bW+pKrL5bXzdlzW8toOO
         QD80zDtwRI9PPMaxtPWwVFyN8yDcd9bGdtsB9uPVA8iWoEfaxKOSDLb9+6pIb5L17Eto
         55UVFcX/sY837HwMdRuFr6xsqxB5mjkJCX+kqU+vJukdToA+58+Oe94eS6BpXkGokE4A
         YxBiKVpkEeu81V0M+nJ8DGu63VPUEvmYu9sjrCjVOW/lEcbA11y4W7IqQQo88CHShlVN
         YnOnN1sAfpqG83WTcXx6YCMddSryG/yKBhCDnTL7xZ2sR6hN0rGPXuMSrYPgV4IwJjXj
         V49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692598863; x=1693203663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIjrnEwaKeqGTU5grAtJfqf2YP8aALmcmlloCUUh95k=;
        b=gx5X7jr4QP/ehI0H155S6orPGch7gGDH0bNJC8NNTwvW7Mz+4CjFtg8ydK/U3pfUDh
         7N+fIBeDLQ4+qCSRfd15QGAKUwq0S/nQk+P5ZJRNbCdvf4jdOD8FZS0m2aWm7iXESlbi
         g3ciI2oVe767HhiPo6MIo4irr7fx2uFCrGnk6p5VacrdOdWSeZir/KuegZrYQSMWDxN8
         Akyjn2aLh7Yvvzj81ZgqJhc74QNzjwa1ADJGyrzke9gOtjaVlDezCrWu5X/5oEplNccx
         vBEbUuskNyTitXdF32wMzEf45doQrrpMae+RqEiSq9crAi5SoaBNkWOKFk7dXg/WLvLR
         S4wQ==
X-Gm-Message-State: AOJu0Ywjm3alpSQ9rbl1iqBPT4BMKZYlPSpzof+T6+AAJkOcet4V7GA3
        vSfs5yi+02AGn4eDmOsWfhXhLg==
X-Google-Smtp-Source: AGHT+IFIQbWRDBMaVNqei5iytuBBv71VukpPeFNpEVR6BikwZiVmxNwYheSJXndTuCqbtUQv0/bSrg==
X-Received: by 2002:ac2:4c82:0:b0:4ff:87f6:6ee5 with SMTP id d2-20020ac24c82000000b004ff87f66ee5mr3107820lfl.10.1692598863092;
        Sun, 20 Aug 2023 23:21:03 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id c4-20020aa7df04000000b00523b1335618sm5455003edy.97.2023.08.20.23.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 23:21:02 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     naresh.solanki@9elements.com,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [v16 1/4] dt-bindings: i2c: pca954x: Correct interrupt support
Date:   Mon, 21 Aug 2023 08:20:21 +0200
Message-ID: <20230821062027.2631725-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821062027.2631725-1-patrick.rudolph@9elements.com>
References: <20230821062027.2631725-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Only some of the PCA954x compatible ICs have interrupt
capability, but the binding advertises it on all ICs.

Sync the dt-binding with the driver and only advertise it on:
 - nxp,pca9542
 - nxp,pca9543
 - nxp,pca9544
 - nxp,pca9545

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 23 +++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 9f1726d0356b..e5c1070903ef 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -12,9 +12,6 @@ maintainers:
 description:
   The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
 
-allOf:
-  - $ref: /schemas/i2c/i2c-mux.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -63,6 +60,24 @@ required:
   - compatible
   - reg
 
+allOf:
+  - $ref: /schemas/i2c/i2c-mux.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - nxp,pca9542
+                - nxp,pca9543
+                - nxp,pca9544
+                - nxp,pca9545
+    then:
+      properties:
+        interrupts: false
+        "#interrupt-cells": false
+        interrupt-controller: false
+
 unevaluatedProperties: false
 
 examples:
@@ -74,7 +89,7 @@ examples:
         #size-cells = <0>;
 
         i2c-mux@74 {
-            compatible = "nxp,pca9548";
+            compatible = "nxp,pca9545";
             #address-cells = <1>;
             #size-cells = <0>;
             reg = <0x74>;
-- 
2.41.0

