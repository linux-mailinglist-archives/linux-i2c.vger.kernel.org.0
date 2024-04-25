Return-Path: <linux-i2c+bounces-3179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC6E8B2B36
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EAB22870E7
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744EF15AAAC;
	Thu, 25 Apr 2024 21:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="emc2KvjJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1A8155739;
	Thu, 25 Apr 2024 21:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081489; cv=none; b=YSgb3V6IvQ3g9DE1MyzdlwwrLxAiPrlyLgrT3h4nmkuMa2QEzhJSnJ/RMOuswxWA+hPRHooEdZXC2lVTWt/kyg7HjqzW8Ez1fN96O/6dMs+zhAHwn6qhfK8Y4Vpsb2RhHC5Q+oIo+HjRV73xffe7lrThiBN74L0vm1abOd/DF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081489; c=relaxed/simple;
	bh=bh0Gh/pQHLvaTDCe1mGlX2hRI+Z5t3HiiUgGmfeGYOE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lG0WoH4oN7EyZZBQW2uuUGvnF1zAoRVdbywG9jL4y6tp+5Gn5OiAP0Ix40+89Q+KEY0YlQIobZy5i73qb3MKzse/fn1PDDJRBTc8Ixz52E/YSKSGXgJny5MoHzAlPmbQ0/On5CBaINagTVwXSt7S34eS0cy/u9PqZPTw1heUldo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=emc2KvjJ; arc=none smtp.client-ip=192.19.144.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 19B93C0003C8;
	Thu, 25 Apr 2024 14:44:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 19B93C0003C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714081483;
	bh=bh0Gh/pQHLvaTDCe1mGlX2hRI+Z5t3HiiUgGmfeGYOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=emc2KvjJesvvkf/wXqc/g2BFz47SK2fhKNpVUgwj2oaa9UhaAoIbNc5TMFLtKzafW
	 DIQg2Mvzb5uUpmHLP3dd7amPFTy8JunbkOjbJAig24iS7/tPI8u+Rb5qfbduBq0cZ6
	 43tVzwTTfmD8FtrbYczapRn1A/pKLeCDpdZgV2sg=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 1226418041CAC7;
	Thu, 25 Apr 2024 14:44:41 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	linux-i2c@vger.kernel.org (open list:SYNOPSYS DESIGNWARE I2C DRIVER),
	netdev@vger.kernel.org (open list:WANGXUN ETHERNET DRIVER)
Subject: [PATCH v3 5/5] net: txgbe: Utilize i2c-designware.h
Date: Thu, 25 Apr 2024 14:44:38 -0700
Message-Id: <20240425214438.2100534-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
References: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than open code the i2c_designware string, utilize the newly
defined constant in i2c-designware.h.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index 93295916b1d2..01a442c38248 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -13,6 +13,8 @@
 #include <linux/pcs/pcs-xpcs.h>
 #include <linux/phylink.h>
 
+#include <linux/platform_data/i2c-designware.h>
+
 #include "../libwx/wx_type.h"
 #include "../libwx/wx_lib.h"
 #include "../libwx/wx_hw.h"
@@ -571,7 +573,7 @@ static int txgbe_clock_register(struct txgbe *txgbe)
 	char clk_name[32];
 	struct clk *clk;
 
-	snprintf(clk_name, sizeof(clk_name), "i2c_designware.%d",
+	snprintf(clk_name, sizeof(clk_name), I2C_DESIGNWARE_NAME ".%d",
 		 pci_dev_id(pdev));
 
 	clk = clk_register_fixed_rate(NULL, clk_name, NULL, 0, 156250000);
@@ -634,7 +636,7 @@ static int txgbe_i2c_register(struct txgbe *txgbe)
 
 	info.parent = &pdev->dev;
 	info.fwnode = software_node_fwnode(txgbe->nodes.group[SWNODE_I2C]);
-	info.name = "i2c_designware";
+	info.name = I2C_DESIGNWARE_NAME;
 	info.id = pci_dev_id(pdev);
 
 	info.res = &DEFINE_RES_IRQ(pdev->irq);
-- 
2.34.1


