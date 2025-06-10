Return-Path: <linux-i2c+bounces-11354-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C38AD444B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 22:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A6D97A7F34
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 20:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AD7267AF6;
	Tue, 10 Jun 2025 20:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVXiU4wM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAD5267728;
	Tue, 10 Jun 2025 20:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589123; cv=none; b=L2G+59Q+TfX+IGHVjA+QEPrzyFwi/T2GTbggpIKmiClrBHS1wSF0ByTWnmcv7GMiSlEee5SGTWXKJWZHDAgtAb/xX+khEd/ZJ46x1VDJWeUSv4u2EZc14wKX4I2uFv52r/oB2nlFbJabskS8XR8qU581KTgxrSwSA7UO9TNbdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589123; c=relaxed/simple;
	bh=OXrjCKmjyzr6ZOd61Pn1+kve/DAc9dhbDa/S85q7zkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFeH0sol0fHH6Ui15NJTctFSYaCZQg4JpEXd6DSsxPUBPm2RWKIzRP3+RjH0fH3KNf67J7Tw5XvInWsT1wz533dRtJ6aXwgicDql+PslLx1tgmNn7boHc5hPfu1jZ76tqnyZ3OIzf5udIGPcCaVSxdi4O7LGF0MPPLVmSGB+V0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVXiU4wM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425D9C4CEF0;
	Tue, 10 Jun 2025 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749589122;
	bh=OXrjCKmjyzr6ZOd61Pn1+kve/DAc9dhbDa/S85q7zkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IVXiU4wMaHETWcnleeHweUzEkZzWRZfpTFMK28+M6CEiyXDtpGbEhjAVZ3KK+5fT6
	 s1nS/1bWkDcd/vop0oJLluL7gAeqvQ22uqblmZVdF8Wi4LQeD5WVz226gIdeF0u9N4
	 EJOA7yKFS1tO51KxQYYgvkWKlUQjcxGBWXONhLbR3qJbsWHGzQX3HnbXBBllLe0CAg
	 Jy82qlHHZM/hDj8HCUrOr6Ivw/HYIJW5eUvjK4yeKUmMMg1xztP4e3Dq/iJD+gZKFR
	 Ss4gxwl9t/KUtp4KiY+ITSY1PB9sNpFcOUsgxROAR3ee3rb4kCIqe6uXtt8lQIPjfg
	 FZ3XxXuW3jlsA==
From: Mario Limonciello <superm1@kernel.org>
To: Ingo Molnar <mingo@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H . Peter Anvin" <hpa@zytor.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:AMD PMC DRIVER),
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] i2c: Re-enable piix4 driver on non-x86
Date: Tue, 10 Jun 2025 15:58:17 -0500
Message-ID: <20250610205817.3912944-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610205817.3912944-1-superm1@kernel.org>
References: <20250610205817.3912944-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

loongarch and mips both support hardware that uses the i2c-piix4 driver.
It should not be restricted to x86, so drop the x86 dependency.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdVPQLjOox5sMp34Z5MTwKv2WOpHa=MpZr8hWG22fQKcjw@mail.gmail.com/
Fixes: 7e173eb82ae97175 ("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86").
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 48c5ab8320090..3be623735ca8a 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -200,7 +200,7 @@ config I2C_ISMT
 
 config I2C_PIIX4
 	tristate "Intel PIIX4 and compatible (ATI/AMD/Serverworks/Broadcom/SMSC)"
-	depends on PCI && HAS_IOPORT && X86
+	depends on PCI && HAS_IOPORT
 	select I2C_SMBUS
 	help
 	  If you say yes to this option, support will be included for the Intel
-- 
2.43.0


