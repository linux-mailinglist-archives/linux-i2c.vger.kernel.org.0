Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BED48D7727
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2019 15:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729773AbfJONMO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Oct 2019 09:12:14 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:8634 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728372AbfJONMO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Oct 2019 09:12:14 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9FD6XqB023027;
        Tue, 15 Oct 2019 15:11:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=w/5qy1IHL1wYdfKxhun+GfbV+h5lcHU8JKwxGzQWPDo=;
 b=RDf0m5xS4B4kJ4OftWL1naOATJhlAGqE0YO2Pcsg7GixmMYaYTLdAICvVrYq9RYhKade
 a0GYk5qqF8778n3smugKFgp2nSUiOhTlbD+b9A3wMQOXLwsnZEAhyuZlRmBETyB1MGpr
 YpMvH66utLtXl083nS7CRbjHd0IiLMZJ+p3vMGf7/aPD/pKsXpJfpPfVQZ6C/PbxP8AH
 4C7lb7ClJa/qG++3gDXllhZBdU+xmFOWi7P2SRu2OI8LjQdU2eY1cs1Ba9PFWaz8NXvM
 iEx5Ij1MSwNjLGKCFXusBQjFEhlDF4PeqHbPqmPNxJZp6Fbekg7oYUmDit6vsdcYpkEf aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vk4kx0ab1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Oct 2019 15:11:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 78DF610002A;
        Tue, 15 Oct 2019 15:11:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 631C12CB0C4;
        Tue, 15 Oct 2019 15:11:59 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 15 Oct 2019 15:11:59
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH v2] i2c: i2c-stm32f7: remove warning when compiling with W=1
Date:   Tue, 15 Oct 2019 15:11:58 +0200
Message-ID: <1571145118-3522-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-15_05:2019-10-15,2019-10-15 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove the following warning:

drivers/i2c/busses/i2c-stm32f7.c:315:
warning: cannot understand function prototype:
'struct stm32f7_i2c_spec i2c_specs[] =

Replace a comment starting with /** by simply /* to avoid having
it interpreted as a kernel-doc comment.

Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
Changes in v2: update commit description
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index d36cf08461f7..7aa4a47792a7 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -305,7 +305,7 @@ struct stm32f7_i2c_dev {
 	struct regmap *regmap;
 };
 
-/**
+/*
  * All these values are coming from I2C Specification, Version 6.0, 4th of
  * April 2014.
  *
-- 
2.7.4

