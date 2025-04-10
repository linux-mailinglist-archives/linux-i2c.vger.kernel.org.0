Return-Path: <linux-i2c+bounces-10257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2CA84DBC
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 22:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5264A1BA1516
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 20:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5630290BC8;
	Thu, 10 Apr 2025 20:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u41KXSbx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B78E290BC2;
	Thu, 10 Apr 2025 20:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315345; cv=none; b=L41fyG9VzlHop4KgYw16dQ9dRtSaoojM5RsJnH3VFGJ8GQWZ/0uJPbxoLpFyTgZ2OdCTz5bEjeCfOoaJDL57gZ75P+W1dCLavrMEnwnUTnFZiGPyH++ABcv23FUUT8G7/+s1wd2UkyqFGYUUpK9Pk5dbqBnxrJCzav9VH7zKopY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315345; c=relaxed/simple;
	bh=w/RU2A4df4biQl18BgwTSbH3JxoDffUQCgnJgrJx7gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bAUHW036em/sROZwQ27eFY3LSu1nBHAjnOaR6FEj/132knN4o9SHPwSfPvNslYa1XNeG0LZ24OfK/TYytjcIEjqiXBi877+MjK0CQdqNeEy6yTjzVHzGy9DW8FS1EvGInX/zaakzRCt3qBLAV3uL2vZxSNnw1IV7omu2wHCdipQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u41KXSbx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32300C4CEF0;
	Thu, 10 Apr 2025 20:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744315344;
	bh=w/RU2A4df4biQl18BgwTSbH3JxoDffUQCgnJgrJx7gQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u41KXSbxzySGPgWWMEoPvJYRRYjoqHM/CWspk3nBt1++CsW3vOdNM3D/UKeEwWJnM
	 K5btupqvestckKK3A8D41pEBnANFWNDLIlyJhlvZPoPGEslJF1w8jU35mJG3J1FmwE
	 MeIztEmilf3Gaz95pSvwBFD23rlH0X1NHEpmG5a/6yGvI1KwTaFvTht9p2DtXIvTDt
	 xfI+P+4JlxKblXSfpgMoWwA8sxNcAJ5sr5GNsW1v2hGjwdu9zE47/hWVQd5/OPsZ/h
	 TOnoqCJPcxTosq1X8j+NEWgQ5edov7ZBraXA6A2+lJUYpWobxrvivIc11pM0Oe7cB8
	 leUwmVyO2qXnQ==
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
Subject: [PATCH v3 3/4] platform/x86/amd: pmc: use FCH_PM_BASE definition
Date: Thu, 10 Apr 2025 15:02:01 -0500
Message-ID: <20250410200202.2974062-4-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410200202.2974062-1-superm1@kernel.org>
References: <20250410200202.2974062-1-superm1@kernel.org>
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
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index b4f49720c87f6..9d817209e407f 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -8,19 +8,22 @@
  * Author: Mario Limonciello <mario.limonciello@amd.com>
  */
 
+#include <asm/amd_node.h>
 #include <linux/dmi.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
 
 #include "pmc.h"
 
+#define FCH_PM_SCRATCH	0x80
+
 struct quirk_entry {
 	u32 s2idle_bug_mmio;
 	bool spurious_8042;
 };
 
 static struct quirk_entry quirk_s2idle_bug = {
-	.s2idle_bug_mmio = 0xfed80380,
+	.s2idle_bug_mmio = FCH_PM_BASE + FCH_PM_SCRATCH,
 };
 
 static struct quirk_entry quirk_spurious_8042 = {
-- 
2.43.0


