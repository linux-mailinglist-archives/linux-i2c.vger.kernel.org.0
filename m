Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F290F782399
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 08:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233367AbjHUGVL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Aug 2023 02:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbjHUGVK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Aug 2023 02:21:10 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E66BF
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 23:21:05 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so3759481a12.0
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 23:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692598864; x=1693203664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b90IMLBWM6zQGsk777iCjnjr53BKkJdrEo5WNQ1ldaY=;
        b=Q+SzAlC91XHDsIyrPa4QB0FT7/Qip3dp1cdy1vffxHH1YfDpqjsQyxgO3AnAeO0z1Q
         IvcbBCpS7qdq183J8cQTO5mRjlZipCJwOdYisGm8roNtD62WJNSnzq4CeJeB8lkwJrZk
         itAEJSTKbA2tByN6JBYmp36EGZVmfL2p6S8cNurlERMSPAyF94fqTroQNu0RDIF/GlrY
         kH909ZJlRL6alQCY/eYg1o7zIqOJ1CmOo8NRAFJOSH5RTZ1ZRMpD1YrmAZHQw9EUJNBu
         84tdKzSL4K9vWTmrOjYmdHQvBi3cATXy3CF4e5iEmzfv1rB2LLBeTIikaOeTpWdTj6//
         7vIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692598864; x=1693203664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b90IMLBWM6zQGsk777iCjnjr53BKkJdrEo5WNQ1ldaY=;
        b=PmW4zNfefwDHxhP3mhyImuhswGfnYrJTXGaFgNmWb+sLI+accAcWNGXPV/b+YDe+ku
         YeUg/qjhKUKnYOf1KH+qGgV8w4dHSb44IGOLRdMV/CGORObbJaiwoTPEhdznN4RtY25A
         LLjhRMYce7VZybKyIKHrf3wx/vTIPAlTISciJwau/Bz0CL3cRy3NsE4CgW6EAKvHgEs9
         KbKS0sr3Pxf/VlFUnBFWuHJMk+IOPCvAz7vh+tEoK/mU7JfiAu22DGYrWxxNpDcjOVyq
         RPl0tNCevuLp4yXWq8R0xjd1NsK0ocHDwDQgYZ4tN9t+SFOD/m0tk6MRxN7h6JshyDEM
         lldA==
X-Gm-Message-State: AOJu0YwfRXmrY4kDUgLVNl1JPPP4YcV22q/dXoZCOYI+ibG7ntcQK7w0
        BGOx8/WmOVLrBnBY0fsAZ+hWgg==
X-Google-Smtp-Source: AGHT+IGqdAx68HaV3YTA0e4cdv+GHibtHR1RLOkS6C2Hl5ScDhgRTdFtCLipQcXNuMlBTQHX2zEkxg==
X-Received: by 2002:a50:e712:0:b0:528:90d7:a19 with SMTP id a18-20020a50e712000000b0052890d70a19mr4613989edn.11.1692598864385;
        Sun, 20 Aug 2023 23:21:04 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id c4-20020aa7df04000000b00523b1335618sm5455003edy.97.2023.08.20.23.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 23:21:04 -0700 (PDT)
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
Subject: [v16 2/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Date:   Mon, 21 Aug 2023 08:20:22 +0200
Message-ID: <20230821062027.2631725-3-patrick.rudolph@9elements.com>
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

Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
chips. The functionality will be provided by the existing pca954x driver.

For chips that are powered off by default add a regulator called vdd-supply.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index e5c1070903ef..2d7bb998b0e9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -4,18 +4,29 @@
 $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: NXP PCA954x I2C bus switch
+title: NXP PCA954x I2C and compatible bus switches
 
 maintainers:
   - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 
 description:
-  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
+  The NXP PCA954x and compatible devices are I2C bus
+  multiplexer/switches that share the same functionality
+  and register layout.
+  The devices usually have 4 or 8 child buses, which are
+  attached to the parent bus by using the SMBus "Send Byte"
+  command.
 
 properties:
   compatible:
     oneOf:
       - enum:
+          - maxim,max7356
+          - maxim,max7357
+          - maxim,max7358
+          - maxim,max7367
+          - maxim,max7368
+          - maxim,max7369
           - nxp,pca9540
           - nxp,pca9542
           - nxp,pca9543
@@ -56,6 +67,10 @@ properties:
     description: if present, overrides i2c-mux-idle-disconnect
     $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
 
+  vdd-supply:
+    description: A voltage regulator supplying power to the chip. On PCA9846
+      the regulator supplies power to VDD2 (core logic) and optionally to VDD1.
+
 required:
   - compatible
   - reg
@@ -68,6 +83,8 @@ allOf:
           compatible:
             contains:
               enum:
+                - maxim,max7367
+                - maxim,max7369
                 - nxp,pca9542
                 - nxp,pca9543
                 - nxp,pca9544
@@ -94,6 +111,8 @@ examples:
             #size-cells = <0>;
             reg = <0x74>;
 
+            vdd-supply = <&p3v3>;
+
             interrupt-parent = <&ipic>;
             interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
             interrupt-controller;
-- 
2.41.0

