Return-Path: <linux-i2c+bounces-3718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FCB8D54D9
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 23:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E5F11C2294D
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 21:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A02418397C;
	Thu, 30 May 2024 21:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="moreprzY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C650183974;
	Thu, 30 May 2024 21:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717105781; cv=none; b=A7edI5JHsSZp9rSHjWuMFSO9rHecE7s0A5KaGxsLhSfehLPcEXeDkiEMWejiU9XWM2nyYW1XEfwTEp8vp8Srq+l1K2NJQ7GxnqiHIGOlktguqHco7L81SCmlaLa7LnkPB8jwQ340RXoZXMissc6XE1918YBKMdvXfjqzDPCdTNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717105781; c=relaxed/simple;
	bh=VEA6I6S308h6wwm8d3f0nPjCMiKHG7T59SSbsMfJrvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xr3GVRRHigDkGyi0R2GPVSfXyU5zG2wfV2R5yfdSyFrf7CncT4QQHMfZJo6wHeDJQ68W9/1YG+5NP+sI1JbTLKugTKc+WZkOf4E1n5Ai5p6KOC2MO1dSHagfaQcbGdnm0x4/G49phB9T4n5Q0Rr5c4m5slFp/Us9LSYSasJeEC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=moreprzY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1717105772;
	bh=VEA6I6S308h6wwm8d3f0nPjCMiKHG7T59SSbsMfJrvY=;
	h=From:Date:Subject:To:Cc:From;
	b=moreprzYqci9cA9kBjB+U6WC85Kr32RuoALqsHauOkB1TsXO/S4zp95T/WDhZCqMP
	 h3BB/a6rwMqWnuBxgqUfUpfIEDrFX3ccLqtgq0anyyZbtco1IHwOfyZBTxpKjJVjYZ
	 2IFSxL3pHDP45oJ3/ZGfJAhOyCr9E6WkdtMVY3yk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 30 May 2024 23:49:27 +0200
Subject: [PATCH] i2c: piix4: Register SPDs
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240530-piix4-spd-v1-1-9cbf1abebf41@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAGb0WGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDU2MD3YLMzAoT3eKCFF1jy2RDU7MkIyNLU0sloPqCotS0zAqwWdGxtbU
 AJxcSxFsAAAA=
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <linux@roeck-us.net>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717105772; l=1804;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=VEA6I6S308h6wwm8d3f0nPjCMiKHG7T59SSbsMfJrvY=;
 b=pyYw+TFK5MQuixmvcFuURwBwRg/D+ubjiN1atO4F/dTZZF2vGikO3bHqzXbhQY4fWPakAarcd
 qTSqc4rcNIlChIQj75ovJnONgq4oKZvINkHcBMQHIHANsgteEoiL9D/
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The piix4 I2C bus can carry SPDs, register them if present.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
For my test setup see [0].
While the spd5118 driver in that form shouldn't be probed this way, the
general principle holds true for the other SPD drivers.

Guenter offered to test it, too.

[0] https://lore.kernel.org/lkml/34a4292e-c4db-4b40-822e-b892e1444045@t-8ch.de/
---
 drivers/i2c/busses/Kconfig     | 1 +
 drivers/i2c/busses/i2c-piix4.c | 3 +++
 2 files changed, 4 insertions(+)

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
index 6a0392172b2f..f8d81f8c0cb3 100644
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
@@ -982,6 +983,8 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 		return retval;
 	}
 
+	i2c_register_spd(adap);
+
 	*padap = adap;
 	return 0;
 }

---
base-commit: 4a4be1ad3a6efea16c56615f31117590fd881358
change-id: 20240530-piix4-spd-39c156b22959

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


