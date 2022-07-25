Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A742157FAC9
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Jul 2022 10:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbiGYIDY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Jul 2022 04:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbiGYIDX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Jul 2022 04:03:23 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06576B08
        for <linux-i2c@vger.kernel.org>; Mon, 25 Jul 2022 01:03:22 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id b26so14803750wrc.2
        for <linux-i2c@vger.kernel.org>; Mon, 25 Jul 2022 01:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4BUdqeYE8bXBWBXa+/4xNagKBmBvaYLtWCrJiqBrOvk=;
        b=anQXQllBG4vQ/G+B7yPNX0MRRGO5M82p5hmDwRjBvf/zUl4aWJy+XDAgnEzzetpXYh
         T4lYtjk1EF3l2taBw8MVDxf465D5bLbor8zN8+IZKHYGN/P9DYT76a/OmkdSwtK+7hzP
         wTRsalKGYTRUtVqtgWjmzXj16TRPLn6F1nVfqQd+trdJsc876MXMdH+Q9vjyo2E4QpFH
         D6QU7V02y5SJLn7UTo6D7J9eUiIIf549vhGLhy0C5Qa6JlYYYqziXJ2qxL+wdFlmwC0C
         CUQv9MPUaR40zREMabW9TFNpztraHNtFKcd2tdZsT2Z9qF3MrMQ8+rxaX+XZMkypse0v
         BY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4BUdqeYE8bXBWBXa+/4xNagKBmBvaYLtWCrJiqBrOvk=;
        b=Vvf+am3ziFOf10+TMj6OF/x1T/FRaOTCmSn82vR+yl2JnPcdzXlxPNaJoVs3F8ruBm
         lc4lFWScYLdXGK6Y4dj5xJ5IaooXsB8POOC1twzkPrLGNETN3Gbglx3FOa8Gx94g6V4o
         vZ1Ansv/cEv7NqNmNEeTooQ4CWgT8XXZXgEXs9o6pJ/5MmnicGeSiDdAhBhiD5S2B7lI
         /vJY6Il9S7tJGFrTq9RM7647U3N+9tv9R5NVevxpR/fp0UwI4xNP1oHlk/mlBv1jTfpT
         bTb+4u5hdMf9qLDb51uxYjCNUuj41P/6Lglkx9z4HSzEYNfIU8ea0+QIYtP9WDCjB1Sc
         EWBw==
X-Gm-Message-State: AJIora9z3I0PeJz5dwFWEjsC/BdApFDRu9TAl1LpF55qixLwR095wS6Q
        p5EDlGTxJymXEhPzIJ5YKOIJ9g==
X-Google-Smtp-Source: AGRyM1si3ttMro/4bJ/RZrru9nER9fBgksbwSWZVMII+N16IWWSor4MjTu02m4Ny0wWtbskTpCtT3Q==
X-Received: by 2002:adf:dd91:0:b0:21e:4e97:c146 with SMTP id x17-20020adfdd91000000b0021e4e97c146mr6760136wrl.281.1658736200431;
        Mon, 25 Jul 2022 01:03:20 -0700 (PDT)
Received: from dabros-l.roam.corp.google.com ([185.157.14.92])
        by smtp.gmail.com with ESMTPSA id o24-20020a05600c379800b003a327f19bf9sm17620005wmr.14.2022.07.25.01.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 01:03:19 -0700 (PDT)
From:   Jan Dabros <jsd@semihalf.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     mika.westerberg@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, mw@semihalf.com, upstream@semihalf.com,
        jsd@semihalf.com
Subject: [PATCH] i2c: designware: Introduce cooldown timer to AMDPSP driver
Date:   Mon, 25 Jul 2022 10:02:40 +0200
Message-Id: <20220725080240.106619-1-jsd@semihalf.com>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In order to optimize performance, limit amount of back and forth
transactions between x86 and PSP. This is done by introduction of
cooldown period - that is window in which x86 isn't releasing the bus
immediately after each I2C transaction.

In order to protect PSP from being starved while waiting for
arbitration, after a programmed time bus is automatically released by a
deferred function.

Signed-off-by: Jan Dabros <jsd@semihalf.com>
---
 drivers/i2c/busses/i2c-designware-amdpsp.c | 68 +++++++++++++++++-----
 1 file changed, 53 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index b624356c945f..2e1bb5ae72c3 100644
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
 
+#define PSP_I2C_COOLDOWN_TIME_MS 100
+
 #define PSP_I2C_REQ_BUS_CMD		0x64
 #define PSP_I2C_REQ_RETRY_CNT		400
 #define PSP_I2C_REQ_RETRY_DELAY_US	(25 * USEC_PER_MSEC)
@@ -240,6 +243,42 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 	return ret;
 }
 
+static void release_bus_now(void)
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
+	release_bus_now();
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
+	 * No need to request bus arbitration once we are inside cooldown
+	 * period.
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
+			      msecs_to_jiffies(PSP_I2C_COOLDOWN_TIME_MS));
 
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
+	 * Send a release command to PSP if the cooldown timeout elapsed but x86 still
+	 * owns the ctrlr.
+	 */
+	if (!delayed_work_pending(&release_queue))
+		release_bus_now();
 
 cleanup:
 	mutex_unlock(&psp_i2c_access_mutex);
-- 
2.37.1.359.gd136c6c3e2-goog

