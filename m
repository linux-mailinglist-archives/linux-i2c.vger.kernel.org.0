Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7D776B675B
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 15:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjCLO42 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 10:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjCLO4Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 10:56:24 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BA94D2A0;
        Sun, 12 Mar 2023 07:56:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 1E3FECE0B49;
        Sun, 12 Mar 2023 14:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397E8C433EF;
        Sun, 12 Mar 2023 14:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678632978;
        bh=Y/oVmiKiguf3cH10Ap6pc0Y9scvYwzwdpgy/O2vWpoM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LnoitOiwa4CdiDJ7UKVW2iX3U2fqvvyU4cNdn0FJbUj0C0ohTu/TwxnwZbbiv3bTZ
         cLE5gziNTQUGFYeaiem7sqkbCN7WfxKvjGZSzr/JFwhONSEMdrqQFnzVk3myB9CDMZ
         n6KhBS7mGzxBEbpchwlZIJ/tYGhnK89dpqjGN7a2wZqf2S1ATitPgHdFgqcecqz8XB
         DSXMgDrCIqjLNKiiolTNueynODoqYEyXlSsuwRYpcaZMeGZ1wLlIaxq7yz0r5lm6fb
         0ohexcmnsHEACH/4b6UCN5OmAV2M6kEo0RPijzHtVHObPHFLLPtNY4s0gqRWlFRXfN
         oOZ+nmuvSq6Kw==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: i2c: mpc: Mark "fsl,timeout" as deprecated
Date:   Sun, 12 Mar 2023 15:55:45 +0100
Message-Id: <20230312145546.262492-2-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312145546.262492-1-andi.shyti@kernel.org>
References: <20230312145546.262492-1-andi.shyti@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Now we have the i2c-scl-clk-low-timeout-ms property defined in
the i2c schema.

Mark "fsl,timeout" as deprecated and update the example.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
index 018e1b944424..bd2dd82471c1 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
@@ -43,6 +43,7 @@ properties:
 
   fsl,timeout:
     $ref: /schemas/types.yaml#/definitions/uint32
+    deprecated: true
     description: |
       I2C bus timeout in microseconds
 
@@ -95,6 +96,6 @@ examples:
         interrupts = <43 2>;
         interrupt-parent = <&mpic>;
         clock-frequency = <400000>;
-        fsl,timeout = <10000>;
+        i2c-scl-clk-low-timeout-ms = <10000>;
     };
 ...
-- 
2.39.2

