Return-Path: <linux-i2c+bounces-10337-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22563A89085
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 02:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C5E83A4E39
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 00:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1D315CD52;
	Tue, 15 Apr 2025 00:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8DveNRn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903A0664C6;
	Tue, 15 Apr 2025 00:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744676838; cv=none; b=WIur/lqFaLmc1juChLHcAoIszJZYY2iSSuNwkC78DqpgPPWCfFgtf9qGtEx6YM4o+c3EQV5kuSHxLTAFaoBN2BsKlFxr9fHg25EkfvMdKTNbFZg04CjNFbUOZMKsWTS4iw6ACqMKYD0WER9N6xOlSxsqCYVAJQFOCCAIMO3gIS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744676838; c=relaxed/simple;
	bh=3PZGgeloL2FPnEpZbWe+5dkglLcVFWEmJTDvvWazHA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DebBf5fHBNbVcyl6Rc4KCQRXPNPUZYCmXGOXtXNbKZqel+N4qTpmmFd9pjBPyZ3rC9nr+/6/Z6EUbopP5z1HaJCmZro6YWf6Q8ErKxXgmWYXM3/qvXHvMagE3Mh0VlhcpnzIF+a0BCPDwi42hpuMCZy1hHwsX8iLseYO5h9Dit0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8DveNRn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53949C4CEEA;
	Tue, 15 Apr 2025 00:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676838;
	bh=3PZGgeloL2FPnEpZbWe+5dkglLcVFWEmJTDvvWazHA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G8DveNRngd6VcmpueND/VjYEA6n11bdZ+b7vZlU3c2gUXIBFccWzevvlEpnE25rVx
	 chI/0YyWFGvFIu8Zt/nhmqZsCgp7pQbBO4NmBCs+n/DRwpzAlkfRPi/Vo7YTp2/Av7
	 vum5f6i5HIydYOMQKPpUh3xFCQ7brsO67bhCPLjkf1Z8vr0q9XKkiekDgsZp4hKHgV
	 mVcPRDyBf4OnnRJr+PfS/RPfeRQ67wTcMIqRERsB+bx7CVefsV1FXQ2USjB875kHa6
	 5dMstpjA/zVH4G+8HY0sMxk1Mp2CFycu/fEC8XRF3vObSvY+sbRr4qPGmkV+nV6eoZ
	 I+9emxkj46VzQ==
From: Mario Limonciello <superm1@kernel.org>
To: Borislav Petkov <bp@alien8.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-i2c@vger.kernel.org (open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC),
	platform-driver-x86@vger.kernel.org (open list:AMD PMC DRIVER)
Subject: [PATCH v4 4/5] platform/x86/amd: pmc: use FCH_PM_BASE definition
Date: Mon, 14 Apr 2025 19:26:57 -0500
Message-ID: <20250415002658.1320419-5-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415002658.1320419-1-superm1@kernel.org>
References: <20250415002658.1320419-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

The s2idle mmio quirk uses a scratch register in the FCH.
Adjust the code to clarify that.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v4:
 * Use fch.h instead
---
 arch/x86/include/asm/amd/fch.h            | 1 +
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/amd/fch.h b/arch/x86/include/asm/amd/fch.h
index a5fd91ff92df3..9b32e8a03193e 100644
--- a/arch/x86/include/asm/amd/fch.h
+++ b/arch/x86/include/asm/amd/fch.h
@@ -8,5 +8,6 @@
 /* register offsets from PM base */
 #define FCH_PM_DECODEEN			0x00
 #define FCH_PM_DECODEEN_SMBUS0SEL	GENMASK(20, 19)
+#define FCH_PM_SCRATCH			0x80
 
 #endif
diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index b4f49720c87f6..3c680d2029f62 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -8,6 +8,7 @@
  * Author: Mario Limonciello <mario.limonciello@amd.com>
  */
 
+#include <asm/amd/fch.h>
 #include <linux/dmi.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -20,7 +21,7 @@ struct quirk_entry {
 };
 
 static struct quirk_entry quirk_s2idle_bug = {
-	.s2idle_bug_mmio = 0xfed80380,
+	.s2idle_bug_mmio = FCH_PM_BASE + FCH_PM_SCRATCH,
 };
 
 static struct quirk_entry quirk_spurious_8042 = {
-- 
2.43.0


