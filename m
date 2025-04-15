Return-Path: <linux-i2c+bounces-10338-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 985EFA89087
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 02:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E54C3A694E
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 00:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7641917A2FB;
	Tue, 15 Apr 2025 00:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxUBHhRu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2919A176ADB;
	Tue, 15 Apr 2025 00:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744676840; cv=none; b=MgEcf89IQ8g75IrhXj1CsUqNn65xEqlcrA0xnjJst5SOvHmm165euXUzf+SyKnmHuB9XywYVji+wIRgDhXvCjZAYAgzRi3izNGmP0pZyrzeONnJ3iftZ6rek6m1M2MIwNrFgaxaaUTurY9teqQd8gcUbH0xGD+BijOcM0B/Pvng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744676840; c=relaxed/simple;
	bh=kqMU7kGHOah8Smsm3vfblSteI+QgRbx0dqIFMAGWhWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ivz12EDnuJWUP7SNnNOVnPLYlPHesuUZcQWFrCiokvVay2B9dMjVKZNZE0kFt8a88jrgtwHyFB5N7Ts39K45ezH3PqsnXh6mKEt0iaXQ0VaHqYD6vFl087YgV/wQ2rKcEUqM20dtkqZb/iuKcUI7iaMNUknxA/eHiL/BmHqrdxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxUBHhRu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C017C4CEE2;
	Tue, 15 Apr 2025 00:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676840;
	bh=kqMU7kGHOah8Smsm3vfblSteI+QgRbx0dqIFMAGWhWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kxUBHhRuu1Z+DN2A/bcFdh4BLuSfTN7MIZy1IJchqHZMeZ4wvMX/Nez3yLtpkO7Zk
	 TzVDqo9RVicqPyY+DY+AJFxxwZ0uQNOxRTF+8zuEEqGmRewmT3SkYpsv7z0aVM+lFk
	 BoUW0Uuml/PhheOvm6f8hoqRzX69jWqaP5pg5ratM8jw7ziKGutyrqoJFGZ4mw2xyG
	 3z7YweVW2OkxXmGSOKnoITb+VW7rYcguroX7YbXOjOD8eYP6rin093jh1MUae8t1DF
	 pFKXQ85XW+1P5PNFRtJedQMDqs8XLuHIFwJO9Ppyornflj/9RTRybB7gkAHCQPmm3h
	 wxmDTsYAvkRPg==
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
Subject: [PATCH v4 5/5] x86/CPU/AMD: Print the reason for the last reset
Date: Mon, 14 Apr 2025 19:26:58 -0500
Message-ID: <20250415002658.1320419-6-superm1@kernel.org>
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

From: Yazen Ghannam <yazen.ghannam@amd.com>

The following register contains bits that indicate the cause for the
previous reset.

        PMx000000C0 (FCH::PM::S5_RESET_STATUS)

This is useful for debug. The reasons for reset are broken into 6 high
level categories. Decode it by category and print during boot.

Specifics within a category are split off into debugging documentation.

The register is accessed indirectly through a "PM" port in the FCH. Use
MMIO access in order to avoid restrictions with legacy port access.

Use a late_initcall() to ensure that MMIO has been set up before trying
to access the register.

This register was introduced with AMD Family 17h, so avoid access on
older families. There is no CPUID feature bit for this register.

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v4:
 * Use loop that can output multiple reasons
 * Drop "Unknown" condition and have dedicated message
v3:
 * Align strings in the CSV and code.
 * Switch to an array of strings
 * Switch to looking up bit of first value
 * Re-order message to have number first (makes grepping easier)
 * Add x86/amd prefix to message
v2:
 * Add string for each reason, but still include value in case multiple
   values are set.
---
 Documentation/arch/x86/amd-debugging.rst | 42 ++++++++++++++++
 arch/x86/include/asm/amd/fch.h           |  1 +
 arch/x86/kernel/cpu/amd.c                | 64 ++++++++++++++++++++++++
 3 files changed, 107 insertions(+)

diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
index ba99d672a1f4d..48c03b04fc4ab 100644
--- a/Documentation/arch/x86/amd-debugging.rst
+++ b/Documentation/arch/x86/amd-debugging.rst
@@ -271,3 +271,45 @@ EPP Policy
 The ``energy_performance_preference`` sysfs file can be used to set a bias
 of efficiency or performance for a CPU.  This has a direct relationship on
 the battery life when more heavily biased towards performance.
