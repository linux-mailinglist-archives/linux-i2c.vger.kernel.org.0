Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89D46196F06
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Mar 2020 19:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgC2RpM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Mar 2020 13:45:12 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36144 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbgC2RpL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 29 Mar 2020 13:45:11 -0400
Received: by mail-ot1-f67.google.com with SMTP id l23so15558443otf.3
        for <linux-i2c@vger.kernel.org>; Sun, 29 Mar 2020 10:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mcg1BbSBobH1mHCgBXFLw2fvTIqtGVMJNnowUsFCErM=;
        b=UD3ppe1wc/gRJ1iKlDONLnyUiWYyevdRDtYyNJ/EEah/P4nlfgLpnUpW0gYs/3S7El
         /SHP2q3DhWqayrPvYbWxcbl5rqOVXRdOJOrxbUXRmpg5C/Y9yLQuFG/9vxaf3vUcdeZW
         PYGyH5NZiIjEacwkfMB8oyLA5JYVw6g31nOS4y/6ysOoAmhCDgxSJDZnGwdW3G5N6lXM
         0htBNR3VhDhls7zoWoianrUNO0WsiYd3kI+6n52eph39ChVCDTzFHQjtxAJX8QqPKg5T
         d8lxUFr6rVrtctpaTfHv/lyPHIhK9Ldu4JHsssD99hheLmdz9AcW7l9XtGUxyrwCdl9z
         Mz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mcg1BbSBobH1mHCgBXFLw2fvTIqtGVMJNnowUsFCErM=;
        b=odqoOGfASiL9LYhQ2Mtw7pXXVbSgebP68CTnXjiUMtx+cqSXer97AviplOpVtXOX6S
         buPToLweonEIwEsgq2janluh40/ZV1rfLLEe+QK2YXsFLwfgYSvQd/65FnjD2vaZTw/n
         tPnHPVlHzIX4DMd3YDZBbVEW+xHndslE2kY58KL1Io9wrZ2iKzHCya0cXa+/OtVHNOOi
         nDA22eBrpBqugMrL9jBXtEhopmvRgiq+hoWM2XbABbX+vTuK/9NC32HNjlIjMOMMV59g
         HPuUTih4qB1fCB4r5805BkXYvL+W9M2Aq1EqOkAW2lCU1ba+ZUV0lg+L76F6uEC4rRHG
         HPAA==
X-Gm-Message-State: ANhLgQ0VWmy+ggqB6atRkEa/PyhTkPQsyBRkG7CeHZcXR8JIZCX3MOx9
        4hPJE1M38pVlNIlgK74Z10w=
X-Google-Smtp-Source: ADFU+vvYTiM6NXwCVOj2AQ3r1lFXfx5PKwLQhmCI/I1ClDJ38qT9HYJ/8hN1Cw3WJhaLfuYr3xXBBg==
X-Received: by 2002:a05:6830:2411:: with SMTP id j17mr6194648ots.257.1585503909233;
        Sun, 29 Mar 2020 10:45:09 -0700 (PDT)
Received: from Adam-Intel-Testbench.lan ([2605:6000:1a0d:a160:c84a:5928:b8e9:3ea2])
        by smtp.gmail.com with ESMTPSA id z22sm3825731oog.45.2020.03.29.10.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 10:45:08 -0700 (PDT)
From:   Adam Honse <calcprogrammer1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Cc:     Adam Honse <calcprogrammer1@gmail.com>
Subject: [PATCH] i2c: Detect secondary SMBus controller on AMD AM4 chipsets
Date:   Sun, 29 Mar 2020 12:44:40 -0500
Message-Id: <20200329174440.19342-1-calcprogrammer1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The AMD X370 and other AM4 chipsets (A/B/X 3/4/5 parts) and Threadripper equivalents have a secondary SMBus controller at I/O port address 0x0B20.  This bus is used by several manufacturers to control motherboard RGB lighting via embedded controllers.  I have been using this bus in my OpenRGB project to control the Aura RGB on many motherboards and ASRock also uses this bus for their Polychrome RGB controller.

See this kernel bug report: https://bugzilla.kernel.org/show_bug.cgi?id=202587

Thanks,

Adam Honse (calcprogrammer1@gmail.com)

---
 drivers/i2c/busses/i2c-piix4.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 30ded6422e7b..6068364b84f6 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -981,6 +981,11 @@ static int piix4_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		retval = piix4_setup_sb800(dev, id, 1);
 	}
 
+	if (dev->vendor == PCI_VENDOR_ID_AMD &&
+	    dev->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS) {
+		retval = piix4_setup_sb800(dev, id, 1);
+	}
+
 	if (retval > 0) {
 		/* Try to add the aux adapter if it exists,
 		 * piix4_add_adapter will clean up if this fails */
-- 
2.25.1

