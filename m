Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2131312E5
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 14:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgAFN36 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 08:29:58 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:30886 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726307AbgAFN34 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jan 2020 08:29:56 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 006DRPL1006050;
        Mon, 6 Jan 2020 14:29:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=AI7zr+DJogbnJyM7WwYjfDpAv8ZqvsAx0EghXGtiEsY=;
 b=mW6/WIqFXADnLAu0PCBTTdooe37M1DzS5V01SqY+DseFqDMXh6d+ncN2Xgd8bzz2XqJB
 04igZi1dhtUAa7wgvQjcBRHTShX1t7AL7+qRmcElptat874d1QsS10OiIrxRgMJq55B2
 FGg6GrCW2G6DhwB+eFgpUGdomQ8FFZkX2ZzfQgZYl5onFZ2E2bQUPhqfW5+/NwZvHlRj
 gQOv/fgWxO/+jypEwItk9qmDk+lzvFEIc8qSfxE9kIieCHWAabcQm1dg9LcbEjZUOERW
 aJLLeFe8HcB1OmvmKbG7MSLLUa/6wRQHyE4k5tpImFXFMh3S6lxTAtmqNeU0PEsbAtN2 Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xakm584u9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jan 2020 14:29:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8D6B3100034;
        Mon,  6 Jan 2020 14:29:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 760DA2D378B;
        Mon,  6 Jan 2020 14:29:41 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 6 Jan 2020 14:29:41
 +0100
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
Subject: [PATCH 0/6] i2c-stm32f7: support suspend/resume & wakeup
Date:   Mon, 6 Jan 2020 14:28:28 +0100
Message-ID: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_04:2020-01-06,2020-01-06 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This serie replaces the previously sent serie "stm32: i2c: Add suspend/resume & add sleep pinctrls".

This serie adds support for pm sleep suspend / resume and allow I2C slave to be
a wakeup-source for the system.

Alain Volmat (6):
  ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp15xx-dkx
  ARM: dts: stm32: add i2c2/i2c5 sleep pinctrl on stm32mp157c-ev1
  ARM: dts: stm32: add i2c4 sleep pinctrl on stm32mp157c-ed1
  i2c: i2c-stm32f7: add PM_SLEEP suspend/resume support
  i2c: i2c-stm32f7: allow controller to be wakeup-source
  ARM: dts: stm32: add wakeup-source in all I2C nodes of stm32mp157c

 arch/arm/boot/dts/stm32mp151.dtsi      |   6 ++
 arch/arm/boot/dts/stm32mp157c-ed1.dts  |   3 +-
 arch/arm/boot/dts/stm32mp157c-ev1.dts  |   6 +-
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi |   3 +-
 drivers/i2c/busses/i2c-stm32f7.c       | 187 ++++++++++++++++++++++++++++++++-
 5 files changed, 196 insertions(+), 9 deletions(-)

