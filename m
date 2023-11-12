Return-Path: <linux-i2c+bounces-71-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE867E8FE9
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 14:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 495D0B209EB
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 13:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1628BF2;
	Sun, 12 Nov 2023 13:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVmK8s62"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9A78BE5
	for <linux-i2c@vger.kernel.org>; Sun, 12 Nov 2023 13:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F32C433C7;
	Sun, 12 Nov 2023 13:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795409;
	bh=eQrZnsK7eKn04L707p+/fl7HDU6+a/qE1c5ct8Xofxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rVmK8s62fefkKAbxtnJtssHN+WUMQvE34QdKUs/wDd4LY/pFUgn4QjHgTix3WNCxa
	 tr7nQuTeuyOWTB7rF74G65OZZ0um7pqcCY4Odjwj74WWQM+EnsMyTkEs6qTIp6lPTb
	 kxcIuSd9aKsEXZA7WRF5bpYzbOzHXl/DF37CVsQdFg2rV96qeiDD+75xWoeSbg1KL2
	 rZlU/7JKy5W3VYrZQFxQZ2iHxnSfQf9P9LozzigaznCj8a8ZJ8kizrUM1gEzcmqcOn
	 vJBDbyoDDcwduzr6/NdmH7CM61El4rSVRkfxlZHxcEQnBmRgFCcEXTENjcj/fZNRqE
	 Hw33xreIG6AJw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.de>,
	Wolfram Sang <wsa@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jdelvare@suse.com,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 2/7] i2c: i801: Add support for Intel Birch Stream SoC
Date: Sun, 12 Nov 2023 08:23:11 -0500
Message-ID: <20231112132323.174148-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132323.174148-1-sashal@kernel.org>
References: <20231112132323.174148-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.1
Content-Transfer-Encoding: 8bit

From: Jarkko Nikula <jarkko.nikula@linux.intel.com>

[ Upstream commit 8c56f9ef25a33e51f09a448d25cf863b61c9658d ]

Add SMBus PCI ID on Intel Birch Stream SoC.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/i2c/busses/i2c-i801.rst | 1 +
 drivers/i2c/busses/Kconfig            | 1 +
 drivers/i2c/busses/i2c-i801.c         | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index e76e68ccf7182..10eced6c2e462 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -47,6 +47,7 @@ Supported adapters:
   * Intel Alder Lake (PCH)
   * Intel Raptor Lake (PCH)
   * Intel Meteor Lake (SOC and PCH)
+  * Intel Birch Stream (SOC)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 6644eebedaf3b..97d27e01a6ee2 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -158,6 +158,7 @@ config I2C_I801
 	    Alder Lake (PCH)
 	    Raptor Lake (PCH)
 	    Meteor Lake (SOC and PCH)
+	    Birch Stream (SOC)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 1d855258a45dc..89631fdf6e2fe 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -79,6 +79,7 @@
  * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
  * Meteor Lake SoC-S (SOC)	0xae22	32	hard	yes	yes	yes
  * Meteor Lake PCH-S (PCH)	0x7f23	32	hard	yes	yes	yes
+ * Birch Stream (SOC)		0x5796	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -231,6 +232,7 @@
 #define PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS		0x4da3
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS		0x51a3
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS		0x54a3
+#define PCI_DEVICE_ID_INTEL_BIRCH_STREAM_SMBUS		0x5796
 #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
 #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
@@ -1044,6 +1046,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_SOC_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_PCH_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, BIRCH_STREAM_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.42.0


