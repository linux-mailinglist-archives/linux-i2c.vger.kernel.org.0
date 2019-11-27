Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0F010AE14
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2019 11:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfK0Kq0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Nov 2019 05:46:26 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:24542 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726698AbfK0KqZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Nov 2019 05:46:25 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xARAgUXw024673;
        Wed, 27 Nov 2019 11:46:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=sQ77mhp6Uc6gGKQZL+Gvd0vSggcu6UyJ2y2Y+ouBWXw=;
 b=bmU9Ug+/zuC0xtFt94PpyAndcBbf4gWfco6MB2YYwhi1TPf0HKatG4SV4MyoptTvC/au
 A43jFmqVvENfPqorPiRzrp7sC4txO/X6mVm9mzRJCaNvC4qmYtjkShE23I2Z1hwiuOli
 uBUMu5S6o/wg2Qgp1rchEqZHsji4Z+L6g8/+lF0zvDOE+D+kfgnIPRf9fx6imvoT7z08
 aIKw3HBVbgPTX+Lqn2wxgq9Ln3IgDIXmTWABuPQ9zSB105gw2ZizJd3RyMGhkOqxmi4J
 yo44z4l0So5EYEUTSAc1EJZJLmUQb4p4L5/tQ5zJSKRwB08qMGiFXF4hFssD3Ny3/H2l CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2whcxsb45d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Nov 2019 11:46:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D71A100034;
        Wed, 27 Nov 2019 11:46:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F4C22B242F;
        Wed, 27 Nov 2019 11:46:14 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 27 Nov 2019 11:46:13
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH 1/4] ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp157a-dk1
Date:   Wed, 27 Nov 2019 11:46:13 +0100
Message-ID: <1574851573-25547-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the sleep state pinctrl entry for the i2c4 node
of the stm32mp157a-dk1 board.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 0615d1c8a6fc..1c827353f22a 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -199,8 +199,9 @@
 };
 
 &i2c4 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c4_pins_a>;
+	pinctrl-1 = <&i2c4_pins_sleep_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
 	status = "okay";
-- 
2.7.4

