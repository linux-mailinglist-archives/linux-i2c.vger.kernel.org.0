Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C56C52C425
	for <lists+linux-i2c@lfdr.de>; Wed, 18 May 2022 22:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242522AbiERUW3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 May 2022 16:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242489AbiERUW2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 May 2022 16:22:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8F9EAD3B;
        Wed, 18 May 2022 13:22:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B4BB1619EB;
        Wed, 18 May 2022 20:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4542FC34117;
        Wed, 18 May 2022 20:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652905347;
        bh=HrYz3FGZgB2PCyAnTNtrp5GLfcExjPVN0IZKA7Llplo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z5/NqsnZ0LdgfxQ+0svO7n/vUtrbO0jf1LOw5SysyU7eF32U74G2AW0ClRArJpzA5
         NtHTQOzm0udN5+LtzhGVWMMBaD+/sTkVBhlcWzBxgck22Zk06pO1h9ii8XlX4jUZNN
         Zg5iQElvPx9jB+Y/ifymOMZ2rvn3C2j/BPksLSC+4NIHAzbhTOxl3efsryWKWRB0bC
         YYwpJ8RCFHx/hyiCY5FMFpSrJMd4o6061SKaEDhY4BCEqx/cUGDq5i1TtFQ/eQzyvs
         YcaMFvkdIbSMlJBT6G9baCz2LI/pFQ5frwyCFlhKXoId9/Pj3sRFTTgXf2IGwdGdGg
         nrd+f21abSNsQ==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     jarkko.nikula@linux.intel.com
Cc:     dinguyen@kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: i2c: dw: Add Intel's SoCFPGA I2C controller
Date:   Wed, 18 May 2022 15:22:17 -0500
Message-Id: <20220518202217.85803-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518202217.85803-1-dinguyen@kernel.org>
References: <20220518202217.85803-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
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

