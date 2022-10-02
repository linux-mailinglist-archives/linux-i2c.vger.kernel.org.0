Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7715F231C
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 14:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiJBM33 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Oct 2022 08:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbiJBM32 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Oct 2022 08:29:28 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813FC27B29;
        Sun,  2 Oct 2022 05:29:27 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bu25so13110038lfb.3;
        Sun, 02 Oct 2022 05:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ujkzJRv7Wk01/aWYBYxoLuM349Mz8v46gWePyURuQP0=;
        b=aaqDAu1t5K24nmsP+7lEzdD+7B/aONF7y+tLlzy5eQxBw9wLdzBYhWcFwpIRfc0T6m
         JQwlNYOcfrMbYVjo8rfohSqgpD49rMDewL1Cufd35Bdw/FmjueaShI5yaRXOWWF4ekrW
         MFaFxA20eobF4G5Raj6pCGqlv4Z9SwskB92k4gvIEtSm6RpN7f2Iwg7kwOkMeAxAXsVU
         G0D0gYWnEC18Dqa1nRe1NhJ98a3Bw4Hx5xYrEs9FlnIbnh8p8pYZ27PCqPg6Uz4VytwE
         eq0ZzLw8uri8euIpuVDTJpO/49NH63vTgI9ZkP7B0h6xK7/QCkSJZ1T3I80svQW/S+yO
         WT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ujkzJRv7Wk01/aWYBYxoLuM349Mz8v46gWePyURuQP0=;
        b=z/Cd5dc3B6pfAxmoGL5v6ZIFr1HcLpMj8bTYDwuv6CbuNl04wRsrvy0XDwD9Y7hCSW
         WPuCvJTdvTeVlJHkCJcwUAzUiTdAIZQZhpK2yvROO1l7ppiSqN0wH+eAWcaXNJjBYcwU
         THrSxN6vPOlc1E0CQXQvYGHLwv/VfeWDW10I+KNuGLfrQBm4aJVI9EDB4yNwx0eMkD4q
         f5PEL0MLGzFppVyToO7pAr47r+7BtsiX662cubwyoD96/ANBjuwyv4+VdqD9xRCBa3sU
         QoouF8lBlmgFaHGZbTzpxwt5ehwh+DRTS7yGcWhV+M9Aqp3GboFcrPFQuBDT2cqr9VyQ
         SoVw==
X-Gm-Message-State: ACrzQf0XbMKCA1N0a9mXqpdT0pHuovdTSISd/V0zxjwyBlzsI8T9kXdM
        zcHIPwMXODmguT+XKOMDM/hCHHc/XbMtlw==
X-Google-Smtp-Source: AMsMyM6AkaOxIGYesLFVJnJ/tO+7KkvYgZloAhyxL6QBlcTurinWyUBLeDHT2XBqfKDX66b3s0swaw==
X-Received: by 2002:a19:ee0a:0:b0:497:a2e3:a9dc with SMTP id g10-20020a19ee0a000000b00497a2e3a9dcmr5628973lfb.96.1664713766978;
        Sun, 02 Oct 2022 05:29:26 -0700 (PDT)
Received: from i-vetokaappi.home.lan (dsl-hkibng42-5673c7-93.dhcp.inet.fi. [86.115.199.93])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm1064948lfe.181.2022.10.02.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Oct 2022 05:29:26 -0700 (PDT)
From:   =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/6] dt-bindings: i2c: qcom,i2c-cci: Document MSM8226 compatible
Date:   Sun,  2 Oct 2022 15:28:54 +0300
Message-Id: <20221002122859.75525-3-matti.lehtimaki@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002122859.75525-1-matti.lehtimaki@gmail.com>
References: <20221002122859.75525-1-matti.lehtimaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

MSM8226's Camera Control Interface has one master and 3 clocks.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index e51a85848d6e..c0f9537a4bb1 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -13,6 +13,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - qcom,msm8226-cci
       - qcom,msm8916-cci
       - qcom,msm8974-cci
       - qcom,msm8996-cci
@@ -27,11 +28,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 4
+    minItems: 3
     maxItems: 6
 
   clock-names:
-    minItems: 4
+    minItems: 3
     maxItems: 6
 
   interrupts:
@@ -78,11 +79,28 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,msm8226-cci
               - qcom,msm8916-cci
     then:
       properties:
         i2c-bus@1: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8226-cci
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: camss_top_ahb
+            - const: cci_ahb
+            - const: cci
+
   - if:
       properties:
         compatible:
-- 
2.34.1

