Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1B7754E316
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 16:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377584AbiFPOMn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 10:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377573AbiFPOMm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 10:12:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC76ED75;
        Thu, 16 Jun 2022 07:12:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 83707B82420;
        Thu, 16 Jun 2022 14:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAACBC341C0;
        Thu, 16 Jun 2022 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655388757;
        bh=KyWpgwiYpy/W6PcREOKBihbI3o7XaGXPymsdhkj3UXE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=REwyjw64HGmycqMaTGcFdGV2G7Dq+zWe5Q1CSWplBtTbIi5skeNffldwUnqby7I3H
         5Eo7Y8tyoL7sO0ADjljAFExzmVRxoGn9ISttvrmQsf1zv+qJ3xvEZFKSN3NyvfNiUW
         /ajzwmkwlygXioKD6pbSIzreVw3J/NSytGRkUgQJLE/AbeTUwThc1guSYUR5rc4tl/
         prcsZHQGXTQ7uHDQWjnNvU6KJFZ5Cuk9x3HYMURzUjMsDcw991FQb8C+pzRrV0sUDX
         tMpJDmWX5FeJt5PEB4HXUPYHBckoXh84as6Ky66qQtTtywDaCAxSu+useAIul0W3Dr
         xEOs+p55dPpRA==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     jarkko.nikula@linux.intel.com
Cc:     dinguyen@kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCHv5 2/2] dt-bindings: i2c: dw: Add Intel's SoCFPGA I2C controller
Date:   Thu, 16 Jun 2022 09:12:30 -0500
Message-Id: <20220616141230.858409-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220616141230.858409-1-dinguyen@kernel.org>
References: <20220616141230.858409-1-dinguyen@kernel.org>
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

