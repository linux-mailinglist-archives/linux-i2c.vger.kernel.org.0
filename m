Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3051A6E58AA
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 07:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjDRFjO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 01:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjDRFjO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 01:39:14 -0400
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6EC64EEB;
        Mon, 17 Apr 2023 22:39:12 -0700 (PDT)
Received: from van1shing-pc.localdomain ([10.12.182.0])
        (user=silver_code@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 33I5cFvC014772-33I5cFvD014772
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 18 Apr 2023 13:38:35 +0800
From:   Wang Zhang <silver_code@hust.edu.cn>
To:     Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>
Cc:     hust-os-kernel-patches@googlegroups.com,
        Wang Zhang <silver_code@hust.edu.cn>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: ocores: add missing unwind goto in `ocores_i2c_probe`
Date:   Tue, 18 Apr 2023 13:38:13 +0800
Message-Id: <20230418053814.117215-1-silver_code@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: silver_code@hust.edu.cn
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Smatch Warns:
drivers/i2c/busses/i2c-ocores.c:701 ocores_i2c_probe() warn:
missing unwind goto?

The error handling code after the err_clk label should be executed to
release any resources that were allocated for the clock if a negative
error code returned after platform_get_irq_optional.

Fix this by changing the direct return to `goto err_clk`. 

Signed-off-by: Wang Zhang <silver_code@hust.edu.cn>
---
v2->v3: the first patch had issues. Just do a much simpler fix. No need 
to add the check. clk_disable_unprepare() has checks for error pointer 
and NULL already.
v1->v2: change `ocores_i2c_of_probe` to use `devm_clk_get_enabled()`
---
This patch was found by static analyzer.
...
 drivers/i2c/busses/i2c-ocores.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 2e575856c5cd..1df1439218c9 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -700,8 +700,10 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 	if (irq == -ENXIO) {
 		ocores_algorithm.master_xfer = ocores_xfer_polling;
 	} else {
-		if (irq < 0)
-			return irq;
+		if (irq < 0) {
+			ret = irq;
+			goto err_clk;
+		}
 	}
 
 	if (ocores_algorithm.master_xfer != ocores_xfer_polling) {
-- 
2.34.1

