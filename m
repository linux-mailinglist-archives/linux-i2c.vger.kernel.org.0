Return-Path: <linux-i2c+bounces-10688-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE8AA49FE
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 13:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70FA74E5A7E
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 11:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2342F2638A1;
	Wed, 30 Apr 2025 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="XByzeJlZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06052609DD;
	Wed, 30 Apr 2025 11:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012415; cv=none; b=V6btRcYHqlCb439QnyMmoC434Aq3gyVw5NGxfVTHhodIju9wbfPDwKq4V99HDzAH/+NqzZ/K5CRqZVYc/JvANmC7RJoGUkdORGMNqBFPkrupaud6sB8u3sQVgg0wuWe34c1gii+JJ1ooAjQyqrFpN++qMbHbpQyPapD2fLtkh0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012415; c=relaxed/simple;
	bh=AbHh2ssONKGBIYKgH6PqJXTxXxyZMFCbetbQ8EQiCjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEOtvKxH77q0LnZmMpOoJ7irT45LbTndVWfRfq8Hf3gSYubNa6L9tShLryG9pacWWjTgltBVWorUcGK1rhZ+NAhsVcPu+b5dBqf45sRZwv7SJ3hMqTpe1nniP4fGh8SWPdMbleWb+d4nssj1yrdOwRg7bN2quhwuuzU3XqzcOA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=XByzeJlZ; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from [10.102.98.142] (unknown [10.101.200.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 514B34157B;
	Wed, 30 Apr 2025 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746012411;
	bh=uOXV3CyeuU+WyKHonmLRfi8ua7uVC2ZWkpVEqrP8/sI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc;
	b=XByzeJlZtZkyY5/8QtKIDYq5g/ZpVm8lxUz5EzPaku5qpSbmbmiqknyjjlqBxbHTu
	 ymUcCXntzwRIkolnC89CC5UgqRBxPOVepxE9cCwOEcDoPaMJHnhZMidSYJFveB91T1
	 22ah7zZC5q5+o2OKFWgEzZi9swZCnbjZLbMcvSVu4m5VZlpyDDLwAjepHuUm8wXXTF
	 wifbRsQuRpEp5tFk6OmnKruuz3TOu6qoTNgbdnxAvwjnN/7h6jdPDR0rLEUhUIou9V
	 2qJJl+UPjsx8EeWxx3aHZXKTrwbWUDuUi9c2Na+V4kZy3SdzmikE6idit9LeV2d3e+
	 7/xfUhrefmTKQ==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Wed, 30 Apr 2025 19:26:17 +0800
Subject: [PATCH v2 2/2] i2c: i801: don't instantiate spd5118 under SPD
 Write Disable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-2-2f54d91ae2c7@canonical.com>
References: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-0-2f54d91ae2c7@canonical.com>
In-Reply-To: <20250430-for-upstream-i801-spd5118-no-instantiate-v2-0-2f54d91ae2c7@canonical.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2437; i=leo.lin@canonical.com;
 h=from:subject:message-id; bh=AbHh2ssONKGBIYKgH6PqJXTxXxyZMFCbetbQ8EQiCjc=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBoEgjxPTN5tKk+U8i7v/xRvLKzW4RVnt3SqHhj4
 +X3x/BgY1OJAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCaBII8QAKCRBfF7GWSinu
 hnvsD/0QAGcg2QlXhXv1WtT1DMf4omVupyQGAJ3R6pjYTiQSis2Pt246FCzFRKZ7vqQjCnTGaJs
 ZsPRKQ9hcFhUTYgGuvuy3bD9FxzwJck4SJGLHO/gPFRZiroKu8xmdVqz8jMlRvSGMPezrA8hPM5
 BqoL0v4VYDAG3yDU1SGTB2JsDzu0/t73shkF95YMveSRlxtaZuzQCDQr9R0QM94cpQOY34fq/qg
 KxHxQf2w8RHiy9pTfAAmj00VCWMjMrQkefTf4uhi44ksVacjm1ToV7oQ9jNXnDvUzU+e4xM17rt
 Z/CVkuBPpv6oSRvCc7r8JhtAAlmSgZJSujoa93X4pdTxnIVkfIGknnCfhLNKmYRdRkraNa7Frl3
 vURyqq0ELpQVBApkHEor5wBceDe1aHSoQC6GqWwLkbjweq6tNHVnE8vNcSbbjJ44dD6RtsWqkXH
 i3N4IB7+Gx1IfNcFj1fyBwMitLWd5TeqH4rVeycEEFLL6lDK+TqjLPi0mfgF0CXq0L7y9tQbF2W
 mYO6yYhM/BJRr8ExInl85Oy5ZWDL/ddSVytH22sQv/6tIgdeI+YASrw8DDd2I4EbDCi6IIuOQZX
 pBmXyNWf2RbVzbtmWdFOx719PDNyiPpYZh+pDhmU9Ghu0fz9l9tPojLDyHFVbowxtlCyab5/W11
 GsVWpgmTAFXrxsw==
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

Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
---
 drivers/i2c/busses/i2c-i801.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a7f89946dad4..88474409e82d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1177,10 +1177,12 @@ static void i801_probe_optional_targets(struct i801_priv *priv)
 		dmi_walk(dmi_check_onboard_devices, &priv->adapter);
 
 	/* Instantiate SPD EEPROMs unless the SMBus is multiplexed */
-#ifdef CONFIG_I2C_I801_MUX
-	if (!priv->mux_pdev)
-#endif
-		i2c_register_spd_write_enable(&priv->adapter);
+	if (!IS_ENABLED(CONFIG_I2C_I801_MUX) || !priv->mux_pdev) {
+		if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
+			i2c_register_spd_write_disable(&priv->adapter);
+		else
+			i2c_register_spd_write_enable(&priv->adapter);
+	}
 }
 #else
 static void __init input_apanel_init(void) {}
@@ -1283,7 +1285,10 @@ static int i801_notifier_call(struct notifier_block *nb, unsigned long action,
 		return NOTIFY_DONE;
 
 	/* Call i2c_register_spd for muxed child segments */
-	i2c_register_spd_write_enable(to_i2c_adapter(dev));
+	if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
+		i2c_register_spd_write_disable(to_i2c_adapter(dev));
+	else
+		i2c_register_spd_write_enable(to_i2c_adapter(dev));
 
 	return NOTIFY_OK;
 }

-- 
2.43.0


