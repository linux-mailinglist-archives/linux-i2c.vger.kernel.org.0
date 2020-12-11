Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C672D73DE
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Dec 2020 11:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgLKKX7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Dec 2020 05:23:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgLKKXm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Dec 2020 05:23:42 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9929C0613D3;
        Fri, 11 Dec 2020 02:23:01 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id t3so6796072pgi.11;
        Fri, 11 Dec 2020 02:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n11CZEHDbroVAtkHzM/7M/ETKh3HOtw2JsXDTI0ERgc=;
        b=JaSA57u9MlRUxTJFqzX5CVkhX6FchPoA6l+e4n7cU9osmJSFpzbNpR3w4Uo9JI9BmB
         YiEBR9RxzaQwyuW9PZ2jXc9PJBAhmSpUKmQVxs4+TV4xBOp/pCmJObY9pQ3+Ub6byo5L
         VLWKs5EnHjhF+BNU72uCfgEGuFUZv7i11JDYqcmIAlU5GXIDSNWoVRKfetLkCW6ik/yx
         j2FtUA2MmwlRZzkpmF+bl5bTuAUVn5CEDpBtDCtBTY0qW/LcE8UYYXur0Qf6N+r3xaxY
         rjDy2a0yVFfL6xzOpod3YqG3EY2tDhBWbFEC/5xpcYrf5CYdCSJSPQW7AOkafc7xrCDY
         MT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n11CZEHDbroVAtkHzM/7M/ETKh3HOtw2JsXDTI0ERgc=;
        b=sb98jTMkjn2f4WUmy8UXYWAzZSchEU0jp1IGmW/TSNY6n2m0pPiCPYbgoqDF7lkaNC
         ej+sgXf73C1VQMzBdXVLN1ZMyxnSu3My1QUTQCeO0h3+OnTn+HwI6yeEu53V9hP5XSOG
         HJkKWP+NOJE/yAV9Lyo7SXf4cswYm+HR5keeSevP/Sxam5dHpj6hBJEDDuq0XxFPrRGQ
         tdc1uwEl+DQur0UP5dhPzW7GPR1ObO10+1um4FFQ9Ruxwuc0MxtWDag9Pwb5jWrfQFTw
         I/jJe2vFEPlFDkrVsiWt3JwZxKd2sWacNR2Gi5nVopqTvUaMBh4G+xI/58UNVGB5CRZe
         hC8w==
X-Gm-Message-State: AOAM532W3duxzVV/WcFNv4Z7scdvgOeOoCi7lwhhO9lG/dHhhwrrCvRo
        t0E0iSkhbX9GYKYLInpIr5s=
X-Google-Smtp-Source: ABdhPJzIYpYavritO9FWIDO0Xr4ylEydj1seGnoP2/zyQPK+5RNbQwcjDIEjTrzizaY/9WNaxQqN+w==
X-Received: by 2002:a65:688a:: with SMTP id e10mr11052563pgt.347.1607682181490;
        Fri, 11 Dec 2020 02:23:01 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id 72sm10031318pfw.177.2020.12.11.02.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 02:23:00 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Linhua Xu <linhua.xu@unisoc.com>
Subject: [PATCH] i2c: sprd: use a specific timeout to avoid system hang up issue
Date:   Fri, 11 Dec 2020 18:22:48 +0800
Message-Id: <20201211102248.1018374-1-zhang.lyra@gmail.com>
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
Original-by: Linhua Xu <linhua.xu@unisoc.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
---
 drivers/i2c/busses/i2c-sprd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 19cda6742423..dba3d526444e 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -72,6 +72,8 @@
 
 /* timeout (ms) for pm runtime autosuspend */
 #define SPRD_I2C_PM_TIMEOUT	1000
+/* timeout (ms) for transfer message */
+#define IC2_XFER_TIMEOUT	1000
 
 /* SPRD i2c data structure */
 struct sprd_i2c {
@@ -244,6 +246,7 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 			       struct i2c_msg *msg, bool is_last_msg)
 {
 	struct sprd_i2c *i2c_dev = i2c_adap->algo_data;
+	unsigned long timeout = msecs_to_jiffies(I2C_XFER_TIMEOUT);
 
 	i2c_dev->msg = msg;
 	i2c_dev->buf = msg->buf;
@@ -273,7 +276,9 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2c_adap,
 
 	sprd_i2c_opt_start(i2c_dev);
 
-	wait_for_completion(&i2c_dev->complete);
+	timeout = wait_for_completion_timeout(&i2c_dev->complete, timeout);
+	if (!timeout)
+		return -EIO;
 
 	return i2c_dev->err;
 }
-- 
2.25.1

