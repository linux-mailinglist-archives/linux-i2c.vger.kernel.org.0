Return-Path: <linux-i2c+bounces-94-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F377E930B
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 23:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6738B1F20DD4
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 22:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAEA1BDE3;
	Sun, 12 Nov 2023 22:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Mh6smUN+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A324E1BDC4
	for <linux-i2c@vger.kernel.org>; Sun, 12 Nov 2023 22:59:46 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B306259D
	for <linux-i2c@vger.kernel.org>; Sun, 12 Nov 2023 14:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=weeh1xfjw6v2qt9Xa+1Ylj5M0XC6rGMHc7p14xkXkmw=; b=Mh6smU
	N+PuTFZ3M1or2dyU0nYtqK5hQsHMrEUX0x1p9Woh7Bem1xL9VvADtgSXz4ZT4YsP
	ELWZ1grq6IY/+6NKWNVjRgw/XjZNgkwRsBk2jYJbp693df0iVBS/xqurHQMRhHjD
	rm+kVoxq+vV9O5eSV8ACWelzPwHUvmFWrAnkyJQmATPYVBe3VTHYWuLyTiGfZ8ur
	wyPZPAALt9WsAQbnSiMBHWwGLKsZe6Cn3BvW1EiKlTTDLHXecId6JCviEM8PG8KJ
	GE5qEDNLetZFvpNRPdL4rDv38+qUBJxDpibsu+9kns9v7qsds6XepAUIlRvw6OUs
	wYoBOZHPxgixX0dw==
Received: (qmail 4067067 invoked from network); 12 Nov 2023 23:59:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Nov 2023 23:59:42 +0100
X-UD-Smtp-Session: l3s3148p1@SxpBgvwJ/t4Mv8XD
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] i2c: npcm7xx: move to per-adapter debugfs directory
Date: Sun, 12 Nov 2023 17:59:11 -0500
Message-Id: <20231112225911.4650-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20231112225444.4487-1-wsa+renesas@sang-engineering.com>
References: <20231112225444.4487-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core now provides a per-adapter debugfs directory. Use it
instead of creating a custom one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 49 +++++---------------------------
 1 file changed, 7 insertions(+), 42 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index ae4bae63ad4f..54181b3f1919 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -326,7 +326,6 @@ struct npcm_i2c {
 	u8 slv_rd_buf[MAX_I2C_HW_FIFO_SIZE];
 	u8 slv_wr_buf[MAX_I2C_HW_FIFO_SIZE];
 #endif
-	struct dentry *debugfs; /* debugfs device directory */
 	u64 ber_cnt;
 	u64 rec_succ_cnt;
 	u64 rec_fail_cnt;
@@ -2250,27 +2249,15 @@ static const struct i2c_algorithm npcm_i2c_algo = {
 #endif
 };
 
-/* i2c debugfs directory: used to keep health monitor of i2c devices */
-static struct dentry *npcm_i2c_debugfs_dir;
-
 static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 				  struct npcm_i2c *bus)
 {
-	struct dentry *d;
-
-	if (!npcm_i2c_debugfs_dir)
-		return;
-	d = debugfs_create_dir(dev_name(&pdev->dev), npcm_i2c_debugfs_dir);
-	if (IS_ERR_OR_NULL(d))
-		return;
-	debugfs_create_u64("ber_cnt", 0444, d, &bus->ber_cnt);
-	debugfs_create_u64("nack_cnt", 0444, d, &bus->nack_cnt);
-	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
-	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
-	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
-	debugfs_create_u64("tx_complete_cnt", 0444, d, &bus->tx_complete_cnt);
-
-	bus->debugfs = d;
+	debugfs_create_u64("ber_cnt", 0444, bus->adap.debugfs, &bus->ber_cnt);
+	debugfs_create_u64("nack_cnt", 0444, bus->adap.debugfs, &bus->nack_cnt);
+	debugfs_create_u64("rec_succ_cnt", 0444, bus->adap.debugfs, &bus->rec_succ_cnt);
+	debugfs_create_u64("rec_fail_cnt", 0444, bus->adap.debugfs, &bus->rec_fail_cnt);
+	debugfs_create_u64("timeout_cnt", 0444, bus->adap.debugfs, &bus->timeout_cnt);
+	debugfs_create_u64("tx_complete_cnt", 0444, bus->adap.debugfs, &bus->tx_complete_cnt);
 }
 
 static int npcm_i2c_probe_bus(struct platform_device *pdev)
@@ -2362,7 +2349,6 @@ static void npcm_i2c_remove_bus(struct platform_device *pdev)
 	unsigned long lock_flags;
 	struct npcm_i2c *bus = platform_get_drvdata(pdev);
 
-	debugfs_remove_recursive(bus->debugfs);
 	spin_lock_irqsave(&bus->lock, lock_flags);
 	npcm_i2c_disable(bus);
 	spin_unlock_irqrestore(&bus->lock, lock_flags);
@@ -2385,28 +2371,7 @@ static struct platform_driver npcm_i2c_bus_driver = {
 	}
 };
 
-static int __init npcm_i2c_init(void)
-{
-	int ret;
-
-	npcm_i2c_debugfs_dir = debugfs_create_dir("npcm_i2c", NULL);
-
-	ret = platform_driver_register(&npcm_i2c_bus_driver);
-	if (ret) {
-		debugfs_remove_recursive(npcm_i2c_debugfs_dir);
-		return ret;
-	}
-
-	return 0;
-}
-module_init(npcm_i2c_init);
-
-static void __exit npcm_i2c_exit(void)
-{
-	platform_driver_unregister(&npcm_i2c_bus_driver);
-	debugfs_remove_recursive(npcm_i2c_debugfs_dir);
-}
-module_exit(npcm_i2c_exit);
+module_platform_driver(npcm_i2c_bus_driver);
 
 MODULE_AUTHOR("Avi Fishman <avi.fishman@gmail.com>");
 MODULE_AUTHOR("Tali Perry <tali.perry@nuvoton.com>");
-- 
2.35.1


