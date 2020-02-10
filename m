Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F301B158124
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Feb 2020 18:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgBJRRv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Feb 2020 12:17:51 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:47581 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727121AbgBJRRv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Feb 2020 12:17:51 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01AHCacB020390;
        Mon, 10 Feb 2020 18:17:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Gq7vJ2L+cJyVm4rmoT7oKXQ1Aw3N9qOaHWBxs8THbRs=;
 b=btT6vR23wvTlVbWtdcOSCzHrAjP54x13DJkDPyQxkctmWOgapPdWwvf/qrAf5N4w2ky7
 3kNGw9AEwNLePY21c0dhegafyhaLu3jUKaK6mu8Wr7MQcVoASGick/FFM++IA4K7yNwG
 dNMny5m8mlhk4NCaGmKuHdsTea1Ij7rzwx+JCIVu3fdeDDJdQ8XPjuyGMdDt7cn8lTXh
 vD/bvE8pDU8kkovgtK0yUjoNBUzSMPqZvfIApjjb5K4VTW1H/CnfDBn5zjR8fkhW9Zpu
 GnjMIvJ9xfGUZj9en2anUbbpwSs7i0ISNrXK3PDnoGxE+gjTysr/92fR0EgWdAoI0UVO uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y1urgv0a9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Feb 2020 18:17:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DEB1B10002A;
        Mon, 10 Feb 2020 18:17:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE4A32C60B3;
        Mon, 10 Feb 2020 18:17:36 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 10 Feb 2020 18:17:36
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
Subject: [PATCH] ARM: dts: stm32: set i2c4 bus freq to 400KHz on stm32mp15 DK boards
Date:   Mon, 10 Feb 2020 18:17:36 +0100
Message-ID: <1581355056-13884-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-10_06:2020-02-10,2020-02-10 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On DK boards, all I2C4 bus slaves supports I2C Fast Mode hence setting
the bus frequency to 400 KHz.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 7f5fcb2c5b03..2521f428ae67 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -221,6 +221,7 @@
 	pinctrl-1 = <&i2c4_pins_sleep_a>;
 	i2c-scl-rising-time-ns = <185>;
 	i2c-scl-falling-time-ns = <20>;
+	clock-frequency = <400000>;
 	status = "okay";
 	/* spare dmas for other usage */
 	/delete-property/dmas;
-- 
2.7.4

