Return-Path: <linux-i2c+bounces-10603-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA67A99FAF
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 05:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE0167AD00B
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Apr 2025 03:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAEB1B4139;
	Thu, 24 Apr 2025 03:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="iQDVqaoD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7921B0411;
	Thu, 24 Apr 2025 03:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745466306; cv=none; b=BnPGOPAgx5EmHM18F6XIskFIhUnesq6AfvWVkGPXIBa2lNf3kAkj01ZAIbGej38EP8JZehnlPehrbViwPQA/c5Z/6zY1pzwtzuHQkp0XTQrqId/c5N6JBZW/Cb+QMK06HJw5iz+FHwE2usX67m2phHO21AE3ZLiHbeCSWJdU3OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745466306; c=relaxed/simple;
	bh=VhkHoUdxKl4O9TthbMASF0VVm4EmFSje5xdRL9hofKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J5g9LJQ742Q5sUQ9ry6p72+U2Afjn+Y3vM+5ujRkXV6GlwxZU2I3ZxOYAyTEyTeM02QtvVbJie8pA+cEd2CaDvTS2ah2yYq7YgcJ2GfvJ40QRBr8nYIFNrD9R4YKU8yNPhP1Mb6MBndyer1BxOkjEP/9vzbDfUg2M7YOkpMjazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=iQDVqaoD; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from [10.102.98.142] (unknown [10.101.200.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 295D23FFEB;
	Thu, 24 Apr 2025 03:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745465797;
	bh=0jZ8ricmTcuy3cC7y+FRlhMCNHHbkhvvP/2DbcyHPQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc;
	b=iQDVqaoDYX3VLscrqLbu+Cvr8DVa2vJ1umbKQSyV3dBK5qTX/tj2G2jySfCM6kQr9
	 OnqEolA3bp16LqpiRwwsCAg3JnuFYXsCbtEqYapbztrErt09DdJoMAUxJyBPO1OIbB
	 geiDdHwCiMwOqY0XAWsC9C/Qk9YsA0j+pkki5jSdbPnT+ugbQ4f11MDX3rsiLi9mtf
	 yEhjTGwlIdIWuun+Z2HroKglfuTUsJiW0W1Cje/OKv6muP4Gwppoz8HsvnjlFPuXEy
	 E/oLQYgxqiQpTDyKMUdlF3ELoo4PvmHqxDCk2WUbyksSS+bOiuW7UP670y+jIE03r3
	 agi3YO15R69Xg==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Thu, 24 Apr 2025 11:35:43 +0800
Subject: [PATCH 1/2] i2c: smbus: pass write disabling bit to spd
 instantiating function
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-1-627398268a1f@canonical.com>
References: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-0-627398268a1f@canonical.com>
In-Reply-To: <20250424-for-upstream-i801-spd5118-no-instantiate-v1-0-627398268a1f@canonical.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3110; i=leo.lin@canonical.com;
 h=from:subject:message-id; bh=VhkHoUdxKl4O9TthbMASF0VVm4EmFSje5xdRL9hofKs=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBoCbG8J/5XjP98f47h12j9AMFRG7jbXLs9BJV2d
 to26hHr14+JAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaAmxvAAKCRBfF7GWSinu
 hiOgEACtmfl1Pi2lo6FGwrRpOP7K81E4x78ypPmnzP6Vnbw0ar3RXehWA1VnB5j1yDmvYoHoasz
 XL303HB741gnmmrsgkQM7AjNY0cyNDEdgpL6iHIP3nG/x8Er9ayoq6uiDTrh3tlGOl60gXRgMm1
 RFhg2aViBfDy6/9aT0nHE9u/qPT1Y5+PKlDX6oqwE4mFsOlrO96tlhraugTdQSqJ+esySnZiyQ6
 2Vm5lFafNE+oQKYP6TiTEvEGP2jcgDgtF/gRlUCl6g6rQPsfFIY1wEZ0EmGm4In6ubK8NcuAG7W
 YX04TfZpshd2qAzfLDjKHvv2p3FjWqdDFAnonw1GKFcPIBzT5fmaGziiyDxRm8UjHu7RMoWbV2W
 rwvyfW9d3jL6zC1FbuNdOqvH5ja+gUMRhwde7uViExb9TXZ9oFbpIb8KZkHM+19rUzgbe4HxFyX
 KhAxL2LR5GlrsaNOrwymMQQYFI7FLS2vrqixIdciA4s9Y7ammhPWz5HUrYCIoA0ReIe90FprUb1
 ATYZQPTM5fG/bmQTTCf+74yStEZg5Va2zOK3GvpMFIuIhvBnd/I83PZ5O8ptZCmRha5I1Txn9+W
 B+3WA9RQozFqiDBf73v4pHP/fh0TcyqwVEVfRKgtlkdgylWBiZyXZEbvneAN/zp0xwRopdWxt0I
 CJmlwCsHDrDZvyA==
X-Developer-Key: i=leo.lin@canonical.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86

Some SMBus controllers may restrict writes to addresses where SPD
sensors may reside. This may lead to some SPD sensors not functioning
correctly, and might need extra handling. Pass this extra context to
i2c_register_spd() so that it could be handled accordingly.

Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
---
 drivers/i2c/busses/i2c-i801.c  | 6 ++++--
 drivers/i2c/busses/i2c-piix4.c | 2 +-
 drivers/i2c/i2c-smbus.c        | 2 +-
 include/linux/i2c-smbus.h      | 4 ++--
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 48e1af544b75..95619eb5e798 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1180,7 +1180,8 @@ static void i801_probe_optional_targets(struct i801_priv *priv)
 #ifdef CONFIG_I2C_I801_MUX
 	if (!priv->mux_pdev)
 #endif
-		i2c_register_spd(&priv->adapter);
+		i2c_register_spd(&priv->adapter,
+				 !!(priv->original_hstcfg & SMBHSTCFG_SPD_WD));
 }
 #else
 static void __init input_apanel_init(void) {}
@@ -1283,7 +1284,8 @@ static int i801_notifier_call(struct notifier_block *nb, unsigned long action,
 		return NOTIFY_DONE;
 
 	/* Call i2c_register_spd for muxed child segments */
-	i2c_register_spd(to_i2c_adapter(dev));
+	i2c_register_spd(to_i2c_adapter(dev),
+			 !!(priv->original_hstcfg & SMBHSTCFG_SPD_WD));
 
 	return NOTIFY_OK;
 }
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index dd75916157f0..085d121a88f6 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -971,7 +971,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	 * This would allow the ee1004 to be probed incorrectly.
 	 */
 	if (port == 0)
-		i2c_register_spd(adap);
+		i2c_register_spd(adap, false);
 
 	*padap = adap;
 	return 0;
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 7d40e7aa3799..97e833895dd7 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -372,7 +372,7 @@ EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
  *  - Only works on systems with 1 to 8 memory slots
  */
 #if IS_ENABLED(CONFIG_DMI)
-void i2c_register_spd(struct i2c_adapter *adap)
+void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled)
 {
 	int n, slot_count = 0, dimm_count = 0;
 	u16 handle;
diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
index ced1c6ead52a..57bb3154eb47 100644
--- a/include/linux/i2c-smbus.h
+++ b/include/linux/i2c-smbus.h
@@ -44,9 +44,9 @@ static inline void i2c_free_slave_host_notify_device(struct i2c_client *client)
 #endif
 
 #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
-void i2c_register_spd(struct i2c_adapter *adap);
+void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled);
 #else
-static inline void i2c_register_spd(struct i2c_adapter *adap) { }
+static inline void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled) { }
 #endif
 
 #endif /* _LINUX_I2C_SMBUS_H */

-- 
2.43.0


