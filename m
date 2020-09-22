Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41952273E00
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Sep 2020 11:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgIVJEl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 05:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgIVJEl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Sep 2020 05:04:41 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E6FC061755
        for <linux-i2c@vger.kernel.org>; Tue, 22 Sep 2020 02:04:40 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t10so16167508wrv.1
        for <linux-i2c@vger.kernel.org>; Tue, 22 Sep 2020 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:reply-to;
        bh=+4XpQvtWXPyTznpGAkELP/n7lzSxC14odmmMx4vJPug=;
        b=SVbjsAJ0lWAiA2xI9F50MwEk6p08jujYjGl79GAah+H/jsP1VaIl/Q/T8OqTw0HjLb
         BhzRPEdRcfsyyD/60fOMmfevb2aoDxE/9VDD3hrCIwJZnQFaukBsbL76JheYyN3lPjmG
         bcOnDKPhe3//S0PN+6NBHwemosnlunB525QZH4IS1LucVhKL5i5EZo6WLU4Y4aOlqyUJ
         fywP5HxHiLW8FUKr/0vY1Ijsvfaqamlj4mRVmiwhZjtfiOPrS6YKSs6qT/GKUclbrdPZ
         FgNwUm4hnZ52rGaNgRti0WwZopwrDnQFZRX27rLU41Ba1hset9/Qgdgo22ROuWuKQtp9
         vDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4XpQvtWXPyTznpGAkELP/n7lzSxC14odmmMx4vJPug=;
        b=RsId+1TC+Au9LMU4mgQmKIeGFJkHxLprnO90LrxEnEHTSlBZl/xDLKHQ7la4YPmQHR
         miq8mxC0Bm/bhO8XWPKhWBmBvxtJXjtpAtkE+G+Rz2RLjinr7YlE05lZeklVkuo/GLa/
         t/C2Os4akFsnrmRTRB81V7VGWRcyhkevstCZ5WsqgUg9fj4TkppaYYvK0yBq9eBIVl+r
         9Ul1RUc+aVRiJxrcaKF2poV/fOZKjvHUIQNe2ZTv4CNcHVU1k+ROOrI0vbOH+70WFC88
         Pa8umsWAY7WCQReMZYh8EFl+TE/KcE3n2ZTqtROFMvOjWZ6b99s9aaQ0r54G5Ut6jcJ+
         9Nfg==
X-Gm-Message-State: AOAM530sgnaDt/GGL9XdpuaGEDBv5jau4D5sR4IDhNH+GMSMlQuMf+54
        +ksRvSLOft5e7vNw8LLnDfZkQqxgcVR36Q==
X-Google-Smtp-Source: ABdhPJxf58HxG1Bf12cBrhsl/LUrq4fECwilAh8SGkmqljX2a0mJoLjdwuBSSmuJxGo/P+mTh/Q4Tg==
X-Received: by 2002:adf:f34f:: with SMTP id e15mr3959591wrp.387.1600765479573;
        Tue, 22 Sep 2020 02:04:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:287:860:29d1:d0a8:b1c3:1cbf])
        by smtp.gmail.com with ESMTPSA id n3sm3428741wmn.28.2020.09.22.02.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 02:04:39 -0700 (PDT)
From:   nico.vince@gmail.com
X-Google-Original-From: nicolas.vincent@vossloh.com
To:     jochen@scram.de
Cc:     linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        Nicolas VINCENT <nicolas.vincent@vossloh.com>
Subject: [PATCH] i2c: cpm: Fix i2c_ram structure
Date:   Tue, 22 Sep 2020 11:04:00 +0200
Message-Id: <20200922090400.6282-1-nicolas.vincent@vossloh.com>
X-Mailer: git-send-email 2.17.1
Reply-To: nicolas.vincent@vossloh.com
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Nicolas VINCENT <nicolas.vincent@vossloh.com>

the i2c_ram structure is missing the sdmatmp field mentionned in
datasheet for MPC8272 at paragraph 36.5. With this field missing, the
hardware would write past the allocated memory done through
cpm_muram_alloc for the i2c_ram structure and land in memory allocated
for the buffers descriptors corrupting the cbd_bufaddr field. Since this
field is only set during setup(), the first i2c transaction would work
and the following would send data read from an arbitrary memory
location.

Signed-off-by: Nicolas VINCENT <nicolas.vincent@vossloh.com>
---
 drivers/i2c/busses/i2c-cpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 1213e1932ccb..c5700addbf65 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -64,7 +64,8 @@ struct i2c_ram {
 	uint    txtmp;		/* Internal */
 	char    res1[4];	/* Reserved */
 	ushort  rpbase;		/* Relocation pointer */
-	char    res2[2];	/* Reserved */
+	char    res2[6];	/* Reserved */
+	uint    sdmatmp;	/* Internal */
 };
 
 #define I2COM_START	0x80
-- 
2.17.1

