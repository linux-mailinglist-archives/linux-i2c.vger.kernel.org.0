Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 990DF68B299
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 00:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjBEXCW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Feb 2023 18:02:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBEXCV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Feb 2023 18:02:21 -0500
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4865C17CF6;
        Sun,  5 Feb 2023 15:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID;
        bh=4Qpo2CTM+yuWhPjOv3A/eGJDp6pSMrUD8pl15abP4Bg=; b=Sf6JkC422imGlgWqMTYFGFGtXb
        +OjEL5SWf7qVIrDhVZqEq/WRbFcKB+0cEL+8yNI+D6z+0oF1bwyOxAnOJkiXOaRXp7u/kSyXSRRkI
        7NSAiahFn1a5wuwr1gPq8clrPECM87dTlE2a5sQNamhR7gif/vMqfBC9TublWp7pelUac6O5nDwAT
        ylhfIFGSjJu2QCRQRPuzz/qXWXz4KsJzBJMMM6kHhhXuTk6tLlivygtiYSyha1sxE6fUlwx5ewzZa
        bMTDwBDcB9MFw9LGj0MIa5Neg/PnNI0ligEmByW6/b7a0SQJNzk5VboHBF4EhiRp5P2MBuIH+qUd4
        DDF4Boow==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pOo1a-000A5Y-GE; Mon, 06 Feb 2023 00:02:18 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pOo1Z-000WgB-V9; Mon, 06 Feb 2023 00:02:18 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 2/2] dt-bindings: i2c: cadence: Document `cdns,fifo-depth` property
Date:   Sun,  5 Feb 2023 15:02:08 -0800
Message-Id: <20230205230208.58355-2-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230205230208.58355-1-lars@metafoo.de>
References: <20230205230208.58355-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26803/Sun Feb  5 09:39:28 2023)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
index 2e95cda7262a..3daa2fa73257 100644
--- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -38,6 +38,12 @@ properties:
     description: |
       Input clock name.
 
+  cdns,fifo-depth:
+    description:
+      Size of the data FIFO in words.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    default: 16
+
 required:
   - compatible
   - reg
@@ -57,4 +63,6 @@ examples:
         clock-frequency = <400000>;
         #address-cells = <1>;
         #size-cells = <0>;
+
+        cdns,fifo-depth = <8>;
     };
-- 
2.30.2

