Return-Path: <linux-i2c+bounces-4526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB00D91E15E
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28D3EB240B1
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 13:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E74715EFC4;
	Mon,  1 Jul 2024 13:54:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C3315ECDF
	for <linux-i2c@vger.kernel.org>; Mon,  1 Jul 2024 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719842054; cv=none; b=FAaVPtuP0KB3ZBNH+TxIxFdWcceKA1c9d4jvRmDftxdebYT0E1sVbfVXa669LdmeIkpPY8Q0XQyDW+DYrAm1GQik19+XHeZzkYcIc15dBlV43wHh+eJJs9tOfkWJQVf5rye9UP0Gkqhyg8rtUOTr30RLZUqshqJy/3WL4JCastI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719842054; c=relaxed/simple;
	bh=JIVhgNSL/W/L3u6sKue9yo8smnMnjBQqdTAHH2hC9XU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/xbYqx5Zo/Z3KaY5mdXyHpgqVES9Kp5UiAelVhVt9w+UwNj73D7rRBqCgZ7JQi6UsN1ifLqiskwFT7GZlYY8QyjXbvQS4yEAWug0Yo6kR7F0mS+V4xvT3cM/OYq44POnmP1Pfwt88Q5G4lbNQg4Sb6ewqr11fVUhHJY4h2j40s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sOHTX-0001LY-Aa; Mon, 01 Jul 2024 15:53:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 01 Jul 2024 15:53:42 +0200
Subject: [PATCH 3/9] mtd: add support to handle EEPROM devices
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-b4-v6-10-topic-usbc-tcpci-v1-3-3fd5f4a193cc@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 loongarch@lists.linux.dev, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

At the moment EEPROMs are covered by misc/driver/eeprom/* drivers. This
commit prepares the MTD framework to handle EEPROM devices within the
MTD layer.

To keep the backward compatibility with the current misc drivers the
master device must be exposed always. Furthermore the NVMEM device
parent must be set to the I2C device instead of the MTD device and the
name must be either the I2C device name or the name specified via the
label.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/mtd/mtdcore.c      | 32 +++++++++++++++++++++++++++++++-
 include/uapi/mtd/mtd-abi.h |  2 ++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index dcd97e59425e..e2a996ccd17e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -149,6 +149,9 @@ static ssize_t mtd_type_show(struct device *dev,
 	case MTD_ROM:
 		type = "rom";
 		break;
+	case MTD_EEPROM:
+		type = "eeprom";
+		break;
 	case MTD_NORFLASH:
 		type = "nor";
 		break;
@@ -578,6 +581,33 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.ignore_wp = true;
 	config.priv = mtd;
 
+	switch (mtd->type) {
+	case MTD_EEPROM:
+		config.type = NVMEM_TYPE_EEPROM;
+		/*
+		 * The master device must be backward compatible with the
+		 * predecessor (misc/eeprom/at24.c) driver. Therefore we need to
+		 * adapt the naming scheme.
+		 *
+		 * Initialize config.id to NVMEM_DEVID_AUTO even if the
+		 * mtd->name is provided via an label as some platform can have
+		 * multiple eeproms with same label and we can not register each
+		 * of those with same label. Failing to register those eeproms
+		 * trigger cascade failure on such platform.
+		 */
+		if (mtd_is_master(mtd)) {
+			config.id = NVMEM_DEVID_AUTO;
+			config.compat = true;
+			config.name = mtd->name;
+			config.dev = mtd->dev.parent;
+			config.base_dev = mtd->dev.parent;
+		}
+		break;
+	default:
+		config.type = NVMEM_TYPE_UNKNOWN;
+		break;
+	}
+
 	mtd->nvmem = nvmem_register(&config);
 	if (IS_ERR(mtd->nvmem)) {
 		/* Just ignore if there is no NVMEM support in the kernel */
@@ -1076,7 +1106,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	if (ret)
 		goto out;
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
+	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) || mtd->type == MTD_EEPROM) {
 		ret = add_mtd_device(mtd);
 		if (ret)
 			goto out;
diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index 714d55b49d2a..59bf43d58ddb 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -146,6 +146,7 @@ struct mtd_read_req {
 #define MTD_DATAFLASH		6
 #define MTD_UBIVOLUME		7
 #define MTD_MLCNANDFLASH	8	/* MLC NAND (including TLC) */
+#define MTD_EEPROM		9
 
 #define MTD_WRITEABLE		0x400	/* Device is writeable */
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
@@ -159,6 +160,7 @@ struct mtd_read_req {
 #define MTD_CAP_NORFLASH	(MTD_WRITEABLE | MTD_BIT_WRITEABLE)
 #define MTD_CAP_NANDFLASH	(MTD_WRITEABLE)
 #define MTD_CAP_NVRAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
+#define MTD_CAP_EEPROM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
 
 /* Obsolete ECC byte placement modes (used with obsolete MEMGETOOBSEL) */
 #define MTD_NANDECC_OFF		0	/* Switch off ECC (Not recommended) */

-- 
2.39.2


