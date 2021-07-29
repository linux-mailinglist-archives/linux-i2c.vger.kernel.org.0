Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68DE83DA105
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Jul 2021 12:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbhG2K10 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Jul 2021 06:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235155AbhG2K1Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Jul 2021 06:27:25 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7CB2C061757;
        Thu, 29 Jul 2021 03:27:22 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id u15-20020a05600c19cfb02902501bdb23cdso6495731wmq.0;
        Thu, 29 Jul 2021 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/r4EMpOiWcNrACqTgelxOYdk1xzSfi6/Cy6AgoDN22Y=;
        b=Qy7yfveaKvQAIF2AvFybTcHBlX5Ow+E0pCDwqqfj+E8R7cpMrapK6IqD6ACX2irdfT
         cQsVlHNSo841rZ/vkfwJntF44EmLAysG8PZfavHv0YxbfsHMRhm5NOBimG/dUu38lgzU
         Jo3cyJ8rqgwuJayZkWRZ7HRGDBJl4lyeh1Kc9POJoIep3UQ8Rz7m4bgzwajTgJ5iWeEO
         spCCtrH+KE1/FYfBIOpsVv+bO0H5/8UBSD2zhquwA+BoZT3FSvbDAKlM0NY4SSIUZvz0
         SK/DbIiC+TyjMnXQS+aaLQXb0YBAzC4Bf3Ih6hb181zzf8e9/CfChBatfvhmoyM7FY52
         B2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/r4EMpOiWcNrACqTgelxOYdk1xzSfi6/Cy6AgoDN22Y=;
        b=VajPgtglzM4EoSntNk/c+b2OwlNJm60i/Gm90kA7D0T+l0rzaoRenApF05vGrLycn6
         7Jm9mGSs6KATbqbeWDKtCt9FfP3YeJQLxWk8qLXmyEJ1tVcb/XPRhbIy5OX+2EWPIIbY
         BygRYeBQbiRiBbdq2igkF9b37n5CPNBCeiwSWXIl7u9wD2a3fvQ+ZgEj8YJKu1oQA3LH
         K0crAj52ngc/n/xhQ517fZcrS1kLaqRNhKp6WLve9bL//zcgF2nu0iZbn/h5ntxcS9rm
         VHDMWTHTFI5+DFdmOBuCy5pT0/4UE/ol+xqp7a4bJT8PQaAaAuLeemjjFn4UeW3TTg0E
         67/A==
X-Gm-Message-State: AOAM5304j6OWoP6hjYDbUM6IBdGBnWlUTCF1peipXNjKsSk8z+mLxwnL
        Tx9fpyFcyu+/ruU8+rIZ/wU=
X-Google-Smtp-Source: ABdhPJwpOxPu9pntuzs0c5YuvjJxhVSBEzf/L50+L72rf1Ve1FbdpyUm+S1f5kyP2b7FC0p5kVaCDA==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr13825686wmj.180.1627554441427;
        Thu, 29 Jul 2021 03:27:21 -0700 (PDT)
Received: from michael-VirtualBox.xsight.ent ([31.168.255.170])
        by smtp.googlemail.com with ESMTPSA id u2sm9441420wmm.37.2021.07.29.03.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 03:27:20 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        aaron.jones@ftdichip.com
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2] HID: ft260: fix device removal due to USB disconnect
Date:   Thu, 29 Jul 2021 13:26:03 +0300
Message-Id: <20210729102603.3844-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <nycvar.YFH.7.76.2107281147160.8253@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2107281147160.8253@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This commit fixes a functional regression introduced by the commit 82f09a637dd3
("HID: ft260: improve error handling of ft260_hid_feature_report_get()")
when upon USB disconnect, the FTDI FT260 i2c device is still available within
the /dev folder.

In my company's product, where the host USB to FT260 USB connection is
hard-wired in the PCB, the issue is not reproducible. To reproduce it, I used
the VirtualBox Ubuntu 20.04 VM and the UMFT260EV1A development module for the
FTDI FT260 chip:

Plug the UMFT260EV1A module into a USB port and attach it to VM.

The VM shows 2 i2c devices under the /dev:
    michael@michael-VirtualBox:~$ ls /dev/i2c-*
    /dev/i2c-0  /dev/i2c-1

The i2c-0 is not related to the FTDI FT260:
    michael@michael-VirtualBox:~$ cat /sys/bus/i2c/devices/i2c-0/name
    SMBus PIIX4 adapter at 4100

The i2c-1 is created by hid-ft260.ko:
    michael@michael-VirtualBox:~$ cat /sys/bus/i2c/devices/i2c-1/name
    FT260 usb-i2c bridge on hidraw1

Now, detach the FTDI FT260 USB device from VM. We expect the /dev/i2c-1
to disappear, but it's still here:
    michael@michael-VirtualBox:~$ ls /dev/i2c-*
    /dev/i2c-0  /dev/i2c-1

And the kernel log shows:
    [  +0.001202] usb 2-2: USB disconnect, device number 3
    [  +0.000109] ft260 0003:0403:6030.0002: failed to retrieve system status
    [  +0.000316] ft260 0003:0403:6030.0003: failed to retrieve system status

It happens because the commit 82f09a637dd3 changed the ft260_get_system_config()
return logic. This caused the ft260_is_interface_enabled() to exit with error
upon the FT260 device USB disconnect, which in turn, aborted the ft260_remove()
before deleting the FT260 i2c device and cleaning its sysfs stuff.

This commit restores the FT260 USB removal functionality and improves the
ft260_is_interface_enabled() code to handle correctly all chip modes defined
by the device interface configuration pins DCNF0 and DCNF1.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Acked-by: Aaron Jones (FTDI-UK) <aaron.jones@ftdichip.com>
---
 drivers/hid/hid-ft260.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index f43a8406cb9a..e73776ae6976 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -742,7 +742,7 @@ static int ft260_is_interface_enabled(struct hid_device *hdev)
 	int ret;
 
 	ret = ft260_get_system_config(hdev, &cfg);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	ft260_dbg("interface:  0x%02x\n", interface);
@@ -754,23 +754,16 @@ static int ft260_is_interface_enabled(struct hid_device *hdev)
 	switch (cfg.chip_mode) {
 	case FT260_MODE_ALL:
 	case FT260_MODE_BOTH:
-		if (interface == 1) {
+		if (interface == 1)
 			hid_info(hdev, "uart interface is not supported\n");
-			return 0;
-		}
-		ret = 1;
+		else
+			ret = 1;
 		break;
 	case FT260_MODE_UART:
-		if (interface == 0) {
-			hid_info(hdev, "uart is unsupported on interface 0\n");
-			ret = 0;
-		}
+		hid_info(hdev, "uart interface is not supported\n");
 		break;
 	case FT260_MODE_I2C:
-		if (interface == 1) {
-			hid_info(hdev, "i2c is unsupported on interface 1\n");
-			ret = 0;
-		}
+		ret = 1;
 		break;
 	}
 	return ret;
@@ -1004,11 +997,9 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 static void ft260_remove(struct hid_device *hdev)
 {
-	int ret;
 	struct ft260_device *dev = hid_get_drvdata(hdev);
 
-	ret = ft260_is_interface_enabled(hdev);
-	if (ret <= 0)
+	if (!dev)
 		return;
 
 	sysfs_remove_group(&hdev->dev.kobj, &ft260_attr_group);
-- 
2.25.1

