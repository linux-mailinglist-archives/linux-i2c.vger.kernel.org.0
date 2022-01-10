Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE00489E60
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jan 2022 18:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238288AbiAJR3F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jan 2022 12:29:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238284AbiAJR3E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jan 2022 12:29:04 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72069C06173F;
        Mon, 10 Jan 2022 09:29:04 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso15715075otf.12;
        Mon, 10 Jan 2022 09:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fm3Y+5F0MohN4olHGLQvRyoAifK70Yk5FnnM8OBOnaY=;
        b=MQ5CdHLt8ziCfryvpihlDJ4ZX85Tcy9aduZDqgAPNXFqWCfkVB3g53gklEatbykw9O
         s06GJKKMFGf0h9XgsqxL3Vk55iIaILIJK5qjz50k3DLDi93RDx3uufwoSONbr5HVO8JJ
         oF+Fp4MuXHSO7HCKDA7tESwPWsLOIdTQUnPEdfInm3tdj8yQEyKpOyxOb8zkUw8HjvWR
         NN1RaGE+dnvPQ44Mz27r2a5Tx1A+AR9ru6qdzQ/TYmva0bjD/KNRfX/uz4Qun8g1Qb5n
         UDU34TIo0n2i3GElXebI6y49GvorEqSFAfso8DRBE5hxrT1UyhWzidW7WnmDM1L7RZdZ
         TTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=fm3Y+5F0MohN4olHGLQvRyoAifK70Yk5FnnM8OBOnaY=;
        b=FW/2jXyjeSja+p4hd0lVvscI2vEPa7z//ScTLptpIlVlRK+Pyj7bsBG5wYFLtjGe5+
         1SvxrJ8qrvCTJo2xOTsvU7vfXSmn1FjEqbIAmS+DxhVgs2PgskACURpf5r/7HlgsS9Ld
         JK7hX7No2QE/Ix9cQLk1a9bSut+69DaiZt2RuI9lX0Q8/5YtQLs/IxV42I6huTxN/PeH
         W9hLgg3eojpyeUTR/vap3DhFxi0iAE//TfqC94J7WLyxrKrFNBTk0u25uImbA7OTkJ34
         CuoXyTnPpki7uu5VsCH0hamyDmp5RDr+vv7SouwM669RoHBMDI7MscIEbNBJ0EfwH0ou
         V8Dg==
X-Gm-Message-State: AOAM5318aJcoLvjzerwJEoMdNWh87KPwxo4B6XWkRrl3jh6pi0jyVqgW
        ZoLyrK0z3Q34ypOHHeYdqfQ=
X-Google-Smtp-Source: ABdhPJxrSaYVUajgkoTx8YKk397pJEjp52052DAoOiu2AGsb0YgzgvbMizN+/LBOAfKZx1FErgLxpw==
X-Received: by 2002:a9d:6b0c:: with SMTP id g12mr623948otp.312.1641835743836;
        Mon, 10 Jan 2022 09:29:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k19sm1419757oot.32.2022.01.10.09.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 09:29:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] i2c: smbus: Improve handling of stuck alerts
Date:   Mon, 10 Jan 2022 09:28:56 -0800
Message-Id: <20220110172857.2980523-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220110172857.2980523-1-linux@roeck-us.net>
References: <20220110172857.2980523-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The following messages were observed while testing alert functionality
on systems with multiple I2C devices on a single bus if alert was active
on more than one chip.

smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
smbus_alert 3-000c: no driver alert()!

and:

smbus_alert 3-000c: SMBALERT# from dev 0x28, flag 0

Once it starts, this message repeats forever at high rate. There is no
device at any of the reported addresses.

Analysis shows that this is seen if multiple devices have the alert pin
active. Apparently some devices do not support SMBus arbitration correctly.
They keep sending address bits after detecting an address collision and
handle the collision not at all or too late.
Specifically, address 0x0c is seen with ADT7461A at address 0x4c and
ADM1021 at address 0x18 if alert is active on both chips. Address 0x28 is
seen with ADT7483 at address 0x2a and ADT7461 at address 0x4c if alert is
active on both chips.

Once the system is in bad state (alert is set by more than one chip),
it often only recovers by power cycling.

To reduce the impact of this problem, abort the endless loop in
smbus_alert() if the same address is read more than once and not
handled by a driver.

Fixes: b5527a7766f0 ("i2c: Add SMBus alert support")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/i2c/i2c-smbus.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index d3d06e3b4f3b..533c885b99ac 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -34,6 +34,7 @@ static int smbus_do_alert(struct device *dev, void *addrp)
 	struct i2c_client *client = i2c_verify_client(dev);
 	struct alert_data *data = addrp;
 	struct i2c_driver *driver;
+	int ret;
 
 	if (!client || client->addr != data->addr)
 		return 0;
@@ -47,16 +48,21 @@ static int smbus_do_alert(struct device *dev, void *addrp)
 	device_lock(dev);
 	if (client->dev.driver) {
 		driver = to_i2c_driver(client->dev.driver);
-		if (driver->alert)
+		if (driver->alert) {
 			driver->alert(client, data->type, data->data);
-		else
+			ret = -EBUSY;
+		} else {
 			dev_warn(&client->dev, "no driver alert()!\n");
-	} else
+			ret = -EOPNOTSUPP;
+		}
+	} else {
 		dev_dbg(&client->dev, "alert with no driver\n");
+		ret = -ENODEV;
+	}
 	device_unlock(dev);
 
 	/* Stop iterating after we find the device */
-	return -EBUSY;
+	return ret;
 }
 
 /*
@@ -67,6 +73,7 @@ static irqreturn_t smbus_alert(int irq, void *d)
 {
 	struct i2c_smbus_alert *alert = d;
 	struct i2c_client *ara;
+	unsigned short prev_addr = 0;	/* Not a valid address */
 
 	ara = alert->ara;
 
@@ -94,8 +101,19 @@ static irqreturn_t smbus_alert(int irq, void *d)
 			data.addr, data.data);
 
 		/* Notify driver for the device which issued the alert */
-		device_for_each_child(&ara->adapter->dev, &data,
-				      smbus_do_alert);
+		status = device_for_each_child(&ara->adapter->dev, &data,
+					       smbus_do_alert);
+		/*
+		 * If we read the same address more than once, and the alert
+		 * was not handled by a driver, it won't do any good to repeat
+		 * the loop because it will never terminate.
+		 * Bail out in this case.
+		 * Note: This assumes that a driver with alert handler handles
+		 * the alert properly and clears it if necessary.
+		 */
+		if (data.addr == prev_addr && status != -EBUSY)
+			break;
+		prev_addr = data.addr;
 	}
 
 	return IRQ_HANDLED;
-- 
2.33.0

