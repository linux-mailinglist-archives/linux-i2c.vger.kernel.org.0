Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7701937A45C
	for <lists+linux-i2c@lfdr.de>; Tue, 11 May 2021 12:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhEKKN3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 06:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231177AbhEKKN3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 May 2021 06:13:29 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89AE4C061574;
        Tue, 11 May 2021 03:12:22 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n84so10824252wma.0;
        Tue, 11 May 2021 03:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yycjFgbB6++8FfDR2a0SYMKkib7VSh+fxdoVw7JnnlI=;
        b=uTm8lLy485DrhpF6TDFZ6Yq5Uo/c1/8UArG+whHuSSYuMmtio4/zuwd5OhozoCGnLP
         TLTroSjQ5Oc1leU6eX0Z7LFNh27M+b0yi7vIBpicdmFk1fT2NN2Mn81YPSj+xC/SY5gl
         yDgU4EAc11VBrrD3pc6lkJHuUs+v3x+z7hXUDO173c8MMNUW4hNVpSQiDtolJB0xYEcU
         NwuqMTcXW/9QCQpLvoLuAwZYACGiEuMJ8/aCbmwOLeEteeEOJtQtWAe3voSzxQBYNdNt
         atSSY+AQzd9WoBtIAROoV5P/0UN6lzdbiSNaL+X4uXJwmnDLhlTU8KwXZgM9RpN+vJSU
         0Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yycjFgbB6++8FfDR2a0SYMKkib7VSh+fxdoVw7JnnlI=;
        b=eVae1JH3Plcv4y2V49UHEU/yk0ro/pRcTprUcYMlvNVOKBXRMIsUFnuDi8BstuyApn
         tunp4fE+O++fwKgs3mTeaYIxq+2z/X+x1zCA0n36N5aUwOBzSretVm7YBYBXT2v+K2R+
         m0maORx1jGDvONNjFUnr5MKJzcG7ohbooLXI27MFuAXSyqgs4B84ipxei2dfHqvaEPG3
         NzmMjLoQUvxB4xG91BktoJW+yAmBdiQtZ1W6mdYItg/2LLNtHLYykXu+h0ItFGaCwrOK
         N6KvukKmU6ROmsTaTd1+K+JQDSCfqrTFF7643WfZKhKHTm+TUwf1dxugqnSBNcromfnZ
         hk5Q==
X-Gm-Message-State: AOAM530aBjW1TOhMvPlEHoEcz52FFtOJap566ceWpHA+I6HLinA3/OMF
        wNmgFHY47YRTZzs9XFtO5XQ=
X-Google-Smtp-Source: ABdhPJxqFAKv38utcX0KHG3ZH/EH1jArGTeSsn9R5iYAXMjMfzPlsDO32mDGedmZOg2VdMzzUpIY/A==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id l15mr4482464wmq.143.1620727941224;
        Tue, 11 May 2021 03:12:21 -0700 (PDT)
Received: from michael-VirtualBox.xsight.ent (cbl217-132-244-50.bb.netvision.net.il. [217.132.244.50])
        by smtp.googlemail.com with ESMTPSA id y14sm26691084wrs.64.2021.05.11.03.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 03:12:20 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     trix@redhat.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4] HID: ft260: improve error handling of ft260_hid_feature_report_get()
Date:   Tue, 11 May 2021 13:12:08 +0300
Message-Id: <20210511101208.16401-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")

The ft260_hid_feature_report_get() checks if the return size matches
the requested size. But the function can also fail with at least -ENOMEM.
Add the < 0 checks.

In ft260_hid_feature_report_get(), do not do the memcpy to the caller's
buffer if there is an error.

---
v4   Fixed commit message
---
v3   Simplify and optimize the changes
---
v2:  add unlikely()'s for error conditions
---

Signed-off-by: Tom Rix <trix@redhat.com>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 047aa85a7c83..7f4cb823129e 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -249,7 +249,10 @@ static int ft260_hid_feature_report_get(struct hid_device *hdev,
 
 	ret = hid_hw_raw_request(hdev, report_id, buf, len, HID_FEATURE_REPORT,
 				 HID_REQ_GET_REPORT);
-	memcpy(data, buf, len);
+	if (likely(ret == len))
+		memcpy(data, buf, len);
+	else if (ret >= 0)
+		ret = -EIO;
 	kfree(buf);
 	return ret;
 }
@@ -298,7 +301,7 @@ static int ft260_xfer_status(struct ft260_device *dev)
 
 	ret = ft260_hid_feature_report_get(hdev, FT260_I2C_STATUS,
 					   (u8 *)&report, sizeof(report));
-	if (ret < 0) {
+	if (unlikely(ret < 0)) {
 		hid_err(hdev, "failed to retrieve status: %d\n", ret);
 		return ret;
 	}
@@ -720,10 +723,9 @@ static int ft260_get_system_config(struct hid_device *hdev,
 
 	ret = ft260_hid_feature_report_get(hdev, FT260_SYSTEM_SETTINGS,
 					   (u8 *)cfg, len);
-	if (ret != len) {
+	if (ret < 0) {
 		hid_err(hdev, "failed to retrieve system status\n");
-		if (ret >= 0)
-			return -EIO;
+		return ret;
 	}
 	return 0;
 }
@@ -776,8 +778,8 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	int ret;
 
 	ret = ft260_hid_feature_report_get(hdev, id, cfg, len);
-	if (ret != len && ret >= 0)
-		return -EIO;
+	if (ret < 0)
+		return ret;
 
 	return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
 }
@@ -788,8 +790,8 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	int ret;
 
 	ret = ft260_hid_feature_report_get(hdev, id, cfg, len);
-	if (ret != len && ret >= 0)
-		return -EIO;
+	if (ret < 0)
+		return ret;
 
 	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
 }
@@ -940,10 +942,8 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	ret = ft260_hid_feature_report_get(hdev, FT260_CHIP_VERSION,
 					   (u8 *)&version, sizeof(version));
-	if (ret != sizeof(version)) {
+	if (ret < 0) {
 		hid_err(hdev, "failed to retrieve chip version\n");
-		if (ret >= 0)
-			ret = -EIO;
 		goto err_hid_close;
 	}
 
-- 
2.25.1

