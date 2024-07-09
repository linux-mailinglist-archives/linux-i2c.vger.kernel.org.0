Return-Path: <linux-i2c+bounces-4799-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A374392C295
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 19:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610181F237F0
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 17:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB2517B020;
	Tue,  9 Jul 2024 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fH4gwkw0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6F41B86CB;
	Tue,  9 Jul 2024 17:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720546544; cv=none; b=PczkC+LwuHkXqTa2RHgDFJvKlVkkPp75PDPJ4TxfK2RfQmPFhFxwHDui3WldHlp8+Hun9/WRdX0QGGmWWJTRF2nmdCBAUig8rb1/athgMUDfMHlcbVlF5ofiSefPaPcPIrOD8pnSLXHFKwrkeykZFfvRgg9kuAZj1X9cKG7iceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720546544; c=relaxed/simple;
	bh=zehIzsFMNanCTtiVgKcABFOQmt6XEZs7XTojxK1mjT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfzVqNGyHGGT5nkmxNmMvIQm9W7M7zMjTsaJe2/agJs7gzeKi+Xq4i6i4ysopZoyjWsVhM2Mlj0iuyJmZbLgML6HRqY7oS+KDabsijUy6j1+/tZdilMeUseocCOLkPbRrzhlqsmL+KWzFQ3NCAquZeKxEGbtBkzyNCXQjAl+Lqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fH4gwkw0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720546537;
	bh=zehIzsFMNanCTtiVgKcABFOQmt6XEZs7XTojxK1mjT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fH4gwkw0yVIvm8ZbHzC+qMiqLfWNI67WRPH7m+rHUsMeuzPvi9TMyXZqmzK7OCxuK
	 rA9cXZMcTxiiCHYpwIrYxdq5SGG6YE0XVAcBPT1rUpu63UBAJoHJ81iMad9ukCdVLU
	 U8WGdTDf/5CKh2k0IU9L/9H5V1X08nmgu9tTREmY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 09 Jul 2024 19:35:36 +0200
Subject: [PATCH v3 2/2] i2c: piix4: Register SPDs
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240709-piix4-spd-v3-2-9d1daa204983@weissschuh.net>
References: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
In-Reply-To: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720546537; l=1815;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zehIzsFMNanCTtiVgKcABFOQmt6XEZs7XTojxK1mjT4=;
 b=qfiCTKcgJ+oEB/8cX5l+2nKtv6xSpyokbF8Yn+iQ/ClQaXpEyMlpwAKBTMvSxzUexcKO42Ro/
 8LLQsNdiB/OD3I48qgC+kBoDjkK/Xpj3apxxxyp99RBsFehXFJNWoEe
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The piix4 I2C bus can carry SPDs, register them if present.
Only look on bus 0, as this is where the SPDs seem to be located.

Only the first 8 slots are supported. If the system has more,
then these will not be visible.

The AUX bus can not be probed as on some platforms it reports all
devices present and all reads return "0".
This would allow the ee1004 to be probed incorrectly.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/i2c/busses/Kconfig     | 1 +
 drivers/i2c/busses/i2c-piix4.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fe6e8a1bb607..ff66e883b348 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -195,6 +195,7 @@ config I2C_ISMT
 config I2C_PIIX4
 	tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
 	depends on PCI && HAS_IOPORT
+	select I2C_SMBUS
 	help
 	  If you say yes to this option, support will be included for the Intel
 	  PIIX4 family of mainboard I2C interfaces.  Specifically, the following
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 6a0392172b2f..14752d946f58 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -29,6 +29,7 @@
 #include <linux/stddef.h>
 #include <linux/ioport.h>
 #include <linux/i2c.h>
+#include <linux/i2c-smbus.h>
 #include <linux/slab.h>
 #include <linux/dmi.h>
 #include <linux/acpi.h>
@@ -982,6 +983,9 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 		return retval;
 	}
 
+	if (port == 0)
+		i2c_register_spd(adap);
+
 	*padap = adap;
 	return 0;
 }

-- 
2.45.2


