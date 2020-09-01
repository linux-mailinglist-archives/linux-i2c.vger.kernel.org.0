Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60548258F05
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 15:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgIANW7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 1 Sep 2020 09:22:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:57516 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728126AbgIANW3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Sep 2020 09:22:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 06D8DB016;
        Tue,  1 Sep 2020 13:22:23 +0000 (UTC)
Date:   Tue, 1 Sep 2020 15:22:21 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Volker =?UTF-8?B?UsO8bWVsaW4=?= <vr_qemu@t-online.de>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 1/2] i2c: i801: Fix resume bug
Message-ID: <20200901152221.3cea0048@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Volker Rümelin <vr_qemu@t-online.de>

On suspend the original host configuration gets restored. The
resume routine has to undo this, otherwise the SMBus master
may be left in disabled state or in i2c mode.

[JD: Rebased on v5.8, moved the write into i801_setup_hstcfg.]

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
I noticed this bug in a QEMU x86_64 q35 VM booted with OVMF. OVMF
doesn't inititialize the SMBus master. After 1s of SMBus inactivity
autosuspend disables the SMBus master. To reproduce please note QEMU's
ICH9 SMBus emulation does not handle interrupts and it's necessary
to pass the parameter disable_features=0x10 to the i2c_i801 driver.

Changes since v1:
 * Move the write into i801_setup_hstcfg() itself (suggested by Wolfram
   Sang).
 * Pass struct i801_priv * as the parameter to i801_setup_hstcfg(). It
   includes everything we need.

 drivers/i2c/busses/i2c-i801.c |   21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

--- linux-5.8.orig/drivers/i2c/busses/i2c-i801.c	2020-08-31 15:09:29.221616330 +0200
+++ linux-5.8/drivers/i2c/busses/i2c-i801.c	2020-09-01 12:42:46.003491616 +0200
@@ -1709,6 +1709,16 @@ static inline int i801_acpi_probe(struct
 static inline void i801_acpi_remove(struct i801_priv *priv) { }
 #endif
 
+static unsigned char i801_setup_hstcfg(struct i801_priv *priv)
+{
+	unsigned char hstcfg = priv->original_hstcfg;
+
+	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
+	hstcfg |= SMBHSTCFG_HST_EN;
+	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
+	return hstcfg;
+}
+
 static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	unsigned char temp;
@@ -1830,14 +1840,10 @@ static int i801_probe(struct pci_dev *de
 		return err;
 	}
 
-	pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &temp);
-	priv->original_hstcfg = temp;
-	temp &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
-	if (!(temp & SMBHSTCFG_HST_EN)) {
+	pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &priv->original_hstcfg);
+	temp = i801_setup_hstcfg(priv);
+	if (!(priv->original_hstcfg & SMBHSTCFG_HST_EN))
 		dev_info(&dev->dev, "Enabling SMBus device\n");
-		temp |= SMBHSTCFG_HST_EN;
-	}
-	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, temp);
 
 	if (temp & SMBHSTCFG_SMB_SMI_EN) {
 		dev_dbg(&dev->dev, "SMBus using interrupt SMI#\n");
@@ -1963,6 +1969,7 @@ static int i801_resume(struct device *de
 {
 	struct i801_priv *priv = dev_get_drvdata(dev);
 
+	i801_setup_hstcfg(priv);
 	i801_enable_host_notify(&priv->adapter);
 
 	return 0;


-- 
Jean Delvare
SUSE L3 Support
