Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0AD532BBF
	for <lists+linux-i2c@lfdr.de>; Tue, 24 May 2022 15:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237971AbiEXNyy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 May 2022 09:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236290AbiEXNyx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 May 2022 09:54:53 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66D89728E;
        Tue, 24 May 2022 06:54:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 1D567CE1B57;
        Tue, 24 May 2022 13:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FC1C36AE5;
        Tue, 24 May 2022 13:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653400488;
        bh=8gk1BM4Q1BDX3V8XDZBmAWQIJt29q+UopM2y8lNtbOE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BBwNijMXc2LMi8dhfbzHQDZKNwtbup7Mw+jy4ZxZECi51B68LzJlMgY1AfFlDN8/K
         3y70fHazj/UtsyZgxMwRd2F/tlNWoP0MRaXPs0L9+IWC8U/wVTDCh63V3PlCO5raaP
         z5ZMCHrFQomJ8EQ9vcCXdTybpEmJ56XcSNWlDAEb/f7mYDNkQQRr3GHtGVQnnEtJJK
         5JMBYE5hPcYlvwA4DAmzNnL0Yj4ADbOhUefqAilHp9oqfix67cZui+OELQIs1Hj7yO
         68Y90E2wVg+UQUA3G7wWIbNCTh2KbKQutUuQBwkrJQ7vqxXVTYR+myHWFiUToEvnRM
         8ykLP8OVFffDA==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     jarkko.nikula@linux.intel.com
Cc:     dinguyen@kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCHv2 2/2] dt-bindings: i2c: dw: Add Intel's SoCFPGA I2C controller
Date:   Tue, 24 May 2022 08:54:41 -0500
Message-Id: <20220524135441.420600-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524135441.420600-1-dinguyen@kernel.org>
References: <20220524135441.420600-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

