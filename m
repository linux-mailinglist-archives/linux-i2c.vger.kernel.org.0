Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3EE3551668
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jun 2022 12:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241099AbiFTK6K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Jun 2022 06:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241026AbiFTK57 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jun 2022 06:57:59 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB21BF3;
        Mon, 20 Jun 2022 03:57:57 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K9DoD4018610;
        Mon, 20 Jun 2022 12:57:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=h6fMAFsPADwHPMj+OuqlhAUtCu1v4UaZSg4erhbwG9U=;
 b=5RMi1kA2Lb90fEI2U09LTHIV8YYh39G7XZBZI7MDc64HLLEfUwkhtIJhuoioZEW7qYFd
 GFEMLsADfMNY9AdxOfmCiL0bn+77zBNDhfnqD5d+F28TYdxkz0pLNyyX7qOVMBUSnZMr
 JmJKrzJCjOSF3OPo7qntZVWMZrGGuPFwehMZtxq4QLow7zMNOs0O28/wOkF2PdkOPLN8
 moTgzeROAGlUh2Run4sMZewQ82QZKN5Yp4lf9pRaesez29xJ3S8mRKlUrsrGKBUbox2u
 uuW0qfBxcnCrUzXL3NrMihdZs4Rf8PZioJzzaPTvkFcPRNX8gwesEARLuZd0poDmktRI LA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtp31rnfs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Jun 2022 12:57:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66ED510002A;
        Mon, 20 Jun 2022 12:57:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 620FE217B89;
        Mon, 20 Jun 2022 12:57:47 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 12:57:47 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH 4/4] i2c: stm32: add support for the STM32MP13 soc
Date:   Mon, 20 Jun 2022 12:54:05 +0200
Message-ID: <20220620105405.145959-5-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620105405.145959-1-alain.volmat@foss.st.com>
References: <20220620105405.145959-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a new compatible for the stm32mp13.  Fast Mode Plus control
register address differ from the one for STM32MP15.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index b29d8e476342..9946b330ddce 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -410,6 +410,12 @@ static const struct stm32f7_i2c_setup stm32mp15_setup = {
 	.fmp_clr_offset = 0x40,
 };
 
+static const struct stm32f7_i2c_setup stm32mp13_setup = {
+	.rise_time = STM32F7_I2C_RISE_TIME_DEFAULT,
+	.fall_time = STM32F7_I2C_FALL_TIME_DEFAULT,
+	.fmp_clr_offset = 0x4,
+};
+
 static inline void stm32f7_i2c_set_bits(void __iomem *reg, u32 mask)
 {
 	writel_relaxed(readl_relaxed(reg) | mask, reg);
@@ -2469,6 +2475,7 @@ static const struct dev_pm_ops stm32f7_i2c_pm_ops = {
 static const struct of_device_id stm32f7_i2c_match[] = {
 	{ .compatible = "st,stm32f7-i2c", .data = &stm32f7_setup},
 	{ .compatible = "st,stm32mp15-i2c", .data = &stm32mp15_setup},
+	{ .compatible = "st,stm32mp13-i2c", .data = &stm32mp13_setup},
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32f7_i2c_match);
-- 
2.25.1

