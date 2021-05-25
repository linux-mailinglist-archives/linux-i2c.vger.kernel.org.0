Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74706390487
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 17:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbhEYPFK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 11:05:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:60154 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229939AbhEYPFJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 11:05:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1621955017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=atPLvUWkGW5/fQz9JbdL6mzZye26xPXevOs0tFAjR04=;
        b=1Mfw3GcMiKNryOCRKkhZxX71o8zNdOeLvqwt4WzzUt+cjkkibz2/QiMXf/KALtr7H4cPwD
        pCJvOT3dXwC+zSWnyChPQ+CkHZGApFQ5ooPTpeLsURmhFgVJG2VaNWK0sZRMHMZ7bR2hHV
        QTdX3RgC/Z2KI3JtmHJz8iZYwqRf+fM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1621955017;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=atPLvUWkGW5/fQz9JbdL6mzZye26xPXevOs0tFAjR04=;
        b=xRtl2Qcbq0MxH2/9W4PXLx0YIJi7XVhtY15xMAsVT10/nzgiZRHDBvoFTNZmZHt1A3MVmv
        Yep3DS0MiPkuixCA==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 90E52AE5C;
        Tue, 25 May 2021 15:03:37 +0000 (UTC)
Date:   Tue, 25 May 2021 17:03:36 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Don't generate an interrupt on bus reset
Message-ID: <20210525170336.213a19b4@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Now that the i2c-i801 driver supports interrupts, setting the KILL bit
in a attempt to recover from a timed out transaction triggers an
interrupt. Unfortunately, the interrupt handler (i801_isr) is not
prepared for this situation and will try to process the interrupt as
if it was signaling the end of a successful transaction. In the case
of a block transaction, this can result in an out-of-range memory
access.

This condition was reproduced several times by syzbot:
https://syzkaller.appspot.com/bug?extid=ed71512d469895b5b34e
https://syzkaller.appspot.com/bug?extid=8c8dedc0ba9e03f6c79e
https://syzkaller.appspot.com/bug?extid=c8ff0b6d6c73d81b610e
https://syzkaller.appspot.com/bug?extid=33f6c360821c399d69eb
https://syzkaller.appspot.com/bug?extid=be15dc0b1933f04b043a
https://syzkaller.appspot.com/bug?extid=b4d3fd1dfd53e90afd79

So disable interrupts while trying to reset the bus. Interrupts will
be enabled again for the following transaction.

Fixes: 636752bcb517 ("i2c-i801: Enable IRQ for SMBus transactions")
Reported-by: syzbot+b4d3fd1dfd53e90afd79@syzkaller.appspotmail.com
Signed-off-by: Jean Delvare <jdelvare@suse.de>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

--- linux-5.12.orig/drivers/i2c/busses/i2c-i801.c	2021-05-24 12:00:59.307576983 +0200
+++ linux-5.12/drivers/i2c/busses/i2c-i801.c	2021-05-24 12:04:10.230998259 +0200
@@ -401,11 +401,9 @@ static int i801_check_post(struct i801_p
 		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
 		/* try to stop the current command */
 		dev_dbg(&priv->pci_dev->dev, "Terminating the current operation\n");
-		outb_p(inb_p(SMBHSTCNT(priv)) | SMBHSTCNT_KILL,
-		       SMBHSTCNT(priv));
+		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
 		usleep_range(1000, 2000);
-		outb_p(inb_p(SMBHSTCNT(priv)) & (~SMBHSTCNT_KILL),
-		       SMBHSTCNT(priv));
+		outb_p(0, SMBHSTCNT(priv));
 
 		/* Check if it worked */
 		status = inb_p(SMBHSTSTS(priv));

-- 
Jean Delvare
SUSE L3 Support
