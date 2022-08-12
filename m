Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0070C590C59
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Aug 2022 09:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237243AbiHLHQE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Aug 2022 03:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235031AbiHLHQB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Aug 2022 03:16:01 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E2E1D314
        for <linux-i2c@vger.kernel.org>; Fri, 12 Aug 2022 00:15:59 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id u3so190088lfk.8
        for <linux-i2c@vger.kernel.org>; Fri, 12 Aug 2022 00:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Ibyyw8eyBkdWgpPHklA51urSo/P4KWDrlMWV8p61Auo=;
        b=np5q3pIwqTobXVFF0oUoVSqBBS1dsAB6312LzrhJiWQA9FoHNz8K76CUd4a0Rl/Wvs
         +0MDO8gWZxLCZgdw61LT2+rmYqi+JiAbiFVU8LYPQwJ4Yu795ARPgu40X7ccwJoO+dL6
         MvqgsZp7Ro6zDS+QCw/UgRUm9fkk9JPXt5TOzWnpqehMVNdVlBxXbGbqJRgETM19ehBT
         zXFEUBtthU6Wps/TX14JYkHlmzSvlPEg/ooq174WvMgPMQNz01ZsfIRa/zoXfriFkl5z
         SASolv5yVtvrlFwJyYL7ydHJ/naRfImKr3nUr8E3k7Z5VIt1DZyY/dXjACfnRiOej1/l
         h6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Ibyyw8eyBkdWgpPHklA51urSo/P4KWDrlMWV8p61Auo=;
        b=pBAn4ZeSKbe8fOgTv2m2V85hBnO5Hj2DQ2Gj48qLew1DoyZ+eC1e12QSnacnE3SabB
         G5pmEl/SYM0pLxe5VdqLpx0eE+vgX1vt2QEXBO4SDntl/F5sSSdpe2cixA7HDz4sXGba
         8wl547FTo1qj0ofgqaOqKJYL6o1hc+a/Ax8MLBrmiSymDuKB/p9sVCANd1gApcXNfjxd
         WWBFZ7dKis/kvqL63S/+3/9+ypeBJVjtk83kmgENp2aZPZrJX3T/mAPctM3yGq2VhcPw
         LtnKXDKH9UtghUW0oezUsvHaYn3xHWgzwNA47VeGC9Ssdq3tepNL3v7/N6WQmWFGncy0
         LBYg==
X-Gm-Message-State: ACgBeo0DCpRQsAfGIYF5QN2xS7/DDKHAppTQgl9hJxsrHBWqZGjCTE9a
        gkKx+zgQkNmGISeafvnJVBZV5A==
X-Google-Smtp-Source: AA6agR4+8bVn1EQrVmPpWj2TrlLC5ReowaoSXciZ23clKO04B7aRWS0X2mRe6WqLtDv0Ie2pA4VTPQ==
X-Received: by 2002:ac2:59c2:0:b0:48b:1827:dd43 with SMTP id x2-20020ac259c2000000b0048b1827dd43mr930481lfn.132.1660288558149;
        Fri, 12 Aug 2022 00:15:58 -0700 (PDT)
Received: from dabros-l.room.semihalf.net ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id u21-20020a05651206d500b0048b0a5293ccsm115624lff.78.2022.08.12.00.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 00:15:57 -0700 (PDT)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     mika.westerberg@linux.intel.com, rrangel@chromium.org,
        mw@semihalf.com, upstream@semihalf.com, jsd@semihalf.com
Subject: [PATCH v2] i2c: designware: Introduce semaphore reservation timer to AMDPSP driver
Date:   Fri, 12 Aug 2022 09:15:26 +0200
Message-Id: <20220812071526.414285-1-jsd@semihalf.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In order to optimize performance, limit amount of back and forth
transactions between x86 and PSP. This is done by introduction of
semaphore reservation period - that is window in which x86 isn't
releasing the bus immediately after each I2C transaction.

In order to protect PSP from being starved while waiting for
arbitration, after a programmed time bus is automatically released by a
deferred function.

