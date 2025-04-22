Return-Path: <linux-i2c+bounces-10570-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 048BFA97B54
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 01:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA8213B7D3F
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Apr 2025 23:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5D5221FBF;
	Tue, 22 Apr 2025 23:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRwJE6Gm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877DC21C16E;
	Tue, 22 Apr 2025 23:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745365725; cv=none; b=GIfM6W1XAf/0sBUXUzGZF8t/HyJgp+KfiyT5nJ9/01JwKdeBG9v9RM7gzV2gg1C9o3Ap7HGdRnjB1kiI106B90wjjr+nzJiz2KCY4HU7jT3wtrsbSU3SKKTXNGv7PL5N8LeLTclOnw7pXY2vxkOd0XZs6Jl5RLGGrz+oUsWSVUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745365725; c=relaxed/simple;
	bh=FfDhZLx0ZCH2UPSNB8/x4ysPdIG2kObs5Tx0TBfNCOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6imm+wCc+5yNj59qJ6ZqtjbFWs9rTgP6h+K6nR40EDAHOPqL7Y4003HnMhPlGFRUNmiNppUqxsrqLTq+N1qe6rJE0dsmLZEhP0wRwvr2gZDuYnXczsHxxH1M3n5nR7dzteLeeUeaSW/7KFR8945PxrJeHuoCdvQFdu4bRXp6mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRwJE6Gm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E36C4CEEC;
	Tue, 22 Apr 2025 23:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745365725;
	bh=FfDhZLx0ZCH2UPSNB8/x4ysPdIG2kObs5Tx0TBfNCOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VRwJE6GmmZMdKHaKwbnmuF///JGC/J7w9x30NuLv82oOt3zi7s+KqYNiDxByZ1C8h
	 dT3dYt2JP2bzcRRTy+3wpyD9CEiw5yDa2EyRiZxePtiKFr1gU9S1LLc4ASUpzfa4/O
	 9S1TB7+ij2KBkQoyaGr1i0S5ATuGoUeN3pzLCnqfZ0pXac7iDwo+ykHkIRM7GwiVps
	 8QqukgBf4aMgupB6dJB8Wasq2azY5xlFbpKnmDOhDoV6upf8kN6oZMPdyoo3qE0iYc
	 63oC/ZxILyCziZ+7G6ftB87aIvcX4jfMzJpiWxcIs2w1M8tXLoI0dDp4/6mN5C790J
	 BmtvgLd0O1Syg==
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
Subject: [PATCH v5 4/5] platform/x86/amd: pmc: use FCH_PM_BASE definition
Date: Tue, 22 Apr 2025 18:48:29 -0500
Message-ID: <20250422234830.2840784-5-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422234830.2840784-1-superm1@kernel.org>
References: <20250422234830.2840784-1-superm1@kernel.org>
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
v5:
 * Move <asm> header after <linux> headers
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
index b4f49720c87f6..b706b1f4d94bf 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -11,6 +11,7 @@
 #include <linux/dmi.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
+#include <asm/amd/fch.h>
 
 #include "pmc.h"
 
@@ -20,7 +21,7 @@ struct quirk_entry {
 };
 
 static struct quirk_entry quirk_s2idle_bug = {
-	.s2idle_bug_mmio = 0xfed80380,
+	.s2idle_bug_mmio = FCH_PM_BASE + FCH_PM_SCRATCH,
 };
 
 static struct quirk_entry quirk_spurious_8042 = {
-- 
2.43.0


