Return-Path: <linux-i2c+bounces-3177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C78B2B2D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FC121F22C63
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08D8156640;
	Thu, 25 Apr 2024 21:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PzZbIkb3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA6515573A;
	Thu, 25 Apr 2024 21:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081485; cv=none; b=D8VdTvyG3tqlGVz34h50SVjJ6JdGBwdeR8gOUF/milbjNCfN/ugpZpJZxAfE+HGYOe+RK2J+aDqFuJXe9Sf6sD42PETls4QOY/gIuJIb2VkR/Y4mKnBhixm0hUPutj2ePYZ0cXq7y826sj6jilguzFRKQWCo9HL4WHCM16RK+GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081485; c=relaxed/simple;
	bh=thjt11Q2mq8PIMSTXSWsp2Op1jKN73Dixr5yJcrrc/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SRQeThMMIRv/VJJXKe9QGQRX6AhfX4+hbZ6Co7wqrC2STmLG/Ks5PH8FgyW36TANiMDmadc3jC0efo8yCNWcgGr92Rr1fTi2Bomd++pxjbzbQKk4pHXVu5fNiOZjrUGKpE9e5SXazYvLTT8xHvzcMNFSSjlpsh99uanMMU+P5g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PzZbIkb3; arc=none smtp.client-ip=192.19.144.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1C34BC0003CF;
	Thu, 25 Apr 2024 14:44:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1C34BC0003CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714081483;
	bh=thjt11Q2mq8PIMSTXSWsp2Op1jKN73Dixr5yJcrrc/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PzZbIkb3/uddE859zhNN5Fx4hZRfqFXfc+fRmkwuom7Ypa4RCDw7bZfBvfFH1t04s
	 t9TLFuVLnMzE0iHsAe+tqQg5UavqwXab1GRdJksZRvtNXRLTUxvxUvrLtg+IirUkOD
	 fjOoBWXYuCUbY14TsTvQtpbgDqyNpkLo2RDqzSEQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id C9F5318041CAC6;
	Thu, 25 Apr 2024 14:44:40 -0700 (PDT)
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
Subject: [PATCH v3 4/5] mfd: intel_quark_i2c_gpio: Utilize i2c-designware.h
Date: Thu, 25 Apr 2024 14:44:37 -0700
Message-Id: <20240425214438.2100534-5-florian.fainelli@broadcom.com>
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
 drivers/mfd/intel_quark_i2c_gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 9b9c76bd067b..86620de5c9ba 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -19,6 +19,8 @@
 #include <linux/i2c.h>
 #include <linux/property.h>
 
+#include <linux/platform_data/i2c-designware.h>
+
 /* PCI BAR for register base address */
 #define MFD_I2C_BAR		0
 #define MFD_GPIO_BAR		1
@@ -30,7 +32,7 @@
 #define INTEL_QUARK_IORES_MEM	0
 #define INTEL_QUARK_IORES_IRQ	1
 
-#define INTEL_QUARK_I2C_CONTROLLER_CLK "i2c_designware.0"
+#define INTEL_QUARK_I2C_CONTROLLER_CLK I2C_DESIGNWARE_NAME ".0"
 
 /* The Quark I2C controller source clock */
 #define INTEL_QUARK_I2C_CLK_HZ	33000000
@@ -136,7 +138,7 @@ static const struct software_node *intel_quark_gpio_node_group[] = {
 static struct mfd_cell intel_quark_mfd_cells[] = {
 	[MFD_I2C_BAR] = {
 		.id = MFD_I2C_BAR,
-		.name = "i2c_designware",
+		.name = I2C_DESIGNWARE_NAME,
 		.acpi_match = &intel_quark_acpi_match_i2c,
 		.num_resources = ARRAY_SIZE(intel_quark_i2c_res),
 		.resources = intel_quark_i2c_res,
-- 
2.34.1