Signed-off-by: Jan Dabros <jsd@semihalf.com>
---
 drivers/i2c/busses/i2c-designware-amdpsp.c | 68 +++++++++++++++++-----
 1 file changed, 53 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index b624356c945f..b9bdc7db89df 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -6,6 +6,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/psp-sev.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #include <asm/msr.h>
 
@@ -15,6 +16,8 @@
 #define PSP_MBOX_OFFSET		0x10570
 #define PSP_CMD_TIMEOUT_US	(500 * USEC_PER_MSEC)
 
+#define PSP_I2C_RESERVATION_TIME_MS 100
+
 #define PSP_I2C_REQ_BUS_CMD		0x64
 #define PSP_I2C_REQ_RETRY_CNT		400
 #define PSP_I2C_REQ_RETRY_DELAY_US	(25 * USEC_PER_MSEC)
@@ -240,6 +243,42 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 	return ret;
 }
 
+static void release_bus(void)
+{
+	int status;
+
+	if (!psp_i2c_sem_acquired)
+		return;
+
+	status = psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
+	if (status)
+		return;
+
+	dev_dbg(psp_i2c_dev, "PSP semaphore held for %ums\n",
+		jiffies_to_msecs(jiffies - psp_i2c_sem_acquired));
+
+	psp_i2c_sem_acquired = 0;
+}
+
+static void psp_release_i2c_bus_deferred(struct work_struct *work)
+{
+
+	mutex_lock(&psp_i2c_access_mutex);
+
+	/*
+	 * If there is any pending transaction, cannot release the bus here.
+	 * psp_release_i2c_bus will take care of this later.
+	 */
+	if (psp_i2c_access_count)
+		goto cleanup;
+
+	release_bus();
+
+cleanup:
+	mutex_unlock(&psp_i2c_access_mutex);
+}
+static DECLARE_DELAYED_WORK(release_queue, psp_release_i2c_bus_deferred);
+
 static int psp_acquire_i2c_bus(void)
 {
 	int status;
@@ -250,21 +289,23 @@ static int psp_acquire_i2c_bus(void)
 	if (psp_i2c_mbox_fail)
 		goto cleanup;
 
+	psp_i2c_access_count++;
+
 	/*
-	 * Simply increment usage counter and return if PSP semaphore was
-	 * already taken by kernel.
+	 * No need to request bus arbitration once we are inside semaphore
+	 * reservation period.
 	 */
-	if (psp_i2c_access_count) {
-		psp_i2c_access_count++;
+	if (psp_i2c_sem_acquired)
 		goto cleanup;
-	}
 
 	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
 	if (status)
 		goto cleanup;
 
 	psp_i2c_sem_acquired = jiffies;
-	psp_i2c_access_count++;
+
+	schedule_delayed_work(&release_queue,
+			      msecs_to_jiffies(PSP_I2C_RESERVATION_TIME_MS));
 
 	/*
 	 * In case of errors with PSP arbitrator psp_i2c_mbox_fail variable is
@@ -279,8 +320,6 @@ static int psp_acquire_i2c_bus(void)
 
 static void psp_release_i2c_bus(void)
 {
-	int status;
-
 	mutex_lock(&psp_i2c_access_mutex);
 
 	/* Return early if mailbox was malfunctional */
@@ -295,13 +334,12 @@ static void psp_release_i2c_bus(void)
 	if (psp_i2c_access_count)
 		goto cleanup;
 
-	/* Send a release command to PSP */
-	status = psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
-	if (status)
-		goto cleanup;
-
-	dev_dbg(psp_i2c_dev, "PSP semaphore held for %ums\n",
-		jiffies_to_msecs(jiffies - psp_i2c_sem_acquired));
+	/*
+	 * Send a release command to PSP if the semaphore reservation timeout
+	 * elapsed but x86 still owns the controller.
+	 */
+	if (!delayed_work_pending(&release_queue))
+		release_bus();
 
 cleanup:
 	mutex_unlock(&psp_i2c_access_mutex);
-- 
2.37.1.595.g718a3a8f04-goog

