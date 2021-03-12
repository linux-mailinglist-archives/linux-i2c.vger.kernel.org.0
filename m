Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDEE338BEF
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 12:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhCLLxn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Mar 2021 06:53:43 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51974 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229956AbhCLLxi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Mar 2021 06:53:38 -0500
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12CBoTQ8009447;
        Fri, 12 Mar 2021 12:53:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=BfJXcClY5SWuajOCVotJOU0beBsi1AE3kA5YqGfUDLk=;
 b=K37OZF+Y8tnuZ9oQvdyYNxIkDjNbBbq8zMsRH1mVRlPMT9JRcASrf3Y0LjVB14BGhhZ5
 /OCAUem3niOJBEdDN4g8C5JI9l68bER3+ORr+PEjk8yQvky3+tuJrEyqXz64IFEolBB/
 YHhtv0oDbd/nXw0fePk+A557O1rVJOuhZwqlvk9Ack69COYdDFcwbCWDkRbGy33iJjiw
 +ewDZBaqCujC+wNLG5Um5Y9Lbk9/9Hd2MzgFGxuo9weUe90t2U+0aSeM0F/HEVDR7Qrn
 5LORTtNg3c9vgjxOMcE83gR/bFkKdg3LOtWWE7Y4JG41WA5O4asiGPr7Jtzz74fC01r+ rQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3741y7c7xf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 Mar 2021 12:53:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 033BA10002A;
        Fri, 12 Mar 2021 12:53:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E28A52336D5;
        Fri, 12 Mar 2021 12:53:27 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar 2021 12:53:27
 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <alain.volmat@foss.st.com>
Subject: [PATCH] i2c: stm32f7: avoid ifdef CONFIG_PM_SLEEP for pm callbacks
Date:   Fri, 12 Mar 2021 12:53:27 +0100
Message-ID: <1615550007-10927-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-12_03:2021-03-10,2021-03-12 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Avoid CONFIG_PM preprocessor check for pm suspend/resume
callbacks and identify the functions with __maybe_unused.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index c62c815b88eb..4c2f1b16c5ce 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2267,8 +2267,7 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
+static int __maybe_unused stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
 {
 	int ret;
 	struct stm32f7_i2c_regs *backup_regs = &i2c_dev->backup_regs;
@@ -2289,7 +2288,7 @@ static int stm32f7_i2c_regs_backup(struct stm32f7_i2c_dev *i2c_dev)
 	return ret;
 }
 
-static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
+static int __maybe_unused stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
 {
 	u32 cr1;
 	int ret;
@@ -2320,7 +2319,7 @@ static int stm32f7_i2c_regs_restore(struct stm32f7_i2c_dev *i2c_dev)
 	return ret;
 }
 
-static int stm32f7_i2c_suspend(struct device *dev)
+static int __maybe_unused stm32f7_i2c_suspend(struct device *dev)
 {
 	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 	int ret;
@@ -2341,7 +2340,7 @@ static int stm32f7_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int stm32f7_i2c_resume(struct device *dev)
+static int __maybe_unused stm32f7_i2c_resume(struct device *dev)
 {
 	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 	int ret;
@@ -2361,7 +2360,6 @@ static int stm32f7_i2c_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
 	SET_RUNTIME_PM_OPS(stm32f7_i2c_runtime_suspend,
-- 
2.17.1

