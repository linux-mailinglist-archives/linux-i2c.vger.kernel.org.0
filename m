Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A5B59534C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 09:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbiHPHD5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 03:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbiHPHD1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 03:03:27 -0400
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB18314039F
        for <linux-i2c@vger.kernel.org>; Mon, 15 Aug 2022 19:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=+/H+J
        ZepilKMl7uAdj8q3XwPjql6UHtvP8uUztv6zJI=; b=hAi+g76RS/HpZMfj2EMg0
        8FRX8evZPcR7pWk9zRTmdvnhJ8d/foiKF2hlRZnq6p9WukHpw2VHSOTnu3wkwzbq
        6DMqdEvc9OTfIFOsrW+yrQuP/inlz78iWamk4iGGwQsSbc9RAVFckUmYMadysZAg
        fm3bbcSGxP1PDvNj2zpnJQ=
Received: from localhost.localdomain (unknown [116.128.244.169])
        by smtp8 (Coremail) with SMTP id NORpCgAX6ww0BvtiUPKdAA--.31891S2;
        Tue, 16 Aug 2022 10:51:32 +0800 (CST)
From:   wolfgang9277@126.com
To:     jarkko.nikula@linux.intel.com
Cc:     andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, p.zabel@pengutronix.de, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: designware: fix direct modify risk in xfer
Date:   Tue, 16 Aug 2022 10:51:11 +0800
Message-Id: <20220816025111.3702045-1-wolfgang9277@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgAX6ww0BvtiUPKdAA--.31891S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFWUJF1rXr4DXr4fWr4DArb_yoW8trW3pa
        ySkFnYyr18uF1q9FsYyr1IvFW0qayrKrW7CayxAwnFk3Z8Zw1jqFyrta4FkF1rKrW5ZFW7
        tayDKw4xGF1qqa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UApndUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xzrowwpdqjmjixx6ij2wof0z/1tbi7RRfFVpEAlAtAgAAsQ
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: wolfgang huang <huangjinhui@kylinos.com>

bind two or more slave devices to master device.
while master device is process reading, dev->msgs
used as a buffer to process the read data,
while the other device uses i2c_dw_xfer to read/write,
this will directly change dev->msgs, causing the
first device reading process to crash or other confusion.

so we should to check the device status before modifying
dev->msgs and others.

[ 1244.815334]  i2c_dw_isr+0x2c8/0x5e0
[ 1244.819238]  __handle_irq_event_percpu+0x5c/0x168
[ 1244.824350]  handle_irq_event_percpu+0x1c/0x58
[ 1244.829201]  handle_irq_event+0x40/0xa0
[ 1244.833449]  handle_fasteoi_irq+0xcc/0x1b0
[ 1244.837956]  generic_handle_irq+0x24/0x38
[ 1244.842376]  __handle_domain_irq+0x5c/0xb8
[ 1244.846883]  gic_handle_irq+0x94/0x1c8
[ 1244.851043]  el1_irq+0xb8/0x140
[ 1244.854599]  arch_cpu_idle+0x10/0x18
[ 1244.858588]  do_idle+0x19c/0x260
[ 1244.862231]  cpu_startup_entry+0x20/0x28

Signed-off-by: wolfgang huang <huangjinhui@kylinos.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 44a94b225ed8..07f7d5e2d12d 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -557,6 +557,14 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	pm_runtime_get_sync(dev->dev);
 
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		goto done_nolock;
+
+	ret = i2c_dw_wait_bus_not_busy(dev);
+	if (ret)
+		goto done;
+
 	/*
 	 * Initiate I2C message transfer when AMD NAVI GPU card is enabled,
 	 * As it is polling based transfer mechanism, which does not support
@@ -578,14 +586,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	dev->abort_source = 0;
 	dev->rx_outstanding = 0;
 
-	ret = i2c_dw_acquire_lock(dev);
-	if (ret)
-		goto done_nolock;
-
-	ret = i2c_dw_wait_bus_not_busy(dev);
-	if (ret < 0)
-		goto done;
-
 	/* Start the transfers */
 	i2c_dw_xfer_init(dev);
 
-- 
2.25.1

