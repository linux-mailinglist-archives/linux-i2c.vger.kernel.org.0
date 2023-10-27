Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17FD17D8D73
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 05:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbjJ0DbR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 23:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJ0DbP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 23:31:15 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C50E192
        for <linux-i2c@vger.kernel.org>; Thu, 26 Oct 2023 20:31:12 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 24F412C011D;
        Fri, 27 Oct 2023 16:31:09 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698377469;
        bh=fhjMiQeoXkVBPNXsIJuW1BQL7JD4RG68hd+jZlHsO3I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D0Wk1mvAYJdVtcq1ZERIFf/snAQK3ZiukPM8kD4lPZh/m9ZUyjPcD7UgDQu4ZUEBj
         qZ/exv/Wf8E0N4X0f/aQPFzN9Ce2Ke2ixjn/KuIcGS753dUAQIKiq9Bg5h/PsD2vW0
         IIbg6WjFPkJ+pP08OjXKpV/Y2J0Ff2RlcvIxtg8ZRpBJQswx5vad+AUDQbmB4lWDVx
         kD11KuQpsbL/vSilQWZ6OikijiAUIcpY/lQKK1MBLTQz4P/tHKKAR2mFJx4t/9xqsP
         3x+/d/3iAx1hVzwf8Q45zkZBkM+XHwN26irTZfisYMCnjkaJ/YmbLeEIqHlN3U31wx
         eH1Rk2Vcbavkw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653b2efc0001>; Fri, 27 Oct 2023 16:31:08 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id 5E70413EE44;
        Fri, 27 Oct 2023 16:31:08 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 5A4F8280347; Fri, 27 Oct 2023 16:31:08 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 1/2] dt-bindings: i2c: mv64xxx: add bus-reset-gpios property
Date:   Fri, 27 Oct 2023 16:31:03 +1300
Message-ID: <20231027033104.1348921-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz>
References: <20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=bhdUkHdE2iEA:10 a=KKAkSRfTAAAA:8 a=N1qcaoclDu5WUfG3NQYA:9 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add bus-reset-gpios and bus-reset-duration-us properties to the
marvell,mv64xxx-i2c binding. These can be used to describe hardware
where a common reset GPIO is connected to all downstream devices on and
I2C bus. This reset will be asserted then released before the downstream
devices on the bus are probed.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    Changes in v5:
    - Rename reset-gpios and reset-duration-us to bus-reset-gpios and
      bus-reset-duration-us as requested by Wolfram
    Changes in v4:
    - Add r-by from Krzysztof
    Changes in v3:
    - Rename reset-delay-us to reset-duration-us to better reflect its
      purpose
    - Add default: for reset-duration-us
    - Add description: for reset-gpios
    Changes in v2:
    - Update commit message
    - Add reset-delay-us property

 .../devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index 461d1c9ee3f7..b165d1c4f0b1 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -70,6 +70,16 @@ properties:
   resets:
     maxItems: 1
=20
+  bus-reset-gpios:
+    description:
+      GPIO pin providing a common reset for all downstream devices. This=
 GPIO
+      will be asserted then released before the downstream devices are p=
robed.
+    maxItems: 1
+
+  bus-reset-duration-us:
+    description: Reset duration in us.
+    default: 1
+
   dmas:
     items:
       - description: RX DMA Channel
--=20
2.42.0

