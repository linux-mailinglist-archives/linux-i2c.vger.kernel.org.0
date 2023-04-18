Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE696E5EE0
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 12:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjDRKeq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 06:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230501AbjDRKep (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 06:34:45 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AB74234
        for <linux-i2c@vger.kernel.org>; Tue, 18 Apr 2023 03:34:40 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id xi5so71870247ejb.13
        for <linux-i2c@vger.kernel.org>; Tue, 18 Apr 2023 03:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1681814079; x=1684406079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hM2bBHeuxBAL+DDlwpzy9mMXdD/d67LP1Ods6dYdRvw=;
        b=G/Yr8UnshxTTU0x/fkPRKMujQ5ZWfMqshcIz2TQ3RQAAtRxNkhI3oclzOj3Q5cA4Hh
         mihM+AezDm1OAID5iOA8ChjjMRi6WJm0hhbIH8wIf55PHLoX6sswIT4tqh4lNxEhTv9w
         L6YQf860x++r7n8E2pNadit5bEl8IvEe/SCmJI3F3kdZ9ymST2IhXIrv5jh/pzre0/Kv
         7nCd8npP1WIBP3cmBdctmg19vhTj793hODD7kmnViW7nD2wKPBU3JEKV5vb6lNiuejIr
         ejlBvdESwqatIhZ+CWTjnYBrqiMYzXx0hXE4cbYrXMyM2euAkxrqVyJDtFqcOPP96Wk9
         6RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681814079; x=1684406079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hM2bBHeuxBAL+DDlwpzy9mMXdD/d67LP1Ods6dYdRvw=;
        b=S72d9cPJ7qgJLl+H3DS08iJKPNkoZMqd3VWimM01N8x0FzpObThrXDhI6e48infdLx
         PGZ+4IJ7yf3+hy9QS5WdZHjQllKb1Q8y79hgQ+Vhg9UCPB4MS+N2a8kWAcFmKnvzK+n6
         VXqXq4sgLV9k6VuIk5i3D0DGqpex+T+6on833z8cwf41OGnSn26j5hzWGgHzYEpnO9VA
         ZFAvDq+d50x+Nt2rDfeTuMsepzehNf3kd/3vHtS9Fc6LdQCsR93mvNSMddbXA+vpsD4t
         jim4Y2hW9MHkRUEyfJuc4LV5s6Wd55vEEZysxsSW86vjoMEouwYojWa6pgcEe9Jawwd2
         dKYg==
X-Gm-Message-State: AAQBX9e3Yv8PiNx5rKhiCiarQcjedstcGkvK62YXTCxOdt1XkZT31tAT
        lLY17rZcBWnuNh7owub8Rou83g==
X-Google-Smtp-Source: AKy350aTCH+B8Ums8L23m06EJw4GP871eBtakETBhkR0nRfLJuZ+KFWJZrT1ruET6duNnnziUc+QmA==
X-Received: by 2002:a17:906:f14f:b0:94a:a6f0:876a with SMTP id gw15-20020a170906f14f00b0094aa6f0876amr10247396ejb.1.1681814078906;
        Tue, 18 Apr 2023 03:34:38 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id a12-20020a170906368c00b0094e8de89111sm7787126ejc.201.2023.04.18.03.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 03:34:38 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v13 1/4] dt-bindings: i2c: pca954x: Correct interrupt support
Date:   Tue, 18 Apr 2023 12:34:26 +0200
Message-Id: <20230418103430.966278-2-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418103430.966278-1-patrick.rudolph@9elements.com>
References: <20230418103430.966278-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
2.39.2

