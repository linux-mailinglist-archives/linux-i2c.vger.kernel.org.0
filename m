Return-Path: <linux-i2c+bounces-11150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27742AC6480
	for <lists+linux-i2c@lfdr.de>; Wed, 28 May 2025 10:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3B7B3ACBF1
	for <lists+linux-i2c@lfdr.de>; Wed, 28 May 2025 08:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1C4268FF1;
	Wed, 28 May 2025 08:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="HqzETtbx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DF9268C7F;
	Wed, 28 May 2025 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748421006; cv=none; b=daP3He3F/l79GbRzv85c6/MVnFvfK+ps2Og4GXqeGqYE8OFUvif+pqsDP6VFMENaNMn/XpIq8ID8DGfUj5ZgFcPdXnwJXzn5AAvvq3f35/aknokrYGRK7Orm17T2Y493eGdf5jjIDmOFPTpJ5KKvAv1nPCPS/HV0YS/7otf0LQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748421006; c=relaxed/simple;
	bh=/Ow1PmBI4yy/CopXyfAdNlFq6FA7vnRAq4zgFhQTxKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hGStCR5LNi5yNyQT4PtE7qr+XFd+cGFhiv0tt7kNUhw9sMN25MYQKa8pewlKY6onWKG8CtuXwQLLSU9iijsmgkGNH+JCnQKc0KCEdOjA0MicCMCpcwdnY4FahB3Nwb9lD9i6ZnunyOHfMXySx4v4lByzpYUL/Ch5tWgpG5/8ZUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=HqzETtbx; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from 2001-b400-e281-d348-7542-b73b-b580-4415.emome-ip6.hinet.net (unknown [10.101.200.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 775C73F796;
	Wed, 28 May 2025 08:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1748420640;
	bh=AstLYq3VMdkE8US+TLkn18adQxf0vcyp/yq783YeBek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc;
	b=HqzETtbxp9eSvSjd4i+6yFEnSZEb1i9MEzQcHtZ7FoLQF476btywbmOYZgbqxhPHh
	 Lxvb/WY6lVhCBQtUWs+inJsmeQ1835urs+4znbxuqWoQSl8v5Tqr5t2cZFXgwOkzvK
	 fa30jjEkYkTqJRJteD135smOcUuFk51YVSVzZCs3+skQc7eirzxEqyHkxAwQdYyN9F
	 pdJuM/SENumq5xo/yFmME1FTQGbvKq8qwvGc7AXDl47ssvH5tlJnVmDpG352kwNinz
	 mkxP/ZpNxit7Pdp/9fVDHEW0iEJsnTlI7P1tlbbi3VYM8eHMxJ4aRUIaC5NbkS2ggB
	 H87eJbr6P/Low==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Wed, 28 May 2025 16:23:40 +0800
Subject: [PATCH] i2c: i801: Do not instantiate spd5118 under SPD Write
 Disable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-for-upstream-not-instantiate-spd5118-v1-1-8216e2d38918@canonical.com>
X-B4-Tracking: v=1; b=H4sIAAvINmgC/x3NwQrCMAyA4VcZORtos7WIryIeOpdpDrYl6UQYe
 /cVj9/l/3cwVmGD27CD8ldMSu7wlwGe75RfjLJ0AzkKLlDEtShu1Zpy+mAuDSVbS7lJaoxWl+D
 9Fac4EoV5nGJy0FNVeZXff3N/HMcJlOgKb3YAAAA=
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3638; i=leo.lin@canonical.com;
 h=from:subject:message-id; bh=/Ow1PmBI4yy/CopXyfAdNlFq6FA7vnRAq4zgFhQTxKw=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBoNsgdiyPwpuPkoaBHvJPCxpFGouM9JGEIYo+Kx
 dhDZaHqswyJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaDbIHQAKCRBfF7GWSinu
 hjv9D/9ln2uf0BMDipKtSG5gJLMIsM2aDUV2VLoqJkm2bTaI3BIX0EckM7cI/Cpw+zecR2+eo2b
 7JWz9I8LjrD+l/BlI1hNXR9Z32XousFTKB0QZX9N6Bt/lhwY1a1uVwuj/Yq//irnPtA2l0zGbBg
 ubyyqSPNBGu9TML/BVFRrtWCAL6X37HqqrFhkNBck9Lpxx1husx/+VQRsujad3leL3qaDEAVMKi
 QHrL56I6yMfVTuTTyz6Xad6Q4si8ZpLZmkU1CxWY2/5fBrgX48Gnrc95A2n5hB3BGZ8nUGBBE5l
 DzHrFA7IE/ReqwyKZTbLcEnGg/4Xq0NGTOkw9TNbXm7/4NrQ9CyzcKvtX/f9/aVfrmIzUC0cGY0
 7XMtGH98dexr5gTU2zgLSdIJJgmq5xid8WFFJLpIlk7B5jwHr8AvHqCubBXYWX7X5Mibazr47gg
 CS1Yv00UsyJfWIfIAWNpYaEJSFMCwJGD3NMrGNZQtjct1vnLqavLPIWGC4CtAaktyFKdmtgb/pq
 BMk7Eha4H3H5Myg/Wc2/Jy34kQ625BO13BAU/Zl4f64TVL6AiJKMMg0zRgGU728K5flvEp/OWan
 K4r9Z75wwQYH9CPxCUEfvFjrYqsn9VmZJYLlEw5JtabzY+koEBo5D8SHZQx8SeS+ehkabIjOTjb
 CDJPnYLWbAJcXpg==
X-Developer-Key: i=leo.lin@canonical.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86

If SPD Write Disable bit in the SMBus is enabled, writing data to
addresses from 0x50 to 0x57 is forbidden. This may lead to the
following issues for spd5118 devices:

  1) Writes to the sensor hwmon sysfs attributes will always result
     in ENXIO.

  2) During system-wide resume, errors may occur during regcache sync,
     resulting in the following error messages:

     kernel: spd5118 1-0050: failed to write b = 0: -6
     kernel: spd5118 1-0050: pm: dpm_run_callback(): spd5118_resume [spd5118] returns -6
     kernel: spd5118 1-0050: pm: failed to resume async: error -6

  3) nvmem won't be usable, because writing to the page selector becomes
     impossible.

