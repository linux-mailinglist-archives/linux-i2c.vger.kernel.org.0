Return-Path: <linux-i2c+bounces-1001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5653381E776
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 13:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB08A1F2286F
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Dec 2023 12:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D604EB27;
	Tue, 26 Dec 2023 12:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b="b0FJyeS9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210FE4E63E
	for <linux-i2c@vger.kernel.org>; Tue, 26 Dec 2023 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 8832 invoked from network); 26 Dec 2023 13:43:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1703594596; bh=p3a/CmiIGmTbIqlEI01R2R9B6ytZl+y74tl8q7fDC1A=;
          h=From:To:Cc:Subject;
          b=b0FJyeS9pVHKwnmHz6ayOg4dqU80VvmeyhEnrv78HucxkjUq7z3nZepMXlF7cPmXL
           wZQ4SU++GAwKBWlKDpkhdZ1502euO7G3r5gk96nOnJehKyhUWfYgZdbzpWnsMkSHaf
           zHIGT2fujQWEG6l3kmwTaHUB+huuRE3LY4qj2EA4=
Received: from aafb137.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.131.137])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-pci@vger.kernel.org>; 26 Dec 2023 13:43:16 +0100
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Borislav Petkov <bp@suse.de>,
	Jean Delvare <jdelvare@suse.de>
Subject: [PATCH v4] acpi,pci: warn about duplicate IRQ routing entries returned from _PRT
Date: Tue, 26 Dec 2023 13:42:54 +0100
Message-Id: <20231226124254.66102-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 2bf909a71691b5886bff2a8b5697113c
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000A [8XME]                               

On some platforms, the ACPI _PRT function returns duplicate interrupt
routing entries. Linux uses the first matching entry, but sometimes the
second matching entry contains the correct interrupt vector.

As a debugging aid, print a warning to dmesg if duplicate interrupt
routing entries are present. This way, we could check how many models
are affected.

This happens on a Dell Latitude E6500 laptop with the i2c-i801 Intel
SMBus controller. This controller is nonfunctional unless its interrupt
usage is disabled (using the "disable_features=0x10" module parameter).

After investigation, it turned out that the driver was using an
incorrect interrupt vector: in lspci output for this device there was:
        Interrupt: pin B routed to IRQ 19
but after running i2cdetect (without using any i2c-i801 module
parameters) the following was logged to dmesg:

        [...]
        i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
        i801_smbus 0000:00:1f.3: Transaction timeout
        i801_smbus 0000:00:1f.3: Timeout waiting for interrupt!
        i801_smbus 0000:00:1f.3: Transaction timeout
        irq 17: nobody cared (try booting with the "irqpoll" option)

Existence of duplicate entries in a table returned by the _PRT method
was confirmed by disassembling the ACPI DSDT table.

Windows XP is using IRQ3 (as reported by HWiNFO32 and in the Device
Manager), which is neither of the two vectors returned by _PRT.
As HWiNFO32 decoded contents of the SPD EEPROMs, the i2c-i801 device is
working under Windows. It appears that Windows has reconfigured the
chipset independently to use another interrupt vector for the device.
This is possible, according to the chipset datasheet [1], page 436 for
example (PIRQ[n]_ROUT—PIRQ[A,B,C,D] Routing Control Register).

[1] https://www.intel.com/content/dam/doc/datasheet/io-controller-hub-9-datasheet.pdf

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>
Cc: Borislav Petkov <bp@suse.de>
Cc: Jean Delvare <jdelvare@suse.de>
Previously-reviewed-by: Jean Delvare <jdelvare@suse.de>
Previously-tested-by: Jean Delvare <jdelvare@suse.de>

---
Hello,

I'm resurrecting an older patch that was discussed back in January:

https://lore.kernel.org/lkml/20230121153314.6109-1-mat.jonczyk@o2.pl/T/#u

To consider: should we print a warning or an error in case of duplicate
entries? This may not be serious enough to disturb the user with an
error message at boot.

I'm also looking into modifying the i2c-i801 driver to disable its usage
of interrupts if one did not fire.

v2: - add a newline at the end of the kernel log message,
    - replace: "if (match == NULL)" -> "if (!match)"
    - patch description tweaks.
v3: - fix C style issues pointed by Jean Delvare,
    - switch severity from warning to error.
v3 RESEND: retested on top of v6.2-rc4
v4: - rebase and retest on top of v6.7-rc7
    - switch severity back to warning,
    - change pr_err() to dev_warn() and simplify the code,
    - modify patch description (describe Windows behaviour etc.)
---
 drivers/acpi/pci_irq.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
index ff30ceca2203..1fcf72e335b0 100644
--- a/drivers/acpi/pci_irq.c
+++ b/drivers/acpi/pci_irq.c
@@ -203,6 +203,8 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev *dev,
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct acpi_pci_routing_table *entry;
 	acpi_handle handle = NULL;
+	struct acpi_prt_entry *match = NULL;
+	const char *match_int_source = NULL;
 
 	if (dev->bus->bridge)
 		handle = ACPI_HANDLE(dev->bus->bridge);
@@ -219,13 +221,30 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev *dev,
 
 	entry = buffer.pointer;
 	while (entry && (entry->length > 0)) {
-		if (!acpi_pci_irq_check_entry(handle, dev, pin,
-						 entry, entry_ptr))
-			break;
+		struct acpi_prt_entry *curr;
+
+		if (!acpi_pci_irq_check_entry(handle, dev, pin, entry, &curr)) {
+			if (!match) {
+				match = curr;
+				match_int_source = entry->source;
+			} else {
+				dev_warn(&dev->dev, FW_BUG
+				       "ACPI _PRT returned duplicate IRQ routing entries for INT%c: %s[%d] and %s[%d]\n",
+				       pin_name(curr->pin),
+				       match_int_source, match->index,
+				       entry->source, curr->index);
+				/* We use the first matching entry nonetheless,
+				 * for compatibility with older kernels.
+				 */
+			}
+		}
+
 		entry = (struct acpi_pci_routing_table *)
 		    ((unsigned long)entry + entry->length);
 	}
 
+	*entry_ptr = match;
+
 	kfree(buffer.pointer);
 	return 0;
 }

base-commit: 861deac3b092f37b2c5e6871732f3e11486f7082
-- 
2.25.1


