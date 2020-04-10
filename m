Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE9A01A4B6B
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Apr 2020 22:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDJUum (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Apr 2020 16:50:42 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34061 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgDJUum (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Apr 2020 16:50:42 -0400
Received: by mail-ot1-f67.google.com with SMTP id m2so3024668otr.1
        for <linux-i2c@vger.kernel.org>; Fri, 10 Apr 2020 13:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ec/NiVi+8Q8qtKZpViXEKWKFHZRTIW/kojWPdeH/6Dc=;
        b=lt6hpBRhkMRXDoerBiZ766buxRz69P7VmgRVYuQK2jd66GnuSESBJXQlISfbl/gaxQ
         sn7fSATnFE0bsRwvOmxbpI40uIrSZh2R9XkVK7lgPfsxYam1mZFeZ+3d6qw164dM1Yef
         Ln6MCxPDVXFDwg1Z7dkpB9Mpx5fHlUR7IObcQJAKz5NG6Bkpq9d8nCUDMM+PtsNhEZyi
         czEC2UyzDQXqw4QnxjeQ2KVPaLkRW1AwDxfDnWed+ATKCDY10V5KhdDCeu57CnPXv0YF
         2QC0eNauTQyUwZqK+0EAqdY2Foi6Au8yy+KDnq/b+k7dMgLK72Cc4GTInwyOxvlacBV2
         eQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ec/NiVi+8Q8qtKZpViXEKWKFHZRTIW/kojWPdeH/6Dc=;
        b=PiEsr19awpz1RREjE/lL4D/Ww9ZTIeeO7cuDeOVtbt1sv7ZC9KPbIZHpM4nnUKw0e0
         g194m3hS0X5G1E6/e8SBSCx0Ul2ubTgM1FH7coXl8S1LR6WUexx7KbMMr6wXLIERXR6V
         biWloIndEyAWTMMRDsYwwtta4nq9GfZmdflJq8rHo50RjMWOjnx7sUkYgR5dwn6+FpGG
         lzccEYYVPcTh15FPeiDuZbXsVbK+2h7m4qwQqNVqHXH9HJu87J8K1hIfb3Lv2XPV510O
         7ShZBIbvDJooKMankBoneMjIc2yXmMD+DVJ/5ao5x6MhgAFm4tvACf5oTUxHXjxxO/rG
         Q6VQ==
X-Gm-Message-State: AGi0Puan/xbwV0+XaMoWKVriJmDMBRFig35BN73ANRMfzuKVsWPZehLs
        Z7ak1o0cSVGzjyB0h3o/KaQ=
X-Google-Smtp-Source: APiQypLkdo4dnEC1Get6KNg+n6NUbK9tTKoUT1t/v81qLoqjnUSZpzCWTJaoRfrxcSK+F6yjPpfhdQ==
X-Received: by 2002:a4a:1882:: with SMTP id 124mr5481712ooo.60.1586551842227;
        Fri, 10 Apr 2020 13:50:42 -0700 (PDT)
Received: from Adam-Intel-Testbench.lan ([2605:6000:1a0d:a160:68ec:b038:c8df:3622])
        by smtp.gmail.com with ESMTPSA id g72sm1716563otg.79.2020.04.10.13.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 13:50:41 -0700 (PDT)
From:   Adam Honse <calcprogrammer1@gmail.com>
To:     jdelvare@suse.de, linux-i2c@vger.kernel.org
Cc:     Adam Honse <calcprogrammer1@gmail.com>
Subject: [PATCH] i2c: Detect secondary SMBus controller on AMD AM4 chipsets
Date:   Fri, 10 Apr 2020 15:48:44 -0500
Message-Id: <20200410204843.3856-1-calcprogrammer1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The AMD X370 and other AM4 chipsets (A/B/X 3/4/5 parts) and Threadripper equivalents have a secondary SMBus controller at I/O port address 0x0B20.  This bus is used by several manufacturers to control motherboard RGB lighting via embedded controllers.  I have been using this bus in my OpenRGB project to control the Aura RGB on many motherboards and ASRock also uses this bus for their Polychrome RGB controller.

See this kernel bug report: https://bugzilla.kernel.org/show_bug.cgi?id=202587

I am not aware of any CZ-compatible platforms which do not have the second SMBus channel.  All of AMD's AM4- and Threadripper- series chipsets that OpenRGB users have tested appear to have this secondary bus.  I also noticed this secondary bus is present on older AMD platforms including my FM1 home server.

Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>

---
 drivers/i2c/busses/i2c-piix4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 30ded6422e7b..69740a4ff1db 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -977,7 +977,8 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	if (dev->vendor == PCI_VENDOR_ID_AMD &&
-	    dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS) {
+	    (dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS ||
+	     dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS)) {
 		retval = piix4_setup_sb800(dev, id, 1);
 	}
 
-- 
2.25.1

