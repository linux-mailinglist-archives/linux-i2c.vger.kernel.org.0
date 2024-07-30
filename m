Return-Path: <linux-i2c+bounces-5086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F9D94142F
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2024 16:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5747287880
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jul 2024 14:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF241A00CE;
	Tue, 30 Jul 2024 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in5ZSArL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3E81552FE;
	Tue, 30 Jul 2024 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722349189; cv=none; b=mz58LGbG/9NUAwMNcpt8Qy95zvslk9Nt1bVL456DrRAf6ngVXUSGm6zLEM2ao2OgdbAUhd0rzEfW+Rxh04QQaca/UTwYqMaaa6j9Vih7LM0ctQF4+v0nvF502Eu5ZrZXLSZQHT/tiIOQur4D88eH/rM6PFb8F5CFm0U4NSvsyvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722349189; c=relaxed/simple;
	bh=8ZOf3sFDONGpB3K5k8KeQzmT7Vf+h4ymqAiZ/Ws4Vk8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tVfhnAYux91bRmPNCIVprreO2ZI4vh/t6j5JVieIAsh0p6Rqjud0yCqJ85QJ3tkEoSKH//o5lwheCKW6lybOfOM/Ge7c0fDApV1j/ESeLaoIPzD1uyciUKcVMlaIy+2Tl9MZJAvBxrnPJaZYC5+dzlLnXgPbY6Wi+yOdK1oGXXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=in5ZSArL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fda7fa60a9so40939715ad.3;
        Tue, 30 Jul 2024 07:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722349187; x=1722953987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=q2AYTtIZ4fIdK8iesy2lLAi2WBdMprUMwIkyr+870os=;
        b=in5ZSArLb09SuSLKKHOUo8Rx/D/dhjJSmS7LaY/QeThqFX1WeGUzHXuRHoKcrn5srh
         6VDRdz45dfeJVtVeBMpdH3gm9H86BfwLEG5DrbW7u0j0c17d9VPtgNnfq0AJ3t5h3yZ+
         jHiYufg0eGvUCPMap5OiOrs1k8bWg5ytOZFlqNrIQZfKkl6HlzW90kxvQvFQbaqNAUma
         zTjcgpRGyAiP/M30GrmZemlQnQJQ/syeYkDFy8tDiHxmlWueAtNTav1NXTTvUVR1niaA
         jOMo8NeBC/d9WQOWLxVTvLXz2zHA3LWl6j6+jGkuOdFsmjHUivMunpDhz9OT14zlPLtH
         99Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722349187; x=1722953987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2AYTtIZ4fIdK8iesy2lLAi2WBdMprUMwIkyr+870os=;
        b=YEwj+6IOL8hgZ6VGTNxtJWeA7Av8yKpsnxZOUrMfm2UDl0uug/hGSSFyJ7NQ3aBvoI
         njSpPfpp3Tb1J/EYbdmo/kyinfzL8Rwew5A0zCha3auc6w2451yviCA1liVAYsizDFvX
         pkAB9kfVOK4QGkQBh1hz/XAnk9Cu6LAFKUtf+SsS3F4QFtma4CnbeVTS+iMUQcAsy6bJ
         Bypck+yn0eSkFkfrfpcEMLW4NpXB14IcD7fRabMO0csfqZu4xVBWo8UUcXU2oX7+DgVR
         J2FGl9fcbghCPxvGXumxQeNABk0gcV3wh8LKY1VOL0AQTkziXQl5HdPtM947utqtL+Kl
         sycQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP/zvPRuldWhbgzwVIFkRRMSJAzocTFkxedVFBtKtei/Gr7nKoGp8DC7HN4nDJ16bj94zMcLpwgI/FeN9/jLjca/AaPaPzSoCvsTqM
X-Gm-Message-State: AOJu0YxKBxj2F9oLa/FXZhxjXr8WCjVL+ZLrEmFm4EAPlEmgTbfKwMgX
	+oI4ywWF6dPttOVT01pQueHM39F2n81FXkyO76u3IHEyg6xemYALxqtMLg==
X-Google-Smtp-Source: AGHT+IH3GEWMTAKn5fQP2L4jM+U9sAV9lzY8cb3rkDssnnNAXLNNgPDS+zoVzTmEmv7XvbuXE9goSQ==
X-Received: by 2002:a17:902:f809:b0:1f9:fb48:7cf9 with SMTP id d9443c01a7336-1ff048e1924mr119253675ad.63.1722349186549;
        Tue, 30 Jul 2024 07:19:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f76016sm102599975ad.232.2024.07.30.07.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 07:19:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2] i2c: smbus: Send alert notifications to all devices if source not found
Date: Tue, 30 Jul 2024 07:19:41 -0700
Message-Id: <20240730141941.2402435-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a SMBUs alert is received and the originating device is not found,
the reason may be that the address reported on the SMBus alert address
is corrupted, for example because multiple devices asserted alert and
do not correctly implement SMBus arbitration.

If this happens, call alert handlers on all devices connected to the
given I2C bus, in the hope that this cleans up the situation.

This change reliably fixed the problem on a system with multiple devices
on a single bus. Example log where the device on address 0x18 (ADM1021)
and on address 0x4c (ADT7461A) both had the alert line asserted:

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
v2: Simplified: break loop after calling smbus_do_alert_force(),
    and dropped retry variable.
    Rebased on top of target branch.

Based on branch i2c/for-current of
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git.

 drivers/i2c/i2c-smbus.c | 38 +++++++++++++++++++++++++++++++++++---
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 836c247e7684..2b33c71feae1 100644
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
@@ -106,13 +132,19 @@ static irqreturn_t smbus_alert(int irq, void *d)
 		/*
 		 * If we read the same address more than once, and the alert
 		 * was not handled by a driver, it won't do any good to repeat
-		 * the loop because it will never terminate.
-		 * Bail out in this case.
+		 * the loop because it will never terminate. Try again, this
+		 * time calling the alert handlers of all devices connected to
+		 * the bus, and abort the loop afterwards. If this helps, we
+		 * are all set. If it doesn't, there is nothing else we can do,
+		 * so we might as well abort the loop.
 		 * Note: This assumes that a driver with alert handler handles
 		 * the alert properly and clears it if necessary.
 		 */
-		if (data.addr == prev_addr && status != -EBUSY)
+		if (data.addr == prev_addr && status != -EBUSY) {
+			device_for_each_child(&ara->adapter->dev, &data,
+					      smbus_do_alert_force);
 			break;
+		}
 		prev_addr = data.addr;
 	}
 
-- 
2.39.2


