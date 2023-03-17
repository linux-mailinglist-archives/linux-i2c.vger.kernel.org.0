Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBA486BF65A
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Mar 2023 00:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbjCQXeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 19:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjCQXeA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 19:34:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50371689F;
        Fri, 17 Mar 2023 16:33:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 67EC1B826E4;
        Fri, 17 Mar 2023 23:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB59C433D2;
        Fri, 17 Mar 2023 23:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679096037;
        bh=aY0ALgTJbwlEVEL6SFHiKj3ExiEgeV4xhWNyVCp61gA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZVHl2rB/y2sifflrf3iNaORordYxXWFgXSHLcPkDut69XFa1deQyQQCYEkc+3XNXx
         Ut50rSDCn0RAqv+oxnJyde8HgAppUPmsRcJ4C5OtowaJbCEL8VQgNABys30mVYwWaR
         Haec9hKYB2I8jSMPWus2ngl6KNPX4Yq7sjr7bAPmGdHA0Hu7LH08y7XLsCG1WOJw5c
         w5a7kR2v4KPz7T12MPsDFjofnqh9zr+n9UFFOiDzVGdlFbGOXBHJeYkUwX+rCS6kHT
         6TkVPBIA6BoZ/JzLQa/xvGnIOKm7k9mQpRc4dk6dqvuk/c65pZsM6a3ku/jvgWkGmi
         AUg0FNxVCVjvA==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v5 1/3] dt-bindings: i2c: mpc: Mark "fsl,timeout" as deprecated
Date:   Sat, 18 Mar 2023 00:33:36 +0100
Message-Id: <20230317233338.424864-2-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317233338.424864-1-andi.shyti@kernel.org>
References: <20230317233338.424864-1-andi.shyti@kernel.org>
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

Now we have the i2c-scl-clk-low-timeout-us property defined in
the i2c schema.

Mark "fsl,timeout" as deprecated and update the example.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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

