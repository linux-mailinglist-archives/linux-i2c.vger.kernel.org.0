Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD5C721C42
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 04:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbjFEC4I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jun 2023 22:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232607AbjFEC4H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jun 2023 22:56:07 -0400
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5C5C7;
        Sun,  4 Jun 2023 19:56:04 -0700 (PDT)
X-QQ-mid: bizesmtp91t1685933712tm175f56
Received: from wxdbg.localdomain.com ( [60.177.99.31])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Mon, 05 Jun 2023 10:55:10 +0800 (CST)
X-QQ-SSF: 01400000000000J0Z000000A0000000
X-QQ-FEAT: QityeSR92A0zhmDLP6CDAjLqZcyrn5M9b+ceM08vzFaA7F70P3hRBZgLk/Htu
        reGJAGwT5oROG9y75J6NJ/a8bQghjjek9jaUqCYOXTfHGlAwqgSD8l0OUZV1lbnjLLmI/fs
        MmuoTwdCzdKAidCR9yhBp/SpRsZBtYksdFIJlyTNulW7IDxNGiHCyK4aR4yp+xU8uqXo9sI
        p8Pp1KNNiackAerf8kkQtW9cOdIKkJEjvLoeU4ASVpqYCXMq/FYyEw5ZYHGknrmaZVKe8L5
        an8xHP9FADPxZvpV9cTXrNKHTRHNrC9Y0efb5+PAbobF+7kukXh2+GTXDcrZzevTduj0n8W
        U7TfOtiRMFbaBy7aW0sRCuF1gC5UkFDPxADoNlY/7Jk9ko2/OHpA/JdCKzul/GjA132+MXf
        7al3ytNRxSRblfbriUdgSw==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 13930050082724152923
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v11 9/9] net: txgbe: Support phylink MAC layer
Date:   Mon,  5 Jun 2023 10:52:11 +0800
Message-Id: <20230605025211.743823-10-jiawenwu@trustnetic.com>
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

Add phylink support to Wangxun 10Gb Ethernet controller for the 10GBASE-R
interface.

Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
---
 .../ethernet/wangxun/txgbe/txgbe_ethtool.c    |  28 +++++
 .../net/ethernet/wangxun/txgbe/txgbe_main.c   |  23 ++--
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 113 +++++++++++++++++-
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |   5 +
 4 files changed, 154 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
index d914e9a05404..859da112586a 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
@@ -6,11 +6,39 @@
 #include <linux/netdevice.h>
 
 #include "../libwx/wx_ethtool.h"
+#include "../libwx/wx_type.h"
+#include "txgbe_type.h"
 #include "txgbe_ethtool.h"
 
+static int txgbe_nway_reset(struct net_device *netdev)
+{
+	struct txgbe *txgbe = netdev_to_txgbe(netdev);
+
+	return phylink_ethtool_nway_reset(txgbe->phylink);
+}
+
+static int txgbe_get_link_ksettings(struct net_device *netdev,
+				    struct ethtool_link_ksettings *cmd)
+{
+	struct txgbe *txgbe = netdev_to_txgbe(netdev);
+
+	return phylink_ethtool_ksettings_get(txgbe->phylink, cmd);
+}
+
+static int txgbe_set_link_ksettings(struct net_device *netdev,
+				    const struct ethtool_link_ksettings *cmd)
+{
+	struct txgbe *txgbe = netdev_to_txgbe(netdev);
+
+	return phylink_ethtool_ksettings_set(txgbe->phylink, cmd);
+}
+
 static const struct ethtool_ops txgbe_ethtool_ops = {
 	.get_drvinfo		= wx_get_drvinfo,
+	.nway_reset		= txgbe_nway_reset,
 	.get_link		= ethtool_op_get_link,
+	.get_link_ksettings	= txgbe_get_link_ksettings,
+	.set_link_ksettings	= txgbe_set_link_ksettings,
 };
 
 void txgbe_set_ethtool_ops(struct net_device *netdev)
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c
index e6eee4446ea6..6caf0b0f202b 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_main.c
@@ -7,6 +7,7 @@
 #include <linux/netdevice.h>
 #include <linux/string.h>
 #include <linux/etherdevice.h>
+#include <linux/phylink.h>
 #include <net/ip.h>
 #include <linux/if_vlan.h>
 
