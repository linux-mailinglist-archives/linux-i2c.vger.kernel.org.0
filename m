Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4664F7F73F
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2019 14:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389840AbfHBMwu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Aug 2019 08:52:50 -0400
Received: from mx2.suse.de ([195.135.220.15]:39136 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726225AbfHBMwu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Aug 2019 08:52:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 1C873B01C;
        Fri,  2 Aug 2019 12:52:48 +0000 (UTC)
Date:   Fri, 2 Aug 2019 14:52:46 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Andrew Cooks <acooks@rationali.st>, linux-acpi@vger.kernel.org,
        platypus-sw@opengear.com, "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: [PATCH v5 1/3] i2c: piix4: Fix port selection for AMD Family 16h
 Model 30h
Message-ID: <20190802145246.76c90f20@endymion>
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

From: Andrew Cooks <andrew.cooks@opengear.com>

Family 16h Model 30h SMBus controller needs the same port selection fix
as described and fixed in commit 0fe16195f891 ("i2c: piix4: Fix SMBus port
selection for AMD Family 17h chips")

commit 6befa3fde65f ("i2c: piix4: Support alternative port selection
register") also fixed the port selection for Hudson2, but unfortunately
this is not the exact same device and the AMD naming and PCI Device IDs
aren't particularly helpful here.

The SMBus port selection register is common to the following Families
and models, as documented in AMD's publicly available BIOS and Kernel
Developer Guides:

 50742 - Family 15h Model 60h-6Fh (PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)
 55072 - Family 15h Model 70h-7Fh (PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)
 52740 - Family 16h Model 30h-3Fh (PCI_DEVICE_ID_AMD_HUDSON2_SMBUS)

The Hudson2 PCI Device ID (PCI_DEVICE_ID_AMD_HUDSON2_SMBUS) is shared
between Bolton FCH and Family 16h Model 30h, but the location of the
SmBus0Sel port selection bits are different:

 51192 - Bolton Register Reference Guide

We distinguish between Bolton and Family 16h Model 30h using the PCI
Revision ID:

  Bolton is device 0x780b, revision 0x15
  Family 16h Model 30h is device 0x780b, revision 0x1F
  Family 15h Model 60h and 70h are both device 0x790b, revision 0x4A.

The following additional public AMD BKDG documents were checked and do
not share the same port selection register:

 42301 - Family 15h Model 00h-0Fh doesn't mention any
 42300 - Family 15h Model 10h-1Fh doesn't mention any
 49125 - Family 15h Model 30h-3Fh doesn't mention any

 48751 - Family 16h Model 00h-0Fh uses the previously supported
         index register SB800_PIIX4_PORT_IDX_ALT at 0x2e

Signed-off-by: Andrew Cooks <andrew.cooks@opengear.com>
Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: stable@vger.kernel.org [v4.6+]
---
Changes since v4:
 * Removed unneeded parentheses (reported by Tobin C. Harding)

 drivers/i2c/busses/i2c-piix4.c |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

--- linux-5.2.orig/drivers/i2c/busses/i2c-piix4.c	2019-07-28 21:57:05.337228192 +0200
+++ linux-5.2/drivers/i2c/busses/i2c-piix4.c	2019-08-02 13:53:33.222597706 +0200
@@ -91,7 +91,7 @@
 #define SB800_PIIX4_PORT_IDX_MASK	0x06
 #define SB800_PIIX4_PORT_IDX_SHIFT	1
 
-/* On kerncz, SmBus0Sel is at bit 20:19 of PMx00 DecodeEn */
+/* On kerncz and Hudson2, SmBus0Sel is at bit 20:19 of PMx00 DecodeEn */
 #define SB800_PIIX4_PORT_IDX_KERNCZ		0x02
 #define SB800_PIIX4_PORT_IDX_MASK_KERNCZ	0x18
 #define SB800_PIIX4_PORT_IDX_SHIFT_KERNCZ	3
@@ -358,18 +358,16 @@ static int piix4_setup_sb800(struct pci_
 	/* Find which register is used for port selection */
 	if (PIIX4_dev->vendor == PCI_VENDOR_ID_AMD ||
 	    PIIX4_dev->vendor == PCI_VENDOR_ID_HYGON) {
-		switch (PIIX4_dev->device) {
-		case PCI_DEVICE_ID_AMD_KERNCZ_SMBUS:
+		if (PIIX4_dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS ||
+		    (PIIX4_dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS &&
+		     PIIX4_dev->revision >= 0x1F)) {
 			piix4_port_sel_sb800 = SB800_PIIX4_PORT_IDX_KERNCZ;
 			piix4_port_mask_sb800 = SB800_PIIX4_PORT_IDX_MASK_KERNCZ;
 			piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT_KERNCZ;
-			break;
-		case PCI_DEVICE_ID_AMD_HUDSON2_SMBUS:
-		default:
+		} else {
 			piix4_port_sel_sb800 = SB800_PIIX4_PORT_IDX_ALT;
 			piix4_port_mask_sb800 = SB800_PIIX4_PORT_IDX_MASK;
 			piix4_port_shift_sb800 = SB800_PIIX4_PORT_IDX_SHIFT;
-			break;
 		}
 	} else {
 		if (!request_muxed_region(SB800_PIIX4_SMB_IDX, 2,


-- 
Jean Delvare
SUSE L3 Support
