Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAFC4504F44
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Apr 2022 13:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiDRLK6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Apr 2022 07:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiDRLK4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Apr 2022 07:10:56 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 479EB1A070;
        Mon, 18 Apr 2022 04:08:18 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id bb21so865216qtb.3;
        Mon, 18 Apr 2022 04:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4tdq9jroPOUGvAM0f6joaa1S+NnnIuEuwiI5ZeawYNY=;
        b=nEgmj51yeSp/gGYWuzhNlADPnABnZJXoKAF6oS5fLL6Q7WyHLCf3GJJl+PRf/GxHlk
         h71VvqVgo3ltgufH8bpxfc9wXUIfLUpt7CJEjmvQkh0ahzDHE6Iwo/MiBEqjLpgj0pkU
         M4FGs7cJNW/tgAGH/jg7zZiW44YsJMS0Dzci8BIubF/NecUUzDhv/ZEXfGCL3eQLoskq
         Co0UOcdZPLa5pYfVUdEyXegsc6aYWo7Wm5Gd2LZhT5xSBLr+fNrDKq8MzTarZbAtka8l
         NP0JqSuKkT4CCx7/sj6hEjsgAJWWyT/ZLhinIRNw6U02dPLgUC5KZ8JD8XzUE9YbWw/P
         E5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4tdq9jroPOUGvAM0f6joaa1S+NnnIuEuwiI5ZeawYNY=;
        b=gKTufSIe6n1YL/CQq3ajyHrSKsauGTBo4fGws0ndHV1xM8hOyXSzZagKZi8km4aKfA
         Sb8za2x2M4mNTUJsi85sFgq8Qj6ffpyyEbC+QfBwCiOGCONiDxhtykUQAQur7TwXAlGd
         LYJI0yK6WWS9bTtKDmhtvwuZVQqGh2pqXGuVv33v8hGBlUHPvloiNgdsSNvakdR5VKoQ
         B171nChXCEQnupV1iWkx4j7QmozB5SR5Bt2vgxgWXcWlAS2Lbg/J5T5f8GijW3CwitCP
         CxwtVOEnSRF1yAE6uwr0k4L8I2AdSmhq6l0anAQ6w89TIVKWH4yJusuhEcRfGOwnjWEC
         DMrw==
X-Gm-Message-State: AOAM531EZb+HEGzETjlK6PGF29LA++FBgAuBGpnlDRE8YtZ0B4yN7fDE
        UZ7+e4A3MjuKawhi6bzdyJk=
X-Google-Smtp-Source: ABdhPJwB/RG4xddzAg3xzpgVkMBxWQSFr1LPn0T5ZmG+MxMtUsepspdSWnl3eUhQY0TVJ5FEEdjHRA==
X-Received: by 2002:ac8:5894:0:b0:2e1:c997:a61e with SMTP id t20-20020ac85894000000b002e1c997a61emr6506536qta.388.1650280097499;
        Mon, 18 Apr 2022 04:08:17 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id v65-20020a376144000000b0069e7842f2f5sm3196193qkb.52.2022.04.18.04.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 04:08:17 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To:     brgl@bgdev.pl
Cc:     arnd@arndb.de, gregkh@linuxfoundation.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] misc/eeprom: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
Date:   Mon, 18 Apr 2022 11:08:11 +0000
Message-Id: <20220418110811.2559529-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get is more appropriate
for simplifing code

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/misc/eeprom/at24.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 633e1cf08d6e..0a5bdd629427 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -431,11 +431,9 @@ static int at24_read(void *priv, unsigned int off, void *val, size_t count)
 	if (off + count > at24->byte_len)
 		return -EINVAL;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	/*
 	 * Read data from chip, protecting against concurrent updates
@@ -478,11 +476,9 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 	if (off + count > at24->byte_len)
 		return -EINVAL;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	/*
 	 * Write data to chip, protecting against concurrent updates
-- 
2.25.1