@@ -204,7 +205,8 @@ static int txgbe_request_irq(struct wx *wx)
 
 static void txgbe_up_complete(struct wx *wx)
 {
-	u32 reg;
+	struct net_device *netdev = wx->netdev;
+	struct txgbe *txgbe;
 
 	wx_control_hw(wx, true);
 	wx_configure_vectors(wx);
@@ -213,24 +215,17 @@ static void txgbe_up_complete(struct wx *wx)
 	smp_mb__before_atomic();
 	wx_napi_enable_all(wx);
 
+	txgbe = netdev_to_txgbe(netdev);
+	phylink_start(txgbe->phylink);
+
 	/* clear any pending interrupts, may auto mask */
 	rd32(wx, WX_PX_IC(0));
 	rd32(wx, WX_PX_IC(1));
 	rd32(wx, WX_PX_MISC_IC);
 	txgbe_irq_enable(wx, true);
 
-	/* Configure MAC Rx and Tx when link is up */
-	reg = rd32(wx, WX_MAC_RX_CFG);
-	wr32(wx, WX_MAC_RX_CFG, reg);
-	wr32(wx, WX_MAC_PKT_FLT, WX_MAC_PKT_FLT_PR);
-	reg = rd32(wx, WX_MAC_WDG_TIMEOUT);
-	wr32(wx, WX_MAC_WDG_TIMEOUT, reg);
-	reg = rd32(wx, WX_MAC_TX_CFG);
-	wr32(wx, WX_MAC_TX_CFG, (reg & ~WX_MAC_TX_CFG_SPEED_MASK) | WX_MAC_TX_CFG_SPEED_10G);
-
 	/* enable transmits */
-	netif_tx_start_all_queues(wx->netdev);
-	netif_carrier_on(wx->netdev);
+	netif_tx_start_all_queues(netdev);
 }
 
 static void txgbe_reset(struct wx *wx)
@@ -265,7 +260,6 @@ static void txgbe_disable_device(struct wx *wx)
 		wx_disable_rx_queue(wx, wx->rx_ring[i]);
 
 	netif_tx_stop_all_queues(netdev);
-	netif_carrier_off(netdev);
 	netif_tx_disable(netdev);
 
 	wx_irq_disable(wx);
@@ -296,8 +290,11 @@ static void txgbe_disable_device(struct wx *wx)
 
 static void txgbe_down(struct wx *wx)
 {
+	struct txgbe *txgbe = netdev_to_txgbe(wx->netdev);
+
 	txgbe_disable_device(wx);
 	txgbe_reset(wx);
+	phylink_stop(txgbe->phylink);
 
 	wx_clean_all_tx_rings(wx);
 	wx_clean_all_rx_rings(wx);
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index 58e12c35627a..8779645a54be 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -11,8 +11,10 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/pcs/pcs-xpcs.h>
+#include <linux/phylink.h>
 
 #include "../libwx/wx_type.h"
+#include "../libwx/wx_lib.h"
 #include "../libwx/wx_hw.h"
 #include "txgbe_type.h"
 #include "txgbe_phy.h"
@@ -153,6 +155,95 @@ static int txgbe_mdio_pcs_init(struct txgbe *txgbe)
 	return 0;
 }
 
+static struct phylink_pcs *txgbe_phylink_mac_select(struct phylink_config *config,
+						    phy_interface_t interface)
+{
+	struct txgbe *txgbe = netdev_to_txgbe(to_net_dev(config->dev));
+
+	return &txgbe->xpcs->pcs;
+}
+
+static void txgbe_mac_config(struct phylink_config *config, unsigned int mode,
+			     const struct phylink_link_state *state)
+{
+}
+
+static void txgbe_mac_link_down(struct phylink_config *config,
+				unsigned int mode, phy_interface_t interface)
+{
+	struct wx *wx = netdev_priv(to_net_dev(config->dev));
+
+	wr32m(wx, WX_MAC_TX_CFG, WX_MAC_TX_CFG_TE, 0);
+}
+
+static void txgbe_mac_link_up(struct phylink_config *config,
+			      struct phy_device *phy,
+			      unsigned int mode, phy_interface_t interface,
+			      int speed, int duplex,
+			      bool tx_pause, bool rx_pause)
+{
+	struct wx *wx = netdev_priv(to_net_dev(config->dev));
+	u32 txcfg, wdg;
+
+	txcfg = rd32(wx, WX_MAC_TX_CFG);
+	txcfg &= ~WX_MAC_TX_CFG_SPEED_MASK;
+
+	switch (speed) {
+	case SPEED_10000:
+		txcfg |= WX_MAC_TX_CFG_SPEED_10G;
+		break;
+	case SPEED_1000:
+	case SPEED_100:
+	case SPEED_10:
+		txcfg |= WX_MAC_TX_CFG_SPEED_1G;
+		break;
+	default:
+		break;
+	}
+
+	wr32(wx, WX_MAC_TX_CFG, txcfg | WX_MAC_TX_CFG_TE);
+
+	/* Re configure MAC Rx */
+	wr32m(wx, WX_MAC_RX_CFG, WX_MAC_RX_CFG_RE, WX_MAC_RX_CFG_RE);
+	wr32(wx, WX_MAC_PKT_FLT, WX_MAC_PKT_FLT_PR);
+	wdg = rd32(wx, WX_MAC_WDG_TIMEOUT);
+	wr32(wx, WX_MAC_WDG_TIMEOUT, wdg);
+}
+
+static const struct phylink_mac_ops txgbe_mac_ops = {
+	.mac_select_pcs = txgbe_phylink_mac_select,
+	.mac_config = txgbe_mac_config,
+	.mac_link_down = txgbe_mac_link_down,
+	.mac_link_up = txgbe_mac_link_up,
+};
+
+static int txgbe_phylink_init(struct txgbe *txgbe)
+{
+	struct phylink_config *config;
+	struct fwnode_handle *fwnode;
+	struct wx *wx = txgbe->wx;
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
+
+	config = devm_kzalloc(&wx->pdev->dev, sizeof(*config), GFP_KERNEL);
+	if (!config)
+		return -ENOMEM;
+
+	config->dev = &wx->netdev->dev;
+	config->type = PHYLINK_NETDEV;
+	config->mac_capabilities = MAC_10000FD | MAC_1000FD | MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
+	phy_mode = PHY_INTERFACE_MODE_10GBASER;
+	__set_bit(PHY_INTERFACE_MODE_10GBASER, config->supported_interfaces);
+	fwnode = software_node_fwnode(txgbe->nodes.group[SWNODE_PHYLINK]);
+	phylink = phylink_create(config, fwnode, phy_mode, &txgbe_mac_ops);
+	if (IS_ERR(phylink))
+		return PTR_ERR(phylink);
+
+	txgbe->phylink = phylink;
+
+	return 0;
+}
+
 static int txgbe_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct wx *wx = gpiochip_get_data(chip);
