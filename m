Return-Path: <linux-i2c+bounces-2779-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A8899FA4
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 16:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00A3E1C227F2
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 14:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FD116EC00;
	Fri,  5 Apr 2024 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTWuCqC+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D1116EBEB;
	Fri,  5 Apr 2024 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712327309; cv=none; b=XaVcdKOhCzVjDwmXeGdDv2RGWzk8hlfOieXsFp9+x7GrwYoW3RMxfYL0DrdwO5+RRwokk4ewgR7izDBCzmwIBq/bliHD/LfYKWl8z/GeboCMW5lxJ1hdTzCX2Jd0TRLM9abvF3cPU0fl2BSfDfr2xoUCMK59lxsJcebMvgvIKZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712327309; c=relaxed/simple;
	bh=F4cLYa35bs+vGQ3otj+tZ+gR8cVZxKEOwbRS5rXqeIs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cce405HXDMmHtqzY8Zk+bcMCdT7wBMCrQ0St7Rvf6te5RfVNrQiTMrkXBo439aInO3Q+jL1PoDXp2Mmei5UmLIgTfVRb5x7g1TCvd5dT35HXPScP01o7i9HiyGKnsyHRDBw02KLqMWpY4lSqcEkggMBPnC0xMUyuwNVKP/Hi7QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTWuCqC+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59386C433C7;
	Fri,  5 Apr 2024 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712327308;
	bh=F4cLYa35bs+vGQ3otj+tZ+gR8cVZxKEOwbRS5rXqeIs=;
	h=From:To:Cc:Subject:Date:From;
	b=UTWuCqC+8b5MhYjP6DSeqxRKQ8lNjzTxo8BjDSmC4rmygV3ZmHxeuDm6taFnHcTLi
	 I3dGLOh5C6e97Zb6AG0LIKKU5OrERSHoIrSBNkCmvXd1VzouW2o34NswRB0KaKQfch
	 dfnUFI8zg5l3QUUFil45D2OE/oZpiqQTl199EicMVz0YDf8RjEPDnTRCYJGgjRVrUH
	 tEiDM1SSouzBnlpDBgNaBxG6Nw2xaXul6MyNyqeeeoCpVh1uytcuZft19Nk6RmHCUl
	 EUeFw/49COhyba0lkwpOcAS9CKMVoHLsrcBDNK5UNwUNeAVj4SblpxmNujB+5qd7z0
	 /ieUcQTLuWqtg==
From: Arnd Bergmann <arnd@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jean Delvare <jdelvare@suse.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH] i2c: i801: add I2C_MUX dependency
Date: Fri,  5 Apr 2024 16:27:43 +0200
Message-Id: <20240405142823.615609-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When I2C_MUX is a loadable module but I2C_I801 is built-in, the newly
added notifier function causes a link error:

x86_64-linux-ld: drivers/i2c/busses/i2c-i801.o: in function `i801_notifier_call':
i2c-i801.c:(.text+0x1f5): undefined reference to `i2c_root_adapter'

This code is only built if I2C_MUX_GPIO is also enabled, so add a
conditional dependency that allows building the driver as before if the
GPIO part is disabled, but otherwise require the linker dependency at
Kconfig level.

With the added dependency, the driver cannot be selected by a builtin
ITCO_WDT driver when I2C_MUX_GPIO is a loadable module, so remove
the 'select' statement in that driver as well. This was apparently
never needed at compile-time, and the watchdog driver just needs either
the LPC or the I2C drivers, but never both.

Configurations that rely on the implied 'select' from the watchdog
driver now need to enable all three.

Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child segments")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/Kconfig | 1 +
 drivers/watchdog/Kconfig   | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 1872f1995c77..2619018dd756 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -108,6 +108,7 @@ config I2C_HIX5HD2
 config I2C_I801
 	tristate "Intel 82801 (ICH/PCH)"
 	depends on PCI
+	depends on I2C_MUX || I2C_MUX_GPIO=n
 	select P2SB if X86
 	select CHECK_SIGNATURE if X86 && DMI
 	select I2C_SMBUS
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0b0df3fe1efd..4dfb3773e6e2 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1301,8 +1301,6 @@ config ITCO_WDT
 	select WATCHDOG_CORE
 	depends on I2C || I2C=n
 	depends on MFD_INTEL_PMC_BXT || !MFD_INTEL_PMC_BXT
-	select LPC_ICH if !EXPERT
-	select I2C_I801 if !EXPERT && I2C
 	help
 	  Hardware driver for the intel TCO timer based watchdog devices.
 	  These drivers are included in the Intel 82801 I/O Controller
-- 
2.39.2


