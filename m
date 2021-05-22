Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0876038D790
	for <lists+linux-i2c@lfdr.de>; Sat, 22 May 2021 23:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhEVVr6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 May 2021 17:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbhEVVr5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 May 2021 17:47:57 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64AB4C061574
        for <linux-i2c@vger.kernel.org>; Sat, 22 May 2021 14:46:31 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id x7so4867639wrt.12
        for <linux-i2c@vger.kernel.org>; Sat, 22 May 2021 14:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=a94n0AzDEz5MaaOGtCdPfEc89IwRWTJup38m/m/bSk4=;
        b=Vw+eQCjezLkI6UtAmwZb0KUq/cpjVZUaZra6AjbFGZwp2w29GK7zI1EWo+SaBr9ZFh
         fQHTwalNNJIJ8fjwKPB2+lnzUYex3iJk0+IHg79wxPcrVj+E1BoPlNqymtSorUwW++25
         7xwl8pu7BCmdLItGZ5cGGDdiidorysPQGFybGllRrsBAEMQchupbVYgQYavPsL8OSgT2
         FksZ9tOB1KfjmSFG/SeVSxr3CODt6atti6189GMu1QjNGWxsXwmnDwJmf0w1SctAzq+T
         +fPjzChdxaLkYRy5JSCy1vv+kJ/EsolKWYUOBKk860U7lDLg8eqQhI09T8KsPXokBvfd
         HhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=a94n0AzDEz5MaaOGtCdPfEc89IwRWTJup38m/m/bSk4=;
        b=EgjN4Dk8hEIZkWRflFhrh4CTun6kVF9JB8hJcQZppi0gHacSRv026uLERD6Hram8+H
         c5zzp56KKlE2m5u2cnDt1TQDitYTpr85voFvl9rTzvio5J6JlFZD8vFFb0IK5ALgJ7MB
         Dz6d3OlUrFjSPg/zoHJ6OtvKbVoEc/YR9ypTL6FRBvgovLHNF5bKNTW4lNocNWFx/qmF
         stYJrAu8CWxb+huGVusXpd2yXe6e/Eyw6v6Fz5yZQ/a9OPg2RywrwDqHKDf4N/gN6Uh6
         +N3VBVgI3R0feOc2m4W7Bc9Q+66BChi5jcQeQlTIyaTCSGjcYU95VW8jbzXfXw47OTDD
         W02Q==
X-Gm-Message-State: AOAM530bLip+FRlfgHQIcIDSvDUnFmgNnJhjXnCSUoa3mmXKYsBLIdAD
        T21aBiSY1vSxOBUmauPAuOVGKaz25UE=
X-Google-Smtp-Source: ABdhPJyVvWpBkDBNJnBLS65VsIpBYuFhQR59S5eoyyPwjB1nw0sov0fb5ss8iige5aO1UFhzXecfXQ==
X-Received: by 2002:a05:6000:c2:: with SMTP id q2mr15802997wrx.288.1621719989350;
        Sat, 22 May 2021 14:46:29 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:5191:238c:90fd:2bab? (p200300ea8f3846005191238c90fd2bab.dip0.t-ipconnect.de. [2003:ea:8f38:4600:5191:238c:90fd:2bab])
        by smtp.googlemail.com with ESMTPSA id z12sm6561254wrv.68.2021.05.22.14.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 May 2021 14:46:28 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Use standard PCI constants instead of own ones
Message-ID: <a4b704b1-278c-20bc-854f-8e1177a530f5@gmail.com>
Date:   Sat, 22 May 2021 23:46:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Layout of these registers is part of the PCI standard. Therefore use
the constants defined by the PCI subsystem.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 738204d77..f6d7866f1 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -131,8 +131,6 @@
 
 /* PCI Address Constants */
 #define SMBBAR		4
-#define SMBPCICTL	0x004
-#define SMBPCISTS	0x006
 #define SMBHSTCFG	0x040
 #define TCOBASE		0x050
 #define TCOCTL		0x054
@@ -141,12 +139,6 @@
 #define SBREG_SMBCTRL		0xc6000c
 #define SBREG_SMBCTRL_DNV	0xcf000c
 
-/* Host status bits for SMBPCISTS */
-#define SMBPCISTS_INTS		BIT(3)
-
-/* Control bits for SMBPCICTL */
-#define SMBPCICTL_INTDIS	BIT(10)
-
 /* Host configuration bits for SMBHSTCFG */
 #define SMBHSTCFG_HST_EN	BIT(0)
 #define SMBHSTCFG_SMB_SMI_EN	BIT(1)
@@ -648,8 +640,8 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 	u8 status;
 
 	/* Confirm this is our interrupt */
-	pci_read_config_word(priv->pci_dev, SMBPCISTS, &pcists);
-	if (!(pcists & SMBPCISTS_INTS))
+	pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
+	if (!(pcists & PCI_STATUS_INTERRUPT))
 		return IRQ_NONE;
 
 	if (priv->features & FEATURE_HOST_NOTIFY) {
@@ -1866,13 +1858,13 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		u16 pcictl, pcists;
 
 		/* Complain if an interrupt is already pending */
-		pci_read_config_word(priv->pci_dev, SMBPCISTS, &pcists);
-		if (pcists & SMBPCISTS_INTS)
+		pci_read_config_word(priv->pci_dev, PCI_STATUS, &pcists);
+		if (pcists & PCI_STATUS_INTERRUPT)
 			dev_warn(&dev->dev, "An interrupt is pending!\n");
 
 		/* Check if interrupts have been disabled */
-		pci_read_config_word(priv->pci_dev, SMBPCICTL, &pcictl);
-		if (pcictl & SMBPCICTL_INTDIS) {
+		pci_read_config_word(priv->pci_dev, PCI_COMMAND, &pcictl);
+		if (pcictl & PCI_COMMAND_INTX_DISABLE) {
 			dev_info(&dev->dev, "Interrupts are disabled\n");
 			priv->features &= ~FEATURE_IRQ;
 		}
-- 
2.31.1

