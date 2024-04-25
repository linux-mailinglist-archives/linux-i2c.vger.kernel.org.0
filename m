Return-Path: <linux-i2c+bounces-3121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B26A8B1803
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 02:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C852B289FF0
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 00:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21921111A1;
	Thu, 25 Apr 2024 00:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ooz+ZMrB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06754A35;
	Thu, 25 Apr 2024 00:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714004816; cv=none; b=GjlQrAq9CADgzUv2szj4mHWjmu/tT9gHxHcHzu7FVlFbUqjxdaCyaUb1l/PnJ2mRAE/Zg8ftYfZ/FPNJsev+aS4t59+3Bn3cUoCnU8rjIe17zyUoeFusfscU8Y8HxYTBKEXiWJ3B9qfdJMbCfc4y8rKvCTYzGBG87aeUJaXBLRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714004816; c=relaxed/simple;
	bh=ZFagWEYvJBD4GgAH/EVhAXHdfVqrRJ5Qc84fXqDt6To=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u9jfYCYHq6f+Dj+eHPihl+ppe3+Mrsk+bNjS382SFXnqdHo7IMbSYedf3e+hJi7emlJutxPP4bYC4kUmArQpGWfkfbmuhQXnPl6NGf+ylh7A2707M9MdxbDlCffX1YIIGE07w/+0hegVWXj7XiCzyINP8wrvxNC8zQsq44BoqcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ooz+ZMrB; arc=none smtp.client-ip=192.19.144.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 68382C00150E;
	Wed, 24 Apr 2024 17:26:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 68382C00150E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714004805;
	bh=ZFagWEYvJBD4GgAH/EVhAXHdfVqrRJ5Qc84fXqDt6To=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ooz+ZMrBGXlrrU/+yGUPCdaHyWxl5xE1O4jhIf2L7xDTF/nF41mHEjyOB/ENbXiV8
	 58RWm616PZfFgHsrvglg9qcoF6MdMPY2Gpa6c0xmT2uqHCHiBeShN/+cupzcQc7Ajs
	 glAOkNNaDoPvttnzrlZHuODUHE0OLv+4JA5EGLyw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 76E9318041CAC6;
	Wed, 24 Apr 2024 17:26:43 -0700 (PDT)
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
Subject: [PATCH v2 4/4] net: txgbe: Utilize i2c-designware.h
Date: Wed, 24 Apr 2024 17:26:42 -0700
Message-Id: <20240425002642.2053657-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
References: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
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
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index 93295916b1d2..7545aacc9c19 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -8,6 +8,7 @@
 #include <linux/clkdev.h>
 #include <linux/i2c.h>
 #include <linux/pci.h>
+#include <linux/platform_data/i2c-designware.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/pcs/pcs-xpcs.h>
@@ -571,8 +572,8 @@ static int txgbe_clock_register(struct txgbe *txgbe)
 	char clk_name[32];
 	struct clk *clk;
 
-	snprintf(clk_name, sizeof(clk_name), "i2c_designware.%d",
-		 pci_dev_id(pdev));
+	snprintf(clk_name, sizeof(clk_name), "%s.%d",
+		 I2C_DESIGNWARE_NAME, pci_dev_id(pdev));
 
 	clk = clk_register_fixed_rate(NULL, clk_name, NULL, 0, 156250000);
 	if (IS_ERR(clk))
@@ -634,7 +635,7 @@ static int txgbe_i2c_register(struct txgbe *txgbe)
 
 	info.parent = &pdev->dev;
 	info.fwnode = software_node_fwnode(txgbe->nodes.group[SWNODE_I2C]);
-	info.name = "i2c_designware";
+	info.name = I2C_DESIGNWARE_NAME;
 	info.id = pci_dev_id(pdev);
 
 	info.res = &DEFINE_RES_IRQ(pdev->irq);
-- 
2.34.1


