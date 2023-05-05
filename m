Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96DFC6F7DED
	for <lists+linux-i2c@lfdr.de>; Fri,  5 May 2023 09:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjEEHcb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 May 2023 03:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjEEHca (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 May 2023 03:32:30 -0400
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D3D11601
        for <linux-i2c@vger.kernel.org>; Fri,  5 May 2023 00:32:20 -0700 (PDT)
X-QQ-mid: bizesmtp75t1683271759tu281r48
Received: from wxdbg.localdomain.com ( [36.24.99.3])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Fri, 05 May 2023 15:29:17 +0800 (CST)
X-QQ-SSF: 01400000000000I0Z000000A0000000
X-QQ-FEAT: QityeSR92A2BdjuRIomhCyOo8JyRuq8dVKBV9Sb6p08o2EJpu9MAA9bw3L/kV
        66xByq8FRrdvOYb8AHcKscPVI8BSi16V15zk4uPHZw2Q6wdFUgsDhWygpQ0lpBtb3KGCHpt
        4Jh9Ccu970/RzWB3wheCNd9RlUOKr8BjVkpiksMleU5Z1FWl+QLCIvqtVUdPWnLXP1lLbk1
        VwqAe1z1pleg0a1Dj3Y42Jo5wmMrmwl9WCfCStxX8BcVsgSgBPkNuewsph75vsLUEReESMR
        BXcibQ3XZPWcVLZcsGgtkqKDxIIwXQYIelARkUk1PtBLysHqYVZV3JPSndt+/hyKrqh3/tm
        FftwkDrEs9Bqq7lhSKaJuIp/2WoVFExSS42A21lijV1WZn6b6/y+wpCFlqKkCy812F4zxkw
        /tYuIqrpEFJNs3vWr/O9Lw==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 1790365272092144346
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [RFC PATCH net-next v6 4/9] net: txgbe: Register I2C platform device
Date:   Fri,  5 May 2023 15:42:23 +0800
Message-Id: <20230505074228.84679-5-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230505074228.84679-1-jiawenwu@trustnetic.com>
References: <20230505074228.84679-1-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Register the platform device to use Designware I2C bus master driver.
Use regmap to read/write I2C device region from given base offset.

Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
---
 drivers/net/ethernet/wangxun/Kconfig          |  2 +
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 71 +++++++++++++++++++
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |  4 ++
 3 files changed, 77 insertions(+)

diff --git a/drivers/net/ethernet/wangxun/Kconfig b/drivers/net/ethernet/wangxun/Kconfig
index a62614eeed2e..ec058a72afb6 100644
--- a/drivers/net/ethernet/wangxun/Kconfig
+++ b/drivers/net/ethernet/wangxun/Kconfig
@@ -40,6 +40,8 @@ config NGBE
 config TXGBE
 	tristate "Wangxun(R) 10GbE PCI Express adapters support"
 	depends on PCI
+	select I2C_DESIGNWARE_PLATFORM
+	select REGMAP
 	select COMMON_CLK
 	select LIBWX
 	help
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index 47509ad54e89..6cb58b82a8a8 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (c) 2015 - 2023 Beijing WangXun Technology Co., Ltd. */
 
+#include <linux/platform_device.h>
 #include <linux/gpio/property.h>
+#include <linux/regmap.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/i2c.h>
@@ -98,6 +100,65 @@ static int txgbe_clock_register(struct txgbe *txgbe)
 	return 0;
 }
 
+static int txgbe_i2c_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct wx *wx = context;
+
+	*val = rd32(wx, reg + TXGBE_I2C_BASE);
+
+	return 0;
+}
+
+static int txgbe_i2c_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct wx *wx = context;
+
+	wr32(wx, reg + TXGBE_I2C_BASE, val);
+
+	return 0;
+}
+
+static const struct regmap_config i2c_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_read = txgbe_i2c_read,
+	.reg_write = txgbe_i2c_write,
+};
+
+static int txgbe_i2c_register(struct txgbe *txgbe)
+{
+	struct platform_device_info info = {};
+	struct platform_device *i2c_dev;
+	struct wx *wx = txgbe->wx;
+	struct regmap *i2c_regmap;
+	struct resource res = {};
+	struct pci_dev *pdev;
+
+	pdev = wx->pdev;
+	i2c_regmap = devm_regmap_init(&pdev->dev, NULL, wx,
+				      &i2c_regmap_config);
+	if (IS_ERR(i2c_regmap)) {
+		wx_err(wx, "failed to init regmap\n");
+		return PTR_ERR(i2c_regmap);
+	}
+
+	info.parent = &pdev->dev;
+	info.fwnode = software_node_fwnode(txgbe->nodes.group[SWNODE_I2C]);
+	info.name = "i2c_designware";
+	info.id = (pdev->bus->number << 8) | pdev->devfn;
+
+	res = DEFINE_RES_IRQ(pdev->irq);
+	info.res = &res;
+	info.num_res = 1;
+	i2c_dev = platform_device_register_full(&info);
+	if (IS_ERR(i2c_dev))
+		return PTR_ERR(i2c_dev);
+
+	txgbe->i2c_dev = i2c_dev;
+
+	return 0;
+}
+
 int txgbe_init_phy(struct txgbe *txgbe)
 {
 	int ret;
@@ -114,8 +175,17 @@ int txgbe_init_phy(struct txgbe *txgbe)
 		goto err_unregister_swnode;
 	}
 
+	ret = txgbe_i2c_register(txgbe);
+	if (ret) {
+		wx_err(txgbe->wx, "failed to init i2c interface: %d\n", ret);
+		goto err_unregister_clk;
+	}
+
 	return 0;
 
+err_unregister_clk:
+	clkdev_drop(txgbe->clock);
+	clk_unregister(txgbe->clk);
 err_unregister_swnode:
 	software_node_unregister_node_group(txgbe->nodes.group);
 
@@ -124,6 +194,7 @@ int txgbe_init_phy(struct txgbe *txgbe)
 
 void txgbe_remove_phy(struct txgbe *txgbe)
 {
+	platform_device_unregister(txgbe->i2c_dev);
 	clkdev_drop(txgbe->clock);
 	clk_unregister(txgbe->clk);
 	software_node_unregister_node_group(txgbe->nodes.group);
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index cdbc4b37f832..55979abf01f2 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -55,6 +55,9 @@
 #define TXGBE_TS_CTL                            0x10300
 #define TXGBE_TS_CTL_EVAL_MD                    BIT(31)
 
+/* I2C registers */
+#define TXGBE_I2C_BASE                          0x14900
+
 /* Part Number String Length */
 #define TXGBE_PBANUM_LENGTH                     32
 
@@ -146,6 +149,7 @@ struct txgbe_nodes {
 struct txgbe {
 	struct wx *wx;
 	struct txgbe_nodes nodes;
+	struct platform_device *i2c_dev;
 	struct clk_lookup *clock;
 	struct clk *clk;
 };
-- 
2.27.0

