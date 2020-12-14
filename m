Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99792D925B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Dec 2020 06:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgLNFBz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Dec 2020 00:01:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgLNFBz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Dec 2020 00:01:55 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E6BC0613CF;
        Sun, 13 Dec 2020 21:01:15 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id hk16so5898545pjb.4;
        Sun, 13 Dec 2020 21:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kxAD3aRQUiMk1E45cepxnGfD2pHGp8PBeo2qCCoeP5M=;
        b=r0wFvoL8/TrisSKiImOruIIt6uMG7xAD3wqWM3wj+Rltx3gIkX3RzdXlR2bhHPTGB/
         Y9czYHrYbi3RETGZ+o5vFDxbg8I3icwL0CEdX0rnfJyyI5coayegzWNpMf8oZZJsHEoC
         oDtqYSyuNbspz3R2zGuI0ln5mARFUdvG89TAUOY7MMw4ssvqrCn/Y2p7k4+vbgIzzLzS
         j4VZ2208FPbUiA8MyoltHVhmJnvdyPCu7vfuNbERpK7T2pvU2fOBcR/xoqeZAQaQVLvf
         rZZJWfJ+tECp4Rj6T1YY2D3zNT86w7OZP6xKJJ4ORwc9yC1JbtUfeemCNk7lCSjgp0No
         T6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kxAD3aRQUiMk1E45cepxnGfD2pHGp8PBeo2qCCoeP5M=;
        b=Xu1GSIKRqxZwSplcQKDg8Gb54eVjArTExuMEvDfcwBquwUu1M3HYAVqQ6rKo6Vbpni
         tyjKCA7Pvo+GOPXtUXhEMySFaWQikuqtidUoq9jbgJ/PU+oD2aRKjRT/ZsWVy/HeMmLW
         I7KqpAM0Uam67H6R32sa8z1KTzuqAaIoIhmtxTrb6HytwU8Agg6VOIfpaH56wzVFclRS
         4Q3K/VQKkFx7yukrcvjZ+1aLJsKT3BV20Hv3Elj8KFobXbuOaZiRxBSDqJ4jISuFWN2i
         Lk3R/GtX0lsdUCmcKzmV5zUYNNkUpkCKmUWOnbu8ZQwbFNeUmFiJJIcgcOt289slN9o5
         byZw==
X-Gm-Message-State: AOAM532UHzDFUkkK5Ml6Py9Nah4CcpYKNnXIiMiWR7T5SjguQ22zWl7g
        B2KCiRlk0VSgYhrgTi/hPjLdoWwwM8dkQA==
X-Google-Smtp-Source: ABdhPJyMOll/mAgPzRYE4GReYqTEnfK/NyQOlhAnYOrehwjgDaomybup/hVfa5k7zqdRxYLhp73VOQ==
X-Received: by 2002:a17:902:6b48:b029:d8:e603:75fb with SMTP id g8-20020a1709026b48b02900d8e60375fbmr21350639plt.6.1607922074698;
        Sun, 13 Dec 2020 21:01:14 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id na6sm15650321pjb.12.2020.12.13.21.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 21:01:14 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Linhua Xu <linhua.xu@unisoc.com>
Subject: [PATCH v2] i2c: sprd: use a specific timeout to avoid system hang up issue
Date:   Mon, 14 Dec 2020 12:58:50 +0800
Message-Id: <20201214045850.1026293-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Chunyan Zhang <chunyan.zhang@unisoc.com>

If the i2c device SCL bus being pulled up due to some exception before
message transfer done, the system cannot receive the completing interrupt
signal any more, it would not exit waiting loop until MAX_SCHEDULE_TIMEOUT
jiffies eclipse, that would make the system seemed hang up. To avoid that
happen, this patch adds a specific timeout for message transfer.

Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
Signed-off-by: Linhua Xu <linhua.xu@unisoc.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
* Changes since v1:
- Addressed Wolfram's comments for code;
- Changed to use Signed-off-by instead of Original-by;
- Fixed a compile error.
---
 drivers/i2c/busses/i2c-sprd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 19cda6742423..b9f58a4b2281 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -72,6 +72,8 @@
 
 /* timeout (ms) for pm runtime autosuspend */
 #define SPRD_I2C_PM_TIMEOUT	1000
+/* timeout (ms) for transfer message */
+#define I2C_XFER_TIMEOUT	1000
 
 /* SPRD i2c data structure */
 struct sprd_i2c {
@@ -244,6 +246,7 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 			       struct i2c_msg *msg, bool is_last_msg)
 {
 	struct sprd_i2c *i2c_dev = i2c_adap->algo_data;
+	unsigned long time_left;
 
 	i2c_dev->msg = msg;
 	i2c_dev->buf = msg->buf;
@@ -273,7 +276,10 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 
 	sprd_i2c_opt_start(i2c_dev);
 
-	wait_for_completion(&i2c_dev->complete);
+	time_left = wait_for_completion_timeout(&i2c_dev->complete,
+				msecs_to_jiffies(I2C_XFER_TIMEOUT));
+	if (!time_left)
+		return -EIO;
 
 	return i2c_dev->err;
 }
-- 
2.25.1

