Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA161701CDD
	for <lists+linux-i2c@lfdr.de>; Sun, 14 May 2023 12:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237327AbjENKhQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 May 2023 06:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237332AbjENKhO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 May 2023 06:37:14 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10AE1FC1
        for <linux-i2c@vger.kernel.org>; Sun, 14 May 2023 03:37:13 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4QJzT92d2Nz9sks;
        Sun, 14 May 2023 12:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mariushoch.de;
        s=MBO0001; t=1684060621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z5ukRjO1JmPw5Mmn3xKNIs5VdxgNV3ShpZVHdaDxMdA=;
        b=0RWqoP3iZXKNPXKJxL5pZ+bdMLwJK7oLG/iKO1JeS08rRgXk7TjFfoRicvohZe4L90fgus
        1xbkbWOjNKq4Sh7hCBJDX9pO+wOHmud6Qeu/p/zDujds8AkqTSwy/pgPlF4Y8qNP8vFVuz
        epZ8LgAC/SRyrirbZdXAYwnitWMtpGD4FFyhlWovHGH9caTFTkzTpsbFxoJBLpW9JWjGgr
        cDv8fSkcKxLT+fUWj+RAOHFiS4LysoMRfU4wtBxapZp5LRFBvmlYtaSC0nOlL4yOATBBi+
        imZS+vBjgkquClxahQFi9cZIY516T+wpUO39/zAD5tZLVB6bRUu1rs8R8CoB9w==
From:   Marius Hoch <mail@mariushoch.de>
To:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Marius Hoch <mail@mariushoch.de>
Subject: [PATCH 1/2] i2c: i801: Force no IRQ for Dell Latitude E7450
Date:   Sun, 14 May 2023 12:36:33 +0200
Message-Id: <20230514103634.235917-2-mail@mariushoch.de>
In-Reply-To: <20230514103634.235917-1-mail@mariushoch.de>
References: <20230514103634.235917-1-mail@mariushoch.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4QJzT92d2Nz9sks
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,NO_DNS_FOR_FROM,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Dell Latitude E7450 uses IRQ 18 for the accelerometer,
but also claims that the SMBus uses IRQ 18. This will
result in:

i801_smbus 0000:00:1f.3: PCI INT C: failed to register GSI
i801_smbus 0000:00:1f.3: Failed to enable SMBus PCI device (-16)
i801_smbus: probe of 0000:00:1f.3 failed with error -16

Force the SMBus IRQ to IRQ_NOTCONNECTED in this case, so that
we fall back to polling, which also seems to be what the (very
dated) Windows 7 drivers on the Dell Latitude E7450 do.

This was tested on Dell Latitude E7450.

Signed-off-by: Marius Hoch <mail@mariushoch.de>
---
 drivers/i2c/busses/i2c-i801.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ac5326747c51..5fd2ac585160 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1624,6 +1624,20 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hstcfg);
 }
 
+/**
+ * These DELL devices claim an IRQ for the SMBus (usually 18), but we can't use
+ * it, as its actually for the I2C accelerometer.
+ */
+static const struct dmi_system_id dmi_force_no_irq[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E7450"),
+		},
+	},
+	{} /* Terminating entry */
+};
+
 static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int err, i;
@@ -1657,6 +1671,12 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (!(priv->features & FEATURE_BLOCK_BUFFER))
 		priv->features &= ~FEATURE_BLOCK_PROC;
 
+	if (dmi_check_system(dmi_force_no_irq)) {
+		/* Force no IRQ for these devices, otherwise pcim_enable_device will fail */
+		dev->irq = IRQ_NOTCONNECTED;
+		dev->irq_managed = 1;
+	}
+
 	err = pcim_enable_device(dev);
 	if (err) {
 		dev_err(&dev->dev, "Failed to enable SMBus PCI device (%d)\n",
-- 
2.40.1

