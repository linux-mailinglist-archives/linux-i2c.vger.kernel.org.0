Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A60C0721C38
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 04:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbjFECz6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Jun 2023 22:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjFECz5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Jun 2023 22:55:57 -0400
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3538BD;
        Sun,  4 Jun 2023 19:55:53 -0700 (PDT)
X-QQ-mid: bizesmtp91t1685933695tfksiyad
Received: from wxdbg.localdomain.com ( [60.177.99.31])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Mon, 05 Jun 2023 10:54:54 +0800 (CST)
X-QQ-SSF: 01400000000000J0Z000000A0000000
X-QQ-FEAT: +oIWmpEafD+EoQuwUxqJHSBUu6MT8p0DeRKj/ZYSPR4P6l+hNyNdFJ6gEmsC9
        mfjYbiPRdjEF9eq2x48BTGkFG4667EQ9VXyws8CuhdJ0YiBe9Irug1U7XJ6jS73FR0tU9bR
        T4SYGSTd8A0wOC9TJ1Bb6m1/PUM5T1WSgsKCjiIOmyntUTJlwkJ0TzlJprnUsWE7OeNuBYf
        6wvcATw/MZ6LGo3fyPvmCydqUNOTwbWw6ZxRcylO72/Mz/ELO4jMQn8UYBwhFamVd/RJlND
        ZTkeeh5PaHaF02H3BKi08QT39691uRLbpCt4hdaBtZ2w+jGzNOT1iSCkaVKI9t6pMImf6Pm
        uDA/C3Ca5vL3GOVQ04k7BmHcucX0LzQb2spN/REBjCNg0BhoHFcmlVZvWPkChbOdSeYyvxe
        2UmveB4fJQA5P5vBcGHfsg==
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 7898461126754656827
From:   Jiawen Wu <jiawenwu@trustnetic.com>
To:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk
Cc:     linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com, Jiawen Wu <jiawenwu@trustnetic.com>,
        Piotr Raczynski <piotr.raczynski@intel.com>
Subject: [PATCH net-next v11 5/9] net: txgbe: Add SFP module identify
Date:   Mon,  5 Jun 2023 10:52:07 +0800
Message-Id: <20230605025211.743823-6-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20230605025211.743823-1-jiawenwu@trustnetic.com>
References: <20230605025211.743823-1-jiawenwu@trustnetic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Register SFP platform device to get modules information.

Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Piotr Raczynski <piotr.raczynski@intel.com>
---
 drivers/net/ethernet/wangxun/Kconfig          |  3 ++
 .../net/ethernet/wangxun/txgbe/txgbe_phy.c    | 28 +++++++++++++++++++
 .../net/ethernet/wangxun/txgbe/txgbe_type.h   |  1 +
 3 files changed, 32 insertions(+)

diff --git a/drivers/net/ethernet/wangxun/Kconfig b/drivers/net/ethernet/wangxun/Kconfig
index 128cc1cb0605..59f3a3f492cf 100644
--- a/drivers/net/ethernet/wangxun/Kconfig
+++ b/drivers/net/ethernet/wangxun/Kconfig
@@ -44,6 +44,9 @@ config TXGBE
 	select REGMAP
 	select I2C
 	select I2C_DESIGNWARE_PLATFORM
+	select PHYLINK
+	select HWMON if TXGBE=y
+	select SFP
 	select LIBWX
 	help
 	  This driver supports Wangxun(R) 10GbE PCI Express family of
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index 24a729150e08..d95dc131e91b 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -158,6 +158,25 @@ static int txgbe_i2c_register(struct txgbe *txgbe)
 	return 0;
 }
 
+static int txgbe_sfp_register(struct txgbe *txgbe)
+{
+	struct pci_dev *pdev = txgbe->wx->pdev;
+	struct platform_device_info info = {};
+	struct platform_device *sfp_dev;
+
+	info.parent = &pdev->dev;
+	info.fwnode = software_node_fwnode(txgbe->nodes.group[SWNODE_SFP]);
+	info.name = "sfp";
+	info.id = (pdev->bus->number << 8) | pdev->devfn;
+	sfp_dev = platform_device_register_full(&info);
+	if (IS_ERR(sfp_dev))
+		return PTR_ERR(sfp_dev);
+
+	txgbe->sfp_dev = sfp_dev;
+
+	return 0;
+}
+
 int txgbe_init_phy(struct txgbe *txgbe)
 {
 	int ret;
@@ -180,8 +199,16 @@ int txgbe_init_phy(struct txgbe *txgbe)
 		goto err_unregister_clk;
 	}
 
+	ret = txgbe_sfp_register(txgbe);
+	if (ret) {
+		wx_err(txgbe->wx, "failed to register sfp\n");
+		goto err_unregister_i2c;
+	}
+
 	return 0;
 
+err_unregister_i2c:
+	platform_device_unregister(txgbe->i2c_dev);
 err_unregister_clk:
 	clkdev_drop(txgbe->clock);
 	clk_unregister(txgbe->clk);
@@ -193,6 +220,7 @@ int txgbe_init_phy(struct txgbe *txgbe)
 
 void txgbe_remove_phy(struct txgbe *txgbe)
 {
+	platform_device_unregister(txgbe->sfp_dev);
 	platform_device_unregister(txgbe->i2c_dev);
 	clkdev_drop(txgbe->clock);
 	clk_unregister(txgbe->clk);
diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 6e471a4d68cc..f420e2569247 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -150,6 +150,7 @@ struct txgbe_nodes {
 struct txgbe {
 	struct wx *wx;
 	struct txgbe_nodes nodes;
+	struct platform_device *sfp_dev;
 	struct platform_device *i2c_dev;
 	struct clk_lookup *clock;
 	struct clk *clk;
-- 
2.27.0

