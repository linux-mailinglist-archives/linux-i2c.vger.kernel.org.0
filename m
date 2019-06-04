Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13374348EA
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 15:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727452AbfFDNes (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 09:34:48 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:47465 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727169AbfFDNer (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jun 2019 09:34:47 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x54DM2T2031387;
        Tue, 4 Jun 2019 15:34:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=JYRJ+q63Fhy7zqvNhQoupVuURIhtdf05RxS1XTNxJFc=;
 b=IbA//KFhtlwxSBdLo4g0/XuBdFuYQWXdReWU3Hc1ef4QyT7ZWrxo/wPObdJ0fENY2ICU
 ypxi6Hh+/fL6YbfcB7n82uH4qeylBqKW/A27k0bORE/PAuzs4cUnd9CGcty1/yDyv/lc
 UhQ0Ru6EfddKYLae17r/RYB8XsMKWy3v3EeQ8ybjUcMN8SHrLctLiDLOZu3UdbELEQz6
 v4bnogFOOEeDMQQN1wh+qjsQCjISrVsHB0WVG/B3ZeMZm+cuL1vZTbZlI51dOH2VvLMY
 oM4UKvuA1NaEv6b6U9ZckFvOuiUw0ygUlrZt4VdudSM50YEKCmitILn6xhwtgSYDRc2h yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2sunmc8q5h-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 04 Jun 2019 15:34:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5413A31;
        Tue,  4 Jun 2019 13:34:30 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23D192AB6;
        Tue,  4 Jun 2019 13:34:30 +0000 (GMT)
Received: from localhost (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 4 Jun 2019 15:34:29
 +0200
From:   Fabrice Gasnier <fabrice.gasnier@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH] dt-bindings: i2c-stm32: document optional dmas
Date:   Tue, 4 Jun 2019 15:34:13 +0200
Message-ID: <1559655253-27008-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-04_09:,,
 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add missing documentation for "dmas" and "dma-names" properties that can be
used on i2c-stm32.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 Documentation/devicetree/bindings/i2c/i2c-stm32.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-stm32.txt b/Documentation/devicetree/bindings/i2c/i2c-stm32.txt
index f334738..ce3df2ff 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-stm32.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-stm32.txt
@@ -21,6 +21,8 @@ Optional properties:
   100000 and 400000.
   For STM32F7, STM32H7 and STM32MP1 SoCs, Standard-mode, Fast-mode and Fast-mode
   Plus are supported, possible values are 100000, 400000 and 1000000.
+- dmas: List of phandles to rx and tx DMA channels. Refer to stm32-dma.txt.
+- dma-names: List of dma names. Valid names are: "rx" and "tx".
 - i2c-scl-rising-time-ns: I2C SCL Rising time for the board (default: 25)
   For STM32F7, STM32H7 and STM32MP1 only.
 - i2c-scl-falling-time-ns: I2C SCL Falling time for the board (default: 10)
-- 
2.7.4

