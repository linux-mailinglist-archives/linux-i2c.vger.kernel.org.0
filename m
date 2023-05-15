Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52F847024D7
	for <lists+linux-i2c@lfdr.de>; Mon, 15 May 2023 08:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238643AbjEOGfE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 May 2023 02:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbjEOGfB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 May 2023 02:35:01 -0400
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D75F1BE8;
        Sun, 14 May 2023 23:34:58 -0700 (PDT)
X-QQ-mid: bizesmtp69t1684132436t6gicsx9
Received: from wxdbg.localdomain.com ( [115.200.228.151])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Mon, 15 May 2023 14:33:55 +0800 (CST)
X-QQ-SSF: 01400000000000I0Z000000A0000000
X-QQ-FEAT: HHPuPN/BfjWhakRcBouU6vImE6WBESPHr/qEaKdWOnbDbnxv64SqoP4g3RPu+
        W0gvh+cU+hlnYy7rAgx/8RGiY09ZsQuj13D7MhQ5xOlX2OjOemiaK+/RZ0OGi9+fK2igoC1
        G2DqrJLBefmMHQjvxF+12Ur0cBNk90ksaTm6zqyvTraSGzXTcTQOnNITEvEqgfIh9AEYbnN
        dK0IefheiGOn+C8l1q0tMlJtzP+VisE+AOEVGNg54mn+XGAGpZfNHD1HZesPyMBqy5VTKr9
        CB0cBcT+vCCDpKcs4/wQpVrvPKY+ixCvl6GV26tgffsC2HgyepczZRAOAaTOlx9m6M1gZgI
        GfGTxOqkf1D+PtGebSPDh5LYlOtiethF8cSAIbiI9o3vE21enQRpZftx+n8HGc8SNcwkM0a
        kO5jFWH38kE=
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 17492628494908096986
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v8 8/9] net: txgbe: Implement phylink pcs
Date:   Mon, 15 May 2023 14:31:59 +0800
Message-Id: <20230515063200.301026-9-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230515063200.301026-1-jiawenwu@trustnetic.com>
References: <20230515063200.301026-1-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Register MDIO bus for PCS layer to use Synopsys designware XPCS, support
10GBASE-R interface to the controller.

Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
---
 drivers/net/ethernet/wangxun/Kconfig          |  1 +
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 97 ++++++++++++++++++-
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |  6 ++
 3 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/Kconfig b/drivers/net/ethernet/wangxun/Kconfig
index 73f4492928c0..f3fb273e6fd0 100644
--- a/drivers/net/ethernet/wangxun/Kconfig
+++ b/drivers/net/ethernet/wangxun/Kconfig
@@ -45,6 +45,7 @@ config TXGBE
 	select GPIOLIB
 	select REGMAP
 	select COMMON_CLK
+	select PCS_XPCS
 	select LIBWX
 	select SFP
 	help
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index aa8b4444e77a..36c6517c7266 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -8,6 +8,8 @@
 #include <linux/regmap.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/mdio.h>
 #include <linux/i2c.h>
 #include <linux/pci.h>
 
@@ -77,6 +79,88 @@ static int txgbe_swnodes_register(struct txgbe *txgbe)
 	return software_node_register_node_group(nodes->group);
 }
 
