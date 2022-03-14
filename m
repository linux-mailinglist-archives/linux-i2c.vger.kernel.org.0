Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253F14D7E14
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Mar 2022 10:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237787AbiCNJEy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Mar 2022 05:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235593AbiCNJEx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Mar 2022 05:04:53 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DEE340E9
        for <linux-i2c@vger.kernel.org>; Mon, 14 Mar 2022 02:03:44 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r6so22302485wrr.2
        for <linux-i2c@vger.kernel.org>; Mon, 14 Mar 2022 02:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJsuvDfEgbFAv2twfqdlbxVBvJIL07keRfhXHhiCGs0=;
        b=Oay8URlUWrpzor5sypkcQla6be9eR0wRHPoF0u7G615sFYRw+zoabq8t48IApxdx2M
         bOrpCT1TejItAS+HCyV9z9oMMrRKKCy3I+HfTQv7lnClu4t4UdC/Vbe2n7Qe9pQadvXj
         4clRy6CZZZZ6RYzUj1AbwuTGUL6DsZFb+5ZI0CGbonWLpi1j+5hSqTsOKfGkesztJYff
         Q0qgLgzQFTjQ1i/NifCt/D3dboRN39JDoezeuE0Ih54eSJwPjQH+JUQ8GiuPCobo57dx
         EuqGjHvOOfgbsCp2pkl7f6DfnXDM5554cdN7/solkr6P0fnid+I4wZueC+oVw8hHmV7c
         2+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJsuvDfEgbFAv2twfqdlbxVBvJIL07keRfhXHhiCGs0=;
        b=pz0XSM7wnfCMHV2fXRj54Jj3wMVfc3t4VQjyf+0KnnxIAyIbZln5PFernRiK3lEH3T
         dtB0H8MRQzreBcEqvQlqQ3h25hZOp72cmhT0U+tF399K3k4vtlrrA5/vxvM4C6XXrqpo
         inHsvMPJptWivYW7AH56qm6NXwcrXLzKT7zevSxn1BLIaRAiE0xrrk/3XgBhPTI3mmoi
         Y7R1Y7BUvENk1s3QdhFbu/9JoFH8egE114R2cSfGAyF0AFo62ye6J6xE5zqVYdmxDRuC
         eZI0YZETmqa2ZXL3w6+Bw5nlZMUbepzuMguubIVl3rmxMXhSgXVGZtG0Lz+xudcqc5cd
         xxjA==
X-Gm-Message-State: AOAM530HdaPL7sqAfDow756z8yP/L0a/NtklqS7wXmn2tFa2ytAcPeCi
        LVOBVDdv3AcIctRy0Q499a5FJQ==
X-Google-Smtp-Source: ABdhPJzqhyWIhdw/+agPQiJAJhQRIc6T5qspCJsIkjm3/RCegi/FEFJnXs4wWJPLuRflEZ4Igg9GRw==
X-Received: by 2002:adf:9f11:0:b0:1f0:728c:8fac with SMTP id l17-20020adf9f11000000b001f0728c8facmr16091191wrf.245.1647248623136;
        Mon, 14 Mar 2022 02:03:43 -0700 (PDT)
Received: from dabros-l.roam.corp.google.com ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id f13-20020adff8cd000000b001f03439743fsm12862775wrq.75.2022.03.14.02.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 02:03:42 -0700 (PDT)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     wsa@kernel.org, upstream@semihalf.com, jsd@semihalf.com
Subject: [PATCH v3 -next] i2c: designware: Remove code duplication
Date:   Mon, 14 Mar 2022 10:03:23 +0100
Message-Id: <20220314090323.272071-1-jsd@semihalf.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2->v3:
* Rebase on top of -next (v2 couldn't be applied cleanly)
v1->v2:
* Add kudos for Andy who suggested this change
* Get rid of extra function and move common code to psp_send_i2c_req
* Update commit message and commit title
  (was "i2c:designware: Add helper to remove redundancy")
 drivers/i2c/busses/i2c-designware-amdpsp.c | 35 ++++++++++------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 3844695e6bf3..9b37f2b95abc 100644
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
 	}
 
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
2.35.1.723.g4982287a31-goog

