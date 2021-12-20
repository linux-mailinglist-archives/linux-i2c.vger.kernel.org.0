Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5717D47B4B6
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 22:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhLTVHJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 16:07:09 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11]:56041 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230203AbhLTVHI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Dec 2021 16:07:08 -0500
Received: from localhost.localdomain (ip5f5aed30.dynamic.kabel-deutschland.de [95.90.237.48])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6505961EA1927;
        Mon, 20 Dec 2021 22:07:04 +0100 (CET)
From:   Paul Menzel <pmenzel@molgen.mpg.de>
To:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Furquan Shaikh <furquan@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tim Wawrzynczak <twawrzynczak@chromium.org>,
        coreboot@coreboot.org, Matt DeVillier <matt.devillier@gmail.com>,
        Dmitry Torokhov <dtor@chromium.org>,
        Felix Singer <felixsinger@posteo.net>,
        Duncan Laurie <dlaurie@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Furquan Shaikh <furquan@chromium.org>,
        Justin TerAvest <teravest@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH] CHROMIUM: i2c: Add device property for probing
Date:   Mon, 20 Dec 2021 22:06:42 +0100
Message-Id: <20211220210643.47842-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Furquan Shaikh <furquan@google.com>

Dear Linux folks,


Google Chromebooks are often built with devices sourced from different
vendors. These need to be probed. To deal with this, the firmware – in
this case coreboot – tags such optional devices accordingly – I think
this is commit fbf2c79b (drivers/i2c/generic: Add config for marking
device as probed) – and Chromium OS’ Linux kernel has the patch at hand
applied to act accordingly. Right after the merge, Dmitry created a
revert, which was actively discussed for two days but wasn’t applied.
That means, millions of devices shipped with such a firmware and Linux
kernel. To support these devices with upstream Linux kernel, is there an
alternative to applying the patch to the Linux kernel, and to support
the shipped devices?


Kind regards,

Paul


[1]: https://review.coreboot.org/c/coreboot/+/16742/
[2]: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1104997

--------------- 8< -------------------------- >8 ---------------

Add a new device property to indicate if an I2C device should be
probed before being added.  If this property is present and set
then the I2C core layer will use i2c_new_probed_device() instead
of i2c_new_device().

This can be used to provide devices in ACPI or DT that may not be
present on the board.  For example, multiple trackpad vendors can
be supported on a single board with a unified firmware image this
way by having their device address be probed before being added.

This property is styled after the PCI Host Bridge probe property
(bindings/pci/host-generic-pci.txt:linuxk,pci-probe-only) and is
a linux specific directive to alter device probing.

BUG=b:110013532
TEST=tested on soraka with 4.14 kernel:
1) add "linux,probed=1" device property to the touchscreen ACPI device
on soraka and ensure that the device is probed before being added.

tested on yorp with 4.14 kernel:
1) I2C devices without the "linux,probed=1" device property are still
functional.

Original-change-Id: I9cf689f7b75ef445c1f0e9f7ec143fa695eb398e
Original-signed-off-by: Duncan Laurie <dlaurie@chromium.org>
Original-reviewed-on: https://chromium-review.googlesource.com/388767
Original-reviewed-by: Benson Leung <bleung@chromium.org>

Change-Id: I54015fe102f2834f6a094d9e650c166a0cc0583b
Signed-off-by: Furquan Shaikh <furquan@google.com>
Reviewed-on: https://chromium-review.googlesource.com/1100544
Commit-Ready: Furquan Shaikh <furquan@chromium.org>
Tested-by: Furquan Shaikh <furquan@chromium.org>
Reviewed-by: Justin TerAvest <teravest@chromium.org>

Conflicts:
	drivers/i2c/i2c-core-of.c

[rebase419(groeck): Context conflicts]
Signed-off-by: Guenter Roeck <groeck@chromium.org>
[rebase510(groeck): Context conflicts]
Signed-off-by: Guenter Roeck <groeck@chromium.org>
Change-Id: Id10adae00b381e62813fd6b8ce7c6c50f140c31b
---
 Documentation/devicetree/bindings/i2c/i2c.txt |  5 +++++
 drivers/i2c/i2c-core-acpi.c                   | 12 +++++++++++-
 drivers/i2c/i2c-core-of.c                     | 10 +++++++++-
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
index b864916e087f..4921ee57f4c1 100644
--- a/Documentation/devicetree/bindings/i2c/i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c.txt
@@ -133,6 +133,11 @@ wants to support one of the below features, it should adapt these bindings.
 - wakeup-source
 	device can be used as a wakeup source.
 
+- linux,probed
+	If this property is present, then the I2C device will be
+	probed before being added using i2c_new_scanned_device, else
+	linux will instantiate the I2C device normally.
+
 Binding may contain optional "interrupts" property, describing interrupts
 used by the device. I2C core will assign "irq" interrupt (or the very first
 interrupt if not using interrupt names) as primary interrupt for the slave.
diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 92c1cc07ed46..c970d99e4438 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -254,10 +254,20 @@ static void i2c_acpi_register_device(struct i2c_adapter *adapter,
 				     struct acpi_device *adev,
 				     struct i2c_board_info *info)
 {
+	struct i2c_client *client;
+
 	adev->power.flags.ignore_parent = true;
 	acpi_device_set_enumerated(adev);
 
-	if (IS_ERR(i2c_new_client_device(adapter, info)))
+	if (!acpi_dev_get_property(adev, "linux,probed", ACPI_TYPE_ANY, NULL)) {
+		unsigned short addrs[] = { info->addr, I2C_CLIENT_END };
+
+		client = i2c_new_scanned_device(adapter, info, addrs, NULL);
+	} else {
+		client = i2c_new_client_device(adapter, info);
+	}
+
+	if (IS_ERR(client))
 		adev->power.flags.ignore_parent = false;
 }
 
diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 3ed74aa4b44b..fd375ce38a9e 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -75,7 +75,15 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
 	if (ret)
 		return ERR_PTR(ret);
 
-	client = i2c_new_client_device(adap, &info);
+	/* Allow device property to enable probing before init */
+	if (of_get_property(node, "linux,probed", NULL)) {
+		unsigned short addrs[] = { info.addr, I2C_CLIENT_END };
+
+		client = i2c_new_scanned_device(adap, &info, addrs, NULL);
+	} else {
+		client = i2c_new_client_device(adap, &info);
+	}
+
 	if (IS_ERR(client))
 		dev_err(&adap->dev, "of_i2c: Failure registering %pOF\n", node);
 
-- 
2.34.1

