Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81FE47B9E77
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Oct 2023 16:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbjJEOGf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 10:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbjJEOEe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 10:04:34 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8078D2812C
        for <linux-i2c@vger.kernel.org>; Thu,  5 Oct 2023 06:45:46 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-307d20548adso985404f8f.0
        for <linux-i2c@vger.kernel.org>; Thu, 05 Oct 2023 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1696513545; x=1697118345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uj31+jd3gJyWsP/fXObaBtCToRppFqlJAWU3kN9VEy4=;
        b=HIg40lnUX5e90HGrA4vwjqPCKtO4IC/mgmrds6ldtAHEly9MNugKxNzhiN4rQqJz13
         BS7eAqfNdiGeydyyQxAtgT9fci2gCfEWDTjxBFcF5cSiRNZbCsyiWss4fWeya6I0fZ6J
         lITc8xqPOsRCjOKzH64ByCCu81rdvOpvWQ+6RovhE8/ZxTDEcJVoTxkYJSc2wQzz+JRa
         3eRB8VcZLzwrXx2HAKcltWeStfYDY/crUVxYytWQW0onuIz2OJp1gjMbufnySEfQVYww
         s5Hvh2g6IelUonIY7uwxi9LaaJ6r6cvGEXUJpbpLBaBCtCqGPUpKQda8luOqJgqXXrqU
         hpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696513545; x=1697118345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uj31+jd3gJyWsP/fXObaBtCToRppFqlJAWU3kN9VEy4=;
        b=RKh5CI6VsvkkqRny68wM6HAFmZyIGhrXIw09W49q1iBGad8ckkcSlN19+PtfwgjxFx
         XrLLu82J58Pj9xUl7VnZ4M1JGjvV0qmX2jj5N0o8Q+FO5pg3xOAZ+skl1wozBz/ChHMS
         wAVCmyPecYDF3gnBz62zCFuu7bYW0YAKa75QaeDXYKMYOrXwedFab/K76LmBLoJWTpzl
         Yqz8tmQulCnpnjA1bS3SsRIwTOqH9T9mDiY475g/2JGrjbVKjQH58bv9k1WvO7IO6/5f
         Em/fl9HZ/AwVn+RargYA/N1oABU5abIz+e8bGQtVAP70yZcuwR/haqDzYeI0BZKT23Fz
         P+aQ==
X-Gm-Message-State: AOJu0YyTRKmfNXdu86MAROoLpcKCD8JYOAEjp8KxD4GqHCrkHvdRouLP
        0SAT1SJ5+xQeNkF48PXHmXszRA==
X-Google-Smtp-Source: AGHT+IGIa4hFNy4A2lBJFQR6ZScq4AlE/Kv0eDGiWp0ZqH/0d7ic1apKJTRq01geLIFmqizzM3U4Kg==
X-Received: by 2002:a5d:4049:0:b0:319:74d5:a2d7 with SMTP id w9-20020a5d4049000000b0031974d5a2d7mr4227088wrp.32.1696513544908;
        Thu, 05 Oct 2023 06:45:44 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id d7-20020adfef87000000b0032326908972sm1840961wro.17.2023.10.05.06.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 06:45:44 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
To:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <naresh.solanki@9elements.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: i2c: pca954x: Add custom properties for MAX7357
Date:   Thu,  5 Oct 2023 15:45:39 +0200
Message-ID: <20231005134541.947727-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Maxim Max7357 has a configuration register to enable additional
features. These features aren't enabled by default & its up to
board designer to enable the same as it may have unexpected side effects.

These should be validated for proper functioning & detection of devices
in secondary bus as sometimes it can cause secondary bus being disabled.

Add booleans for:
 - maxim,isolate-stuck-channel
 - maxim,send-flush-out-sequence
 - maxim,preconnection-wiggle-test-enable

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
Changes in V4:
- Drop max7358.
Changes in V3:
- Update commit message
Changes in V2:
- Update properties.
---
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 2d7bb998b0e9..9aa0585200c9 100644
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
@@ -95,6 +112,19 @@ allOf:
         "#interrupt-cells": false
         interrupt-controller: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - maxim,max7357
+    then:
+      properties:
+        maxim,isolate-stuck-channel: false
+        maxim,send-flush-out-sequence: false
+        maxim,preconnection-wiggle-test-enable: false
+
 unevaluatedProperties: false
 
 examples:

base-commit: b5d463c0eecb4a690e631fa38cb6771a906f7620
-- 
2.41.0

