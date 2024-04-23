Return-Path: <linux-i2c+bounces-3079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E958AFCB8
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 01:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8955A1C20B2A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 23:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361D0535C4;
	Tue, 23 Apr 2024 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G/2qjj1x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A219951C5B;
	Tue, 23 Apr 2024 23:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713915397; cv=none; b=i6O0wTXxQsHtn7ZY3Q9+w9qC9yFmWgrYiwxKe5xCuTV/mOVwW2BXsifZQXuAhQ4UGsKDc3MA/J9z82f/21Epfj5cHZZZ6Jq+dJKaAyIl2Am3GfWcOaPDTHpkOBttZ9VbsouMtIZ2h0yTav16w+OnMx2HCwj4rsavGIzGIqsZVQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713915397; c=relaxed/simple;
	bh=BlNAiO3Ob0kPQCj0nwB1iVkt/SR7XQ1oeTzzc6te+Jw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F8bebNwZ1ARRQICxp+OHD+BUMldMEam1yIBfgMKmCW+TO88CySrSKH/+Lb1AFE+u+oQ8gr79YgUHeJ1TR850EpgSpjie40Wbkp3dt5nrcCL5oyD4WdWcqF8OarO1hu++W/WJ8XvSYRLnu/SWPsBntgT0KEwTFYHMQzeVocWLVyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=G/2qjj1x; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8DED3C003ADC;
	Tue, 23 Apr 2024 16:36:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8DED3C003ADC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1713915389;
	bh=BlNAiO3Ob0kPQCj0nwB1iVkt/SR7XQ1oeTzzc6te+Jw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G/2qjj1xFe9BxMR83H9lupqaxOc4Iw4cALvbo5/BiPK/u0oKGo1TJCJswOEYZJng+
	 yghN+KTkfj2IV2+3mlR47EnpZRm+tgYvmUT9ykPaYENar1b3YtLjNMobLFLA5ugSyC
	 CnchbDAGyx3Ds3Cy7WvwULLpCuVxD8cICkLYtv2M=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 8B92018041CAC4;
	Tue, 23 Apr 2024 16:36:27 -0700 (PDT)
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
Subject: [PATCH 3/4] mfd: intel_quark_i2c_gpio: Utilize i2c-designware.h
Date: Tue, 23 Apr 2024 16:36:21 -0700
Message-Id: <20240423233622.1494708-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
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
index 9b9c76bd067b..5ddc9a57ca73 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -17,6 +17,7 @@
 #include <linux/clk-provider.h>
 #include <linux/dmi.h>
 #include <linux/i2c.h>
+#include <linux/i2c-designware.h>
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


