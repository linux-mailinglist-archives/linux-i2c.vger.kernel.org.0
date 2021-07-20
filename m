Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6813CFD38
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jul 2021 17:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238188AbhGTOd6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jul 2021 10:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239272AbhGTONr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jul 2021 10:13:47 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FD2C061786;
        Tue, 20 Jul 2021 07:50:07 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id ee25so28755990edb.5;
        Tue, 20 Jul 2021 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DfaYjaAQWD7iw8jrijr5uZKZKd1db+DgTG/cmZm1AoU=;
        b=rfezC5dL7JwoDTyXVJMplYPp7NimB1xesQl2PaOTxXk13s7kDmCnCAfywwPd28wZX2
         9TDa9akJR/eMHMFiK/5mLlNHDwS1bQzlQ8xC9OmmyPlVX6d2V2afKWOpLJrThSQorLHT
         7WvJ0klPF7M7MUUDqRA/Df/N7n4BWJkAwgt6pqcdfOfMJd5wqfnfYHFZZjBl8LWSIp0t
         6o1jCMxWs1Vwkzhj3seqgKcSOUdRpzgSgqQP3JdBA00eJO1lafaxKX+5cVZjTersw+h8
         U0ylwPPLZaZ4dUYs8FnLlYZTiluTNNHGc3nz4IviEafuIuEsaNJmQGwYijfe7VJWJcFQ
         kENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DfaYjaAQWD7iw8jrijr5uZKZKd1db+DgTG/cmZm1AoU=;
        b=X3MHt1QdFKtgsyZYg+ceU8aUcEMRHKEcJXVvnI2XGYBIrAd2YMmPQj+sQ7XdDHnvLZ
         0sXZF49gMYJyBpwC1G3l+lAXwqWPdvp7LLVNBUqzWnU+xRWgq5RlJ5zKgA4nVonO3+kQ
         hVZfxR5IRbiZpv5uOTUPk9/1IPllUQJk80rzGKnaaiprxiVSKgdm4Z53U69sMBtSfCdw
         cbk6+++VpvH+zaUFRZdZdcD34V0DSOjEQGW1sb84fjTqc+W6UbM3shRr7ri3Ixc5pYzH
         ulz7/Y7odqiFV/JNY1x5UPwTrxf9h3sb/fKuXAS+y5acYDDPbszxRzsIkWuMgdSmaveJ
         qVqg==
X-Gm-Message-State: AOAM532HRe6xRaAhLwjxfWyrOBCyuhncn7L9ahL9R0ZJ+GHqkxsELMXE
        BcTBKYtnWHWqFLVdCCIUg1VD0mWpB76c6P0FYQc=
X-Google-Smtp-Source: ABdhPJw88j9PXuncQg+libg07ckFW1eeacVNT7ZHohEgh6T49pi57vahmjem4mbdgcSh4CwVvTdldg==
X-Received: by 2002:a05:6402:1011:: with SMTP id c17mr13780157edu.144.1626792605965;
        Tue, 20 Jul 2021 07:50:05 -0700 (PDT)
Received: from localhost.localdomain (cbl217-132-240-31.bb.netvision.net.il. [217.132.240.31])
        by smtp.googlemail.com with ESMTPSA id n13sm4876600eda.36.2021.07.20.07.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 07:50:05 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        aaron.jones@ftdichip.com
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v1] HID: ft260: fix device removal due to USB disconnect
Date:   Tue, 20 Jul 2021 17:49:54 +0300
Message-Id: <20210720144954.5392-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This commit fixes a regression introduced by the commit 82f09a637dd3
("HID: ft260: improve error handling of ft260_hid_feature_report_get()")
when upon USB disconnect, the ft260 i2c device is still available within
the /dev folder.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Acked-by: Aaron Jones (FTDI-UK) <aaron.jones@ftdichip.com>
---
 drivers/hid/hid-ft260.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index f43a8406cb9a..fa73a35aaf98 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -742,8 +742,8 @@ static int ft260_is_interface_enabled(struct hid_device *hdev)
 	int ret;
 
 	ret = ft260_get_system_config(hdev, &cfg);
-	if (ret)
-		return ret;
+	if (ret < 0)
+		return 0;
 
 	ft260_dbg("interface:  0x%02x\n", interface);
 	ft260_dbg("chip mode:  0x%02x\n", cfg.chip_mode);
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

