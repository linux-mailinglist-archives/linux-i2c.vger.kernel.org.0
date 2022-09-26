Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C217D5EB28D
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 22:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiIZUqr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 16:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiIZUqr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 16:46:47 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA699FA9E;
        Mon, 26 Sep 2022 13:46:44 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 7949884DD8;
        Mon, 26 Sep 2022 22:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664225202;
        bh=CBDilgeWFIDHqedtyjY50ZN3XapKiimiMO9OJg6Q+28=;
        h=From:To:Cc:Subject:Date:From;
        b=T83novwM6PTG/jvVJJhYrArLVrcLJXDh/qzWYn63hIiDWw9csIVqxWpCEoBeZ6oG0
         FtGwM+ErywZGC8FGZ61kFMWPM06joOYtOWhQB79AlSeiVDwXWDuQFPhy/sjIN+RQaD
         bteL/IYz3iDQXSrIJB/vmNwRykB0iaT/Li7duvyVbilO5+w3DzoMFYklYAU1YT8xdB
         uYLBebNbY99xeYMvt3reH0bsedAq6rDA16Mcgdf2Lrt+gDbGAqKQYIhaqrn2hjZ7A0
         s5Y5XQ8Ld7cuQCEEf0/nDB/3zizB+jBtNTB4jgZpQsS7GIC79lP26LQdaJZLndKDiW
         1+EozeJauaKcw==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: i2c: st,stm32-i2c: Document interrupt-names property
Date:   Mon, 26 Sep 2022 22:46:31 +0200
Message-Id: <20220926204631.381702-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document interrupt-names property with "event" and "error" interrupt names.
This fixes dtbs_check warnings when building current Linux DTs:

"
arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: i2c@40015000: Unevaluated properties are not allowed ('interrupt-names' was unexpected)
"

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index a415887637862..63958cac339b7 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -57,6 +57,11 @@ properties:
       - description: interrupt ID for I2C event
       - description: interrupt ID for I2C error
 
+  interrupt-names:
+    items:
+      - const: event
+      - const: error
+
   resets:
     maxItems: 1
 
-- 
2.35.1

