Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913511FB718
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jun 2020 17:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731844AbgFPPnp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 11:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731840AbgFPPnp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Jun 2020 11:43:45 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA55DC061573;
        Tue, 16 Jun 2020 08:43:44 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a127so9675096pfa.12;
        Tue, 16 Jun 2020 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w/Ciov9t0cTutzO4p633r2W+NbASpriMULdDl2xvMIs=;
        b=ETBPxV/lHGvYByFysF/yMcA65AniTR6zZ9T49f5VlQX+ut3BMhgHsDD3Thg75xLWO/
         ghmsqvPijrBOnLbVTeJTqE5URxBseYBquqfwJ3YtwsPpLA7037fNK7CvF9EPYew4dSwZ
         PH2s8pDzIMkrmEj1GCF/v3P6EZUpYEcEbEaPh1Qqg5iKDK+nv4zuS5Hlmj4JAEQ7zFFD
         FwK/1WVrh9TeGJn/d44S3QAklh9xdDf6wcQJ6ngVWdiACQJBTtzsOcpeMIDXSg0+ZTw5
         n+qJTSTQohvZj0L2hd7/ftJLoZR7B3bSYU7SfcQkHis1uJsVrS9W1Detdr6RbQFJF+y5
         PiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=w/Ciov9t0cTutzO4p633r2W+NbASpriMULdDl2xvMIs=;
        b=TT3PZ+CMkbUNhP7Pz2Hb43XeSaQbYMuKyVO92t86kxYagtqrp11OsIWYnqKszdAUtb
         0TR7coLLzyxZdv1o4Cicixf/J+vBxKb0kfMZt2zSRtpe9XKk+TqRPBPrQUPL14ThZ8m/
         6pJUfXpP4+y/jUblQe35E1coTNsaTRxgrr6ZXqlQSnjP/1Q6pwoFpq/jwd9gB6iaS/HM
         BZMeXmPH9Y/gFeZaWgBlr71CRO5E/EM9+e1QnfdxtDhx0g6BjTaTWS8EelRw5Z/gJmiC
         QnAreucsJw4pnSwyfB0zpYLOTo+RmCPbbTxvHZlMFq8gHJkP9tBUVI4eKqctqscxOrge
         XRxA==
X-Gm-Message-State: AOAM5315x+SIuE+o/Puq+bztuyJ24ykPg4ks2iySEwQ0NPMf+MMsZg9G
        lvux9HdkorUm3F51NvimtRmvcy/Q
X-Google-Smtp-Source: ABdhPJxv0IaKwMnUpXyDzneEw/MpLUyX/yRRHSZQW5/Fq5lXhvaDPw8QVhhoEQjI8jabz0B6vg+7NA==
X-Received: by 2002:a63:3c16:: with SMTP id j22mr2611605pga.335.1592322224256;
        Tue, 16 Jun 2020 08:43:44 -0700 (PDT)
Received: from sultan-box.localdomain ([89.45.90.111])
        by smtp.gmail.com with ESMTPSA id c194sm17199948pfc.212.2020.06.16.08.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 08:43:43 -0700 (PDT)
From:   Sultan Alsawaf <sultan@kerneltoast.com>
X-Google-Original-From: Sultan Alsawaf
To:     jarkko.nikula@linux.intel.com
Cc:     aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com, jikos@kernel.org,
        kai.heng.feng@canonical.com, linux-i2c@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, sultan@kerneltoast.com,
        vicamo.yang@canonical.com, wsa@kernel.org
Subject: [PATCH v2] i2c: designware: Only check the first byte for SMBus block read length
Date:   Tue, 16 Jun 2020 08:43:28 -0700
Message-Id: <20200616154328.2866-1-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <9782f44e-4e01-4e5d-cc50-ab9e2219085c@linux.intel.com>
References: <9782f44e-4e01-4e5d-cc50-ab9e2219085c@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sultan Alsawaf <sultan@kerneltoast.com>

SMBus block reads can be broken because the read function will just skip
over bytes it doesn't like until reaching a byte that conforms to the
length restrictions for block reads. This is problematic when it isn't
known if the incoming payload is indeed a conforming block read.

According to the SMBus specification, block reads will only send the
payload length in the first byte, so we can fix this by only considering
the first byte in a sequence for block read length purposes.

Fixes: c3ae106050b9 ("i2c: designware: Implement support for SMBus block read and write")
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d6425ad6e6a3..d22271438869 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -391,14 +391,10 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
 	struct i2c_msg *msgs = dev->msgs;
 	u32 flags = msgs[dev->msg_read_idx].flags;
 
-	/*
-	 * Adjust the buffer length and mask the flag
-	 * after receiving the first byte.
-	 */
+	/* Adjust the buffer length */
 	len += (flags & I2C_CLIENT_PEC) ? 2 : 1;
 	dev->tx_buf_len = len - min_t(u8, len, dev->rx_outstanding);
 	msgs[dev->msg_read_idx].len = len;
-	msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
 
 	return len;
 }
@@ -430,10 +426,12 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			u32 flags = msgs[dev->msg_read_idx].flags;
 
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
-			/* Ensure length byte is a valid value */
-			if (flags & I2C_M_RECV_LEN &&
-			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
-				len = i2c_dw_recv_len(dev, tmp);
+			if (flags & I2C_M_RECV_LEN) {
+				/* Ensure length byte is a valid value */
+				if (tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0)
+					len = i2c_dw_recv_len(dev, tmp);
+				/* Mask the flag after receiving the first byte */
+				msgs[dev->msg_read_idx].flags &= ~I2C_M_RECV_LEN;
 			}
 			*buf++ = tmp;
 			dev->rx_outstanding--;
-- 
2.27.0

