Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD1678DB21
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Aug 2023 20:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjH3Sig (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Aug 2023 14:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243856AbjH3L61 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Aug 2023 07:58:27 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53321B0
        for <linux-i2c@vger.kernel.org>; Wed, 30 Aug 2023 04:58:24 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so7099762a12.2
        for <linux-i2c@vger.kernel.org>; Wed, 30 Aug 2023 04:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1693396703; x=1694001503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xraLT5LJsBHpcTpLojfKH2C0VbKrtJqn2idXpO3Q7k4=;
        b=fKbvTNAcYIqvUBvyQCGYCQZn7YLtQKydWCHBlKKCw+z0TYo8PbPLOk2L5DsvqTrOuu
         hw/2Z4J58tcFB0Klb0u1IrtkMEQ6gt//damfvOWX2AZf/XFVlpkYFEPBpNavkexNxeD+
         Aw9n3WSp5bI2zLjnpLjmXzXg6/taXmrE/6gpLtMVmoXKOVLZfSO7f6q1tmVbt88JOzkB
         gB+I+Ff6ImldVV3XzKX+NIQktDDzJEU5LhrdrZmcPDWKs538vDUeurVwCiVWTVE5JiyZ
         dq6tVYfNfXpHINrflzM1b+l9SPwOuwUEJ7E1B5THa5aNGPf4dYn/Y63NNv0sfamAB8S+
         +32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693396703; x=1694001503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xraLT5LJsBHpcTpLojfKH2C0VbKrtJqn2idXpO3Q7k4=;
        b=EUJ1k/FGywmzGAypmms/Lwe5ainFIZFDBRy/RLE7ayg2rEhG9FPyxY1vB6B/0V9vE/
         3m6iBFb422AZJBJjWdjtd0u9F8WRWDlERy+ef5mrCgzKg5AJZ/YnS77vHPbBqGTD1XcG
         I9pzeEwjKSBtUJiTKwLl1G97onUkYgO0daLSdViqGnU0cYq4SdaPN5aTsy+rVg+l5rki
         SvQ5f1J3NWDy+erej8FaOuyFXtr2Q27FrW8l8jClwRH6mce+NbNF8xH3CCnngJ9WsEwA
         2+V3LvgPvZKrFlAajlAA2Bd/0l+QErwLVUileKqaqeIJtN1WgN1vaN4kTt4kLizmt3kR
         k10A==
X-Gm-Message-State: AOJu0Yz8z2oSZyoUrXCKkXuHKZQ0858S1mijoY8MmEnvdqBUMIFydhj4
        CwJdxpmByEwh86II8cfZdGXZ6A==
X-Google-Smtp-Source: AGHT+IHvDPZ/6vvBEBfGlIX7oJAvbPEoFEmwc2hCyzNLDGBhuPPNYL7+Ecr9I/J2Mc1Sq/3iq7xFGw==
X-Received: by 2002:a05:6402:1206:b0:525:7da7:af10 with SMTP id c6-20020a056402120600b005257da7af10mr1907238edw.23.1693396703233;
        Wed, 30 Aug 2023 04:58:23 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id u8-20020aa7d888000000b00527e7087d5dsm6681571edq.15.2023.08.30.04.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 04:58:22 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-binding: Add custom property for MAX7357
Date:   Wed, 30 Aug 2023 13:57:42 +0200
Message-ID: <20230830115744.4102929-1-Naresh.Solanki@9elements.com>
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

Add a custom property "maxim,bus-lockup-fix" to enable proprietary
features on MAX7357. The driver configures MAX7357 to isolate the
failing channel and trigger a flush-out sequence for bus lock-up
resolution.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 .../devicetree/bindings/i2c/i2c-mux-pca954x.yaml  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 2d7bb998b0e9..984d4614a270 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -71,6 +71,11 @@ properties:
     description: A voltage regulator supplying power to the chip. On PCA9846
       the regulator supplies power to VDD2 (core logic) and optionally to VDD1.
 
+  maxim,bus-lockup-fix:
+    type: boolean
+    description: Isolates only the stuck channel and generates a flush-out sequence
+      to attempt to clear the bus lock-up.
+
 required:
   - compatible
   - reg
@@ -95,6 +100,16 @@ allOf:
         "#interrupt-cells": false
         interrupt-controller: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: maxim,max7357
+    then:
+      properties:
+        maxim,bus-lockup-fix: false
+
 unevaluatedProperties: false
 
 examples:

base-commit: f9ea75e087b81081f33e34c4e1ba8b4abe841d9f
-- 
2.41.0

