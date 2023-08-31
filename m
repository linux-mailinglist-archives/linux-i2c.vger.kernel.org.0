Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECC278EA00
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 12:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344037AbjHaKPV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 06:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241286AbjHaKPV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 06:15:21 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F12CF9
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 03:15:17 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9a5dff9d2d9so68145266b.3
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 03:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693476916; x=1694081716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/QBPbcdBIUaDmEdJvoBEfz2mE+9ATt7Z3dvvW3W+XM=;
        b=D/83I3LUXCsZrb2APzMxQs1EUOarA9A37v0QZ5Th/A1QfUv9Ba6mNjMUFzck6TCSOs
         tsoT2fMlnImN/d24DKJ4cE6K+77LdwNYaBWWhJbQtKbkXt+XkRsN9gkVsG1e3Mpn/qVV
         HatyYwZu8nvsvu19FcnUbAGyMbVGm8MIcvVqFZEGiWa4dLt7IS0vdgBdRX24jJ6rgZkF
         74laAtR4otK517WelO50NF8RSBBgFxqfC6MHhQK0bt97MF/Xe73cZJH1S3ofyXGskv1Z
         8Iy2JkwxJYUt+etXjWbiI5qH+VH+8zeCMXUBDqU3VU4t5hIbwgvgQjAMFvwbMwX0czHZ
         qfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693476916; x=1694081716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/QBPbcdBIUaDmEdJvoBEfz2mE+9ATt7Z3dvvW3W+XM=;
        b=QlCxyRiF3NhOw/qy3TUVVg+Sq/eqp0GRPtVHBps/Sjs6gNlK5v9csBbmZYUtn2BBu+
         wUb8qgqaLpz0wyvy1BZQ1Ss8pwa/TW3+OqvFTJBTK2skq6EYHVthnL2Ieu9R7N4hQyZ1
         I9OZNvlrDJiAFdUWcwbSXDWC0ExJJA09BGb5jI+Oeaeq5EGvs1hAiZJJwmRGwDAta1jX
         o19Vqvv+cJf06q63ISvUR4i2/xmuZrMoP5/rCAGprmhT9wk39SmOU6dsrBrOwb/KuXXA
         CsDVN1cu914e57LJd8YsogSqx3PkbZzgMot7YG+zvkNSxQV1396n7JLdIRr/xa3x4+ZW
         olrQ==
X-Gm-Message-State: AOJu0YzDiftOPc8WV0r6DmWCpqs2MhJ7Br1SfkLD4WoF8ENRlKihW8WI
        ApKdVSI42wUTK1PIkwS7RE0JKw==
X-Google-Smtp-Source: AGHT+IFieRs3jKu+tDRFvH+FgeMgEnwkMxzDYii31CjCN37+X6VKTZjqXup8FZU8u0Hccxr1RrpNHQ==
X-Received: by 2002:a17:907:77d3:b0:99e:1581:6437 with SMTP id kz19-20020a17090777d300b0099e15816437mr3483828ejc.46.1693476916352;
        Thu, 31 Aug 2023 03:15:16 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h5-20020a1709062dc500b009a2235ed496sm604388eji.141.2023.08.31.03.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 03:15:15 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: i2c: Add custom properties for MAX7357/MAX7358
Date:   Thu, 31 Aug 2023 12:15:11 +0200
Message-ID: <20230831101513.2042773-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Both chips have a configuration register to enable additional
features. These features aren't enabled by default & its up to
board designer to enable the same.

Add booleans for:
 - maxim,isolate-stuck-channel
 - maxim,send-flush-out-sequence
 - maxim,preconnection-wiggle-test-enable

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
Changes in V2:
- Update properties.
---
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 2d7bb998b0e9..fa73eadfdf7b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -71,6 +71,23 @@ properties:
     description: A voltage regulator supplying power to the chip. On PCA9846
       the regulator supplies power to VDD2 (core logic) and optionally to VDD1.
 
+  maxim,isolate-stuck-channel:
+    type: boolean
+    description: Allows to use non faulty channels while a stuck channel is
+      isolated from the upstream bus. If not set all channels are isolated from
+      the upstream bus until the fault is cleared.
+
+  maxim,send-flush-out-sequence:
+    type: boolean
+    description: Send a flush-out sequence to stuck auxiliary buses
+      automatically after a stuck channel is being detected.
+
+  maxim,preconnection-wiggle-test-enable:
+    type: boolean
+    description: Send a STOP condition to the auxiliary buses when the switch
+      register activates a channel to detect a stuck high fault. On fault the
+      channel is isolated from the upstream bus.
+
 required:
   - compatible
   - reg
@@ -95,6 +112,20 @@ allOf:
         "#interrupt-cells": false
         interrupt-controller: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - maxim,max7357
+                - maxim,max7358
+    then:
+      properties:
+        maxim,isolate-stuck-channel: false
+        maxim,send-flush-out-sequence: false
+        maxim,preconnection-wiggle-test-enable: false
+
 unevaluatedProperties: false
 
 examples:

base-commit: f9ea75e087b81081f33e34c4e1ba8b4abe841d9f
-- 
2.41.0

