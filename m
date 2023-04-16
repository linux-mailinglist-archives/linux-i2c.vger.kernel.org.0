Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAC2B6E35C1
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Apr 2023 09:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjDPHb6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Apr 2023 03:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjDPHb5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 16 Apr 2023 03:31:57 -0400
Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E766171C;
        Sun, 16 Apr 2023 00:31:56 -0700 (PDT)
Received: from van1shing-pc.localdomain ([10.12.182.0])
        (user=silver_code@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 33G7Kkuo013655-33G7Kkup013655
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Sun, 16 Apr 2023 15:20:49 +0800
From:   Wang Zhang <silver_code@hust.edu.cn>
To:     Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>
Cc:     Wang Zhang <silver_code@hust.edu.cn>,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: ocores: add missing unwind goto in `ocores_i2c_probe`
Date:   Sun, 16 Apr 2023 15:20:40 +0800
Message-Id: <20230416072040.58373-1-silver_code@hust.edu.cn>
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

platform_get_irq_optional is a function used to obtain an IRQ
number for a device on a platform. The function returns the IRQ number
associated with the specified device, or a negative error code if it fails.

The error handling code after the err_clk label should be executed to
release any resources that were allocated for the clock if a negative
error code returned.

Fix this by assigning irq to ret and changing the direct return to err_clk.

Signed-off-by: Wang Zhang <silver_code@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/i2c/busses/i2c-ocores.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index a0af027db04c..95efad5a5a28 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -697,8 +697,10 @@ static int ocores_i2c_probe(struct platform_device *pdev)
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

