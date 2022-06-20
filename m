Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6463755276B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 01:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344823AbiFTXBf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jun 2022 19:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344873AbiFTXBU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jun 2022 19:01:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D7021263;
        Mon, 20 Jun 2022 16:01:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 387A4614DB;
        Mon, 20 Jun 2022 23:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25DFC3411C;
        Mon, 20 Jun 2022 23:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655766078;
        bh=qtAlTGYG35KObNBX4bA5SMGxiGB4jAp/BEJx1e1sI3w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=reP4tGnn03T01ZfIZb14y+3vf/o5lIsm9EnJ9fsMnD52Jwh7H5gpqhLs6kugCB3pM
         gN7C6d6u8yiD9CYei2ZNLKZLzzyGAoj/jWFelcswTRG+rVn7U8OkJcD7cyIFwkLA8i
         EW4ofXfxt+zG/Jxa0ZxhwdWbXnZPftfgaoNeCAZLfmkrm25uoDFSlIkepoXkM5xowd
         Payr9/CoZwizXJgjW37F08lrNwAeQ/9TQY8Q5+VHvJo/f2DimGsVFnJIC9HmnlBMAK
         gxErNVC66QrPovOUJD3vjix+rBNr3h8xBFJ8SphVqnmy4f4N+i8/R3BplQeeFuzT1X
         jDMw3lRN++UWg==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     jarkko.nikula@linux.intel.com
Cc:     dinguyen@kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCHv6 2/2] dt-bindings: i2c: dw: Add Intel's SoCFPGA I2C controller
Date:   Mon, 20 Jun 2022 18:01:09 -0500
Message-Id: <20220620230109.986298-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620230109.986298-1-dinguyen@kernel.org>
References: <20220620230109.986298-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C pins on Intel's SoCFPGA platform are not connected to GPIOs and
thus cannot be recovered by the standard GPIO method.

Document the "intel,socfpga-i2c" binding.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v6: no changes
v5: no changes
v4: no changes
v3: no changes
v2: Added Acked-by
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index d9293c57f573..a130059e97ab 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -33,6 +33,8 @@ properties:
           - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
+      - description: Intel's SoCFPGA I2C controller
+        const: intel,socfpga-i2c
 
   reg:
     minItems: 1
-- 
2.25.1

