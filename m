Return-Path: <linux-i2c+bounces-11406-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1127AD84E7
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 09:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBEFF7A79C1
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 07:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5732E6D1E;
	Fri, 13 Jun 2025 07:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="F9f3VZTW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEFB2C327C;
	Fri, 13 Jun 2025 07:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800468; cv=none; b=i+IIHurxaZOBZQBPyaKAHRyMAKmbn+9jm4PS7SZr3sJkNoePX/j/gjzp7k/JO1JOkrCqYwV29qP8I9ZUimo1xYHhteTiP9kbRFIHAMv5ZISBOBNzL51uC9hdULgzOiMgmzpiT1hu4DUkKNoEmF8KbTUiJNhenwMc1Ayd3CjayBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800468; c=relaxed/simple;
	bh=XTLNLa6cch6vvzm8GPLGQE1EqCmrVS/d67uIjyzKwy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pLqXHqb40XE/PN6AfUFiED1CJJJv72xm1gt3anIOxr1jh3HqmG0CtIi61V6c9JYDfRRLSPBflCcLNcqmsqqJZwpkrNPEK28fYXV5BBldsyb+rmc2ZgijZueRfaW030cj6AUtXGeL6LPUbqJb928YGIzYZYYlbMNCPY0svR6DHjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=F9f3VZTW; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from [10.102.99.184] (unknown [10.101.200.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id AD9293F796;
	Fri, 13 Jun 2025 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749800456;
	bh=/s3ULtZuuGEr6lVQB4oZg7nvmbpL3b9XXpwD3nZvvhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc;
	b=F9f3VZTW+BB2abEWnbw/0UhmJOusVX9yvI702W5eAfgUhxMLHtNe1pSFFRePvgfTU
	 JctbEUPLG0lTKMQFmt0HIvDBSlgEB0iVzBWXnkHACFAfVWfk6xsndNVSQZWVJgqqXx
	 zznYpoO76I0K3F3TeYS8ARiVMRjt+5fRT/uXjwyEsbGFjFlPZQUOg/1EiQWQy1IaJO
	 tXajDWRz5NdFdiVN5FlDF1dmNfvdel+apW4ee7fZ/tW1gzlYGI6YsAwnf7r2/V2hay
	 NKXdbVo3zVfa+NOtDcm2XbdMpmOETLGb33oHVfOJUcLDttmOuh5L7G2FF9pqHa7wvL
	 AglGsZ4c5zF7w==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Fri, 13 Jun 2025 15:40:18 +0800
Subject: [PATCH v2] i2c: i801: Do not instantiate spd5118 under SPD Write
 Disable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-for-upstream-not-instantiate-spd5118-v2-1-cf456ed9b587@canonical.com>
X-B4-Tracking: v=1; b=H4sIAOHVS2gC/43NQQ6CMBCF4auQrh1DB9pUV97DsKhlkEmkJW0lG
 sLdrSTuXf5v8b5VJIpMSZyrVURaOHHwJfBQCTdafyfgvrTAGlWtUMMQIjznlCPZCXzIwD5l6zP
 bTJDmXklpoNUNoro1rba1KFdzpIFfO3PtSo+ccojvXV3kd/0B5j9gkSDBoNSEfWNO0lyc9cGzs
 4+jC5Potm37AA1Tz37cAAAA
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3612; i=leo.lin@canonical.com;
 h=from:subject:message-id; bh=XTLNLa6cch6vvzm8GPLGQE1EqCmrVS/d67uIjyzKwy0=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBoS9YEWAAj3LAMRYBS63h3VjqJfn8WIBu8BBxKa
 Zjmxn0R0lGJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaEvWBAAKCRBfF7GWSinu
 hrpsD/sFBVStcy3VpX4RuV9znK3vjQ36PWnRk8vq6JVDuX0WnfyqGv4Syydih4VcUequ2JnOtGP
 +yAIk0wzpIXDX+dZppHroZH9JsYf2aUEPmHUfPt4PmmjsUfmQy6deK6BGsXibEiALvjB/cuUu9Y
 iAT/hnZqdrjBPIZSMhSkv61pHGwZiUVnDQbxTAq59wTtxEi7k89GYhTRAybtYShau33xSMzTUNy
 Her/ViU8RB8JDoCB3w6GH+H5GKZoz1Q1UH1HaS6+vK/jAuniB+AJ59Ifooim3dZYWEu4P43RWvt
 AkY5KDAzR0Hj7v30/+8bBMibaRA8yjjHq45O3QQngWjRk4Dw47Z9XHWyOgkrdtHYOz802ib0D+b
 sEWGB4JrKD+CwVkmUgyzc/fSVy3gdF1AOBc0xNRKkTBTPF1dUvRKaxmveb2UqSvg/CgErfypbhU
 1HUe4emKUSmcsdrn1PdUtSf1V+u0f9M1o0QWYnivhSPqwPNSMc405m25ZU2mqCFgzTQGt7a9k+x
 pnyzKhAljcHa2B/oKYeE4KmWjjskqEwWUeQmgzO7DR/j19nxrboOyuw2TaNH4lS35fKDcnqlzsL
 KTIpyS7M/K1kS2YsXxzdro4knan1buNTozp5l7NfO1JzLPm/HQx7WV3+DErQCB+tGourRjElziS
 SbOqhGRHm7rMF1w==
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
Changes in v2:
- Fix build failure on some non-x86 archs, by moving __i801_register_spd() out of the CONFIG_X86 && defined CONFIG_DMI region
- Also fix unused function warning by adding __always_inline.
- Link to v1: https://lore.kernel.org/r/20250528-for-upstream-not-instantiate-spd5118-v1-1-8216e2d38918@canonical.com
---
 drivers/i2c/busses/i2c-i801.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a7f89946dad41..2a56396d88c29 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -978,6 +978,14 @@ static void i801_disable_host_notify(struct i801_priv *priv)
 	iowrite8(priv->original_slvcmd, SMBSLVCMD(priv));
 }
 
+static inline __maybe_unused void __i801_register_spd(struct i801_priv *priv)
+{
+	if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
+		i2c_register_spd_write_disable(&priv->adapter);
+	else
+		i2c_register_spd_write_enable(&priv->adapter);
+}
+
 static const struct i2c_algorithm smbus_algorithm = {
 	.smbus_xfer	= i801_access,
 	.functionality	= i801_func,
@@ -1157,6 +1165,19 @@ static void dmi_check_onboard_devices(const struct dmi_header *dm, void *adap)
 	}
 }
 
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
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250526-for-upstream-not-instantiate-spd5118-463225b346a0

Best regards,
-- 
Yo-Jung (Leo) Lin <leo.lin@canonical.com>


