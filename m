Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47100636C93
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 22:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238609AbiKWVtZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 16:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237704AbiKWVtY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 16:49:24 -0500
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E8B26121
        for <linux-i2c@vger.kernel.org>; Wed, 23 Nov 2022 13:49:21 -0800 (PST)
Received: (wp-smtpd smtp.tlen.pl 15356 invoked from network); 23 Nov 2022 22:49:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1669240156; bh=D/IG6aN7NVTAZ/xMxOsnr2tGYOM0JOYTUCbROLhD6IE=;
          h=From:To:Cc:Subject;
          b=ehkvJLTaw1giNPygoMQQm4TnossN3yKX7pNCmvhADnUf4COHSCstExcu3jdQeB3mD
           qTMfbHcgL4y/vSf3m/nbMpw7IOhvoOfQt/Oeb1tqD0D4J31DN3JJmypzTdggHdeU3c
           DBymsGov5byGJyCbttdKsXb0dD+HfFHJUKGkwgEk=
Received: from aafn183.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.143.183])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 23 Nov 2022 22:49:16 +0100
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: [PATCH v3] acpi,pci: warn about duplicate IRQ routing entries returned from _PRT
Date:   Wed, 23 Nov 2022 22:48:44 +0100
Message-Id: <20221123214844.4760-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: af4bfda2c63d7e23bafa6513101a476e
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000A [0VP0]                               
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On some platforms, the ACPI _PRT function returns duplicate interrupt
routing entries. Linux uses the first matching entry, but sometimes the
second matching entry contains the correct interrupt vector.

Print an error to dmesg if duplicate interrupt routing entries are
present, so that we could check how many models are affected.

This happens on a Dell Latitude E6500 laptop with the i2c-i801 Intel
SMBus controller. This controller was nonfunctional unless its interrupt
usage was disabled (using the "disable_features=0x10" module parameter).

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

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>
Cc: Borislav Petkov <bp@suse.de>
Cc: Jean Delvare <jdelvare@suse.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
Tested-by: Jean Delvare <jdelvare@suse.de>

--
v2: - add a newline at the end of the kernel log message,
    - replace: "if (match == NULL)" -> "if (!match)"
    - patch description tweaks.
v3: - fix C style issues pointed by Jean Delvare,
    - switch severity from warning to error.

To consider: should we print a warning or an error in case of duplicate
entries? This may be not serious enough to disturb the user with an
error message at boot. On the other hand, hardware vendors should see
it and the kernel uses this logging severtity in similar cases.
---
 drivers/acpi/pci_irq.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
index 08e15774fb9f..1c846def1ce4 100644
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
@@ -219,13 +221,31 @@ static int acpi_pci_irq_find_prt_entry(struct pci_dev *dev,
 
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
+				pr_err(FW_BUG
+				       "ACPI _PRT returned duplicate IRQ routing entries for device %04x:%02x:%02x[INT%c]: %s[%d] and %s[%d]\n",
+				       curr->id.segment, curr->id.bus, curr->id.device,
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

base-commit: eb7081409f94a9a8608593d0fb63a1aa3d6f95d8
-- 
2.25.1

