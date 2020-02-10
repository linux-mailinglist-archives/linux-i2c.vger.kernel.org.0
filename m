Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFC4158122
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2020 18:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727922AbgBJRRg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Feb 2020 12:17:36 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:28852 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727121AbgBJRRg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Feb 2020 12:17:36 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01AHEAmv010505;
        Mon, 10 Feb 2020 18:17:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Bz8h5qkb0zpjw1HFvVpIPJZK+9cjPLGnvR32+IgzkF8=;
 b=vIX3qFh3OoX85SuggQADVj3C/fCXOvwDsmsStcfljo1+kq9tHHFghyRRqZrTZ1lkLgxK
 7oatmogpU/Q/7wDFxU2OjAYoTEQeWKBBSvadHsmLdAC+Q1AI+K1xiDnbWFLGPTg3CtGN
 1JxDjJOVCAw1pAXwmEqJktmKfcrcEGELqwqSc3wMst8L6RzdMSXYI1kgAjgeDTDm4soV
 V34X/x+N8zfzCM5qKQbhn2TZ4RVFGETsVdPV3W45Jar1VOcQyI2toxxMto40ekfvvrBz
 PbpKMvD2wi5lPmGP8mGTF4SpQhGfLWCM6ScnRUf++F5XmYgpeezoW3dhfyKiL+rliUHS JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1ufgv4vw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Feb 2020 18:17:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0855510002A;
        Mon, 10 Feb 2020 18:17:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E67912C60B3;
        Mon, 10 Feb 2020 18:17:21 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 10 Feb 2020 18:17:21
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH] ARM: dts: stm32: set i2c4 bus freq to 400KHz on stm32mp157c-ed1
Date:   Mon, 10 Feb 2020 18:17:21 +0100
Message-ID: <1581355041-13845-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-10_06:2020-02-10,2020-02-10 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On this board, the I2C4 bus has only a single slave (pmic) which
supports I2C Fast Mode hence setting bus frequency to 400 KHz.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 209dae010be4..ac4f7ee4ad55 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -135,6 +135,7 @@
 	pinctrl-0 = <&i2c4_pins_sleep_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	clock-frequency = <400000>;
 	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
-- 
2.7.4

