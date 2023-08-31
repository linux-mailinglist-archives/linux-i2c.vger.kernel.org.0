Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC48D78F260
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 20:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242148AbjHaSSN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 14:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244232AbjHaSSM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 14:18:12 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8616E63
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 11:18:09 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 727468657F;
        Thu, 31 Aug 2023 20:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1693505888;
        bh=P/1f2J/c+3Ic9WT9oy6mwXSQDEz17yKxQnoArGuUDQs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MJLRqbhCc5RZ92voDs4jlnGueOoQYCZvmatm8FNkRr2hHMY2LSZ04GnHREMObjLaQ
         LCCWdEVMWhVrTQZ3NyXMB6nLRmTzqDHIBDVQJYcHlfQVcFQGXRa4pjI6Hb111514wn
         Zk1qKZP434EpD6YYa6YfG4tFnc5x+rGlW7A8ZsUfKeYd+zd/Edl2+wtKO8AAS/Y6kc
         xvV3iMxtjMbInoKgx8ELXY+Pm4Lsx8KIkQ7YJJUJCdsbKX7mp2Gqn83uc/bmZNLKrk
         UgbdIwBDCXuhMPN7pPL/U0YOyiWHrQ+PjF8zmJ95zI4GGjM1KOv+LMUz6IElsuTeXY
         TeObbd9rpTZqg==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 2/2] i2c: mux: pca954x: Resume the mux early
Date:   Thu, 31 Aug 2023 20:17:53 +0200
Message-Id: <20230831181753.154787-2-marex@denx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230831181753.154787-1-marex@denx.de>
References: <20230831181753.154787-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The mux resumes alongside its subdevices, which means the subdevices may
resume while the mux is not yet fully configured and those subdevices may
fail to access I2C registers through the mux. Use resume_early to resume
the mux before any of the other i2c devices.

Signed-off-by: Marek Vasut <marex@denx.de>
---
NOTE: This might be wrong approach
---
Cc: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 97cf475dde0f4..87fd8d3ba56b2 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -627,12 +627,14 @@ static int pca954x_resume(struct device *dev)
 	return ret;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(pca954x_pm, NULL, pca954x_resume);
+static const struct dev_pm_ops pca954x_pm = {
+	.resume_early = pca954x_resume,
+};
 
 static struct i2c_driver pca954x_driver = {
 	.driver		= {
 		.name	= "pca954x",
-		.pm	= pm_sleep_ptr(&pca954x_pm),
+		.pm	= &pca954x_pm,
 		.of_match_table = pca954x_of_match,
 	},
 	.probe		= pca954x_probe,
-- 
2.40.1

