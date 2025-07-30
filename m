Return-Path: <linux-i2c+bounces-12083-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49147B15F45
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 13:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1F2B189F6A6
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 11:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F7D4293C48;
	Wed, 30 Jul 2025 11:23:40 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99AB15383A;
	Wed, 30 Jul 2025 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753874619; cv=none; b=UWNA/tLH8a4N9NFyp09/+a+HuR84kxgjGxJ0IvsyFF5HEUlAKrqL9zcl/Hg6olvnzaVgMrESlnK/cUPOMR/nLZpnfx8jGjgKaDyimbB5L2vBX+8JTW4F/PZCuTpWfJM2uHJadXhERdKW2k8fMWjWSDMA79E9r0I2CA7SvUbHe+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753874619; c=relaxed/simple;
	bh=ado/mW/al6GgtHriar0Rs7TCQCI1FxEm96mQuOFcW2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tuBbGIhHGSO+DC2sGdaFdMe+ze1uWN9PLVhDYu67j7y9GOcvYISEdC9zeifO2wma/NdMnbljFZdZv0WOslqlW99rEQV5muVyfR+ZskrgnPWjPwH2HB6CIlg9caY2Ks/nFzKhAgs9Ym48BBIWObawVu7UBlO2L66yQH8rEWeggZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD71C4CEE7;
	Wed, 30 Jul 2025 11:23:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ivan Vecera <ivecera@redhat.com>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jakub Kicinski <kuba@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: netdev@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dpll: Make ZL3073X invisible
Date: Wed, 30 Jul 2025 13:23:32 +0200
Message-ID: <97804163aeb262f0e0706d00c29d9bb751844454.1753874405.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the user is always asked about the Microchip Azurite
DPLL/PTP/SyncE core driver, even when I2C and SPI are disabled, and thus
the driver cannot be used at all.

Fix this by making the Kconfig symbol for the core driver invisible
(unless compile-testing), and selecting it by the bus glue sub-drivers.
Drop the modular defaults, as drivers should not default to enabled.

Fixes: 2df8e64e01c10a4b ("dpll: Add basic Microchip ZL3073x support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/dpll/zl3073x/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dpll/zl3073x/Kconfig b/drivers/dpll/zl3073x/Kconfig
index 7db262ab84582d29..9915f7423dea370c 100644
--- a/drivers/dpll/zl3073x/Kconfig
+++ b/drivers/dpll/zl3073x/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config ZL3073X
-	tristate "Microchip Azurite DPLL/PTP/SyncE devices"
+	tristate "Microchip Azurite DPLL/PTP/SyncE devices" if COMPILE_TEST
 	depends on NET
 	select DPLL
 	select NET_DEVLINK
@@ -16,9 +16,9 @@ config ZL3073X
 
 config ZL3073X_I2C
 	tristate "I2C bus implementation for Microchip Azurite devices"
-	depends on I2C && ZL3073X
+	depends on I2C
 	select REGMAP_I2C
-	default m
+	select ZL3073X
 	help
 	  This is I2C bus implementation for Microchip Azurite DPLL/PTP/SyncE
 	  devices.
@@ -28,9 +28,9 @@ config ZL3073X_I2C
 
 config ZL3073X_SPI
 	tristate "SPI bus implementation for Microchip Azurite devices"
-	depends on SPI && ZL3073X
+	depends on SPI
 	select REGMAP_SPI
-	default m
+	select ZL3073X
 	help
 	  This is SPI bus implementation for Microchip Azurite DPLL/PTP/SyncE
 	  devices.
-- 
2.43.0


