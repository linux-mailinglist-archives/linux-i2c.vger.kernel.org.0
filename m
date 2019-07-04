Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 181225F5AD
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2019 11:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfGDJeG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Jul 2019 05:34:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:44082 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727291AbfGDJeF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 4 Jul 2019 05:34:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 22841AC8E;
        Thu,  4 Jul 2019 09:34:04 +0000 (UTC)
Date:   Thu, 4 Jul 2019 11:34:02 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] i2c: i801: Documentation update
Message-ID: <20190704113402.3ade31cb@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c-i801 driver documentation needs some dusting:
* Mention disable_features flag 0x20.
* The i2c_ec driver has been removed from the kernel long ago. Driver
  i2c-scmi serves the same purpose for more recent hardware.
* Replace obsolete /proc paths with equivalent /sys paths.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
---
 Documentation/i2c/busses/i2c-i801 |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--- linux-5.1.orig/Documentation/i2c/busses/i2c-i801	2019-07-04 10:48:54.957325058 +0200
+++ linux-5.1/Documentation/i2c/busses/i2c-i801	2019-07-04 11:28:23.665334156 +0200
@@ -59,6 +59,7 @@ possible to work around possible driver
  0x02  disable the block buffer
  0x08  disable the I2C block read functionality
  0x10  don't use interrupts
+ 0x20  disable SMBus Host Notify
 
 
 Description
@@ -119,16 +120,15 @@ BIOS to enable it, it means it has been
 well known for first doing this on their P4B motherboard, and many other
 boards after that. Some vendor machines are affected as well.
 
-The first thing to try is the "i2c_ec" ACPI driver. It could be that the
+The first thing to try is the "i2c-scmi" ACPI driver. It could be that the
 SMBus was hidden on purpose because it'll be driven by ACPI. If the
-i2c_ec driver works for you, just forget about the i2c-i801 driver and
-don't try to unhide the ICH SMBus. Even if i2c_ec doesn't work, you
+i2c-scmi driver works for you, just forget about the i2c-i801 driver and
+don't try to unhide the ICH SMBus. Even if i2c-scmi doesn't work, you
 better make sure that the SMBus isn't used by the ACPI code. Try loading
-the "fan" and "thermal" drivers, and check in /proc/acpi/fan and
-/proc/acpi/thermal_zone. If you find anything there, it's likely that
-the ACPI is accessing the SMBus and it's safer not to unhide it. Only
-once you are certain that ACPI isn't using the SMBus, you can attempt
-to unhide it.
+the "fan" and "thermal" drivers, and check in /sys/class/thermal. If you
+find a thermal zone with type "acpitz", it's likely that the ACPI is
+accessing the SMBus and it's safer not to unhide it. Only once you are
+certain that ACPI isn't using the SMBus, you can attempt to unhide it.
 
 In order to unhide the SMBus, we need to change the value of a PCI
 register before the kernel enumerates the PCI devices. This is done in


-- 
Jean Delvare
SUSE L3 Support
