Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7BA74B37B4
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Feb 2022 20:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbiBLTrV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Feb 2022 14:47:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbiBLTrV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Feb 2022 14:47:21 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB9E606D5
        for <linux-i2c@vger.kernel.org>; Sat, 12 Feb 2022 11:47:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id DD6ABCE098A
        for <linux-i2c@vger.kernel.org>; Sat, 12 Feb 2022 19:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A901FC340EF;
        Sat, 12 Feb 2022 19:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644695234;
        bh=ejW1a4SkngWJ9I15lG9w0hJyYltRmgO2PevXgvdV2E4=;
        h=From:To:Cc:Subject:Date:From;
        b=ZDsKUTodl0Ip4U9f0r2tKV7HiM+4gffWkof7liK/QXArb2ZRz64LtNJkB7/HwTWgN
         iL3A5XkX0led4KC74DcbEm8Z8UxE1itAcnqX6VzjmNx9dwGoykxUGSObtkL20o4V2X
         a7vm9a+xCcUFszXKrvEB60nfa/RaCr4pHSfImWjJKp0C9s6oKZ4KAXgH5xT5YnFkrE
         vXIpJIkKZ0g0idtxlUGsz2TI5smXeTHbYJXQjNpT/NHTNbB4U+HrfW4vGMbeE7FuiL
         VnHYX9CkMkVRhDNTuvICqUtnO5h28lufO7s5Q98LHZrEsyBcZlbQ0E1gxMbotYf7Zy
         JqlEtDTP4oh7A==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] i2c: qup: allow COMPILE_TEST
Date:   Sat, 12 Feb 2022 20:47:07 +0100
Message-Id: <20220212194707.11262-1-wsa@kernel.org>
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
index 255fd4198433..8a6c6ee28556 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -935,7 +935,7 @@ config I2C_QCOM_GENI
 
 config I2C_QUP
 	tristate "Qualcomm QUP based I2C controller"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for the
 	  built-in I2C interface on the Qualcomm SoCs.
-- 
2.30.2

