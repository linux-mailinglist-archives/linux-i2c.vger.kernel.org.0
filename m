Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5B3732DCF
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 12:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245126AbjFPK14 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 06:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344011AbjFPK1S (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 06:27:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AF34233;
        Fri, 16 Jun 2023 03:26:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 79E40635D4;
        Fri, 16 Jun 2023 10:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCC8C433D9;
        Fri, 16 Jun 2023 10:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686911161;
        bh=WX97hGv7nM7zOSIgNl2gsNEkMonhpFfsgn9gTcWRj4Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iTE8Yvq+T7WqJknEDqPf9tVQ5mkhSk2TS5GJUp29tx6LCDbos77afil+a/LQd+/Bv
         cZczUC+eNTAKNuCUBKla6mLsS5NSm/gI2FAQ5+tOCbtFp7C4pUFuVY/BsmdudfRF5P
         BuKDqAzrf8SmF4WPIakc3ZWan8u5fbbY6fc6R2S8Fv9N1vts586DSBEkOyofsiDR0S
         vWMz+Du6Tkz4W3Au8gibFgP7BnmDCgSbUcERFQ6gv70RMpu4v/Gg55bqLHsucfQHF4
         EjJEUAHZ9T8finlielrbs9SCF6mwktiUFpsRB0Gx90gLques6FtK/77HQUmvrQCqXJ
         VNNc9RFnCydOg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Simon Horman <horms@kernel.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Wolfram Sang <wsa@kernel.org>, Sasha Levin <sashal@kernel.org>,
        kumaravel.thiagarajan@microchip.com, UNGLinuxDriver@microchip.com,
        nathan@kernel.org, ndesaulniers@google.com,
        linux-i2c@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.3 19/30] i2c: mchp-pci1xxxx: Avoid cast to incompatible function type
Date:   Fri, 16 Jun 2023 06:25:07 -0400
Message-Id: <20230616102521.673087-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102521.673087-1-sashal@kernel.org>
References: <20230616102521.673087-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Simon Horman <horms@kernel.org>

[ Upstream commit 7ebfd881abe9e0ea9557b29dab6aa28d294fabb4 ]

Rather than casting pci1xxxx_i2c_shutdown to an incompatible function type,
update the type to match that expected by __devm_add_action.

Reported by clang-16 with W-1:

 .../i2c-mchp-pci1xxxx.c:1159:29: error: cast from 'void (*)(struct pci1xxxx_i2c *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
         ret = devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shutdown, i2c);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ./include/linux/device.h:251:29: note: expanded from macro 'devm_add_action'
         __devm_add_action(release, action, data, #action)
                                   ^~~~~~

No functional change intended.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Tharun Kumar P<tharunkumar.pasumarthi@microchip.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index b21ffd6df9276..5ef136c3ecb12 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -1118,8 +1118,10 @@ static int pci1xxxx_i2c_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(pci1xxxx_i2c_pm_ops, pci1xxxx_i2c_suspend,
 			 pci1xxxx_i2c_resume);
 
-static void pci1xxxx_i2c_shutdown(struct pci1xxxx_i2c *i2c)
+static void pci1xxxx_i2c_shutdown(void *data)
 {
+	struct pci1xxxx_i2c *i2c = data;
+
 	pci1xxxx_i2c_config_padctrl(i2c, false);
 	pci1xxxx_i2c_configure_core_reg(i2c, false);
 }
@@ -1156,7 +1158,7 @@ static int pci1xxxx_i2c_probe_pci(struct pci_dev *pdev,
 	init_completion(&i2c->i2c_xfer_done);
 	pci1xxxx_i2c_init(i2c);
 
-	ret = devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shutdown, i2c);
+	ret = devm_add_action(dev, pci1xxxx_i2c_shutdown, i2c);
 	if (ret)
 		return ret;
 
-- 
2.39.2

