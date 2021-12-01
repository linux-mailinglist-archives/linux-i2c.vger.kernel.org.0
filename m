Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9775464D44
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Dec 2021 12:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243442AbhLALv6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Dec 2021 06:51:58 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:54896 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S242543AbhLALvw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Dec 2021 06:51:52 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B19D5HL028937;
        Wed, 1 Dec 2021 12:48:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=7odZAZhCVgaOiJipJ40jrarQIFv9heW0d1vSNIFNSZg=;
 b=dvAmKLFUsRSFG3HDFoPaVZgFIDHJWGRG6r32XKpk7/2v7PYQ6CiD43uYb1aY7WmxZiSM
 ugcLlTGzD6aNhd98Y7EPDKzmA57TeV+9w/Bfrlxb3SeJ4Oxlk33M6wJEIIN8WSn4cNpP
 yujhr8JM8JYlIYWfMDfVoIlv61G/plvcqdUx+YC93eeFHH1kXJ3ZCfQ5XjeXk2z1ATyy
 4BL8m2daiHffWNfkzuia7DOpCTtCUOBii1t36dU3QoH6hkqXTptvNf46YGGtnvOI7x5K
 mhSQ1AS/soB2MA7hiS7SN6VAAL2KcGn5dlAiPGHCFe/J2O5U+0bO0jOhvohehztdZ25R kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cp67m921x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Dec 2021 12:48:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44E71100039;
        Wed,  1 Dec 2021 12:48:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EBD82194D5;
        Wed,  1 Dec 2021 12:48:11 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 1 Dec 2021 12:48:10
 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH 1/2] i2c: stm32: get rid of stm32f7_i2c_release_bus return value
Date:   Wed, 1 Dec 2021 12:47:50 +0100
Message-ID: <20211201114751.828474-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201114751.828474-1-alain.volmat@foss.st.com>
References: <20211201114751.828474-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_10,2021-12-01_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Function stm32f7_i2c_release_bus is always returning 0, hence it
should be a void function.  Update the function and remove the
return value error checking code in caller functions.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 66145d2b9b55..fcf43b3ac64f 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -828,7 +828,7 @@ static void stm32f7_i2c_smbus_reload(struct stm32f7_i2c_dev *i2c_dev)
 	writel_relaxed(cr2, i2c_dev->base + STM32F7_I2C_CR2);
 }
 
-static int stm32f7_i2c_release_bus(struct i2c_adapter *i2c_adap)
+static void stm32f7_i2c_release_bus(struct i2c_adapter *i2c_adap)
 {
 	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
 
@@ -838,8 +838,6 @@ static int stm32f7_i2c_release_bus(struct i2c_adapter *i2c_adap)
 			     STM32F7_I2C_CR1_PE);
 
 	stm32f7_i2c_hw_config(i2c_dev);
-
-	return 0;
 }
 
 static int stm32f7_i2c_wait_free_bus(struct stm32f7_i2c_dev *i2c_dev)
@@ -856,11 +854,7 @@ static int stm32f7_i2c_wait_free_bus(struct stm32f7_i2c_dev *i2c_dev)
 
 	dev_info(i2c_dev->dev, "bus busy\n");
 
-	ret = stm32f7_i2c_release_bus(&i2c_dev->adap);
-	if (ret) {
-		dev_err(i2c_dev->dev, "Failed to recover the bus (%d)\n", ret);
-		return ret;
-	}
+	stm32f7_i2c_release_bus(&i2c_dev->adap);
 
 	return -EBUSY;
 }
-- 
2.25.1