+static int txgbe_pcs_read(struct mii_bus *bus, int addr, int devnum, int regnum)
+{
+	struct wx *wx  = bus->priv;
+	u32 offset, val;
+
+	if (addr)
+		return -EOPNOTSUPP;
+
+	offset = devnum << 16 | regnum;
+
+	/* Set the LAN port indicator to IDA_ADDR */
+	wr32(wx, TXGBE_XPCS_IDA_ADDR, offset);
+
+	/* Read the data from IDA_DATA register */
+	val = rd32(wx, TXGBE_XPCS_IDA_DATA);
+
+	return (u16)val;
+}
+
+static int txgbe_pcs_write(struct mii_bus *bus, int addr, int devnum, int regnum, u16 val)
+{
+	struct wx *wx = bus->priv;
+	u32 offset;
+
+	if (addr)
+		return -EOPNOTSUPP;
+
+	offset = devnum << 16 | regnum;
+
+	/* Set the LAN port indicator to IDA_ADDR */
+	wr32(wx, TXGBE_XPCS_IDA_ADDR, offset);
+
+	/* Write the data to IDA_DATA register */
+	wr32(wx, TXGBE_XPCS_IDA_DATA, val);
+
+	return 0;
+}
+
+static int txgbe_mdio_pcs_init(struct txgbe *txgbe)
+{
+	struct mdio_device *mdiodev;
+	struct wx *wx = txgbe->wx;
+	struct mii_bus *mii_bus;
+	struct dw_xpcs *xpcs;
+	struct pci_dev *pdev;
+	int ret = 0;
+
+	pdev = wx->pdev;
+
+	mii_bus = devm_mdiobus_alloc(&pdev->dev);
+	if (!mii_bus)
+		return -ENOMEM;
+
+	mii_bus->name = "txgbe_pcs_mdio_bus";
+	mii_bus->read_c45 = &txgbe_pcs_read;
+	mii_bus->write_c45 = &txgbe_pcs_write;
+	mii_bus->parent = &pdev->dev;
+	mii_bus->phy_mask = ~0;
+	mii_bus->priv = wx;
+	snprintf(mii_bus->id, MII_BUS_ID_SIZE, "txgbe_pcs-%x",
+		 (pdev->bus->number << 8) | pdev->devfn);
+
+	ret = devm_mdiobus_register(&pdev->dev, mii_bus);
+	if (ret)
+		return ret;
+
+	mdiodev = mdio_device_create(mii_bus, 0);
+	if (IS_ERR(mdiodev))
+		return PTR_ERR(mdiodev);
+
+	xpcs = xpcs_create(mdiodev, PHY_INTERFACE_MODE_10GBASER);
+	if (IS_ERR(xpcs)) {
+		mdio_device_free(mdiodev);
+		return PTR_ERR(xpcs);
+	}
+
+	txgbe->mdiodev = mdiodev;
+	txgbe->xpcs = xpcs;
+
+	return 0;
+}
+
 static int txgbe_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wx *wx = gpiochip_get_data(chip);
@@ -423,16 +507,22 @@ int txgbe_init_phy(struct txgbe *txgbe)
 		return ret;
 	}
 
+	ret = txgbe_mdio_pcs_init(txgbe);
+	if (ret) {
+		wx_err(txgbe->wx, "failed to init mdio pcs: %d\n", ret);
+		goto err_unregister_swnode;
+	}
+
 	ret = txgbe_gpio_init(txgbe);
 	if (ret) {
 		wx_err(txgbe->wx, "failed to init gpio\n");
-		goto err_unregister_swnode;
+		goto err_destroy_xpcs;
 	}
 
 	ret = txgbe_clock_register(txgbe);
 	if (ret) {
 		wx_err(txgbe->wx, "failed to register clock: %d\n", ret);
-		goto err_unregister_swnode;
+		goto err_destroy_xpcs;
 	}
 
 	ret = txgbe_i2c_register(txgbe);
@@ -454,6 +544,8 @@ int txgbe_init_phy(struct txgbe *txgbe)
 err_unregister_clk:
 	clkdev_drop(txgbe->clock);
 	clk_unregister(txgbe->clk);
+err_destroy_xpcs:
+	xpcs_destroy(txgbe->xpcs);
 err_unregister_swnode:
 	software_node_unregister_node_group(txgbe->nodes.group);
 
@@ -466,5 +558,6 @@ void txgbe_remove_phy(struct txgbe *txgbe)
 	platform_device_unregister(txgbe->i2c_dev);
 	clkdev_drop(txgbe->clock);
 	clk_unregister(txgbe->clk);
+	xpcs_destroy(txgbe->xpcs);
 	software_node_unregister_node_group(txgbe->nodes.group);
 }
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 6c903e4517c7..6c0393c19b83 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -80,6 +80,10 @@
 /* I2C registers */
 #define TXGBE_I2C_BASE                          0x14900
 
+/************************************** ETH PHY ******************************/
+#define TXGBE_XPCS_IDA_ADDR                     0x13000
+#define TXGBE_XPCS_IDA_DATA                     0x13004
+
 /* Part Number String Length */
 #define TXGBE_PBANUM_LENGTH                     32
 
@@ -171,6 +175,8 @@ struct txgbe_nodes {
 struct txgbe {
 	struct wx *wx;
 	struct txgbe_nodes nodes;
+	struct mdio_device *mdiodev;
+	struct dw_xpcs *xpcs;
 	struct platform_device *sfp_dev;
 	struct platform_device *i2c_dev;
 	struct clk_lookup *clock;
-- 
2.27.0

