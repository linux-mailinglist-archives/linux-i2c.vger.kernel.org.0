Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49D696D9CAB
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Apr 2023 17:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239065AbjDFPtO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Apr 2023 11:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239083AbjDFPsw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Apr 2023 11:48:52 -0400
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94365A261;
        Thu,  6 Apr 2023 08:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=Pskvx082MAeUdvUYOiR5OupVD3nAB2qmVZxOgRw8OXk=; b=gyhANO9cmhVsG0raxaoL6Qao2S
        ngHh0rJ2TJ10qtV44zOiv/36MrS71Y6yvrCLgOjIOy2ofqcincAy8b9JOTMJLuP1Gjze3F/3vHkcW
        tpIDCzNf/ErixHKA3mh09b0dQ63WSenp/Ohhtedluf+rpouhM3jfz+LOm3pMpd5YIEwycZMUiLQk0
        I7ioy6FI3k8Ovmu8u6UD+ZQuzthFibzhsY549absIJ7eVebILurFxB6xavbbWSMnsrX0XpS612Gn0
        Z/ENhN9j0mazS/a1JqSPEH/gSpluhvqye4YxYsasR7ypFJJliw1YRJvJbvam4Swoy+O8zeikQDcd5
        5G8GpeDw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pkRqz-0005yu-AJ; Thu, 06 Apr 2023 17:48:49 +0200
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pkRqy-000IQf-NS; Thu, 06 Apr 2023 17:48:49 +0200
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Michal Simek <michal.simek@amd.com>,
        Shubhrajyoti Datta <Shubhrajyoti.datta@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: i2c: cadence: Document `resets` property
Date:   Thu,  6 Apr 2023 08:48:33 -0700
Message-Id: <20230406154834.171577-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26867/Thu Apr  6 09:24:29 2023)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Cadence I2C controller has an external reset that needs to be
de-asserted before the I2C controller can be accessed.

Document the `resets` devicetree property that can be used to describe how
the reset signal is connected.

While the reset signal will always be present in hardware the devicetree
property is kept optional for backwards compatibility with existing systems
that do not specify the reset property and where the reset signal might not
be controlled by operating system.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
	* Add `resets` property to example
---
 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
index 9187015d9702..cb24d7b3221c 100644
--- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -24,6 +24,9 @@ properties:
   clocks:
     minItems: 1
 
+  resets:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
@@ -59,6 +62,7 @@ examples:
     i2c@e0004000 {
         compatible = "cdns,i2c-r1p10";
         clocks = <&clkc 38>;
+        resets = <&rstc 288>;
         interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
         reg = <0xe0004000 0x1000>;
         clock-frequency = <400000>;
-- 
2.30.2

