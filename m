Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD07928CB5E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Oct 2020 12:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgJMKFd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Oct 2020 06:05:33 -0400
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:57528 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726495AbgJMKFd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Oct 2020 06:05:33 -0400
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 09DA3P1A022735;
        Tue, 13 Oct 2020 13:03:25 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
        id 533D8639D6; Tue, 13 Oct 2020 13:03:25 +0300 (IDT)
From:   Tali Perry <tali.perry1@gmail.com>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com, xqiu@google.com,
        kunyi@google.com, benjaminfair@google.com, avifishman70@gmail.com,
        joel@jms.id.au, tmaimon77@gmail.com
Cc:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v2] i2c: npcm7xx: Support changing bus speed using debugfs.
Date:   Tue, 13 Oct 2020 13:03:14 +0300
Message-Id: <20201013100314.216154-1-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Systems that can dynamically add and remove slave devices
often need to change the bus speed in runtime.
This patch expose the bus frequency to the user.
This feature can also be used for test automation.

--
v2 -> v1:
	- Fix typos.
	- Remove casting to u64.
	
v1: initial version

Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2ad166355ec9..633ac67153e2 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2208,6 +2208,40 @@ static const struct i2c_algorithm npcm_i2c_algo = {
 /* i2c debugfs directory: used to keep health monitor of i2c devices */
 static struct dentry *npcm_i2c_debugfs_dir;
 
+static int i2c_speed_get(void *data, u64 *val)
+{
+	struct npcm_i2c *bus = data;
+
+	*val = bus->bus_freq;
+	return 0;
+}
+
+static int i2c_speed_set(void *data, u64 val)
+{
+	struct npcm_i2c *bus = data;
+	int ret;
+
+	if (val < I2C_FREQ_MIN_HZ || val > I2C_FREQ_MAX_HZ)
+		return -EINVAL;
+
+	if (val == bus->bus_freq)
+		return 0;
+
+	i2c_lock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	npcm_i2c_int_enable(bus, false);
+
+	ret = npcm_i2c_init_module(bus, I2C_MASTER, (u32)val);
+
+	i2c_unlock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
+
+	if (ret)
+		return -EAGAIN;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(i2c_clock_ops, i2c_speed_get, i2c_speed_set, "%llu\n");
+
 static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 				  struct npcm_i2c *bus)
 {
@@ -2223,6 +2257,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
 	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
 	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
+	debugfs_create_file("i2c_speed", 0644, d, bus, &i2c_clock_ops);
 
 	bus->debugfs = d;
 }

base-commit: 865c50e1d279671728c2936cb7680eb89355eeea
-- 
2.22.0

