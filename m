Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6986489E62
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jan 2022 18:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238359AbiAJR3J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jan 2022 12:29:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238350AbiAJR3H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jan 2022 12:29:07 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC77C06173F;
        Mon, 10 Jan 2022 09:29:06 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id c3-20020a9d6c83000000b00590b9c8819aso6271961otr.6;
        Mon, 10 Jan 2022 09:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3arUIq63vNkv0j9deYGRwsb6acRjeiR9Ll7tBXR1ckY=;
        b=KfxnQt6E4jhETkBYRW6RgjpaOewUsqAv3+5n7Qbagdyen8Mo0Z70sbHSFse0rfEnvR
         V5EBEMM1hvovVG0sNctLNgRJrlHf7TL2fqqVocdNtQqm5XWNqpT/pZjCetBOVYcXo3zl
         f7MaDWmhUUwLcKjvc5c0Y8eBZ2T98TV55/fLF6kZrrQJRcfFTdGbOibVHo7tFms7MPWs
         u+6PME91vyXW8R0SQ2MNO/tgMABtjhuEenFEgaFNItFoi6I/bz0PsfEWaY+xEozBfeUE
         bklikwqZqo1lmxpH3ZK2yhi9EAaOPhTayWw8YsmHDRJ1nStfzzlag+9lycTy6SFiGZZw
         jeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=3arUIq63vNkv0j9deYGRwsb6acRjeiR9Ll7tBXR1ckY=;
        b=OFPhj+urUuSzBQAcHCy8JIEMtD2msscL3P64jr5MVZsh2MioazR4ctyVtscF8AruIx
         O2WjHVyz1Ehtsd0qyZcQDlU9Lblrku1KJ/Eei1DhLJgefWe67+26U4JDeE+MUqGDkqTc
         BCno0Oi+51GK60K4sDH6bvxrbhw1GcDhSzA0a1ds9nOkFCCtTYfX73tG9wwLZ3hLLZwY
         dIT835S+gPk+h4PN4hjEYidsNAg4/KFcOxYhp5yuCiIcVkH9l74fqKsvQYQtqXnmD55H
         wRL2pHCM4lyvIH//W9hRNR0XA4sb7iyWj8+nrXQ7Y/ZZmMjm7X7XPThLcJeZ6VQbIOZQ
         4anA==
X-Gm-Message-State: AOAM53295ktTWkMwiwZCPRoPjmgJ3S0oQ1yFQSmnzGjXRaP6gwOwZsv2
        c96KNoBe7xcmBZ3+kTFncSY39GW/RWM=
X-Google-Smtp-Source: ABdhPJy31UYaR9emLBbPr2+/92GUNa+ayCindvUPDU4MVjEJzuglp0vPcFmpQBScXNM1OlIQA3I9fA==
X-Received: by 2002:a05:6830:1e6b:: with SMTP id m11mr627285otr.29.1641835745772;
        Mon, 10 Jan 2022 09:29:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d3sm1274717oiw.52.2022.01.10.09.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 09:29:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] i2c: smbus: Send alert notifications to all devices if source not found
Date:   Mon, 10 Jan 2022 09:28:57 -0800
Message-Id: <20220110172857.2980523-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220110172857.2980523-1-linux@roeck-us.net>
References: <20220110172857.2980523-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If a SMBUs alert is received and the originating device is not found,
the reason may be that the address reported on the SMBus alert address
is corrupted, for example because multiple devices asserted alert and
do not correctly implement SMBus arbitration.

If this happens, call alert handlers on all devices connected to the
given I2C bus, in the hope that this cleans up the situation. Retry
twice before giving up.

This change reliably fixed the problem on a system with multiple devices
on a single bus. Example log where the device on address 0x18 (ADM1021)
and on address 0x4c (ADM7461A) both had the alert line asserted:

smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
smbus_alert 3-000c: no driver alert()!
smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
smbus_alert 3-000c: no driver alert()!
lm90 3-0018: temp1 out of range, please check!
lm90 3-0018: Disabling ALERT#
lm90 3-0029: Everything OK
lm90 3-002a: Everything OK
lm90 3-004c: temp1 out of range, please check!
lm90 3-004c: temp2 out of range, please check!
lm90 3-004c: Disabling ALERT#

Fixes: b5527a7766f0 ("i2c: Add SMBus alert support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/i2c/i2c-smbus.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 533c885b99ac..f48cec19db41 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -65,6 +65,32 @@ static int smbus_do_alert(struct device *dev, void *addrp)
 	return ret;
 }
 
+/* Same as above, but call back all drivers with alert handler */
+
+static int smbus_do_alert_force(struct device *dev, void *addrp)
+{
+	struct i2c_client *client = i2c_verify_client(dev);
+	struct alert_data *data = addrp;
+	struct i2c_driver *driver;
+
+	if (!client || (client->flags & I2C_CLIENT_TEN))
+		return 0;
+
+	/*
+	 * Drivers should either disable alerts, or provide at least
+	 * a minimal handler. Lock so the driver won't change.
+	 */
+	device_lock(dev);
+	if (client->dev.driver) {
+		driver = to_i2c_driver(client->dev.driver);
+		if (driver->alert)
+			driver->alert(client, data->type, data->data);
+	}
+	device_unlock(dev);
+
+	return 0;
+}
+
 /*
  * The alert IRQ handler needs to hand work off to a task which can issue
  * SMBus calls, because those sleeping calls can't be made in IRQ context.
@@ -74,6 +100,7 @@ static irqreturn_t smbus_alert(int irq, void *d)
 	struct i2c_smbus_alert *alert = d;
 	struct i2c_client *ara;
 	unsigned short prev_addr = 0;	/* Not a valid address */
+	int retries = 0;
 
 	ara = alert->ara;
 
@@ -111,8 +138,15 @@ static irqreturn_t smbus_alert(int irq, void *d)
 		 * Note: This assumes that a driver with alert handler handles
 		 * the alert properly and clears it if necessary.
 		 */
-		if (data.addr == prev_addr && status != -EBUSY)
-			break;
+		if (data.addr == prev_addr && status != -EBUSY) {
+			/* retry once */
+			if (retries++)
+				break;
+			device_for_each_child(&ara->adapter->dev, &data,
+					      smbus_do_alert_force);
+		} else {
+			retries = 0;
+		}
 		prev_addr = data.addr;
 	}
 
-- 
2.33.0

