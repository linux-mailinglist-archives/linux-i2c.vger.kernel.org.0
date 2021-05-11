Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BB637A449
	for <lists+linux-i2c@lfdr.de>; Tue, 11 May 2021 12:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbhEKKH7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 06:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbhEKKH7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 May 2021 06:07:59 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B570C061574;
        Tue, 11 May 2021 03:06:52 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id v12so19500819wrq.6;
        Tue, 11 May 2021 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2WVbfAVqJcL+REqbX0YpO9uYgKY9glSk3kcY+TpGLg=;
        b=CLuDvEpM3aoLoo6URBinpv+XxdSvKbVEhi+rM3DXkpBb1On2rr2Rc5Ryydipxns/7W
         J/BihtFNpBMPDUZXQpXLUQyuC+2M18/GY49sw6Mdg3kRFUGKPw6a8wP8DoKxDtlkU0Vv
         k7rbsUTq9iGHsSkGjUxRzg2NUdhyP3ZsCcdBygYutaKqVyAbn/Y5osGGsawJ8RvtNQrE
         p4XT4Q0oXppYPkKSSamfZz5tXbricf2cdPRkB8VgWlQb/ew4grrt0n6+NC+PEbsv5+XP
         MQjmWnV6HFdrZc4EXQpqgMuAMM/rnpW9JNhKaKgpMqh2FtvFo+UNoFvFsTgNj+mk86oQ
         iq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c2WVbfAVqJcL+REqbX0YpO9uYgKY9glSk3kcY+TpGLg=;
        b=cSGhgKfsIlnrW6N4dMNwL6403YO3GHPvysmq6s6Nh7XdFEzJwPsiUWyWHzfn+52CbH
         G9gdFbfysrFrLdFOSpUYHpojAuuLMe6orDXc+wYcK8iHMyozlHLm7eHIkupSKnDy8OOL
         V/NmM4Y159k0KPSg3lryEAMtYWZR0fpPxQlblQRsrxT4mDpCtNePt+ZggMB/7hNH/9u4
         +lNmD20A2XpSkZFdQlTJ9PkxVSD6GGO/gnyZdcnDmCJlo9oqV5/32y1BUuTF+FnKAmzV
         bpmeAS+ctAEGnsu6iRmT9bb73ox0XW6VjA8Cmcw5wSfWp2XMAhZXGyPVNZlEMrFnXFIG
         b0yw==
X-Gm-Message-State: AOAM5321JyRyKRjFG/lLWIQbKrqV7KMehHyKUQ0kbocgug4Xg4mQwldb
        tp1wDX0vDbU/xW09BNyZO3E=
X-Google-Smtp-Source: ABdhPJwhqZ4PpItyOqNGBZqT+MmWAkofsgKBZYJ9WwZj2DQHPHW3XZY472j3ptZBh1MvZIHYlBJS5A==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr38324156wrq.198.1620727610765;
        Tue, 11 May 2021 03:06:50 -0700 (PDT)
Received: from michael-VirtualBox.xsight.ent (cbl217-132-244-50.bb.netvision.net.il. [217.132.244.50])
        by smtp.googlemail.com with ESMTPSA id 61sm30079581wrm.52.2021.05.11.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 03:06:50 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     trix@redhat.com, jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v3] HID: ft260: improve error handling of ft260_hid_feature_report_get()
Date:   Tue, 11 May 2021 13:06:34 +0300
Message-Id: <20210511100634.16278-1-michael.zaidman@gmail.com>
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

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
Signed-off-by: Tom Rix <trix@redhat.com>

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

