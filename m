Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099FA2219DD
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jul 2020 04:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgGPC2A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jul 2020 22:28:00 -0400
Received: from ipmail03.adl2.internode.on.net ([150.101.137.141]:6767 "EHLO
        ipmail03.adl2.internode.on.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726479AbgGPC2A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jul 2020 22:28:00 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jul 2020 22:27:58 EDT
X-SMTP-MATCH: 0
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2B6BwBtuQ9f/5UxyQ5gHQEBPAEFBQE?=
 =?us-ascii?q?CAQkBHIFDAoNrX400hX6eGQsBPAECBAEBhEYEAoIMJTcGDgIQAQEGAQEBAQE?=
 =?us-ascii?q?GBIZUhigBIyMpJm8TgyaCfKwrhVGDXIFAgTgBiAKFCYIAgRGDTooRIgSbHpo?=
 =?us-ascii?q?RgmeBC5hBMIELni4BswGBezMaCCgIgyRQGQ2cdTQwNwIGCAEBAwlXAY9cAQE?=
Received: from 14-201-49-149.tpgi.com.au (HELO silver.lan) ([14.201.49.149])
  by ipmail03.adl2.internode.on.net with ESMTP; 16 Jul 2020 11:52:54 +0930
From:   Paul Schulz <paul@mawsonlakes.org>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     Paul Schulz <paul@mawsonlakes.org>, linux-i2c@vger.kernel.org
Subject: [PATCH] drivers/i2c: Removes 'blacklist' from file
Date:   Thu, 16 Jul 2020 11:52:49 +0930
Message-Id: <20200716022249.148043-1-paul@mawsonlakes.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This edit changes instances of 'blacklist' to 'blocklist'

This is a functionally trivial patch and has no other effect.

Signed-off-by: Paul Schulz <paul@mawsonlakes.org>
---
 Documentation/i2c/busses/i2c-sis5595.rst | 2 +-
 drivers/i2c/busses/i2c-sis5595.c         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/i2c/busses/i2c-sis5595.rst b/Documentation/i2c/busses/i2c-sis5595.rst
index b85630c84a96..a92ab4c3471b 100644
--- a/Documentation/i2c/busses/i2c-sis5595.rst
+++ b/Documentation/i2c/busses/i2c-sis5595.rst
@@ -21,7 +21,7 @@ Note: all have mfr. ID 0x1039.
 
    Note: these chips contain a 0008 device which is incompatible with the
          5595. We recognize these by the presence of the listed
-         "blacklist" PCI ID and refuse to load.
+         "blocklist" PCI ID and refuse to load.
 
    =============        ======          ================
    NOT SUPPORTED        PCI ID          BLACKLIST PCI ID
diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index c793a5c14cda..1da2560b418d 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -14,9 +14,9 @@
 
    Note: these chips contain a 0008 device which is incompatible with the
          5595. We recognize these by the presence of the listed
-         "blacklist" PCI ID and refuse to load.
+	  "blocklist" PCI ID and refuse to load.
 
-   NOT SUPPORTED	PCI ID		BLACKLIST PCI ID	
+	NOT SUPPORTED	PCI ID		BLOCKLIST PCI ID
 	 540		0008		0540
 	 550		0008		0550
 	5513		0008		5511
@@ -51,7 +51,7 @@
 #include <linux/acpi.h>
 #include <linux/io.h>
 
-static int blacklist[] = {
+static int blocklist[] = {
 	PCI_DEVICE_ID_SI_540,
 	PCI_DEVICE_ID_SI_550,
 	PCI_DEVICE_ID_SI_630,
@@ -138,7 +138,7 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 	int retval;
 
 	/* Look for imposters */
-	for (i = blacklist; *i != 0; i++) {
+	for (i = blocklist; *i != 0; i++) {
 		struct pci_dev *dev;
 		dev = pci_get_device(PCI_VENDOR_ID_SI, *i, NULL);
 		if (dev) {
-- 
2.25.1

