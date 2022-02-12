Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79384B37AF
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Feb 2022 20:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbiBLTqG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Feb 2022 14:46:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiBLTqF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Feb 2022 14:46:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BEA606CD;
        Sat, 12 Feb 2022 11:46:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5F348B8068F;
        Sat, 12 Feb 2022 19:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CED4C340E7;
        Sat, 12 Feb 2022 19:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644695158;
        bh=D5kuqxFtgNZgdrn3s7Yj+iwFmkMGtVe1YHCagXT5VzI=;
        h=From:To:Cc:Subject:Date:From;
        b=LvNcN6Dva4O9cO8rU20p8PbzRJM6PueXCImRI9u/USpsF6fK7UrLSz8Smnk7yymft
         c6rIUB028FcRBjxfjtHbzv6LHMFrfBlc+MUUJ6BU1xDapb2lGTMoWKD6i4Kv0Pj9vA
         3sZlx/vVTxDb7yiB4mpJEXA4+ch6av/RE0dmd9leE7i40mzq5HE7CgiNh1uxTrVwk5
         9FpDRPwZ/+ewQxaob5iiIio7lgGQ9xpSkcHGqbVopzYGWe2IdiiR3abCR3g3G1qp84
         BzxdOw8cHRmRry3FXwkw5hlZm2/YWd8yp62IOdeAHd6mJ2QKnBt8oLW3Y9ZZclT7+f
         iFAuAAUdSMjKw==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: cadence: allow COMPILE_TEST
Date:   Sat, 12 Feb 2022 20:45:48 +0100
Message-Id: <20220212194549.11021-1-wsa@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Driver builds fine with COMPILE_TEST. Enable it for wider test coverage
and easier maintenance.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 42da31c1ab70..bad2fadc94a3 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -488,7 +488,7 @@ config I2C_BRCMSTB
 
 config I2C_CADENCE
 	tristate "Cadence I2C Controller"
-	depends on ARCH_ZYNQ || ARM64 || XTENSA
+	depends on ARCH_ZYNQ || ARM64 || XTENSA || COMPILE_TEST
 	help
 	  Say yes here to select Cadence I2C Host Controller. This controller is
 	  e.g. used by Xilinx Zynq.
-- 
2.30.2

