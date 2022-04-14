Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74ADB50094F
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Apr 2022 11:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbiDNJJ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Apr 2022 05:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241260AbiDNJJ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Apr 2022 05:09:57 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358046E353;
        Thu, 14 Apr 2022 02:07:33 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id mp16-20020a17090b191000b001cb5efbcab6so8702029pjb.4;
        Thu, 14 Apr 2022 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eJF41dR8CM5e2ZZW3grRLN20zsR7Q9ZeigZpuEaXzjc=;
        b=PubBcYCaKM0TfK3rk/m2r16WsUX8fa9v1AhUKvdN6Sx81eAbuEmzphFhmpikmLvSGQ
         P55ZWsJ20a5BdLwO3FPv0wSO6uE1LM3zYzC+spSetN5hv8t1rKcnEyXC4WYdLnBjXkSc
         WMgvWXJd+YtwCtuXcm/megCYH2TMcv4Y4kQU5DBafqSo2J8MVHvPOYQcevC8gfQqBVWN
         ELiRpmcpdkmAsRCOASft5VvyaQ5duU8WRpV/vmvCelJ3HEebYTGuhv7pIu/9gutUvpKI
         z23PR96nsLXLjgtQ0LUftCTRs3ZmdLCGGjdYvhgNxkSM9d9SpLTy3gl2v4+x2KqvpvEr
         y93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eJF41dR8CM5e2ZZW3grRLN20zsR7Q9ZeigZpuEaXzjc=;
        b=tkIZG9WAYJhxIPFuAR1wPbdrG2R9xcKaZaidVYe/TM06lB4S8QB0a9lHQ/VuoXd2Fa
         LLQeUCyiSSygryesbQYhl6k2Giwlvq78yNL4PgX63kA+MiJjIkbzBBKqxiUjCS3V2xSd
         6oN5ASsa3fOpXGC8eo4TPwrgboo7UV7oGUhuLivb74lrwdsiN0oteIDs/wEAL6eUPkXW
         hZJeQwa/6f9j2UCjfqqp5KI6qwjbncA1pqvzQQbBdhbFKnOBZ1bvFG5G6xU/r7612PKG
         7MaHU2wosUSZaWBJUFFTT/LKHPP4uyUuHpDJ0cBFj1sCBtFtAWzvjd7twX2f/fpuQMLZ
         c18w==
X-Gm-Message-State: AOAM531HvGC+Ce3C4Sj29XVWo8UEQ8I4QgpxkDvnx5Zn6cB+tza3QQIP
        H6Ec15gfjlt4xF8FYqpV/FVxmjickcE=
X-Google-Smtp-Source: ABdhPJwUezP4/bTL7XIUAOgjBJ7RfzEbgDwelq3f6M1v5m7V18kS9wnJoX334HNzeNQ0xaUxsCd9ng==
X-Received: by 2002:a17:903:2045:b0:158:c130:31b7 with SMTP id q5-20020a170903204500b00158c13031b7mr560517pla.154.1649927252796;
        Thu, 14 Apr 2022 02:07:32 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id m21-20020a17090a7f9500b001c97c6bcaf4sm5368836pjl.39.2022.04.14.02.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 02:07:32 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To:     nsekhar@ti.com
Cc:     brgl@bgdev.pl, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] i2c: i2c-davinci: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
Date:   Thu, 14 Apr 2022 09:07:27 +0000
Message-Id: <20220414090727.2542000-1-chi.minghao@zte.com.cn>
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

Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle. This change is just to simplify the code, no
actual functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/i2c/busses/i2c-davinci.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index e9d07323c604..9e09db31a937 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -539,10 +539,9 @@ i2c_davinci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
 
-	ret = pm_runtime_get_sync(dev->dev);
+	ret = pm_runtime_resume_and_get(dev->dev);
 	if (ret < 0) {
 		dev_err(dev->dev, "Failed to runtime_get device: %d\n", ret);
-		pm_runtime_put_noidle(dev->dev);
 		return ret;
 	}
 
@@ -821,10 +820,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev->dev);
 
-	r = pm_runtime_get_sync(dev->dev);
+	r = pm_runtime_resume_and_get(dev->dev);
 	if (r < 0) {
 		dev_err(dev->dev, "failed to runtime_get device: %d\n", r);
-		pm_runtime_put_noidle(dev->dev);
 		return r;
 	}
 
@@ -898,11 +896,9 @@ static int davinci_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&dev->adapter);
 
-	ret = pm_runtime_get_sync(&pdev->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	davinci_i2c_write_reg(dev, DAVINCI_I2C_MDR_REG, 0);
 
-- 
2.25.1


