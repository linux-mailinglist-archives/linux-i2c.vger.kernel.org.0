Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 462256FDDD4
	for <lists+linux-i2c@lfdr.de>; Wed, 10 May 2023 14:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237012AbjEJMcj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 May 2023 08:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236761AbjEJMci (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 May 2023 08:32:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90F349C0
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 05:32:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 79D2D62B76
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 12:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15ACC433D2;
        Wed, 10 May 2023 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683721955;
        bh=MxBP5jLAkaod1vzTeTn3KMLAWc/AHr+UNOpEZNvg6Ik=;
        h=From:Date:Subject:To:Cc:From;
        b=VZByduWC1kHJu0oDwQbaQ3J4zG3C0guPpvRfqPi6+H05DB82ZD0uE1W4rg6Pn/Xl/
         N6znYUHPxRhpDgFPOUkWEwW/KhrVA367xv4PsWM6v/71DEMxCdBFWmKq2VrrzHiDTC
         eCczpz4g4UMonLMd9qZep0gD9XJ+iDRiBO0cmrMnNRjsEMla2nZzjDOj8Qw8uGwMoW
         fjVjzWU4XQYuxWTfvsvg9CWrNjTrE5xngJ18+klLfz1WkblFjBW/QnSTZnw+kxrB/a
         +hhbGBp9zNpblPBkhqND+AHgSapRCsvK3CiFvDPGoDPmQ6/nJjEuiaM0ANyAsAYiub
         T+9c000bg/B+w==
From:   Simon Horman <horms@kernel.org>
Date:   Wed, 10 May 2023 14:32:17 +0200
Subject: [PATCH] i2c: mchp-pci1xxxx: Avoid cast to incompatible function
 type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>
X-B4-Tracking: v=1; b=H4sIANCOW2QC/x2NQQrDMAwEvxJ0rsBySEv7ldKDo8i1IHWNnZRAy
 N8rsrdZ2NkdmlSVBo9uhyo/bfrNBnTpgFPIb0GdjME737uBHKpn/HAqWFhps2BcMy82Qw5tQXc
 TvtIQ+7snMMsYmuBYQ+ZknrzOs5WlStTtvH2+juMP/uIpUYYAAAA=
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        llvm@lists.linux.dev, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index b21ffd6df927..5ef136c3ecb1 100644
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
 

