Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 132E77F77A
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2019 14:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405038AbfHBMyl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Aug 2019 08:54:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:39686 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404889AbfHBMyk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Aug 2019 08:54:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 983BEAD85;
        Fri,  2 Aug 2019 12:54:39 +0000 (UTC)
Date:   Fri, 2 Aug 2019 14:54:38 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Andrew Cooks <acooks@rationali.st>, linux-acpi@vger.kernel.org,
        platypus-sw@opengear.com, "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: [PATCH v5 2/3] i2c: piix4: Fix probing of reserved ports on AMD
 Family 16h Model 30h
Message-ID: <20190802145438.601c9a8c@endymion>
In-Reply-To: <20190802145109.38dd4045@endymion>
References: <20190802145109.38dd4045@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Prevent bus timeouts and resets on Family 16h Model 30h by not probing
reserved Ports 3 and 4.

According to the AMD BIOS and Kernel Developer's Guides (BKDG), Port 3
and Port 4 are reserved on the following devices:
 - Family 15h Model 60h-6Fh
 - Family 15h Model 70h-7Fh
 - Family 16h Model 30h-3Fh

Based on earlier work by Andrew Cooks.

Reported-by: Andrew Cooks <andrew.cooks@opengear.com>
Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Changes since v4:
 * Fix subject line
 * Drop local variable port_count, use piix4_adapter_count
   everywhere to represent the maximum number of main SMBus ports
 * Exclude early Hudson2 implementations from this change

 drivers/i2c/busses/i2c-piix4.c |   16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

--- linux-5.2.orig/drivers/i2c/busses/i2c-piix4.c	2019-08-02 14:08:17.003820098 +0200
+++ linux-5.2/drivers/i2c/busses/i2c-piix4.c	2019-08-02 14:15:38.284423549 +0200
@@ -72,7 +72,8 @@
 #define PIIX4_BLOCK_DATA	0x14
 
 /* Multi-port constants */
-#define PIIX4_MAX_ADAPTERS 4
+#define PIIX4_MAX_ADAPTERS	4
+#define HUDSON2_MAIN_PORTS	2 /* HUDSON2, KERNCZ reserves ports 3, 4 */
 
 /* SB800 constants */
 #define SB800_PIIX4_SMB_IDX		0xcd6
@@ -806,6 +807,7 @@ MODULE_DEVICE_TABLE (pci, piix4_ids);
 
 static struct i2c_adapter *piix4_main_adapters[PIIX4_MAX_ADAPTERS];
 static struct i2c_adapter *piix4_aux_adapter;
+static int piix4_adapter_count;
 
 static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 			     bool sb800_main, u8 port, bool notify_imc,
@@ -865,7 +867,15 @@ static int piix4_add_adapters_sb800(stru
 	int port;
 	int retval;
 
-	for (port = 0; port < PIIX4_MAX_ADAPTERS; port++) {
+	if (dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS ||
+	    (dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS &&
+	     dev->revision >= 0x1F)) {
+		piix4_adapter_count = HUDSON2_MAIN_PORTS;
+	} else {
+		piix4_adapter_count = PIIX4_MAX_ADAPTERS;
+	}
+
+	for (port = 0; port < piix4_adapter_count; port++) {
 		retval = piix4_add_adapter(dev, smba, true, port, notify_imc,
 					   piix4_main_port_names_sb800[port],
 					   &piix4_main_adapters[port]);
@@ -987,7 +997,7 @@ static void piix4_adap_remove(struct i2c
 
 static void piix4_remove(struct pci_dev *dev)
 {
-	int port = PIIX4_MAX_ADAPTERS;
+	int port = piix4_adapter_count;
 
 	while (--port >= 0) {
 		if (piix4_main_adapters[port]) {

-- 
Jean Delvare
SUSE L3 Support
