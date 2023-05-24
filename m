Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBB6170F213
	for <lists+linux-i2c@lfdr.de>; Wed, 24 May 2023 11:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240626AbjEXJUu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 May 2023 05:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236340AbjEXJUt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 May 2023 05:20:49 -0400
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9871132;
        Wed, 24 May 2023 02:20:40 -0700 (PDT)
X-QQ-mid: bizesmtp69t1684919952tceo3eg3
Received: from wxdbg.localdomain.com ( [122.235.247.1])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Wed, 24 May 2023 17:19:11 +0800 (CST)
X-QQ-SSF: 01400000000000I0Z000000A0000000
X-QQ-FEAT: hoArX50alxGCNCVL8kXJ0qWdHUhLOdk8DmwDWawgvEyN5amrUwcIeP9FFc+ib
        ssYR9OyyWcc1HZ9z8jbmbjmrqc19z+DzkLj9QuatvtEVjp46Ynp6UrW0cLtiuz0Bf2OBLKn
        wpWMp9bFefCvtlXxkLUedSWtMuxGz3PunGpQhXj1/0IGBF4NrqvoDMMNNLyfIg5OR9LP/nt
        NdJFA0tiuKSOx6Jkhvf2fZvlBgwkbFtuQMLnKBHGrPUQEVW/6BRQ+NcJzPxN4PR9X7CeEc5
        H+vEFiG25d4gwj912Cpy9lMFWF5C3Im83qtaSN0OilZv/4JThIJNfJ2CUe5rQ6vvq0daslV
        3JLP2roszqWL4tCr5jVVToKeJ+Sz2Y3AuKLnu6mmrrMcV/Qmg/I1+z37zT6bSUijxdtunbq
        4T0ZgSjTGTTkDAuKlnB3qw==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 5649594363928881543
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v9 3/9] net: txgbe: Register fixed rate clock
Date:   Wed, 24 May 2023 17:17:16 +0800
Message-Id: <20230524091722.522118-4-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230524091722.522118-1-jiawenwu@trustnetic.com>
References: <20230524091722.522118-1-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In order for I2C to be able to work in standard mode, register a fixed
rate clock for each I2C device.

Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
---
 drivers/net/ethernet/wangxun/Kconfig          |  1 +
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 41 +++++++++++++++++++
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |  2 +
 3 files changed, 44 insertions(+)

diff --git a/drivers/net/ethernet/wangxun/Kconfig b/drivers/net/ethernet/wangxun/Kconfig
index c9d88673d306..a62614eeed2e 100644
--- a/drivers/net/ethernet/wangxun/Kconfig
+++ b/drivers/net/ethernet/wangxun/Kconfig
@@ -40,6 +40,7 @@ config NGBE
 config TXGBE
 	tristate "Wangxun(R) 10GbE PCI Express adapters support"
 	depends on PCI
+	select COMMON_CLK
 	select LIBWX
 	help
 	  This driver supports Wangxun(R) 10GbE PCI Express family of
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index be4b5ad74a3c..06506cfb8d06 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -2,6 +2,8 @@
 /* Copyright (c) 2015 - 2023 Beijing WangXun Technology Co., Ltd. */
 
 #include <linux/gpio/property.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
 #include <linux/i2c.h>
 #include <linux/pci.h>
 
@@ -70,6 +72,32 @@ static int txgbe_swnodes_register(struct txgbe *txgbe)
 	return software_node_register_node_group(nodes->group);
 }
 
+static int txgbe_clock_register(struct txgbe *txgbe)
+{
+	struct pci_dev *pdev = txgbe->wx->pdev;
+	struct clk_lookup *clock;
+	char clk_name[32];
+	struct clk *clk;
+
+	snprintf(clk_name, sizeof(clk_name), "i2c_designware.%d",
+		 (pdev->bus->number << 8) | pdev->devfn);
+
+	clk = clk_register_fixed_rate(NULL, clk_name, NULL, 0, 156250000);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	clock = clkdev_create(clk, NULL, clk_name);
+	if (!clock) {
+		clk_unregister(clk);
+		return -ENOMEM;
+	}
+
+	txgbe->clk = clk;
+	txgbe->clock = clock;
+
+	return 0;
+}
+
 int txgbe_init_phy(struct txgbe *txgbe)
 {
 	int ret;
@@ -80,10 +108,23 @@ int txgbe_init_phy(struct txgbe *txgbe)
 		return ret;
 	}
 
+	ret = txgbe_clock_register(txgbe);
+	if (ret) {
+		wx_err(txgbe->wx, "failed to register clock: %d\n", ret);
+		goto err_unregister_swnode;
+	}
+
 	return 0;
+
+err_unregister_swnode:
+	software_node_unregister_node_group(txgbe->nodes.group);
+
+	return ret;
 }
 
 void txgbe_remove_phy(struct txgbe *txgbe)
 {
+	clkdev_drop(txgbe->clock);
+	clk_unregister(txgbe->clk);
 	software_node_unregister_node_group(txgbe->nodes.group);
 }
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 5bef0f9df523..cdbc4b37f832 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -146,6 +146,8 @@ struct txgbe_nodes {
 struct txgbe {
 	struct wx *wx;
 	struct txgbe_nodes nodes;
+	struct clk_lookup *clock;
+	struct clk *clk;
 };
 
 #endif /* _TXGBE_TYPE_H_ */
-- 
2.27.0

