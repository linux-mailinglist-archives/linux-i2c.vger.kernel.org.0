Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F41077F0F7
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 09:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348360AbjHQHLY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 03:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348362AbjHQHLF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 03:11:05 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98FA2D4F
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 00:11:01 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99bcf2de59cso952923166b.0
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 00:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692256260; x=1692861060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIjrnEwaKeqGTU5grAtJfqf2YP8aALmcmlloCUUh95k=;
        b=WacsCwd/mTW/bUVtr3GPWrz7PCmkCc2+kASptV0P7rFTE0R9JwO0dwS0d9fm5zWWCP
         jVQLBAEuEY2TeZ+7J43YpwG/rvwmOFcUtCixJOpcfUD9ER/YGw6ud6q0H3BJuii5bTmm
         oz7NiDzwXh+YNrM3WWh0maeTRON+wvh0VkyxUxYITj4CUpXFRfSbsY8lOZsmtQRMVP9J
         d7LiAEEEaNIfXlpOUBvsxhQpbKS97igXv9he8JpvAoJDmMh+QfEoCCQIqu7vaGfdjiOF
         cz7UZfJ/vzykdECCYUEClUJwoo8cNxkkZ4QUJoy2rQTI3/tSdPg/ua9ngS7lgAjjz76+
         AGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692256260; x=1692861060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIjrnEwaKeqGTU5grAtJfqf2YP8aALmcmlloCUUh95k=;
        b=BVwBj7M/SXpxvTOxGg7AAtBuJghgTLly1C6p20udWY8JdXPGs9CXOMww1pnLwOl9gf
         7dZo5KZmI5gII8RWA7wB1O7EI4ZnInrga/2evd9ImZUcz9WwuF9IbjmeOzahewgzObOK
         daSsUb34eg8AW3adMRHoPEibK7rwsJeYF3W4OiE7+jT05UDYT7FazILdezUHZ70M9ywi
         sZM3rwmS0NgcttqK7gHTfw8yO6K6PRlIv5sgnRFPKAMIaZsLrffudUx158Jbk9f8S1tE
         uhXZjh20D0NNC7jMCx+M/uXZoYn6KZ9TSpvVybFH+PoIZpulplt7O/xig0r8FlFSsdap
         CyPQ==
X-Gm-Message-State: AOJu0YzNsXgIjB0HFlCOL16UV7hVQSy94+4BwTJm6ws7wMegwMygcDlX
        KkXkGKy5fV/iVSuCOyytC0M2KLlPQPnZ8ePOzdL1UA==
X-Google-Smtp-Source: AGHT+IEm3Zuw6iWJxveFv6TWkJryZMT36/j5LUA/U0DfI6Y7uj4yMRyUOzDLKV23+RFgUnjU5V3B+w==
X-Received: by 2002:a17:906:20dc:b0:99b:ed53:5c12 with SMTP id c28-20020a17090620dc00b0099bed535c12mr3023587ejc.17.1692256260537;
        Thu, 17 Aug 2023 00:11:00 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id qn17-20020a170907211100b00992b510089asm9674361ejb.84.2023.08.17.00.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 00:11:00 -0700 (PDT)
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
Subject: [PATCH v15 1/4] dt-bindings: i2c: pca954x: Correct interrupt support
Date:   Thu, 17 Aug 2023 09:10:50 +0200
Message-ID: <20230817071056.2125679-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
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

