Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70773588739
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Aug 2022 08:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbiHCGQc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 02:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234504AbiHCGQb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 02:16:31 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0818B2F67B;
        Tue,  2 Aug 2022 23:16:28 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id w14so2436516plp.9;
        Tue, 02 Aug 2022 23:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=qc8sogB9KzRqq2waISxMZ3m9FIay9sPm79O98vMFya8=;
        b=jT/yVNtIwhgoQ6s0mEx8Qr5eRNLD08KqKNkHmVI3Ox5lT9YopJpKyZkjX3E/hK/h3n
         0SOZnO9Fc8i1ngjlmAfgOWGwKXb/64UziwNDdgZUs7k6d6KSy0SXnEL6ax6GKA17/zMW
         I40eZC4bNSLXTdqWmaqDxZ3uwJPAlUkqMy2c4r9zXHPJZP7rgUc0N4DAlUtDXyKW2Ez1
         IywDa2GK0F6bOd1veJpkhn7YFjsLIxt4TAATFb8TYuNksx6rTCI9ltAyjJa7+fWL4hXE
         FZ3jvksML/g2M/L53qR8RFIjamUp4kb4qo2sIoEAfJu6ZPusi9o2DWYKfbfkbba1MmIE
         6UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=qc8sogB9KzRqq2waISxMZ3m9FIay9sPm79O98vMFya8=;
        b=sgxu2i4RVgaMb564I5rXQKQFnaK2iF+lVquhZgWhaHr6Dfscwogu3toj9YqvUjuhBh
         COGJLsOQsNcMs/m+5hFHWhzA+KaOm+FNnjZ36QcuPVZ5fDD5lRvGCtxzFoQ3jpQTh8UR
         GFtYXm5Zi+d+Xrt6XXhLJ64iG9cEjMMaWpr9842LnLC4AOvngyEJFGsuCQd1Ko7ti8Yx
         5NMmZ7glSFlavxiKe3EhdE8/H6S8sszAkJV89CfIAzrPA+muuuxo/YsnVNMb0KlrvOg2
         NBIZ/tB15AjvbbKEWz4UqzAViz9wxxKZz+0WiauvTzphPxbxcnuIHMpTMGNcV229eHQd
         QdSQ==
X-Gm-Message-State: ACgBeo1xX2OI7lXS7fMmn/ctK240ZcxfmvaPfTZHzSUlShllZoajqvbx
        5iK99sL7kzkIZ4JQLx0xEM3lakZSfKQ=
X-Google-Smtp-Source: AA6agR6TslFx4ikepsI8NyOo0bZOo0Fk6zhZISYLr1y0WgmZOUBVfgttf3wEPUg5nMrPVOz516DpOw==
X-Received: by 2002:a17:90b:1c8e:b0:1f1:b5a9:20c3 with SMTP id oo14-20020a17090b1c8e00b001f1b5a920c3mr3384857pjb.47.1659507387313;
        Tue, 02 Aug 2022 23:16:27 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id x11-20020a170902a38b00b0015e9f45c1f4sm851030pla.186.2022.08.02.23.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 23:16:27 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] eeprom: at24:using the pm_runtime_resume_and_get to  simplify the code
Date:   Wed,  3 Aug 2022 06:16:18 +0000
Message-Id: <20220803061618.1650538-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: ye xingchen <ye.xingchen@zte.com.cn>

Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync
and pm_runtime_put_noidle.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/misc/eeprom/at24.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 633e1cf08d6e..f354b79619d8 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -431,9 +431,8 @@ static int at24_read(void *priv, unsigned int off, void *val, size_t count)
 	if (off + count > at24->byte_len)
 		return -EINVAL;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
 		return ret;
 	}
 
@@ -478,9 +477,8 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 	if (off + count > at24->byte_len)
 		return -EINVAL;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
 		return ret;
 	}
 
-- 
2.25.1
