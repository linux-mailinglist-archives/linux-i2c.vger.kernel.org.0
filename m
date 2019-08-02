Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9CB7F77F
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2019 14:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388832AbfHBMzb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Aug 2019 08:55:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:40050 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404801AbfHBMz3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Aug 2019 08:55:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C4AA9AD85;
        Fri,  2 Aug 2019 12:55:27 +0000 (UTC)
Date:   Fri, 2 Aug 2019 14:55:26 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Andrew Cooks <acooks@rationali.st>, linux-acpi@vger.kernel.org,
        platypus-sw@opengear.com, "Tobin C . Harding" <me@tobin.cc>,
        Guenter Roeck <linux@roeck-us.net>,
        Will Wagner <willw@carallon.com>
Subject: [PATCH v5 3/3] i2c: piix4: Add ACPI support
Message-ID: <20190802145526.6edba0a6@endymion>
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

Enable the i2c-piix4 SMBus controller driver to enumerate I2C slave
devices using ACPI. It builds on the related I2C mux device work
in commit 8eb5c87a92c0 ("i2c: add ACPI support for I2C mux ports")

In the i2c-piix4 driver the adapters are enumerated as:
 Main SMBus adapter Port 0, Port 2, ..., aux port (i.e., ASF adapter)

However, in the AMD BKDG documentation[1], the implied order of ports is:
 Main SMBus adapter Port 0, ASF adapter, Port 2, Port 3, ...

This ordering difference is unfortunate. We assume that ACPI
developers will use the AMD documentation ordering, so we have to
pass an extra parameter to piix4_add_adapter().

[1] 52740 BIOS and Kernel Developer's Guide (BKDG) for AMD Family 16h
Models 30h-3Fh Processors

Based on earlier work by Andrew Cooks.

Reported-by: Andrew Cooks <andrew.cooks@opengear.com>
Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
Changes since v4:
 * Fix code alignment (reported by Tobin C. Harding)
 * Adjust to changes in previous patch
 * Use the SMBus numbering documented by AMD

 drivers/i2c/busses/i2c-piix4.c |   18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

--- linux-5.2.orig/drivers/i2c/busses/i2c-piix4.c	2019-08-02 14:26:02.197346075 +0200
+++ linux-5.2/drivers/i2c/busses/i2c-piix4.c	2019-08-02 14:40:40.990505068 +0200
@@ -811,7 +811,8 @@ static int piix4_adapter_count;
 
 static int piix4_add_adapter(struct pci_dev *dev, unsigned short smba,
 			     bool sb800_main, u8 port, bool notify_imc,
-			     const char *name, struct i2c_adapter **padap)
+			     u8 hw_port_nr, const char *name,
+			     struct i2c_adapter **padap)
 {
 	struct i2c_adapter *adap;
 	struct i2c_piix4_adapdata *adapdata;
@@ -843,6 +844,12 @@ static int piix4_add_adapter(struct pci_
 	/* set up the sysfs linkage to our parent device */
 	adap->dev.parent = &dev->dev;
 
+	if (has_acpi_companion(&dev->dev)) {
+		acpi_preset_companion(&adap->dev,
+				      ACPI_COMPANION(&dev->dev),
+				      hw_port_nr);
+	}
+
 	snprintf(adap->name, sizeof(adap->name),
 		"SMBus PIIX4 adapter%s at %04x", name, smba);
 
@@ -876,7 +883,10 @@ static int piix4_add_adapters_sb800(stru
 	}
 
 	for (port = 0; port < piix4_adapter_count; port++) {
+		u8 hw_port_nr = port == 0 ? 0 : port + 1;
+
 		retval = piix4_add_adapter(dev, smba, true, port, notify_imc,
+					   hw_port_nr,
 					   piix4_main_port_names_sb800[port],
 					   &piix4_main_adapters[port]);
 		if (retval < 0)
@@ -947,8 +957,8 @@ static int piix4_probe(struct pci_dev *d
 			return retval;
 
 		/* Try to register main SMBus adapter, give up if we can't */
-		retval = piix4_add_adapter(dev, retval, false, 0, false, "",
-					   &piix4_main_adapters[0]);
+		retval = piix4_add_adapter(dev, retval, false, 0, false, 0,
+					   "", &piix4_main_adapters[0]);
 		if (retval < 0)
 			return retval;
 	}
@@ -974,7 +984,7 @@ static int piix4_probe(struct pci_dev *d
 	if (retval > 0) {
 		/* Try to add the aux adapter if it exists,
 		 * piix4_add_adapter will clean up if this fails */
-		piix4_add_adapter(dev, retval, false, 0, false,
+		piix4_add_adapter(dev, retval, false, 0, false, 1,
 				  is_sb800 ? piix4_aux_port_name_sb800 : "",
 				  &piix4_aux_adapter);
 	}

-- 
Jean Delvare
SUSE L3 Support
