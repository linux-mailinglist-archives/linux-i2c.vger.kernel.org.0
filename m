Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE91610AE0F
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2019 11:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbfK0KqW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Nov 2019 05:46:22 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:32324 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726510AbfK0KqW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Nov 2019 05:46:22 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xARAgL7E002710;
        Wed, 27 Nov 2019 11:46:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=AfM+ZEMb0CjRpx4WonEZ50fg5isv/g8XPgB1p+eqsd4=;
 b=E7pjnlJQo5I+OUI5agfXbT8pqNABXyQBlEo0IsEo9o7hmnKoy40vHSxIHuTxCPiyb3ET
 MK3zXfj1z+n+zf72KoOt7ETcMjYNb09GiUVnbzQW/nzRiTV02M51fc7prxiu1hBzabPO
 imnSjp6FD7ypRBQhH6kWlbQV8f1zjkZjIqJXIMF1MxUED10Rz9l7P9u0nuFXqAtO0JJZ
 UWamJ4at5N6IPPzFGa/cIoXht/v7apQkv0i/VcfUg084YRlc4X6jZo/5hgrhTaY0Owd9
 hxfCtwMq0urikkPuMStsxXHu/vOrcrr2PxilaxYMxDj512WSVbnlWZFp/aYg9tiOp2Ur fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2whcxj3269-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Nov 2019 11:46:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14F4810002A;
        Wed, 27 Nov 2019 11:46:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF7EF2B242E;
        Wed, 27 Nov 2019 11:46:01 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 27 Nov 2019 11:46:01
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH 0/4] stm32: i2c: Add suspend/resume & add sleep pinctrls
Date:   Wed, 27 Nov 2019 11:46:01 +0100
Message-ID: <1574851561-25501-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This small series add missing sleep pinctrl in boards device-tree including
i2c-stm32f7 nodes.
The driver is also enhanced to add support for PM_SLEEP suspend/resume.

Alain Volmat (4):
  ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp157a-dk1
  ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp157c-ed1
  ARM: dts: stm32: add i2c2/i2c5 sleep pinctrl on stm32mp157c-ev1
  i2c: i2c-stm32f7: add PM_SLEEP suspend/resume support

 arch/arm/boot/dts/stm32mp157a-dk1.dts |   3 +-
 arch/arm/boot/dts/stm32mp157c-ed1.dts |   3 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts |   6 +-
 drivers/i2c/busses/i2c-stm32f7.c      | 118 ++++++++++++++++++++++++++++++++--
 4 files changed, 119 insertions(+), 8 deletions(-)

-- 
2.7.4

