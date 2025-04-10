Return-Path: <linux-i2c+bounces-10258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F7EA84DCA
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 22:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 518AE9A3887
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 20:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B87290094;
	Thu, 10 Apr 2025 20:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHnCNir2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53456293453;
	Thu, 10 Apr 2025 20:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315348; cv=none; b=lvh8DitAbAUfoi7XFrMIecLoAeJizi0S/1c3zsbTWObzUcRzwB1HktG81TDm/6mvHFjl7RPh+HrmqPUs2gpPCHnW0daIH/vMIEUaOp9XV4ThebIzj8mia+FHM4cItCR38wNTGre2vvbzL+FKy93AzBI1gnRt4T2Ykr22o6CuxnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315348; c=relaxed/simple;
	bh=HKokz0uKDHtOCWF8mVU98Ua+9d+BqiXJ5Xr3OER4avA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKtS+lbp2TqrYkPkAXl2BBD7A8uOTPqMbqnejLeyidz9LLHP+THbbLoKwzcwUn6u+CANd29X8R99LADZ8BHJEZW7sqbj2CKayONiL3Gl7Kl3rqFglzVR6a09cBvgxXuxvfapVLcij35lKa8hBGPi1S8HBoD50w9/dYhgt7JcEJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHnCNir2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF2CC4CEEB;
	Thu, 10 Apr 2025 20:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744315346;
	bh=HKokz0uKDHtOCWF8mVU98Ua+9d+BqiXJ5Xr3OER4avA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UHnCNir2w/qC/TUDrEZF6CUuXnAq7z4ttCiWJ7Zl6E4G4rJEXXpWt+vq2GKISyhsO
	 IqItkZJyoRyEZuzecc8VL4x0QTWnbFALNEcjHwd9EvC1iyAysslm7SQsCE9dL4z6d9
	 0FE58oRWLowJTRzzppEA4JDmElzf1Y3GjsDbrl9ZK038s4lWkpAxmFhx86oPAjhjdU
	 vmRUwPMkNKwJ3Fpen4X3sUgqAuK5ZXaymtAWbKUnwN8+/xDOFjQUoHuJ4XJEg3Uf7G
	 YVbGSupTFtRkeDWSzIJg9wQucb/eEEEcLvcLB8qDASxtfXed2IQOngDwYPDTzxkP5O
	 5jmb6uFdZEsOw==
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
Subject: [PATCH v3 4/4] x86/CPU/AMD: Print the reason for the last reset
Date: Thu, 10 Apr 2025 15:02:02 -0500
Message-ID: <20250410200202.2974062-5-superm1@kernel.org>
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
 Documentation/admin-guide/amd/index.rst | 42 ++++++++++++++++++++
 arch/x86/include/asm/amd_node.h         |  1 +
 arch/x86/kernel/cpu/amd.c               | 51 +++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/Documentation/admin-guide/amd/index.rst b/Documentation/admin-guide/amd/index.rst
index 5a721ab4fe013..c888b192365c5 100644
--- a/Documentation/admin-guide/amd/index.rst
+++ b/Documentation/admin-guide/amd/index.rst
@@ -268,3 +268,45 @@ EPP Policy
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
diff --git a/arch/x86/include/asm/amd_node.h b/arch/x86/include/asm/amd_node.h
index f4993201834ea..a945d146f1a77 100644
--- a/arch/x86/include/asm/amd_node.h
+++ b/arch/x86/include/asm/amd_node.h
@@ -20,6 +20,7 @@
 #include <linux/pci.h>
 
 #define FCH_PM_BASE		0xFED80300
+#define FCH_PM_S5_RESET_STATUS	0xC0
 
 #define MAX_AMD_NUM_NODES	8
 #define AMD_NODE0_PCI_SLOT	0x18
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 79569f72b8ee5..ddb17f0ad580e 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -9,6 +9,7 @@
 #include <linux/sched/clock.h>
 #include <linux/random.h>
 #include <linux/topology.h>
+#include <asm/amd_node.h>
 #include <asm/processor.h>
 #include <asm/apic.h>
 #include <asm/cacheinfo.h>
@@ -1231,3 +1232,53 @@ void amd_check_microcode(void)
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
+	[32] = "unknown",
+};
+
+static __init int print_s5_reset_status_mmio(void)
+{
+	void __iomem *addr;
+	unsigned long value;
+	int bit = -1;
+
+	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
+		return 0;
+
+	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
+	if (!addr)
+		return 0;
+	value = ioread32(addr);
+	iounmap(addr);
+
+	do {
+		bit = find_next_bit(&value, BITS_PER_LONG, bit + 1);
+	} while (!s5_reset_reason_txt[bit]);
+
+	pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
+		value, s5_reset_reason_txt[bit]);
+
+	return 0;
+}
+late_initcall(print_s5_reset_status_mmio);
-- 
2.43.0


