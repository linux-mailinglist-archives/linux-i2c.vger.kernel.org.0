Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56A5D104EC2
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 10:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUJKy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 04:10:54 -0500
Received: from mx2.suse.de ([195.135.220.15]:41892 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726014AbfKUJKy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 21 Nov 2019 04:10:54 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 942DCAF42;
        Thu, 21 Nov 2019 09:10:52 +0000 (UTC)
Date:   Thu, 21 Nov 2019 10:10:51 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Linux I2C <linux-i2c@vger.kernel.org>
Cc:     Corey Minyard <cminyard@mvista.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH] i2c: i2c-smbus: Don't filter out duplicate alerts
Message-ID: <20191121101051.71859534@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

Getting the same alert twice in a row is legal and normal,
especially on a fast device (like running in qemu).  Kind of
like interrupts.  So don't report duplicate alerts, and deliver
them normally.

[JD: Fixed subject]

Signed-off-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
That's a 4-year-old patch from Corey which I stumbled upon this
morning. I was supposed to test it on my ADM1032 evaluation board but
never got to it. Sorry about that. It turns out that I no longer have
any system with a parallel port to test it.

I think the patch is correct and whatever the problem was on my ADM1032
evaluation board, it should be fixed differently. Maybe it was a wrong
trigger type, or alerts must be disabled temporarily during processing,
or the hardware is actually bogus and it would be up to the device
driver to ignore alerts for some time after receiving one. Whatever,
let's apply the fix now and deal with this problem later if/when it
resurfaces.

 drivers/i2c/i2c-smbus.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 94765a8..cecd423 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -75,7 +75,6 @@ static void smbus_alert(struct work_struct *work)
 {
 	struct i2c_smbus_alert *alert;
 	struct i2c_client *ara;
-	unsigned short prev_addr = 0;	/* Not a valid address */
 
 	alert = container_of(work, struct i2c_smbus_alert, alert);
 	ara = alert->ara;
@@ -99,18 +98,12 @@ static void smbus_alert(struct work_struct *work)
 		data.flag = status & 1;
 		data.addr = status >> 1;
 
-		if (data.addr == prev_addr) {
-			dev_warn(&ara->dev, "Duplicate SMBALERT# from dev "
-				"0x%02x, skipping\n", data.addr);
-			break;
-		}
 		dev_dbg(&ara->dev, "SMBALERT# from dev 0x%02x, flag %d\n",
 			data.addr, data.flag);
 
 		/* Notify driver for the device which issued the alert */
 		device_for_each_child(&ara->adapter->dev, &data,
 				      smbus_do_alert);
-		prev_addr = data.addr;
 	}
 
 	/* We handled all alerts; re-enable level-triggered IRQs */


-- 
Jean Delvare
SUSE L3 Support
