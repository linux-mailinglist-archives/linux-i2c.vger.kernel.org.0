Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C4F4D4BF2
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Mar 2022 16:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239113AbiCJObq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 09:31:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243990AbiCJO2J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 09:28:09 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0B5B12ED
        for <linux-i2c@vger.kernel.org>; Thu, 10 Mar 2022 06:23:06 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bu29so9819147lfb.0
        for <linux-i2c@vger.kernel.org>; Thu, 10 Mar 2022 06:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+mgizJNjOYF4lch4iTAKF7piDFY6Ykg49t6OGyo4hho=;
        b=H97fj5Xc9OYd/KWfmpTAh3vt0Gmh7v3twAo/7Y+iRLHI1rglIJs8yAG/HuTkBnnUE5
         7LlMAKLiPw+FiRiIMh73MYSiLInF5I3Ij/jGq45LOIuY0gZqSNgdnAAVgrB8sVF2LscA
         ywS5RXFZWN0s7pCP/xcixRch5bTE6FUvJwoQmV8IAUioaq/ao9sq+yhG43AOjiCC3idW
         lFHW40TW4ZrC8rpggm9YpSHwVy08NxMpWgHvh4J3LqPt26aqgWh47f5Hds7ZA/53a6ew
         lBD4thx0TyjxK1TJZmhYXCb2OoMSdgy6WCqrG1lttLVVtev+MkS2Ms/f8rR1Jf/3MRJ4
         fL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+mgizJNjOYF4lch4iTAKF7piDFY6Ykg49t6OGyo4hho=;
        b=A+71X+wVk5cN8PCj29OwVMUFMzzYCWuiOAofvwCpD2dHs6r5BEZpkKjdk8V90mwPf1
         VaC5c+Lg4b14fBcRtHkABxw1iudgU8PnLYmq2l54xH5a/PoVKIuvmpHD0UvNnHWjn+j/
         y59KbvYo/ycbS3o0yLyvE5q3JaK1W4YNO2OMel1Ri/jYbZBzZPJRinGUQgtVsiI+Qewn
         ZqKOZD6fqlU4/RQVtqg0b5WkuJXS9cAOtaZdJJxpstwRE0tpgfGbuOnngoJcajvN2Hhh
         4TuaCJHtr+FqmVzkfZZB5EV9rcrHo+/NgpIr5OsBAH6/ivk5oDAVdTTDZyci+4fOIrGJ
         XlFA==
X-Gm-Message-State: AOAM530KsQRnK+adHbYXD0QSGqOSJbIsdJCL4gwGnsmxlWZLWT9C1hwZ
        8fc4wAREjiBPkr2LhQZeaFSjBnxL8KDw9A==
X-Google-Smtp-Source: ABdhPJy8W5W97zwjQGUdYTRF8dxaIBmJza5DDIfiUsHku/UJSAHqRnHnDwpVLS/0u+lMaWugKl+UqA==
X-Received: by 2002:ac2:4342:0:b0:445:b98c:edd3 with SMTP id o2-20020ac24342000000b00445b98cedd3mr3190060lfl.348.1646922179267;
        Thu, 10 Mar 2022 06:22:59 -0800 (PST)
Received: from dabros-l.roam.corp.google.com ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id cf12-20020a056512280c00b004485b8f37b7sm676993lfb.277.2022.03.10.06.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 06:22:58 -0800 (PST)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     wsa@kernel.org, upstream@semihalf.com, jsd@semihalf.com
Subject: [PATCH -next] i2c: designware: Add helper to remove redundancy
Date:   Thu, 10 Mar 2022 15:22:36 +0100
Message-Id: <20220310142236.192811-1-jsd@semihalf.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
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

Simplify code by adding an extra static function for sending I2C
requests and verifying results.

Signed-off-by: Jan Dabros <jsd@semihalf.com>
---
 drivers/i2c/busses/i2c-designware-amdpsp.c | 44 ++++++++++++----------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index c64e459afb5c..cc758792f150 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -229,6 +229,26 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 	return ret;
 }
 
+static int psp_send_i2c_req_check_err(enum psp_i2c_req_type request)
+{
+	int status;
+
+	status = psp_send_i2c_req(request);
+	if (status) {
+		if (status == -ETIMEDOUT)
+			dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
+				(request == PSP_I2C_REQ_ACQUIRE) ?
+				"release" : "acquire");
+		else
+			dev_err(psp_i2c_dev, "PSP communication error\n");
+
+		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
+		psp_i2c_mbox_fail = true;
+	}
+
+	return status;
+}
+
 static int psp_acquire_i2c_bus(void)
 {
 	int status;
@@ -248,17 +268,9 @@ static int psp_acquire_i2c_bus(void)
 		goto cleanup;
 	};
 
-	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
-	if (status) {
-		if (status == -ETIMEDOUT)
-			dev_err(psp_i2c_dev, "Timed out waiting for PSP to release I2C bus\n");
-		else
-			dev_err(psp_i2c_dev, "PSP communication error\n");
-
-		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
-		psp_i2c_mbox_fail = true;
+	status = psp_send_i2c_req_check_err(PSP_I2C_REQ_ACQUIRE);
+	if (status)
 		goto cleanup;
-	}
 
 	psp_i2c_sem_acquired = jiffies;
 	psp_i2c_access_count++;
@@ -293,17 +305,9 @@ static void psp_release_i2c_bus(void)
 		goto cleanup;
 
 	/* Send a release command to PSP */
-	status = psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
-	if (status) {
-		if (status == -ETIMEDOUT)
-			dev_err(psp_i2c_dev, "Timed out waiting for PSP to acquire I2C bus\n");
-		else
-			dev_err(psp_i2c_dev, "PSP communication error\n");
-
-		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
-		psp_i2c_mbox_fail = true;
+	status = psp_send_i2c_req_check_err(PSP_I2C_REQ_RELEASE);
+	if (status)
 		goto cleanup;
-	}
 
 	dev_dbg(psp_i2c_dev, "PSP semaphore held for %ums\n",
 		jiffies_to_msecs(jiffies - psp_i2c_sem_acquired));
-- 
2.35.1.616.g0bdcbb4464-goog

