Return-Path: <linux-i2c+bounces-3118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6CE8B17FB
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 02:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E0701C22E06
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 00:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687F93FC2;
	Thu, 25 Apr 2024 00:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Dr044oAK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58A4816;
	Thu, 25 Apr 2024 00:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714004813; cv=none; b=soim5JsMVr4oiDbNgepGn4LI0/G7s0CBf6IFtLPNXvSpj7OoZBbC1L1E9s9dFaEVwQO1Wt5IrFu7PPX3WupjnoMqtlBeL74eZYLN2roZdnlyQrBkaPlub+yu2N5TbJD/yqmp3ly8rB4WIOOif2QmlwlcPxX84nh1QN0JZYuQiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714004813; c=relaxed/simple;
	bh=KUOLZ8zPxT+a28U7lKki1joh8uQ88dQcZ5pMqNkBKAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=flHRGKZss9iY5wKHyyF4pUjJjYt7+oc3TZHrAO8u1n3UQZ33GSi4ji9TFHBUWXZg18WDM2k3XEEXvAL44snVEbL9D+/zQl+itw+rI2Ij8wBFGX2RydzrakXiAi+fuMPOvFxEV9Uaj/11AEMHyNN6p+JtzLKCs5H1JdB4BIfBsxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Dr044oAK; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 28A4EC000C95;
	Wed, 24 Apr 2024 17:26:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 28A4EC000C95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714004805;
	bh=KUOLZ8zPxT+a28U7lKki1joh8uQ88dQcZ5pMqNkBKAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dr044oAKpqzzjau3IcyhuFVqup8yhk3MUeKMCfqcgh929t4aDtsLbtSzJAh9eYEIJ
	 XTBJM+ysMTR+tIpUnQI4wWPIWeSuvXFCo37vPyYMixVIvoOrZPyjXHWWjpg8Ax1q+O
	 hmnxWYl3N2z4BGs8S1RGLglAzGYGvFn/zfTOFvqc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 3B21618041CAC4;
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
Subject: [PATCH v2 3/4] mfd: intel_quark_i2c_gpio: Utilize i2c-designware.h
Date: Wed, 24 Apr 2024 17:26:41 -0700
Message-Id: <20240425002642.2053657-4-florian.fainelli@broadcom.com>
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
 drivers/mfd/intel_quark_i2c_gpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 9b9c76bd067b..08e296fc56f3 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -17,6 +17,7 @@
 #include <linux/clk-provider.h>
 #include <linux/dmi.h>
 #include <linux/i2c.h>
+#include <linux/platform_data/i2c-designware.h>
 #include <linux/property.h>
 
 /* PCI BAR for register base address */
@@ -30,7 +31,7 @@
 #define INTEL_QUARK_IORES_MEM	0
 #define INTEL_QUARK_IORES_IRQ	1
 
-#define INTEL_QUARK_I2C_CONTROLLER_CLK "i2c_designware.0"
+#define INTEL_QUARK_I2C_CONTROLLER_CLK I2C_DESIGNWARE_NAME ".0"
 
 /* The Quark I2C controller source clock */
 #define INTEL_QUARK_I2C_CLK_HZ	33000000
@@ -136,7 +137,7 @@ static const struct software_node *intel_quark_gpio_node_group[] = {
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


