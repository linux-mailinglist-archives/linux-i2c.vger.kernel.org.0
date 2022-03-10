Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9CD64D5447
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Mar 2022 23:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344244AbiCJWLK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 17:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344275AbiCJWLI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 17:11:08 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31495DA873
        for <linux-i2c@vger.kernel.org>; Thu, 10 Mar 2022 14:10:06 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bt26so11916839lfb.3
        for <linux-i2c@vger.kernel.org>; Thu, 10 Mar 2022 14:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tK2DffIcTcbFc6YisuU/CAQwL4qcT6NxH18APJQxTOM=;
        b=6cuUYOWDZHQoQ6qpPp6RnzAvQBz6h92+KoZ33nIdPkqIvU2W3u6mLlvhvmWle6XFED
         kXAiC1L8EQiqKTXQ3Ho94WG9scxPyfupoBAWL+YUJnuL5tL7P9JphrpZafP4O3YsUath
         Vrc82QS6C8qTWn5v5SZgYPp8lGlK7QrNDqQMYk7JmsFeYzrqeEEK/09KNEGkr+Ezexw4
         Bony9rQnL03NYGjciFb/d4QY+mkq7MMTd9tWI3LTG+m42hLELjfivY3KLgbY5I0vbsUb
         qhHaxJNmgi4XUJermkRRSX4mhnScQW9lP6h/B1T93XlTWcHgRejZ0L5bRuA8K6Z3/m2a
         xSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tK2DffIcTcbFc6YisuU/CAQwL4qcT6NxH18APJQxTOM=;
        b=uM0Ar4ZeU7mjLNn0oO3vfH1QOyxkEpwrO9PYOFHDX3CyvcZ+4Ztt/x8mTGTGg/cB+4
         4zuSsSaRSYQsEUCRC8FlByw4ccGX9OEkaptgD4L5E5GVVSHs6+jPNNeouwFRRrqLk7xg
         2yYpm+8Lvbju9Jxhf9z+UC+BtnBnWGdw38Dfvfh6Zxz6XNBEbe3NtYN90qb4ZCIGJ5lF
         I6wb8OkpsymCDQKLBGoYIjyKzI/lAAmbiB/XZY83imWRIE8QQipUXhjngEkzBYRKCIUR
         QGFtieQHPPFhL+GO1MpUECj63ro5cwGM/0aioYRVzHXXb4S21X4Rg3ZKG+kp/9MQ044p
         Jn6w==
X-Gm-Message-State: AOAM533w6yUMOp+HAAWndQgwcIo4nRdd7dA0aYAcHOYaWQREdHdWk81m
        b9a1tp3zFAH6pSy8Qdbj6At1Kw==
X-Google-Smtp-Source: ABdhPJz2GDfFMCRDAfn/kgAPWUdUq7NUrA3/jXOsH3Chmz4MUG5XOWiU1VjW7Up0DEynwppO5C4wjw==
X-Received: by 2002:a05:6512:c03:b0:447:7912:7e6b with SMTP id z3-20020a0565120c0300b0044779127e6bmr4237365lfu.508.1646950204381;
        Thu, 10 Mar 2022 14:10:04 -0800 (PST)
Received: from dabros-l.roam.corp.google.com ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id c23-20020a196557000000b004481befdc8bsm1201593lfj.161.2022.03.10.14.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 14:09:55 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     wsa@kernel.org, upstream@semihalf.com, jsd@semihalf.com
Subject: [PATCH v2 -next] i2c: designware: Remove code duplication
Date:   Thu, 10 Mar 2022 23:09:32 +0100
Message-Id: <20220310220932.140973-1-jsd@semihalf.com>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Simplify code by moving common part to one function.

Signed-off-by: Jan Dabros <jsd@semihalf.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v1->v2:
* Add kudos for Andy who suggested this change
* Get rid of extra function and move common code to psp_send_i2c_req
* Update commit message and commit title
  (was "i2c:designware: Add helper to remove redundancy")
 drivers/i2c/busses/i2c-designware-amdpsp.c | 35 ++++++++++------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index c64e459afb5c..5c32255c3239 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -214,17 +214,28 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 				PSP_I2C_REQ_RETRY_DELAY_US,
 				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
 				0, req);
-	if (ret)
+	if (ret) {
+		dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
+			(i2c_req_type == PSP_I2C_REQ_ACQUIRE) ?
+			"release" : "acquire");
 		goto cleanup;
+	}
 
 	ret = status;
-	if (ret)
+	if (ret) {
+		dev_err(psp_i2c_dev, "PSP communication error\n");
 		goto cleanup;
+	}
 
 	dev_dbg(psp_i2c_dev, "Request accepted by PSP after %ums\n",
 		jiffies_to_msecs(jiffies - start));
 
 cleanup:
+	if (ret) {
+		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
+		psp_i2c_mbox_fail = true;
+	}
+
 	kfree(req);
 	return ret;
 }
@@ -249,16 +260,8 @@ static int psp_acquire_i2c_bus(void)
 	};
 
 	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
-	if (status) {
-		if (status == -ETIMEDOUT)
-			dev_err(psp_i2c_dev, "Timed out waiting for PSP to release I2C bus\n");
-		else
-			dev_err(psp_i2c_dev, "PSP communication error\n");
-
-		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
-		psp_i2c_mbox_fail = true;
+	if (status)
 		goto cleanup;
-	}
 
 	psp_i2c_sem_acquired = jiffies;
 	psp_i2c_access_count++;
@@ -294,16 +297,8 @@ static void psp_release_i2c_bus(void)
 
 	/* Send a release command to PSP */
 	status = psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
-	if (status) {
-		if (status == -ETIMEDOUT)
-			dev_err(psp_i2c_dev, "Timed out waiting for PSP to acquire I2C bus\n");
-		else
-			dev_err(psp_i2c_dev, "PSP communication error\n");
-
-		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
-		psp_i2c_mbox_fail = true;
+	if (status)
 		goto cleanup;
-	}
 
 	dev_dbg(psp_i2c_dev, "PSP semaphore held for %ums\n",
 		jiffies_to_msecs(jiffies - psp_i2c_sem_acquired));
-- 
2.31.0

