Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE8466BA1A4
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 22:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjCNV6N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 17:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbjCNV6I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 17:58:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70884485;
        Tue, 14 Mar 2023 14:58:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F36FB81BCE;
        Tue, 14 Mar 2023 21:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3A9C433EF;
        Tue, 14 Mar 2023 21:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678831084;
        bh=3anpauQ7tbtNVmsvLCLAkelo44OUKYuYXCpJm5o4VNg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RCymknihK1JeysrJcH/jpSJEswq4NH6WdCwG74jqaArUjZcCHBdt1Gn6PDjL9dOFh
         NLmlS1iRz8f2EPULRR83QAcBzVMKX1FZ6cmIXr9b3iGPjx0hi8W4gR+3GpVShH6tFR
         ssB5huW3A/cjqR5FAMCLftvcW8+nbVQbbkKUnGw0ouI4AA1ZzFbOvlzlldeAgWb7ji
         uh5AuBWFZRxsBqQP03E1w/yu2PCJi7nRQnSoDSPgjpFuYBEzjprbB7fqy0KNjXOwpG
         pa6WKJO/WIsRn1w2EYSUnu1TP7MQ7zdn+HfZmBWWndWR9WG0SJjva2nH5DvcKpr/Uk
         nm4jMWDxkTd+w==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: i2c: mpc: Mark "fsl,timeout" as deprecated
Date:   Tue, 14 Mar 2023 22:56:10 +0100
Message-Id: <20230314215612.23741-2-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314215612.23741-1-andi.shyti@kernel.org>
References: <20230314215612.23741-1-andi.shyti@kernel.org>
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

Now we have the i2c-scl-clk-low-timeout-us property defined in
the i2c schema.

Mark "fsl,timeout" as deprecated and update the example.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
index 018e1b9444248..70fb69b923c46 100644
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
+        i2c-scl-clk-low-timeout-us = <10000>;
     };
 ...
-- 
2.39.2

