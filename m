Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D30D493F3D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 18:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356485AbiASRoQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 12:44:16 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:34518 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356489AbiASRoO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 12:44:14 -0500
Received: by mail-oi1-f181.google.com with SMTP id bb37so5333862oib.1;
        Wed, 19 Jan 2022 09:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KpLkQGHLvfl7uQnQ0Gz9HQ7CbtFmU1lgLR6VE5GiEys=;
        b=ixLjhxcnE9gFn0pmLwGrk/mb1TFshjeEMwEM6uqEmNsvqboaAyLkGQ/ktLi5fBCu+l
         7iRXHceQb0wFIpKH7n9swUNiWKXlaUj8CNddvkdLJs6M3+rpNIpdZ3W1Q/TMhCBxtlB5
         TvdS4o3WAlVPD7PVrol6kpAyxCyqKqX6h2c87y98qGme1E2uJU17uVzh37KGKCzCNewM
         +7Qg0V+cj/fcpjWO9/cmnuqp0ZemZ7Em2gD2UH2PpnzT5LVsu5dRzC6N59khusqRg94I
         wuyZZAA7S89kXloD7v5uTiMXNVS9pQtdTz1A6jBBTyzayxggS/TI6x/oedkQHSF5e0Gh
         b3Rg==
X-Gm-Message-State: AOAM531fybZOmmaBuT+SqG7JsST4SrEmLZ04W5N1yVAcHBXw4HzzGwMJ
        3F5NE8D2BVFX3jtlGsY7ug==
X-Google-Smtp-Source: ABdhPJyOS1pvnElPNh4TbjSAgOzKuS8FtvhaAUcUpdGJedrl9supK918JbpezOPIInPkzig9dhUT2w==
X-Received: by 2002:a05:6808:3d1:: with SMTP id o17mr4026302oie.12.1642614254287;
        Wed, 19 Jan 2022 09:44:14 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id bd41sm284361oib.32.2022.01.19.09.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 09:44:13 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: stm32-i2c: Move st,syscfg-fmp definition to top level
Date:   Wed, 19 Jan 2022 11:44:07 -0600
Message-Id: <20220119174407.3810088-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It is preferred to define all properties in the main schema and leave
if/then/else schemas to just be further constraints on properties.

Rework the schema to use be more specific for each cell. Previously,
multiple entries of 3 cells each was allowed.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 46b62e1c9273..dccbb18b6dc0 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -25,16 +25,9 @@ allOf:
 
         i2c-scl-falling-time-ns:
           default: 10
-
-        st,syscfg-fmp:
-          description: Use to set Fast Mode Plus bit within SYSCFG when
-                       Fast Mode Plus speed is selected by slave.
-                       Format is phandle to syscfg / register offset within
-                       syscfg / register bitmask for FMP bit.
-          $ref: "/schemas/types.yaml#/definitions/phandle-array"
-          items:
-            minItems: 3
-            maxItems: 3
+    else:
+      properties:
+        st,syscfg-fmp: false
 
   - if:
       properties:
@@ -87,6 +80,16 @@ properties:
     minimum: 1
     maximum: 1000000
 
+  st,syscfg-fmp:
+    description: Use to set Fast Mode Plus bit within SYSCFG when Fast Mode
+      Plus speed is selected by slave.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    items:
+      - items:
+          - description: phandle to syscfg
+          - description: register offset within syscfg
+          - description: register bitmask for FMP bit
+
 required:
   - compatible
   - reg
@@ -147,4 +150,3 @@ examples:
           i2c-scl-falling-time-ns = <20>;
           st,syscfg-fmp = <&syscfg 0x4 0x2>;
       };
-...
-- 
2.32.0

