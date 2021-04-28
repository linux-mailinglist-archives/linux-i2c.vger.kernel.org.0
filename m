Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23CB336D74B
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Apr 2021 14:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235096AbhD1M2w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Apr 2021 08:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234674AbhD1M2w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Apr 2021 08:28:52 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7EEC061574;
        Wed, 28 Apr 2021 05:28:06 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id z16so3671951pga.1;
        Wed, 28 Apr 2021 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=FCc5BZu5iRztXIUiSt2+3FhaGtDlfucfxXcqT01eExc=;
        b=s1ybdI7WecLYnVPXzIG8r2ufsshTyUG6UBIgf5iZ9rQliaO9QErsrYXIa/i4JeqNQF
         NTu9m1+eajP/7Ozit9TFqR+4pw8P2Ja2s3PWyb+f91pWvvAARcpkSa+HnfVT/C/YVfvh
         n1crgTzs3K/MEAN/PW2chwCa1hS4loARDIabSVxomFETp3p/GHQ6A7vKf+mCo2pRHjPk
         iP54a/IAcobV9YjClrPOCz7bYoxN5yAG9KY9zz4dLEAwBwpm4yB+RkP4st+duj5Hhhcm
         mIXNDw134CsfCAfh/20N4PNaO70pYYZV7Z7MtExQtmJLlziHJgb6W+q0lVqgn0RcmV85
         /Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=FCc5BZu5iRztXIUiSt2+3FhaGtDlfucfxXcqT01eExc=;
        b=AFGPKFtmgN0uyEycfjqp3+A+2w/4LFfmATcCpYLvtMcZjbWVfLYFfIs5STReNQVkD4
         bVmSQhW7apFRWMA3IJsdKtI4wvZDiljL4ywJvbO1l8CBAev1z7obOf7jXki/sKBqakZw
         hNz+BTt4ATvI6Tjb2uBIeC2/lEzYtHZiQaEcpE2vt3wfDJY7+yH0DYGOila1eF3rIxG4
         nhBUV+LTKiRcgX0Vsg7noTo2XbB08MJEAW05oKE9KPW96b8JFTX7fOqP3tYWSBO7ZD2B
         8jywk7cmCvut/BWrdHINOA5lfdt9i2i9h3sNMhC4062D2NmZ6XI56lQ/PrCxJebQZtGY
         LmvQ==
X-Gm-Message-State: AOAM533nCtsKzuLctaEcCf8P4NftDHyrBxXUOrvyCu2eMeGB5xyEOxFE
        XsxvasTX90FFPRn2GJbaGjc=
X-Google-Smtp-Source: ABdhPJzFwvuMniv8ai0SvEHoZynqHjurs4c0D6rOCMpJ54ptB8lK6dKuU/popa6Id15ZLDpegNO2ww==
X-Received: by 2002:a65:6085:: with SMTP id t5mr26835510pgu.201.1619612884496;
        Wed, 28 Apr 2021 05:28:04 -0700 (PDT)
Received: from localhost ([157.45.56.196])
        by smtp.gmail.com with ESMTPSA id l3sm4868719pju.44.2021.04.28.05.28.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 05:28:03 -0700 (PDT)
Date:   Wed, 28 Apr 2021 17:57:55 +0530
From:   Shubhankar Kuranagatti <shubhankarvk@gmail.com>
To:     wsa@kernel.org
Cc:     sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drivers: i2c: i2c-core-smbus.c: Fix alignment of comment
Message-ID: <20210428122755.2s56uotb225rezcw@kewl-virtual-machine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Multi line comment have been aligned starting with a *
The closing */ has been shifted to a new line.
Single space replaced with tab space
This is done to maintain code uniformity.

Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
---
 drivers/i2c/i2c-core-smbus.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index d2d32c0fd8c3..205750518c21 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -66,10 +66,11 @@ static inline void i2c_smbus_add_pec(struct i2c_msg *msg)
 }
 
 /* Return <0 on CRC error
-   If there was a write before this read (most cases) we need to take the
-   partial CRC from the write part into account.
-   Note that this function does modify the message (we need to decrease the
-   message length to hide the CRC byte from the caller). */
+ * If there was a write before this read (most cases) we need to take the
+ * partial CRC from the write part into account.
+ * Note that this function does modify the message (we need to decrease the
+ * message length to hide the CRC byte from the caller).
+ */
 static int i2c_smbus_check_pec(u8 cpec, struct i2c_msg *msg)
 {
 	u8 rpec = msg->buf[--msg->len];
@@ -113,7 +114,7 @@ EXPORT_SYMBOL(i2c_smbus_read_byte);
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value)
 {
 	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-	                      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
+			I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte);
 
@@ -387,7 +388,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 		if (read_write == I2C_SMBUS_READ) {
 			msg[1].flags |= I2C_M_RECV_LEN;
 			msg[1].len = 1; /* block length will be added by
-					   the underlying bus driver */
+					 * the underlying bus driver
+					 */
 			i2c_smbus_try_get_dmabuf(&msg[1], 0);
 		} else {
 			msg[0].len = data->block[0] + 2;
@@ -418,7 +420,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 
 		msg[1].flags |= I2C_M_RECV_LEN;
 		msg[1].len = 1; /* block length will be added by
-				   the underlying bus driver */
+				 * the underlying bus driver
+				 */
 		i2c_smbus_try_get_dmabuf(&msg[1], 0);
 		break;
 	case I2C_SMBUS_I2C_BLOCK_DATA:
-- 
2.17.1

