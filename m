Return-Path: <linux-i2c+bounces-8166-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC69D71FC
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 14:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C60592843D9
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Nov 2024 13:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08571E909A;
	Sun, 24 Nov 2024 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1wblvcR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8345C1E9093;
	Sun, 24 Nov 2024 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732455514; cv=none; b=JBmb9hJgOK52W5qzvw07VCLQlLwmvB2A0o7cez361gTXmRaJIBvce6bwwk+BICoN+CrayXqaV9I9Rnk6K++KzXQdqRzkqZaZkSWe12/Pioma6+6jFid/+pwSIXGCJxXB3YwjSZJRY+3CT7MCNFSxOT/s/S2+26D6gZOPOW4ts3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732455514; c=relaxed/simple;
	bh=laDrs0Vb2L0/CzdXMIjKElRV1JFcqlTDdyHVbdJUJDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDTdw6JKmw5hdScBu83WyWpGt01TwzTux35s9dhoxUlrx10PEUGmOw8Iw72lAnbdBJl5+DQRSpOR9Rfw8/u4VgNM1Dlrc94lm+wLqYm1kIVHdQ5JbQ5VvMvYVdZ4op/mt6Bc7C8GFl2yXMKdaz/DvI6DfJ2WNhdB9Nzvs4/rqNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1wblvcR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23983C4CECC;
	Sun, 24 Nov 2024 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732455514;
	bh=laDrs0Vb2L0/CzdXMIjKElRV1JFcqlTDdyHVbdJUJDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V1wblvcR88d7YU5GuXysMJl89JjtrN31JCDAjYiOLpEry3qEu2pHyECn7ToGEgZVM
	 qcliE38OZ2sHEQ/YvaepRfxPtL2ZoRBO15z4Zp1ex1iXNkxLS3HikxmTL6CbpXNo8a
	 QBcKsCPJ4sZkqKaJgyPZGEV0+RA4P3cItXtRAh14zJV0OieU2NAJ2NIHmCEAYDgK4X
	 rIgxH4GlDpt5YX175/nFG/E6jlcGfFjk8xKZfcjf58HNb5YjxpAumR20E1+ZJhRsJn
	 MbbagZ40PpBbTJluhgEJNSOLYUahtW7mw7mVF2raoroW8g+QRh+8UGm/KraibwnPAM
	 Sl/dcYdYTvQkg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jdelvare@suse.com,
	wsa+renesas@sang-engineering.com,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 092/107] i2c: i801: Add support for Intel Panther Lake
Date: Sun, 24 Nov 2024 08:29:52 -0500
Message-ID: <20241124133301.3341829-92-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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
index 6b3ba7e5723aa..2254abda5c46c 100644
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


