Return-Path: <linux-i2c+bounces-10689-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4581EAA4A06
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 13:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 815D77AE3B7
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 11:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57A626461F;
	Wed, 30 Apr 2025 11:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="AyNmS4Rq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5620825B663;
	Wed, 30 Apr 2025 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012417; cv=none; b=Z3z5JfyEF58xtN7b5+5VxquTkfxA3/2WKrtlVTzkPJTV+5/gCfMZtat4CCshkBporYJOtsFidZ4yOeGDkwGDspuGSzpjPylzm3yOfOM6EDUYgoLXjb+eyXmSjpaUFk/3nakDM0XkNq49pSIuq5os894LdZpBydqSDZLxse8k28E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012417; c=relaxed/simple;
	bh=kuZ0coO8UI48fmBIoGRCVlKwgmRGWrR38Mt0Wt+YHqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1cfWVIfBoiMw71013oIvHm2rOBKRi5VZu4g3MQb0bolVz6sE/X6ApdZLpasGGPmYf8sKmOimIFIWtbXWDBAdgxX/vZBCArXJSfS94Z2dr6vqXRvM02jdnYTGmBX6tc+C88+goYUI6zK6tJgi9tvPNG3m5yo37zfbWRCWflENsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=AyNmS4Rq; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from [10.102.98.142] (unknown [10.101.200.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 1818A41579;
	Wed, 30 Apr 2025 11:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746012408;
	bh=rvSgcVwMLyxNfL+w5hCFbK2q/AUAO2K8xn5qUK7cuIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc;
	b=AyNmS4RqY8IG9qmhY/LTWQaAMTd0zfhxtPqpTY3PFhOwzlf5JZtESqDa8w6hGlPZp
	 sWeyKcanMuYka1K/1SfKHJNYqGFTv4vv9X0EwvO0regr5raa7IGxJ0Qvx3ePJ9LFyS
	 tS8ZviK6cf7xRKMpMdBfrzfOoqpeQXZlv7JX9rWNOYXJkeTEqAQFSWBWcxDPq3n+OK
	 I2Lidz0FbuLdRrt6Az+Quvo3NYlsc5A6hqJ1cbsWwupqNrDpAMGMBjm3I3cWTWNQQh
	 wEE3hZ7Fnzk8P68mLU8vO56wdjSnql3VF5yMugHq4ZkSa2Clu8pAvT9O/FlatXd4jD
	 FFLEgYwsJEjaw==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Wed, 30 Apr 2025 19:26:16 +0800
Subject: [PATCH v2 1/2] i2c: smbus: introduce Write Disable-aware SPD
 instantiating functions
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-1-2f54d91ae2c7@canonical.com>
References: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-0-2f54d91ae2c7@canonical.com>
In-Reply-To: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-0-2f54d91ae2c7@canonical.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4439; i=leo.lin@canonical.com;
 h=from:subject:message-id; bh=kuZ0coO8UI48fmBIoGRCVlKwgmRGWrR38Mt0Wt+YHqI=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBoEgjwczhiV1ZJlcIbUhQwlW6jRK51368+afk1X
 hgu61gtIFOJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaBII8AAKCRBfF7GWSinu
 hpkuD/wJPz3xyUTT16q2piO+CpntcbrwX+uWLxhVVGeTLPtUamr01nl7QDVFxOZJpO83chrftud
 H9yULxfa1PcluHISvPIzqyjkiEUkZCQoe0KxqEkZ4MLlgKZWW9zj8rYvdw81SpWHMzd1dYqWS2S
 25X7uRoj9u7rxraurXZj66kuztoj9s07yyp6C4l2WHQaZtciJPthDsh+03AC+1SLk0VJOrPF1b1
 9fCJFogBPsQhMMEaznZi/PpgN4JH2RhTfxWFLEJw99z7YJH4AoHLYVl/kE2C0yFbGULbYocG/E8
 oV5sNlkDr6C63ahEmtieFrWBZLuvg58UOQb8LMHY9Vtp8CBn80ITPX/z9tmhe6ZJXpe1NDs9p6i
 Nxcr0s451Eg8WMwW1VMvCfldwaVcHAv2nWeaS/jPtiTZYal5HK7fi0DYomtnbUlyQbIXaqMaW0k
 mUBhkcmeyoE10z+jiBmEUIHkZT7Qa10u/wjzwuW4aP3kUljVDQg+QHnY+KYkjjRjAItpgFb9Czx
 Jd+Se1u3VOTB3EmPSCzIp6r15/mpzOmg7i0XjXELYkVCKb7T/fRIEXDdPs7TVtXTWsXXstlYRIF
 DXFVE1bHp3z+AIfQ0xahLIO5se+yOeSmNXDZMzwl6BU1JtjGrOGAj4npXcrD4Lg4YmhsLXka45K
 KLKkiNaoHQhsjmA==
X-Developer-Key: i=leo.lin@canonical.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86

Some SMBus controllers may restrict writes to addresses where SPD sensors
may reside. This may lead to some SPD sensors not functioning correctly,
and might need extra handling. Introduce new SPD-instantiating functions
that are aware of this, and use them instead.

Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
---
 drivers/i2c/busses/i2c-i801.c  |  4 ++--
 drivers/i2c/busses/i2c-piix4.c |  2 +-
 drivers/i2c/i2c-smbus.c        | 21 +++++++++++++++++++--
 include/linux/i2c-smbus.h      |  6 ++++--
 4 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 48e1af544b75..a7f89946dad4 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1180,7 +1180,7 @@ static void i801_probe_optional_targets(struct i801_priv *priv)
 #ifdef CONFIG_I2C_I801_MUX
 	if (!priv->mux_pdev)
 #endif
-		i2c_register_spd(&priv->adapter);
+		i2c_register_spd_write_enable(&priv->adapter);
 }
 #else
 static void __init input_apanel_init(void) {}
@@ -1283,7 +1283,7 @@ static int i801_notifier_call(struct notifier_block *nb, unsigned long action,
 		return NOTIFY_DONE;
 
 	/* Call i2c_register_spd for muxed child segments */
-	i2c_register_spd(to_i2c_adapter(dev));
+	i2c_register_spd_write_enable(to_i2c_adapter(dev));
 
 	return NOTIFY_OK;
 }
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index dd75916157f0..56839557ec6c 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -971,7 +971,7 @@ static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 	 * This would allow the ee1004 to be probed incorrectly.
 	 */
 	if (port == 0)
-		i2c_register_spd(adap);
+		i2c_register_spd_write_enable(adap);
 
 	*padap = adap;
 	return 0;
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 7d40e7aa3799..0316b347f9e7 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -372,12 +372,13 @@ EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
  *  - Only works on systems with 1 to 8 memory slots
  */
 #if IS_ENABLED(CONFIG_DMI)
-void i2c_register_spd(struct i2c_adapter *adap)
+static void i2c_register_spd(struct i2c_adapter *adap, bool write_disabled)
 {
 	int n, slot_count = 0, dimm_count = 0;
 	u16 handle;
 	u8 common_mem_type = 0x0, mem_type;
 	u64 mem_size;
+	bool instantiate = true;
 	const char *name;
 
 	while ((handle = dmi_memdev_handle(slot_count)) != 0xffff) {
@@ -438,6 +439,7 @@ void i2c_register_spd(struct i2c_adapter *adap)
 	case 0x22:	/* DDR5 */
 	case 0x23:	/* LPDDR5 */
 		name = "spd5118";
+		instantiate = !write_disabled;
 		break;
 	default:
 		dev_info(&adap->dev,
@@ -461,6 +463,9 @@ void i2c_register_spd(struct i2c_adapter *adap)
 		addr_list[0] = 0x50 + n;
 		addr_list[1] = I2C_CLIENT_END;
 
+		if (!instantiate)
+			continue;
+
 		if (!IS_ERR(i2c_new_scanned_device(adap, &info, addr_list, NULL))) {
 			dev_info(&adap->dev,
 				 "Successfully instantiated SPD at 0x%hx\n",
@@ -469,7 +474,19 @@ void i2c_register_spd(struct i2c_adapter *adap)
 		}
 	}
 }
-EXPORT_SYMBOL_GPL(i2c_register_spd);
+
+void i2c_register_spd_write_disable(struct i2c_adapter *adap)
+{
+	i2c_register_spd(adap, true);
+}
+EXPORT_SYMBOL_GPL(i2c_register_spd_write_disable);
+
+void i2c_register_spd_write_enable(struct i2c_adapter *adap)
+{
+	i2c_register_spd(adap, false);
+}
+EXPORT_SYMBOL_GPL(i2c_register_spd_write_enable);
+
 #endif
 
 MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
index ced1c6ead52a..dc1bd2ab4c13 100644
--- a/include/linux/i2c-smbus.h
+++ b/include/linux/i2c-smbus.h
@@ -44,9 +44,11 @@ static inline void i2c_free_slave_host_notify_device(struct i2c_client *client)
 #endif
 
 #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
-void i2c_register_spd(struct i2c_adapter *adap);
+void i2c_register_spd_write_disable(struct i2c_adapter *adap);
+void i2c_register_spd_write_enable(struct i2c_adapter *adap);
 #else
-static inline void i2c_register_spd(struct i2c_adapter *adap) { }
+static inline void i2c_register_spd_write_disable(struct i2c_adapter *adap) { }
+static inline void i2c_register_spd_write_enable(struct i2c_adapter *adap) { }
 #endif
 
 #endif /* _LINUX_I2C_SMBUS_H */

-- 
2.43.0


