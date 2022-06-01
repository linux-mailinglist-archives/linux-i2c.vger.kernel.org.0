Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC201539C05
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jun 2022 06:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232558AbiFAERy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jun 2022 00:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232968AbiFAERv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jun 2022 00:17:51 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B460B57175;
        Tue, 31 May 2022 21:17:48 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id 187so821886pfu.9;
        Tue, 31 May 2022 21:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DQ+FCy1HGI3Ies4LEu7xbJ8vvBaBXxmKzVnykcfWgYc=;
        b=cz3+YUGhugwCO8sy3yMoeG9UKTe6cXoNB5HsquXRcM1x8kO4l2SB2p5lA3nEn7WHWa
         vR2BzibqnYCojzjoHn+4fh4xjPWlRVY+rwgWhDLd7ZnQmBsP69280m3iSRgGt+9jutJv
         G9Llp2q7NwZL/JNUf2bMttPSk+928J91kB9mWKKvkUK57YIozSOy84Laj8iLBbTzixp1
         ydZx6tkcdIeO49cwUT6epL0z5+oxO0+UFwZtffi9aras6j6qIvE9QEPVOm8OvxW2DxTY
         ErKdgi+a1t90qzQlL5P5BwJ4oYrjaFEMectidaqmmDN1fWzDcCcbm3RViAZr7/yUncms
         XUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DQ+FCy1HGI3Ies4LEu7xbJ8vvBaBXxmKzVnykcfWgYc=;
        b=x2KOuCfqjJVcnVwhKAC3LD+plhAwWKThQWIhKduwoXFqRpUlbikUGOH7hZ8CD4TxId
         jAnJSP7x1drFNanLWlQ6mW8SkBSQ2iSH4pKCPqF/P0PTSpgHO89Df40ML40RX3yCRRDT
         rTqSxM7rFwmtdOPKIuB1h49Q17E5H48Ugo5NkxtWS1aSWx81/qjy0mpRfv73LAZZZjlQ
         OWJImP6JCmVBe8GE7tHn/eV0oori401+Y8S9av+kJWYWQlUfq7kasfbZHyDrNpHwqRSG
         gUWmg4ceX7kKWGPYVwN0Ad5BKHJbC1sJOR37DKDqZFLMr4Kl5bxv1owbNvXxPhx2lgy3
         kJ2Q==
X-Gm-Message-State: AOAM530VJjNouHolB9zWfHj7OJ5h8p5ye1zMLLkhr1ep9sUKo0J4v8VH
        nUT7Eq1lN+8QrdPziByZs6w=
X-Google-Smtp-Source: ABdhPJxuABQQ5nnDs9x6ucPra80+mc4j7aUfsFQDxn8DBnNB6maVVyCDmZ2Lamz55ogHhWOIjy1jkw==
X-Received: by 2002:a63:a0f:0:b0:3fa:95b9:8c70 with SMTP id 15-20020a630a0f000000b003fa95b98c70mr36216628pgk.385.1654057068274;
        Tue, 31 May 2022 21:17:48 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id u11-20020a63d34b000000b003c14af505f6sm290749pgi.14.2022.05.31.21.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 21:17:47 -0700 (PDT)
From:   Potin Lai <potin.lai.pt@gmail.com>
To:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        Potin Lai <potin.lai@quantatw.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: aspeed-i2c: add properties for manual clock setting
Date:   Wed,  1 Jun 2022 12:15:12 +0800
Message-Id: <20220601041512.21484-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601041512.21484-1-potin.lai.pt@gmail.com>
References: <20220601041512.21484-1-potin.lai.pt@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add following properties for manual tuning clock divisor and cycle of
hign/low pulse witdh.

* aspeed,i2c-manual-clk: Enable aspeed i2c clock manual setting
* aspeed,i2c-base-clk-div: Base Clock divisor (tBaseClk)
* aspeed,i2c-clk-high-cycle: Cycles of clock-high pulse (tClkHigh)
* aspeed,i2c-clk-low-cycle: Cycles of clock-low pulse (tClkLow)

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
index ea643e6c3ef5..e2f67fe2aa0c 100644
--- a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
@@ -12,6 +12,28 @@ maintainers:
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: st,stm32-uart
+
+    then:
+      properties:
+        aspeed,i2c-clk-high-cycle:
+          maximum: 8
+        aspeed,i2c-clk-low-cycle:
+          maximum: 8
+
+  - if:
+      required:
+        - aspeed,i2c-manual-clk
+
+    then:
+      required:
+        - aspeed,i2c-base-clk-div
+        - aspeed,i2c-clk-high-cycle
+        - aspeed,i2c-clk-low-cycle
+
 properties:
   compatible:
     enum:
@@ -49,6 +71,28 @@ properties:
     description:
       states that there is another master active on this bus
 
+  aspeed,i2c-manual-clk:
+    type: boolean
+    description: enable manual clock setting
+
+  aspeed,i2c-base-clk-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192,
+           16384, 32768]
+    description: base clock divisor
+
+  aspeed,i2c-clk-high-cycle:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 16
+    description: cycles of master clock-high pulse width
+
+  aspeed,i2c-clk-low-cycle:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 16
+    description: cycles of master clock-low pulse width
+
 required:
   - reg
   - compatible
-- 
2.17.1

