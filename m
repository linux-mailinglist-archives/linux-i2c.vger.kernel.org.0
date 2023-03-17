Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71D9F6BEBE8
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 15:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjCQO4S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 10:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjCQO4R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 10:56:17 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C1D3524E;
        Fri, 17 Mar 2023 07:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=N8AQvUD4CkJRTp9l4/aTKO2hzAyj5DrZ3kdV7fLxNxU=; b=Aj5FldAmifl1mnpVGpPCDwuFRa
        anpISlwySB74lEODIJG7A5DJW8RUNoWrutqOXvG5JvnZFDHXeOZ0qwUNzT5Np9gt2LDUWkbsY9AWj
        icogAE5MWHO0Knav31rtjqYAzs+6GZB7n63CY3JlJCspUP3Q0L2rSrNjPNKP1ehWLOCxVph/agfMd
        tGGkiz2fOZ9rC5W2bnyS5u+Ua+2kc1J/XxkkgFyPFVocAkcYhF2/JstTI9DK+EOgv9VW0OdnI3IQH
        M0ZIGT4EukgYNUBT8Hp07WTWZqqmQEQisXpaiaU3OCgMbPwl8wpr36bY+D/+Gx4fJDQhPjM+P5y1O
        6YlEPfpQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pdBUX-000LQ7-P0; Fri, 17 Mar 2023 15:55:37 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pdBUX-000E4A-7C; Fri, 17 Mar 2023 15:55:37 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v2 1/3] dt-bindings: i2c: cadence: Document `fifo-depth` property
Date:   Fri, 17 Mar 2023 07:54:39 -0700
Message-Id: <20230317145441.156880-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26846/Fri Mar 17 08:22:57 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The depth of the FIFO of the Cadence I2C controller IP is a synthesis
configuration parameter. Different instances of the IP can have different
values. For correct operation software needs to be aware of the size of the
FIFO.

Add the documentation for the devicetree property that describes the FIFO
depth of the IP core.

The default value of 16 is for backwards compatibility reasons with
existing hardware descriptions where this property is not specified and
software has assumed that the FIFO depth is 16.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
Changes since v1:
 * Remove quotes around "/schemas/types.yaml#/definitions/uint32"
 * Add `enum` describing valid values
 * Use `fifo-depth` instead of `cdns,fifo-depth`
 * Use `bytes` instead of `words` for the property unit
---
 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
index 2e95cda7262a..2401d1e19916 100644
--- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -38,6 +38,13 @@ properties:
     description: |
       Input clock name.
 
+  fifo-depth:
+    description:
+      Size of the data FIFO in bytes.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 16
+    enum: [2, 4, 8, 16, 32, 64, 128, 256]
+
 required:
   - compatible
   - reg
@@ -57,4 +64,5 @@ examples:
         clock-frequency = <400000>;
         #address-cells = <1>;
         #size-cells = <0>;
+        fifo-depth = <8>;
     };
-- 
2.30.2

