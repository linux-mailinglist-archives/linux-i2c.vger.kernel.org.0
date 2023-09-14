Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7731A7A02BF
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 13:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235350AbjINLeb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Sep 2023 07:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237799AbjINLe3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Sep 2023 07:34:29 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A341FDD
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 04:34:22 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9ad8bf9bfabso114459566b.3
        for <linux-i2c@vger.kernel.org>; Thu, 14 Sep 2023 04:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1694691261; x=1695296061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXa4ycYFzT7jLeokUgoWTtJjQh8+NIDSPVuIE36lEvI=;
        b=TcUy05WeARz+LFWGVi8yH1dw7F0mWoa4WJBNDiQ5PnB/9xefhisF5srV995mBw12CC
         OWOcRYqndaPWkQQd8YTwAxSdEGEl90fHxUJ3nx3eY+xTicjdp+cRCoD94csY33O8/bx4
         4sU4zj4bcQAg+AfJrwX+oAvQ06DrqktiIPEGfFhjFMj/3eRNB2ccocmi87kLme1OUTB0
         G3oedJVA+/rfBC7OR45jt1ehBWiPxWzrNtD9HFeH1nAY+wYIviDmRb6qa3XIp6ZE/ZJ/
         BtTIYEq9nzudNLzao1pkzaa3WgFCM9pblakoeZ0rOl4dBy2dPiP0i5cfUxm2MbSMQAQk
         OL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694691261; x=1695296061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXa4ycYFzT7jLeokUgoWTtJjQh8+NIDSPVuIE36lEvI=;
        b=Hcog6dlwQPIN2Qwu8IR44sNudukWegIqKOVrS84IiA7D+3LxY7CjbjkE4fLsMEHjUN
         bozjeomlXlhblpOjHhv9CL0idkpggNtx2eVjZtb7C5/Gbpmt4PrlhKhS7YlZJ7WGV552
         0QDUB8qU1pjtD95uy3HkxJH1pwRMsqXvnsWwFdoOt21w6P5ePJjBif2Mc9nwOOOr2FIr
         oTz26/FngDDGV0S0INRy6u2UztWNYtFkmL+1N1USVFJFZUWgpik3dtOuBESaxYrwfOhY
         yOGBM6OFGX6BIEFmKuI00QbhwOnrLdBh9M9AXOiTBJW+20dd2qG1YQz4/OXPvRvx7sJG
         ZWjg==
X-Gm-Message-State: AOJu0Yzf/TX2I9y1enyFqJvcabGdsT4/+mM3OSLQgWcSNda14yP4cdk8
        kwGyMe5LefEk+0G2Q7z0EpKO/Q==
X-Google-Smtp-Source: AGHT+IGhxfGLWS9n5UK96bk1q/w1vuoTujKcbBAcFbFYwjmqvmyvlCpC/ds32SMX6ht2v9Hva9iFDQ==
X-Received: by 2002:a17:907:2724:b0:9ad:7ec3:c055 with SMTP id d4-20020a170907272400b009ad7ec3c055mr4343650ejl.10.1694691260689;
        Thu, 14 Sep 2023 04:34:20 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id h11-20020a170906854b00b0099ccee57ac2sm875119ejy.194.2023.09.14.04.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 04:34:20 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: i2c: pca954x: Add custom properties for MAX7357/MAX7358
Date:   Thu, 14 Sep 2023 13:34:14 +0200
Message-ID: <20230914113416.1285518-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Both chips have a configuration register to enable additional
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
Changes in V3:
- Update commit message
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

base-commit: 637f33a4fe864ac8636e22766d67210e801fcd0d
-- 
2.41.0

