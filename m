Return-Path: <linux-i2c+bounces-8167-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9649D730B
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 15:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2BE1281A3F
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 14:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA02212EFD;
	Sun, 24 Nov 2024 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3Pz68Ax"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C4A212EF4;
	Sun, 24 Nov 2024 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732455911; cv=none; b=STbByf6DPw78jH0Lm/jjKJsyIDSJHTqnBqcOLLHWyNhRiqSKoB39o2IPJCsUO4A4HwqIT0JzMeTYmb/Xww1ijJKaSNb0osr+P4GVzt0MJEfSgdypU/I0KVZgksnH9AzLkhm3R2XIKS3ghXPiw4bG3Dmbmm1BaaOfW0dg/7Psy9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732455911; c=relaxed/simple;
	bh=Za9kCBxWoL4z2LTmVf0IGghmPVV7WbHS9v++BgVF4Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cYJEmFPMajdR+t/vL3P00hM+vMfbJJcmyelXLjC3HbRulPRlfvHmn/g9fwHMzuwBddzScRLPf9P6ShXKs0+KTqSau3lx/X3v0bAPgL6fzRkutuFctVCg4NWQGaxAqDY29DGQaT1OxyCFmKA7sn1mH47IfYFLkFCFvWEaH+hpx0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3Pz68Ax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94389C4CECC;
	Sun, 24 Nov 2024 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732455911;
	bh=Za9kCBxWoL4z2LTmVf0IGghmPVV7WbHS9v++BgVF4Ik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M3Pz68AxXAn4i2rfpby1G8399nuVWh2ez30G+91m51iFiKiaFxlLs9b9cwoSKlFqv
	 mB01d2p0kiCcUgcmBxR0eHjWzWoLdZ7GGMnhv1usKPu0/J42pPF0ANu4yVjkh03UlG
	 RiNT6vp1b+Fz1dRHihVVPomLwe48C7bifbM2DseasNgN96JDygiu/X1Vztco485vnV
	 2S4VGrVF4655UWqnURGOwHvX1K+EProaJidLQ0em2qY85Eax9Iy6YHt/X0GppAorJh
	 YmbVSp2xiaDOqDUpwFcC2/Rw3/HoZLjwjhqkF5+lLB3FYDytllSQ9uH87I4UCDXi0L
	 AuRqXUVmllR/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jdelvare@suse.com,
	wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 75/87] i2c: i801: Add support for Intel Panther Lake
Date: Sun, 24 Nov 2024 08:38:53 -0500
Message-ID: <20241124134102.3344326-75-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Jarkko Nikula <jarkko.nikula@linux.intel.com>

[ Upstream commit bd492b58371295d3ae26162b9666be584abad68a ]

Add SMBus PCI IDs on Intel Panther Lake-P and -U.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/i2c/busses/i2c-i801.rst | 1 +
 drivers/i2c/busses/Kconfig            | 1 +
 drivers/i2c/busses/i2c-i801.c         | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index c840b597912c8..47e8ac5b7099f 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -49,6 +49,7 @@ Supported adapters:
   * Intel Meteor Lake (SOC and PCH)
   * Intel Birch Stream (SOC)
   * Intel Arrow Lake (SOC)
+  * Intel Panther Lake (SOC)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a22f9125322a7..e14281aed1acf 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -160,6 +160,7 @@ config I2C_I801
 	    Meteor Lake (SOC and PCH)
 	    Birch Stream (SOC)
 	    Arrow Lake (SOC)
+	    Panther Lake (SOC)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 299fe9d3afab0..75dab01d43a75 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -81,6 +81,8 @@
  * Meteor Lake PCH-S (PCH)	0x7f23	32	hard	yes	yes	yes
  * Birch Stream (SOC)		0x5796	32	hard	yes	yes	yes
  * Arrow Lake-H (SOC)		0x7722	32	hard	yes	yes	yes
+ * Panther Lake-H (SOC)		0xe322	32	hard	yes	yes	yes
+ * Panther Lake-P (SOC)		0xe422	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -261,6 +263,8 @@
 #define PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS		0xa323
 #define PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS		0xa3a3
 #define PCI_DEVICE_ID_INTEL_METEOR_LAKE_SOC_S_SMBUS	0xae22
+#define PCI_DEVICE_ID_INTEL_PANTHER_LAKE_H_SMBUS	0xe322
+#define PCI_DEVICE_ID_INTEL_PANTHER_LAKE_P_SMBUS	0xe422
 
 struct i801_mux_config {
 	char *gpio_chip;
@@ -1055,6 +1059,8 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_PCH_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, BIRCH_STREAM_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, ARROW_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.43.0