@@ -316,6 +407,9 @@ static void txgbe_irq_handler(struct irq_desc *desc)
 	unsigned long gpioirq;
 	struct gpio_chip *gc;
 	unsigned long flags;
+	u32 eicr;
+
+	eicr = wx_misc_isb(wx, WX_ISB_MISC);
 
 	chained_irq_enter(chip, desc);
 
@@ -337,6 +431,12 @@ static void txgbe_irq_handler(struct irq_desc *desc)
 
 	chained_irq_exit(chip, desc);
 
+	if (eicr & (TXGBE_PX_MISC_ETH_LK | TXGBE_PX_MISC_ETH_LKDN)) {
+		u32 reg = rd32(wx, TXGBE_CFG_PORT_ST);
+
+		phylink_mac_change(txgbe->phylink, !!(reg & TXGBE_CFG_PORT_ST_LINK_UP));
+	}
+
 	/* unmask interrupt */
 	wx_intr_enable(wx, TXGBE_INTR_MISC(wx));
 }
@@ -514,16 +614,22 @@ int txgbe_init_phy(struct txgbe *txgbe)
 		goto err_unregister_swnode;
 	}
 
+	ret = txgbe_phylink_init(txgbe);
+	if (ret) {
+		wx_err(txgbe->wx, "failed to init phylink\n");
+		goto err_destroy_xpcs;
+	}
+
 	ret = txgbe_gpio_init(txgbe);
 	if (ret) {
 		wx_err(txgbe->wx, "failed to init gpio\n");
-		goto err_destroy_xpcs;
+		goto err_destroy_phylink;
 	}
 
 	ret = txgbe_clock_register(txgbe);
 	if (ret) {
 		wx_err(txgbe->wx, "failed to register clock: %d\n", ret);
-		goto err_destroy_xpcs;
+		goto err_destroy_phylink;
 	}
 
 	ret = txgbe_i2c_register(txgbe);
@@ -545,6 +651,8 @@ int txgbe_init_phy(struct txgbe *txgbe)
 err_unregister_clk:
 	clkdev_drop(txgbe->clock);
 	clk_unregister(txgbe->clk);
+err_destroy_phylink:
+	phylink_destroy(txgbe->phylink);
 err_destroy_xpcs:
 	xpcs_destroy(txgbe->xpcs);
 err_unregister_swnode:
@@ -559,6 +667,7 @@ void txgbe_remove_phy(struct txgbe *txgbe)
 	platform_device_unregister(txgbe->i2c_dev);
 	clkdev_drop(txgbe->clock);
 	clk_unregister(txgbe->clk);
+	phylink_destroy(txgbe->phylink);
 	xpcs_destroy(txgbe->xpcs);
 	software_node_unregister_node_group(txgbe->nodes.group);
 }
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 76470582ba1e..51199c355f95 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -77,6 +77,10 @@
 	 TXGBE_PX_MISC_ETH_AN | TXGBE_PX_MISC_INT_ERR |   \
 	 TXGBE_PX_MISC_GPIO)
 
+/* Port cfg registers */
+#define TXGBE_CFG_PORT_ST                       0x14404
+#define TXGBE_CFG_PORT_ST_LINK_UP               BIT(0)
+
 /* I2C registers */
 #define TXGBE_I2C_BASE                          0x14900
 
@@ -177,6 +181,7 @@ struct txgbe {
 	struct wx *wx;
 	struct txgbe_nodes nodes;
 	struct dw_xpcs *xpcs;
+	struct phylink *phylink;
 	struct platform_device *sfp_dev;
 	struct platform_device *i2c_dev;
 	struct clk_lookup *clock;
-- 
2.27.0

