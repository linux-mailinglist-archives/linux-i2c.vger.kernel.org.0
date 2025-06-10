Return-Path: <linux-i2c+bounces-11353-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC87AD4449
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 22:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5AD6165243
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 20:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A83D2673B9;
	Tue, 10 Jun 2025 20:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1fplW04"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AC1264A85;
	Tue, 10 Jun 2025 20:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589121; cv=none; b=XwulPhYkFa+K58gB7rd6phx9xKDTGz9ewMNR2OwMRFZvUPl5SSzzAKcoC1EKUvgLnZAc/7WvBfZjsTvy53N/32Frtc/RUjnqSinUZwQlqVh0ezwwZUxifGHuhPE5RpsrqHov78lrUbGnBTQ1ocQPQVNxOx2eybsPEFxeSIvgWis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589121; c=relaxed/simple;
	bh=qm3uF6HSzJnRnw72+spsb/hFAmy0FfViB4PecXNYNVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qImX44JLVhpbQpf84Q9Kw1+aEkJXRIW2fD11jxNQo5TG226ZIHeGTBGtfgooWDoTnqCnbpFrLJSlj6eNyZFf3vtfqpjVXsYzBVak05AnT+NoyJM3MzhuSBu/qgjgHGPXSTROtNs4JJRlfYXBOszeRDiFj3DqH9lgpkCtNWLK8GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1fplW04; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB9FC4CEED;
	Tue, 10 Jun 2025 20:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749589121;
	bh=qm3uF6HSzJnRnw72+spsb/hFAmy0FfViB4PecXNYNVg=;
	h=From:To:Cc:Subject:Date:From;
	b=k1fplW04yy6+qHw/isDiwWRXbz+MBex3RvCws52wxu8s7yojNk1RfUT1OeNpJSSMR
	 IeMhDzuQC9Yxl52p0ODzdHjbepJyfRjNqnOzfK6KW+wSoyYUyMeoewTxzLAw+yV5wD
	 DH4g+B7v+ldHkheavFnTz1Pfr+m4LkE3g/jsstlQTbb5zjSWH1GKsL9zgmE3eqiZ03
	 i8Xk7a+WAy07BQe1kBHBPzDuOgaxlqQF1in8KMnzizkVAWU8Ch7A3PgjoKGXdLcm9x
	 Va5Ou8s69GjMWDTrE+e4pBWrfah6Dl/TtEYYHYLKgcXEW1ZVwF1pkpzivScatniuQG
	 hJypUqLSIN18g==
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
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 1/2] Move FCH header to a location accessible by all archs
Date: Tue, 10 Jun 2025 15:58:16 -0500
Message-ID: <20250610205817.3912944-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

A new header fch.h was created to store registers used by different AMD
drivers.  This header was included by i2c-piix4 in
commit 624b0d5696a8 ("i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH
definitions to <asm/amd/fch.h>"). To prevent compile failures on non-x86
archs i2c-piix4 was set to only compile on x86 by commit 7e173eb82ae9717
("i2c: piix4: Make CONFIG_I2C_PIIX4 dependent on CONFIG_X86").
This was not a good decision because loongarch and mips both actually
support i2c-piix4 and set it enabled in the defconfig.

Move the header to a location accessible by all architectures.

Fixes: 624b0d5696a89 ("i2c: piix4, x86/platform: Move the SB800 PIIX4 FCH definitions to <asm/amd/fch.h>")
Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 arch/x86/kernel/cpu/amd.c                                       | 2 +-
 drivers/i2c/busses/i2c-piix4.c                                  | 2 +-
 drivers/platform/x86/amd/pmc/pmc-quirks.c                       | 2 +-
 .../asm/amd/fch.h => include/linux/platform_data/x86/amd-fch.h  | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/x86/include/asm/amd/fch.h => include/linux/platform_data/x86/amd-fch.h (100%)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 93da466dfe2cb..9543d5de4e7d6 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -9,7 +9,7 @@
 #include <linux/sched/clock.h>
 #include <linux/random.h>
 #include <linux/topology.h>
-#include <asm/amd/fch.h>
+#include <linux/platform_data/x86/amd-fch.h>
 #include <asm/processor.h>
 #include <asm/apic.h>
 #include <asm/cacheinfo.h>
diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 9d3a4dc2bd60c..ac3bb550303fe 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -34,7 +34,7 @@
 #include <linux/dmi.h>
 #include <linux/acpi.h>
 #include <linux/io.h>
-#include <asm/amd/fch.h>
+#include <linux/platform_data/x86/amd-fch.h>
 
 #include "i2c-piix4.h"
 
diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 5c7c01f66cde0..6648fe0dce537 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -11,7 +11,7 @@
 #include <linux/dmi.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
-#include <asm/amd/fch.h>
+#include <linux/platform_data/x86/amd-fch.h>
 
 #include "pmc.h"
 
diff --git a/arch/x86/include/asm/amd/fch.h b/include/linux/platform_data/x86/amd-fch.h
similarity index 100%
rename from arch/x86/include/asm/amd/fch.h
rename to include/linux/platform_data/x86/amd-fch.h
-- 
2.43.0


