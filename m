Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4CB6B668C
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 14:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjCLNVo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 09:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjCLNVn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 09:21:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F6C2B2B5;
        Sun, 12 Mar 2023 06:21:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A60C260F14;
        Sun, 12 Mar 2023 13:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F92AC433EF;
        Sun, 12 Mar 2023 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678627194;
        bh=YpVG7djRZHe3zyr0hDaeowF//XjwA7OjIrOeWhOC/80=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GnFOWyE1jG9bk/f+fQQlh9D79UMaw0y5fmirNBHmgHz39L4wVnIO6beu7RXTFuMCo
         SjOgh6Qo35FiwXj6LTcUSoy5WeGerHyAjx/D5HAH6B3mKbTeP/dQw9Kx1QWOHrAHCA
         AhsiMzhHnG8uyjJvG7O9q1PDR2ALnup1pU9GMhnApX16HpR+1vFoNbJJ6Ni09smmNu
         Anc2flf+alDgYlGrDpIecM7hL0TAgTzRWjz7Ts4hsNSpgSpi7hCabw+BE4syEzZ+9J
         pnTrMSM+MMoKqOXWuaYJ0ZiL3SMHpD+7aanwHTGQXA39fPwj8vrs3T5SpCq106QLoT
         hOBd+MrGtw1ig==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 2/2] i2c: mpc: Use the i2c-scl-clk-low-timeout-ms property
Date:   Sun, 12 Mar 2023 14:19:33 +0100
Message-Id: <20230312131933.248715-3-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312131933.248715-1-andi.shyti@kernel.org>
References: <20230312131933.248715-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Now we have the i2c-scl-clk-low-timeout-ms property defined in
the binding. Use it and remove the previous "fsl,timeout".

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 12 ++++++------
 drivers/i2c/busses/i2c-mpc.c                       |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
index 018e1b944424..c01547585456 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
@@ -41,11 +41,6 @@ properties:
       if defined, the clock settings from the bootloader are
       preserved (not touched)
 
-  fsl,timeout:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description: |
-      I2C bus timeout in microseconds
-
   fsl,i2c-erratum-a004447:
     $ref: /schemas/types.yaml#/definitions/flag
     description: |
@@ -53,6 +48,11 @@ properties:
       says that the standard i2c recovery scheme mechanism does
       not work and an alternate implementation is needed.
 
+  i2c-scl-clk-low-timeout-ms:
+    description:
+      Indicates the SCL timeouts which used to force the client
+      into a waiting state
+
 required:
   - compatible
   - reg
@@ -95,6 +95,6 @@ examples:
         interrupts = <43 2>;
         interrupt-parent = <&mpic>;
         clock-frequency = <400000>;
-        fsl,timeout = <10000>;
+        i2c-scl-clk-low-timeout-ms = <10000>;
     };
 ...
diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 81ac92bb4f6f..93c484efc3f3 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -846,7 +846,8 @@ static int fsl_i2c_probe(struct platform_device *op)
 			mpc_i2c_setup_8xxx(op->dev.of_node, i2c, clock);
 	}
 
-	prop = of_get_property(op->dev.of_node, "fsl,timeout", &plen);
+	prop = of_get_property(op->dev.of_node,
+			       "i2c-scl-clk-low-timeout-ms", &plen);
 	if (prop && plen == sizeof(u32)) {
 		mpc_ops.timeout = *prop * HZ / 1000000;
 		if (mpc_ops.timeout < 5)
-- 
2.39.2

