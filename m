Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1F0251DE0
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 19:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgHYRNM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 25 Aug 2020 13:13:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:34518 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726432AbgHYRNG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 13:13:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2A0C1AE68;
        Tue, 25 Aug 2020 17:13:35 +0000 (UTC)
Date:   Tue, 25 Aug 2020 19:13:03 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Volker =?UTF-8?B?UsO8bWVsaW4=?= <vr_qemu@t-online.de>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [PATCH] i2c: i801: Fix resume bug
Message-ID: <20200825191303.4a258073@endymion>
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

[JD: Rebased on v5.8, simplified a condition.]

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
I noticed this bug in a QEMU x86_64 q35 VM booted with OVMF. OVMF
doesn't initialize the SMBus master. After 1s of SMBus inactivity
autosuspend disables the SMBus master. To reproduce please note QEMU's
ICH9 SMBus emulation does not handle interrupts and it's necessary
to pass the parameter disable_features=0x10 to the i2c_i801 driver.

Note from JD: I can't test this.

 drivers/i2c/busses/i2c-i801.c |   21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

--- linux-5.8.orig/drivers/i2c/busses/i2c-i801.c	2020-08-25 11:54:30.371682962 +0200
+++ linux-5.8/drivers/i2c/busses/i2c-i801.c	2020-08-25 14:06:06.168116285 +0200
@@ -1709,6 +1709,13 @@ static inline int i801_acpi_probe(struct
 static inline void i801_acpi_remove(struct i801_priv *priv) { }
 #endif
 
+static unsigned char i801_setup_hstcfg(unsigned char hstcfg)
+{
+	hstcfg &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
+	hstcfg |= SMBHSTCFG_HST_EN;
+	return hstcfg;
+}
+
 static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	unsigned char temp;
@@ -1830,13 +1837,10 @@ static int i801_probe(struct pci_dev *de
 		return err;
 	}
 
-	pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &temp);
-	priv->original_hstcfg = temp;
-	temp &= ~SMBHSTCFG_I2C_EN;	/* SMBus timing */
-	if (!(temp & SMBHSTCFG_HST_EN)) {
+	pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &priv->original_hstcfg);
+	temp = i801_setup_hstcfg(priv->original_hstcfg);
+	if (!(priv->original_hstcfg & SMBHSTCFG_HST_EN))
 		dev_info(&dev->dev, "Enabling SMBus device\n");
-		temp |= SMBHSTCFG_HST_EN;
-	}
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, temp);
 
 	if (temp & SMBHSTCFG_SMB_SMI_EN) {
@@ -1961,8 +1965,11 @@ static int i801_suspend(struct device *d
 
 static int i801_resume(struct device *dev)
 {
-	struct i801_priv *priv = dev_get_drvdata(dev);
+	struct pci_dev *pci_dev = to_pci_dev(dev);
+	struct i801_priv *priv = pci_get_drvdata(pci_dev);
+	unsigned char hstcfg = i801_setup_hstcfg(priv->original_hstcfg);
 
+	pci_write_config_byte(pci_dev, SMBHSTCFG, hstcfg);
 	i801_enable_host_notify(&priv->adapter);
 
 	return 0;


-- 
Jean Delvare
SUSE L3 Support
