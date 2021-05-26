Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662D9391F8C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 20:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233937AbhEZSuQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 14:50:16 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:36799 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbhEZSuQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 14:50:16 -0400
Received: by mail-ot1-f48.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so1983139otl.3;
        Wed, 26 May 2021 11:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CXgdAQp8/SwFmLInUVTGGyEAMwT4zmJfF17IH/irWI4=;
        b=ioTK6AdXZG9sxt+cgbpbFM8Aj/p3FDfzNhpaAp8Dstr9TS28SnLHHa8p8rji+hE1ZV
         XV40rFtwgFaNUCRcI8eGdDON3W+gJPDrSBLt+r5ciLT+bfUTSGHc17og++J4aAmPT0gh
         Lu/YJIlnZrFFk0ILgRiISC28zbspP6q8sPuAMTYpaZcusU7m2OtUzt52k6LdhXmn9erM
         Pyd1h8eUpls45aaIpYl3q+7rGcolQC/WotiOm1cPajqvbVeyI9DeJbpU7ePrKO69Ex83
         F4sJkj3p5AHPe3sprcoMoqopOoiWXjqnECARFWluQLdQPaFEGycG3TNJ8AR1z1ZX9q6t
         NP1Q==
X-Gm-Message-State: AOAM530XryytVSOHcMsY84gJ9a2nAiD+sp+gTx4LKep+sk+T/t/2Po3m
        pyRTfJQdXPrEB9AHY8h6+YpqV0E8sA==
X-Google-Smtp-Source: ABdhPJzdfhKHM036hT9vdm33/C1cQtWN3p5Gr/114nlCA6S2igm1KJjTYeZSv7iqS3NYvbI9hLhHUg==
X-Received: by 2002:a05:6830:110c:: with SMTP id w12mr3547388otq.91.1622054924070;
        Wed, 26 May 2021 11:48:44 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id x65sm7224otb.59.2021.05.26.11.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 11:48:42 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: mfd: ti,j721e-system-controller: Fix mux node errors
Date:   Wed, 26 May 2021 13:48:34 -0500
Message-Id: <20210526184839.2937899-2-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526184839.2937899-1-robh@kernel.org>
References: <20210526184839.2937899-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The ti,j721e-system-controller binding does not follow the standard mux
controller node name 'mux-controller' and the example is incomplete. Fix
these to avoid schema errors before the mux controller binding is
converted to schema.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../mfd/ti,j721e-system-controller.yaml       | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml
index 19fcf59fd2fe..272832e9f8f2 100644
--- a/Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml
@@ -43,12 +43,10 @@ properties:
 
 patternProperties:
   # Optional children
-  "^serdes-ln-ctrl@[0-9a-f]+$":
+  "^mux-controller@[0-9a-f]+$":
     type: object
-    description: |
-      This is the SERDES lane control mux. It should follow the bindings
-      specified in
-      Documentation/devicetree/bindings/mux/reg-mux.txt
+    description:
+      This is the SERDES lane control mux.
 
 required:
   - compatible
@@ -68,9 +66,18 @@ examples:
         #size-cells = <1>;
         ranges;
 
-        serdes_ln_ctrl: serdes-ln-ctrl@4080 {
+        serdes_ln_ctrl: mux-controller@4080 {
             compatible = "mmio-mux";
             reg = <0x00004080 0x50>;
+
+            #mux-control-cells = <1>;
+            mux-reg-masks =
+                <0x4080 0x3>, <0x4084 0x3>, /* SERDES0 lane0/1 select */
+                <0x4090 0x3>, <0x4094 0x3>, /* SERDES1 lane0/1 select */
+                <0x40a0 0x3>, <0x40a4 0x3>, /* SERDES2 lane0/1 select */
+                <0x40b0 0x3>, <0x40b4 0x3>, /* SERDES3 lane0/1 select */
+                <0x40c0 0x3>, <0x40c4 0x3>, <0x40c8 0x3>, <0x40cc 0x3>;
+                /* SERDES4 lane0/1/2/3 select */
         };
     };
 ...
-- 
2.27.0