Also, BIOS vendors may choose to set the page to a value != 0 after a board
reset. This will make the sensor not functional unless its MR11 register
can be changed, which is impossible due to writes being disabled.

To address these issues, don't instantiate it at all if the SPD Write Disable
bit is set.

Signed-off-by: Yo-Jung Lin (Leo) <leo.lin@canonical.com>
---
This is intended to be the fixed version of the second patch in the
following patch series[1]:

[PATCH v2 0/2] i2c: i801: don't instantiate spd5118 under SPD Write Disable

The original version got reverted due to breaking i386 defconfig build.
However the first patch in that series didn't. To avoid the first patch in
the series being repeatedly sent and applied, this is sent as a separate
patch. 

Also not pulling Reviewed-by from Guenter because the patch differs from
what was originally reviewed.

[1] https://lore.kernel.org/all/20250430-for-upstream-i801-spd5118-no-instantiate-v2-0-2f54d91ae2c7@canonical.com/
---
 drivers/i2c/busses/i2c-i801.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a7f89946dad4..de17532402b9 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1157,6 +1157,27 @@ static void dmi_check_onboard_devices(const struct dmi_header *dm, void *adap)
 	}
 }
 
+static void __i801_register_spd(struct i801_priv *priv)
+{
+	if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
+		i2c_register_spd_write_disable(&priv->adapter);
+	else
+		i2c_register_spd_write_enable(&priv->adapter);
+}
+
+#ifdef CONFIG_I2C_I801_MUX
+static void i801_register_spd(struct i801_priv *priv)
+{
+	if (!priv->mux_pdev)
+		__i801_register_spd(priv);
+}
+#else
+static void i801_register_spd(struct i801_priv *priv)
+{
+	__i801_register_spd(priv);
+}
+#endif
+
 /* Register optional targets */
 static void i801_probe_optional_targets(struct i801_priv *priv)
 {
@@ -1177,10 +1198,7 @@ static void i801_probe_optional_targets(struct i801_priv *priv)
 		dmi_walk(dmi_check_onboard_devices, &priv->adapter);
 
 	/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
-#ifdef CONFIG_I2C_I801_MUX
-	if (!priv->mux_pdev)
-#endif
-		i2c_register_spd_write_enable(&priv->adapter);
+	i801_register_spd(priv);
 }
 #else
 static void __init input_apanel_init(void) {}
@@ -1283,7 +1301,7 @@ static int i801_notifier_call(struct notifier_block *nb, unsigned long action,
 		return NOTIFY_DONE;
 
 	/* Call i2c_register_spd for muxed child segments */
-	i2c_register_spd_write_enable(to_i2c_adapter(dev));
+	__i801_register_spd(priv);
 
 	return NOTIFY_OK;
 }

---
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250526-for-upstream-not-instantiate-spd5118-463225b346a0

Best regards,
-- 
Yo-Jung (Leo) Lin <leo.lin@canonical.com>


