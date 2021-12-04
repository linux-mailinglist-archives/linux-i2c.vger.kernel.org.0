Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDBE468761
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Dec 2021 21:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbhLDUIR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Dec 2021 15:08:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232824AbhLDUIQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Dec 2021 15:08:16 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A10BC061751
        for <linux-i2c@vger.kernel.org>; Sat,  4 Dec 2021 12:04:50 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id k37-20020a05600c1ca500b00330cb84834fso7468103wms.2
        for <linux-i2c@vger.kernel.org>; Sat, 04 Dec 2021 12:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:content-language
         :subject:content-transfer-encoding;
        bh=QPRIoF4rlKOTwAz/z+/OLsqS2Fzjm2v40KS3kV0qtbY=;
        b=m6jLo+KHq9B+ujFprALMccBTECn9lcHhnKxz/1yClLGiNCcxEMLlnpXsov6LQjnQ7T
         UxgdFi5Kc90b2XvTvD+5RRTsg0rpHHbNp6ovwhHoQ3H85GOYTnaYQa5oTdx2f5VBo2iz
         gZbwmEbmMH3/vVccuWf8BJirk5kI1+p+yyCzwmQgKIQxvLkRYp2eE3Q0zy9RUjqZ0Zkn
         gmP7YZIALrB+LV3aQpWljMZV4S/g3G4VoglHVfVshlYgnwP8iyKWqjRcPZ9Cu2/lueXM
         Lpu+yoz5ka6T/0Q7K2UcWL2irzA/vX9RBjzG8E4g5/wY1w0HwAlVKFYVq8ulVqogXDjx
         yHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:content-language:subject:content-transfer-encoding;
        bh=QPRIoF4rlKOTwAz/z+/OLsqS2Fzjm2v40KS3kV0qtbY=;
        b=rO9xFbkjbxyM8r17KmSvm6Rxhcs5XgMxz2duby9cT3M99ln8Fq9d6VGco0EA4I/41j
         gOPAmoco5OXQCHMCcsP+34Tn2OLfa1l3vX76J1DvVAhvmktD4tRang5qZr5MV4s2iu8U
         3kXbxyUN2UxcTL/W6zUZFzwhrCm2+9Q8tfgsKCicGD+F10WxWaTvi8NgKe5SCDYqfa2t
         eHLEDA4uFVVpZqq26Bdi4+haMP3H8X2wMPft93YNV/kWNbtVO9ePq5x81JxZpbD3vhyN
         lSZUPRT3SlZrjKgqsrJIJwf38p/tv2piF3wDisbIkR0lHrijqGVo1vD5QNfQREac9rGW
         MjGg==
X-Gm-Message-State: AOAM53209V6Alkh4gCXryfR6Dtwv7oNm5SzzMkayj2xiVj0/Z9Cmji7J
        CpXE8my06HL/GO8SVd7Do0LdbnnwQvE=
X-Google-Smtp-Source: ABdhPJxqnGeKnlM+4jczuvObkY2C+DY/AXKJr6o8c+L+9VhZJ7WVl9Pk/Dkgs9ri5svBX6X+WZIwdw==
X-Received: by 2002:a05:600c:b46:: with SMTP id k6mr25860575wmr.45.1638648288407;
        Sat, 04 Dec 2021 12:04:48 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:683c:6af8:489f:48c5? (p200300ea8f1a0f00683c6af8489f48c5.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:683c:6af8:489f:48c5])
        by smtp.googlemail.com with ESMTPSA id f8sm8926344wmf.2.2021.12.04.12.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Dec 2021 12:04:47 -0800 (PST)
Message-ID: <bd0def53-4e63-61eb-c0bb-9975a308cb1a@gmail.com>
Date:   Sat, 4 Dec 2021 21:04:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Language: en-US
Subject: [PATCH v3] i2c: i801: Don't clear status flags twice in interrupt
 mode
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In interrupt mode we clear the status flags twice, in the interrupt
handler and in i801_check_post(). Remove clearing the status flags
from i801_check_post() and handle polling mode by using the
SMBus unlocking write to also clear the status flags if still set.
To be precise: One could still argue that the status flags are
cleared twice in interrupt mode, but it comes for free.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- clear status flags also in i801_wait_byte_done()
- remove outdated comment at i801_check_post()
v3:
- merge unlocking SMBus and clearing status flags
- avoid the complexity added with v2
---
 drivers/i2c/busses/i2c-i801.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 930c6edbe..128a25de7 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -372,11 +372,6 @@ static int i801_check_pre(struct i801_priv *priv)
 	return 0;
 }
 
-/*
- * Convert the status register to an error code, and clear it.
- * Note that status only contains the bits we want to clear, not the
- * actual register value.
- */
 static int i801_check_post(struct i801_priv *priv, int status)
 {
 	int result = 0;
@@ -401,7 +396,6 @@ static int i801_check_post(struct i801_priv *priv, int status)
 		    !(status & SMBHSTSTS_FAILED))
 			dev_err(&priv->pci_dev->dev,
 				"Failed terminating the transaction\n");
-		outb_p(STATUS_FLAGS, SMBHSTSTS(priv));
 		return -ETIMEDOUT;
 	}
 
@@ -440,9 +434,6 @@ static int i801_check_post(struct i801_priv *priv, int status)
 		dev_dbg(&priv->pci_dev->dev, "Lost arbitration\n");
 	}
 
-	/* Clear status flags except BYTE_DONE, to be cleared by caller */
-	outb_p(status, SMBHSTSTS(priv));
-
 	return result;
 }
 
@@ -939,8 +930,11 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	}
 
 out:
-	/* Unlock the SMBus device for use by BIOS/ACPI */
-	outb_p(SMBHSTSTS_INUSE_STS, SMBHSTSTS(priv));
+	/*
+	 * Unlock the SMBus device for use by BIOS/ACPI,
+	 * and clear status flags if not done already.
+	 */
+	outb_p(SMBHSTSTS_INUSE_STS | STATUS_FLAGS, SMBHSTSTS(priv));
 
 	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
 	pm_runtime_put_autosuspend(&priv->pci_dev->dev);
-- 
2.34.1