+
+Random reboot issues
+====================
+When a random reboot occurs, the high-level reason for the reboot is stored
+in a register that will persist onto the next boot.
+
+There are 6 classes of reasons for the reboot:
+ * Software induced
+ * Power state transition
+ * Pin induced
+ * Hardware induced
+ * Remote reset
+ * Internal CPU event
+
+.. csv-table::
+   :header: "Bit", "Type", "Reason"
+   :align: left
+
+   "0",  "Pin",      "thermal pin BP_THERMTRIP_L was tripped"
+   "1",  "Pin",      "power button was pressed for 4 seconds"
+   "2",  "Pin",      "shutdown pin was shorted"
+   "4",  "Remote",   "remote ASF power off command was received"
+   "9",  "Internal", "internal CPU thermal limit was tripped"
+   "16", "Pin",      "system reset pin BP_SYS_RST_L was tripped"
+   "17", "Software", "software issued PCI reset"
+   "18", "Software", "software wrote 0x4 to reset control register 0xCF9"
+   "19", "Software", "software wrote 0x6 to reset control register 0xCF9"
+   "20", "Software", "software wrote 0xE to reset control register 0xCF9"
+   "21", "Sleep",    "ACPI power state transition occurred"
+   "22", "Pin",      "keyboard reset pin KB_RST_L was asserted"
+   "23", "Internal", "internal CPU shutdown event occurred"
+   "24", "Hardware", "system failed to boot before failed boot timer expired"
+   "25", "Hardware", "hardware watchdog timer expired"
+   "26", "Remote",   "remote ASF reset command was received"
+   "27", "Internal", "an uncorrected error caused a data fabric sync flood event"
+   "29", "Internal", "FCH and MP1 failed warm reset handshake"
+   "30", "Internal", "a parity error occurred"
+   "31", "Internal", "a software sync flood event occurred"
+
+This information is read by the kernel at bootup and is saved into the
+kernel ring buffer. When a random reboot occurs this message can be helpful
+to determine the next component to debug such an issue.
diff --git a/arch/x86/include/asm/amd/fch.h b/arch/x86/include/asm/amd/fch.h
index 9b32e8a03193e..4a6e1e3b685a4 100644
--- a/arch/x86/include/asm/amd/fch.h
+++ b/arch/x86/include/asm/amd/fch.h
@@ -9,5 +9,6 @@
 #define FCH_PM_DECODEEN			0x00
 #define FCH_PM_DECODEEN_SMBUS0SEL	GENMASK(20, 19)
 #define FCH_PM_SCRATCH			0x80
+#define FCH_PM_S5_RESET_STATUS		0xC0
 
 #endif
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index a839ff506f454..32ecb70cce5dc 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -9,6 +9,7 @@
 #include <linux/sched/clock.h>
 #include <linux/random.h>
 #include <linux/topology.h>
+#include <asm/amd/fch.h>
 #include <asm/processor.h>
 #include <asm/apic.h>
 #include <asm/cacheinfo.h>
@@ -1232,3 +1233,66 @@ void amd_check_microcode(void)
 	if (cpu_feature_enabled(X86_FEATURE_ZEN2))
 		on_each_cpu(zenbleed_check_cpu, NULL, 1);
 }
+
+static const char * const s5_reset_reason_txt[] = {
+	[0] = "thermal pin BP_THERMTRIP_L was tripped",
+	[1] = "power button was pressed for 4 seconds",
+	[2] = "shutdown pin was shorted",
+	[4] = "remote ASF power off command was received",
+	[9] = "internal CPU thermal limit was tripped",
+	[16] = "system reset pin BP_SYS_RST_L was tripped",
+	[17] = "software issued PCI reset",
+	[18] = "software wrote 0x4 to reset control register 0xCF9",
+	[19] = "software wrote 0x6 to reset control register 0xCF9",
+	[20] = "software wrote 0xE to reset control register 0xCF9",
+	[21] = "ACPI power state transition occurred",
+	[22] = "keyboard reset pin KB_RST_L was asserted",
+	[23] = "internal CPU shutdown event occurred",
+	[24] = "system failed to boot before failed boot timer expired",
+	[25] = "hardware watchdog timer expired",
+	[26] = "remote ASF reset command was received",
+	[27] = "an uncorrected error caused a data fabric sync flood event",
+	[29] = "FCH and MP1 failed warm reset handshake",
+	[30] = "a parity error occurred",
+	[31] = "a software sync flood event occurred",
+};
+
+static __init int print_s5_reset_status_mmio(void)
+{
+	void __iomem *addr;
+	unsigned long value;
+	int nr_reasons = 0;
+	int bit = -1;
+
+	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
+		return 0;
+
+	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
+	if (!addr)
+		return 0;
+
+	value = ioread32(addr);
+	iounmap(addr);
+
+	/* Iterate on each bit in the 'value' mask: */
+	while (true) {
+		bit = find_next_bit(&value, BITS_PER_LONG, bit + 1);
+
+		/* Reached the end of the word, no more bits: */
+		if (bit >= BITS_PER_LONG) {
+			if (!nr_reasons)
+				pr_info("x86/amd: Previous system reset reason [0x%08lx]: Unknown\n", value);
+			break;
+		}
+
+		if (!s5_reset_reason_txt[bit])
+			continue;
+
+		nr_reasons++;
+		pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
+			value, s5_reset_reason_txt[bit]);
+	}
+
+	return 0;
+}
+late_initcall(print_s5_reset_status_mmio);
-- 
2.43.0


