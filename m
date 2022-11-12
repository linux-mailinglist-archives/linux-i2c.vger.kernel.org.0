Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC0D626B81
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Nov 2022 21:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234889AbiKLUKc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 12 Nov 2022 15:10:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234728AbiKLUKa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 12 Nov 2022 15:10:30 -0500
X-Greylist: delayed 186 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 12 Nov 2022 12:10:28 PST
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.145])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748265FDD
        for <linux-i2c@vger.kernel.org>; Sat, 12 Nov 2022 12:10:28 -0800 (PST)
Received: (wp-smtpd smtp.tlen.pl 18112 invoked from network); 12 Nov 2022 21:10:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1668283825; bh=uqtOYyBZaSxTk6vFnxq67IjlDkClKoEOAUnHV1aUrT0=;
          h=From:To:Cc:Subject;
          b=FhnxMZy8l4sI4n3JMwI9GDByfbqZg8//i211z5MahGRACd3DKqmVMBsZ0BONJt2f0
           yVX3tA8CGJkpBIwigre1BPdvyv0QNZjklYcsL4AQ+QWmqV6TMSGR69EBT7U/TZdPK+
           s9iLLuzykfJTf1/yGZEw8R8eByS06fyS1Rhz330c=
Received: from aaey149.neoplus.adsl.tpnet.pl (HELO localhost.localdomain) (mat.jonczyk@o2.pl@[83.4.128.149])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <linux-kernel@vger.kernel.org>; 12 Nov 2022 21:10:25 +0100
From:   =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>,
        Jean Delvare <jdelvare@suse.com>
Subject: [PATCH] acpi,pci: warn about duplicate IRQ routing entries returned from _PRT
Date:   Sat, 12 Nov 2022 21:09:27 +0100
Message-Id: <20221112200927.7255-1-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <35cfe433-bafa-9aeb-20ad-2f275f585b6c@o2.pl>
References: <35cfe433-bafa-9aeb-20ad-2f275f585b6c@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 72f4d30cf4d363848074315d888fad29
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [UVOU]                               
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On some platforms, the ACPI _PRT function returns duplicate interrupt
routing entries. Linux uses the first matching entry, but sometimes the
second matching entry contains the correct interrupt vector.

To check how widespread this problem is, print a warning to dmesg if
this is the case.

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
        irq 17: nobody cared (try booting with the "irqpoll" option)

Existence of duplicate entries in the table returned by the _PRT method
was confirmed by disassembling the ACPI DSDT table.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>
Cc: Borislav Petkov <bp@suse.de>
Cc: Jean Delvare <jdelvare@suse.com>
---
 drivers/acpi/pci_irq.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
index 08e15774fb9f..c3168927446c 100644
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
+			if (match == NULL) {
+				match = curr;
+				match_int_source = entry->source;
+			} else {
+				pr_warn(FW_BUG
+				"ACPI _PRT returned duplicate IRQ routing entries for device "
+					"%04x:%02x:%02x[INT%c]: %s[%d] and %s[%d]. ",
+					curr->id.segment, curr->id.bus, curr->id.device,
+					pin_name(curr->pin),
+					match_int_source, match->index,
+					entry->source, curr->index);
+				// we use the first matching entry nonetheless
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

base-commit: f0c4d9fc9cc9462659728d168387191387e903cc
-- 
2.25.1

