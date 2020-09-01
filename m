Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99613258F76
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 15:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbgIANu2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 09:50:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:34012 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728150AbgIAN2m (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 1 Sep 2020 09:28:42 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D8498AC55;
        Tue,  1 Sep 2020 13:28:38 +0000 (UTC)
Date:   Tue, 1 Sep 2020 15:28:37 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Volker =?UTF-8?B?UsO8bWVsaW4=?= <vr_qemu@t-online.de>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 2/2] i2c: i801: Simplify the suspend callback
Message-ID: <20200901152837.77bfcaaa@endymion>
In-Reply-To: <20200901152221.3cea0048@endymion>
References: <20200901152221.3cea0048@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We don't actually need to derive the PCI device from the device
structure, as we already have a pointer to it in our private data
structure.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-i801.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

This makes suspend and resume mostly symmetric again :-)

Changes since v1: New.

--- linux-5.8.orig/drivers/i2c/busses/i2c-i801.c	2020-09-01 12:37:04.226362935 +0200
+++ linux-5.8/drivers/i2c/busses/i2c-i801.c	2020-09-01 12:37:54.235979605 +0200
@@ -1958,10 +1958,9 @@ static void i801_shutdown(struct pci_dev
 #ifdef CONFIG_PM_SLEEP
 static int i801_suspend(struct device *dev)
 {
-	struct pci_dev *pci_dev = to_pci_dev(dev);
-	struct i801_priv *priv = pci_get_drvdata(pci_dev);
+	struct i801_priv *priv = dev_get_drvdata(dev);
 
-	pci_write_config_byte(pci_dev, SMBHSTCFG, priv->original_hstcfg);
+	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
 	return 0;
 }
 

-- 
Jean Delvare
SUSE L3 Support
