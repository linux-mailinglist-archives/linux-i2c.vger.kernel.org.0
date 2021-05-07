Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 469C0376A19
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 20:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhEGSjF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 14:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43315 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229482AbhEGSjF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 14:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620412684;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1k6eq9jPcs1/rUuIMW2P4M5PT4z4+pXOzj/IObfRD18=;
        b=X3O0Wfk28wLvIKc9BGq2UPFq0CBB9NYaiD92sot5OUY6ja1kGW0BvJbgky2fhpz7qcmDHr
        OvmIrV9DSGl0O0sR2CIj/p/cSDrhXVzVrl6HTHYrSBClD8oBnNeO0gmL8znTOpK6vfBsz2
        +M8B0Za8/gHkF/roI/vqDuKjG1z2Em0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-TY85slWiNeW5EXEPCYYLBA-1; Fri, 07 May 2021 14:38:02 -0400
X-MC-Unique: TY85slWiNeW5EXEPCYYLBA-1
Received: by mail-qt1-f200.google.com with SMTP id h4-20020ac858440000b029019d657b9f21so6319998qth.9
        for <linux-i2c@vger.kernel.org>; Fri, 07 May 2021 11:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1k6eq9jPcs1/rUuIMW2P4M5PT4z4+pXOzj/IObfRD18=;
        b=crtNrufQC6xShrS6lOBjOkaawy9jI2cQDOCW5MiFI9F35oDnyTNzmZ7YknzRLUtCZw
         N01qfiUfYjyj/LxPdURI2gcg2V4dOTuRFWoxLPb0KnGzTd27on3IjQg5dNXIFr3HN/Wv
         ZRxFolSeMx52RNFqau1/FW/iP8ce/DHEA6FODjkqjLNaRzyj4usWdfpCvl8eZlSBBApo
         20DXU8eqYNeEoeoVfRs1GFMfpTV2uXnEp+53S89H77nPNEO1ZjjuvnXjZZOY31L+Ooq0
         vfEBapfATRiDZw4hA0Se+C/8jB+I7Wn8NKTC1vvRIrtf8g/+OJ/upjox8ZkzCzY1pYwr
         /hPQ==
X-Gm-Message-State: AOAM532TyXxmiFBrR/ScfibnPngzmRmj2GMqoLwL3XPmP0j5YqUan1uu
        WJE47EwX2HvuPm+cc9Zf8nCpRFIYkvubLqRmkgDi2PRbTZezb9SIvQa1X9VRQ8/GKbBLBcyvWhM
        HBfp0H+PR9ARn+mzxVhEJ
X-Received: by 2002:a37:4017:: with SMTP id n23mr10328951qka.338.1620412682483;
        Fri, 07 May 2021 11:38:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcasrcawhbP+7zVi8omyoDWPuKGLAwmdSq3xmIbEg+FiBTtNoZWmFJja8xDruM9cbUDbsfUA==
X-Received: by 2002:a37:4017:: with SMTP id n23mr10328937qka.338.1620412682253;
        Fri, 07 May 2021 11:38:02 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id s21sm1048679qks.114.2021.05.07.11.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 11:38:01 -0700 (PDT)
From:   trix@redhat.com
To:     michael.zaidman@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] HID: ft260: improve error handling of ft260_hid_feature_report_get()
Date:   Fri,  7 May 2021 11:37:57 -0700
Message-Id: <20210507183757.68810-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Static analysis reports this representative problem

hid-ft260.c:787:9: warning: 4th function call argument is an
  uninitialized value
        return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Uses of ft260_hid_feature_report_get() check if the return size matches
the requested size.  But the function can also fail with at least -ENOMEM.
Add the < 0 checks.

In ft260_hid_feature_report_get(), do not do the memcpy to the caller's
buffer if there is an error.

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/hid/hid-ft260.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 7a9ba984a75a..628fa664a10b 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -249,7 +249,8 @@ static int ft260_hid_feature_report_get(struct hid_device *hdev,
 
 	ret = hid_hw_raw_request(hdev, report_id, buf, len, HID_FEATURE_REPORT,
 				 HID_REQ_GET_REPORT);
-	memcpy(data, buf, len);
+	if (ret == len)
+		memcpy(data, buf, len);
 	kfree(buf);
 	return ret;
 }
@@ -295,12 +296,16 @@ static int ft260_xfer_status(struct ft260_device *dev)
 	struct hid_device *hdev = dev->hdev;
 	struct ft260_get_i2c_status_report report;
 	int ret;
+	int len = sizeof(report);
 
 	ret = ft260_hid_feature_report_get(hdev, FT260_I2C_STATUS,
-					   (u8 *)&report, sizeof(report));
-	if (ret < 0) {
+					   (u8 *)&report, len);
+	if (ret != len) {
 		hid_err(hdev, "failed to retrieve status: %d\n", ret);
-		return ret;
+		if (ret >= 0)
+			return -EIO;
+		else
+			return ret;
 	}
 
 	dev->clock = le16_to_cpu(report.clock);
@@ -728,6 +733,8 @@ static int ft260_get_system_config(struct hid_device *hdev,
 		hid_err(hdev, "failed to retrieve system status\n");
 		if (ret >= 0)
 			return -EIO;
+		else
+			return ret;
 	}
 	return 0;
 }
@@ -782,6 +789,8 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	ret = ft260_hid_feature_report_get(hdev, id, cfg, len);
 	if (ret != len && ret >= 0)
 		return -EIO;
+	else if (ret < 0)
+		return  ret;
 
 	return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
 }
@@ -794,6 +803,8 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	ret = ft260_hid_feature_report_get(hdev, id, cfg, len);
 	if (ret != len && ret >= 0)
 		return -EIO;
+	else if (ret < 0)
+		return ret;
 
 	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
 }
-- 
2.26.3

