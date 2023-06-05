Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1403F721C3A
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 04:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbjFEC4B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jun 2023 22:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjFEC4A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jun 2023 22:56:00 -0400
Received: from smtpbg153.qq.com (smtpbg153.qq.com [13.245.218.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BE2C4;
        Sun,  4 Jun 2023 19:55:56 -0700 (PDT)
X-QQ-mid: bizesmtp91t1685933691tvjqe17l
Received: from wxdbg.localdomain.com ( [60.177.99.31])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Mon, 05 Jun 2023 10:54:50 +0800 (CST)
X-QQ-SSF: 01400000000000J0Z000000A0000000
X-QQ-FEAT: Gq6/1HjPYVUj9pFG0gSvlzLv1dD8bH7hS1PAdaWoc4Lst6zWCyk1gBT0G6sBF
        bAC1AWZPN0kzhDFWU0f+iY4mBVT2PHAYOL2CDwDxtemOc42ZM/cWGHA2h2OFFjMf8EV6n5o
        Tiy9qjaFY36/jzj/Z2ixWd2oGNXMudZJemHd7im9bVrM77lNEff+jW1kf48kk6hMAvSDFBD
        /qYS9O9c9gd3t0Q8DR5Hb/1aAnIr3H1smECUS2Mbl0vi/SfXQMM4hhTVz3DpDxHxHa7KTYQ
        HACSJvdCA109Pfk3A6LnkKAYBkQJQxrWfQcNWILbpOvrDzhLQuwtIG00d3d2ESliwn1M5jb
        jjGtCLANMCqGellNayo0nRyXNO8HBDXGWMHQoPzFSWyxfmHCH2l9Akg4PoTu+JzY2KvWFMy
        QMFHNyb3T6AnSbcNOSwBZA==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 1801423902774848963
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>,
        Piotr Raczynski <piotr.raczynski@intel.com>
Subject: [PATCH net-next v11 4/9] net: txgbe: Register I2C platform device
Date:   Mon,  5 Jun 2023 10:52:06 +0800
Message-Id: <20230605025211.743823-5-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230605025211.743823-1-jiawenwu@trustnetic.com>
References: <20230605025211.743823-1-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Register the platform device to use Designware I2C bus master driver.
Use regmap to read/write I2C device region from given base offset.

Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Piotr Raczynski <piotr.raczynski@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/net/ethernet/wangxun/Kconfig          |  3 +
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 70 +++++++++++++++++++
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |  4 ++
 3 files changed, 77 insertions(+)

diff --git a/drivers/net/ethernet/wangxun/Kconfig b/drivers/net/ethernet/wangxun/Kconfig
index 190d42a203b4..128cc1cb0605 100644
--- a/drivers/net/ethernet/wangxun/Kconfig
+++ b/drivers/net/ethernet/wangxun/Kconfig
@@ -41,6 +41,9 @@ config TXGBE
 	tristate "Wangxun(R) 10GbE PCI Express adapters support"
 	depends on PCI
 	depends on COMMON_CLK
+	select REGMAP
+	select I2C
+	select I2C_DESIGNWARE_PLATFORM
 	select LIBWX
 	help
 	  This driver supports Wangxun(R) 10GbE PCI Express family of
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index 06506cfb8d06..24a729150e08 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -6,6 +6,8 @@
 #include <linux/clkdev.h>
 #include <linux/i2c.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include "../libwx/wx_type.h"
 #include "txgbe_type.h"
@@ -98,6 +100,64 @@ static int txgbe_clock_register(struct txgbe *txgbe)
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
+	.fast_io = true,
+};
+
+static int txgbe_i2c_register(struct txgbe *txgbe)
+{
+	struct platform_device_info info = {};
+	struct platform_device *i2c_dev;
+	struct regmap *i2c_regmap;
+	struct pci_dev *pdev;
+	struct wx *wx;
+
+	wx = txgbe->wx;
+	pdev = wx->pdev;
+	i2c_regmap = devm_regmap_init(&pdev->dev, NULL, wx, &i2c_regmap_config);
+	if (IS_ERR(i2c_regmap)) {
+		wx_err(wx, "failed to init I2C regmap\n");
+		return PTR_ERR(i2c_regmap);
+	}
+
+	info.parent = &pdev->dev;
+	info.fwnode = software_node_fwnode(txgbe->nodes.group[SWNODE_I2C]);
+	info.name = "i2c_designware";
+	info.id = (pdev->bus->number << 8) | pdev->devfn;
+
+	info.res = &DEFINE_RES_IRQ(pdev->irq);
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
@@ -114,8 +174,17 @@ int txgbe_init_phy(struct txgbe *txgbe)
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
 
@@ -124,6 +193,7 @@ int txgbe_init_phy(struct txgbe *txgbe)
 
 void txgbe_remove_phy(struct txgbe *txgbe)
 {
+	platform_device_unregister(txgbe->i2c_dev);
 	clkdev_drop(txgbe->clock);
 	clk_unregister(txgbe->clk);
 	software_node_unregister_node_group(txgbe->nodes.group);
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 856d0f9d045b..6e471a4d68cc 100644
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
 
@@ -147,6 +150,7 @@ struct txgbe_nodes {
 struct txgbe {
 	struct wx *wx;
 	struct txgbe_nodes nodes;
+	struct platform_device *i2c_dev;
 	struct clk_lookup *clock;
 	struct clk *clk;
 };
-- 
2.27.0

