Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 554E059C95B
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 21:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237179AbiHVT5k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 15:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbiHVT5h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 15:57:37 -0400
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AF16540575
        for <linux-i2c@vger.kernel.org>; Mon, 22 Aug 2022 12:57:34 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 22 Aug 2022 22:57:31 +0300
Received: from bu-vnc02.mtbu.labs.mlnx (bu-vnc02.mtbu.labs.mlnx [10.15.2.65])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 27MJvUvs027428;
        Mon, 22 Aug 2022 15:57:30 -0400
Received: (from asmaa@localhost)
        by bu-vnc02.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 27MJvUmE012738;
        Mon, 22 Aug 2022 15:57:30 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v2 2/9] i2c-mlxbf.c: remove IRQF_ONESHOT
Date:   Mon, 22 Aug 2022 15:57:18 -0400
Message-Id: <20220822195725.12656-3-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20220822195725.12656-1-asmaa@nvidia.com>
References: <20220822195725.12656-1-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

IRQF_ONESHOT is not needed so remove it.

Fixes: b5b5b32081cd206b (i2c: mlxbf: I2C SMBus driver for Mellanox BlueField SoC)
Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 2e2ac45d9ca0..087a70981283 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2356,7 +2356,7 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 	ret = devm_request_irq(dev, irq, mlxbf_smbus_irq,
-			       IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED,
+			       IRQF_SHARED | IRQF_PROBE_SHARED,
 			       dev_name(dev), priv);
 	if (ret < 0) {
 		dev_err(dev, "Cannot get irq %d\n", irq);
-- 
2.30.1

