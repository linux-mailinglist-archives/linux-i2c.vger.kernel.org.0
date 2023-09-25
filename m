Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2F77AD57D
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Sep 2023 12:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbjIYKKg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Sep 2023 06:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbjIYKK1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Sep 2023 06:10:27 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1BA410D5
        for <linux-i2c@vger.kernel.org>; Mon, 25 Sep 2023 03:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=hWHpByxbxk7AQm4ckeZ/BJr0ENeshN7bukPmrgSsylY=; b=khcSAU
        NCK/odx7kxWOUUj/iyveRtOxxoZrF/ZvPXSLDmRMgaXFmKTqf4J0//ejFw3mBj17
        XQFYl0fJe/V9hiq1KzL9bY4dGG/LDPJrJdGhHKrtSzMIUI/I+9GHZkzkD4WaFD5P
        YUEHQTVU7ehyovvQthq2STbtw9cl/bKCBKxUzcBSa+7RpYLo3OwjUsJXE0A66SYt
        uR8vxrl3MpXgnbiRpsAF308gdHVJl9MP7p1JqiQOl356bBAzcoEC56zWECKRmY8n
        gUMEaEtAdgPe41z04k9Zb+s9rI55Brat3zZENXKb3C5vAaOVt4Zj+3THBfbNNw4z
        LfHbCb/GPyHpov6Q==
Received: (qmail 2356943 invoked from network); 25 Sep 2023 12:10:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2023 12:10:11 +0200
X-UD-Smtp-Session: l3s3148p1@kWviKSwGxWoucs9T
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Andi Shyti <andi.shyti@kernel.org>, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFT 3/3] i2c: npcm7xx: move to per-adapter debugfs directory
Date:   Mon, 25 Sep 2023 12:09:55 +0200
Message-Id: <20230925100956.117939-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230925100956.117939-1-wsa+renesas@sang-engineering.com>
References: <20230925100956.117939-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C core now provides a per-adapter debugfs directory. Use it
instead of creating a custom one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I could only build test this, so I would appreciate it very much if this
could be tested on actual HW. Thanks in advance!


 drivers/i2c/busses/i2c-npcm7xx.c | 49 +++++---------------------------
 1 file changed, 7 insertions(+), 42 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 495a8b5f6a2b..2326e7de9cf0 100644
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
@@ -2253,27 +2252,15 @@ static const struct i2c_algorithm npcm_i2c_algo = {
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
@@ -2365,7 +2352,6 @@ static void npcm_i2c_remove_bus(struct platform_device *pdev)
 	unsigned long lock_flags;
 	struct npcm_i2c *bus = platform_get_drvdata(pdev);
 
-	debugfs_remove_recursive(bus->debugfs);
 	spin_lock_irqsave(&bus->lock, lock_flags);
 	npcm_i2c_disable(bus);
 	spin_unlock_irqrestore(&bus->lock, lock_flags);
@@ -2388,28 +2374,7 @@ static struct platform_driver npcm_i2c_bus_driver = {
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

