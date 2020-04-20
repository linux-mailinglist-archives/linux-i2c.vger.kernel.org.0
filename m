Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81E1C1B0F04
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 16:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbgDTO6V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 10:58:21 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:13354 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725944AbgDTO6V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Apr 2020 10:58:21 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03KEvxFe029857;
        Mon, 20 Apr 2020 16:58:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=vnvueWF2EAYv1eJy/Hwk/dSPJsB/WwgqTpNzfqj2Osg=;
 b=iFVVMe31yG1knkRz19oSGJ3tW5TSm8SPWpnIbNqd4drZytF9ZjbbYxaqdSeLNGyIuep6
 /k2MUWA5P4jn0eh8Ha1wcKWN0IzEaMvbgDJ/Bfn/tur5ws4vjrg9OXLWdb8TmIdi1ZaQ
 ZBK36iYhFF+RYmeYsvqCBmcWMKZeAifthqhN64efcfgi+Yw15ajjMRNtOP6Gnl57bglj
 wmcEJIhDiGRhoADi51lBoTM57N9z8xc9yfDa67MndJwgE71dqyF3QOd/HXKZsqEII/Ws
 XBtD35C+QjSKpfOx3DTKvcVMOgCQxzAyxLlEKTzQP4PddyK0EIGfqe5L8Y8Ov1JVznwM 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30fpp8k27y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Apr 2020 16:58:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0E2D10002A;
        Mon, 20 Apr 2020 16:58:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BEC932C1F6E;
        Mon, 20 Apr 2020 16:58:06 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 Apr 2020 16:58:06
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@the-dreams.de>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH v3 0/2] i2c: i2c-stm32f7: allow range of I2C bus frequency
Date:   Mon, 20 Apr 2020 16:57:55 +0200
Message-ID: <1587394677-6872-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-20_05:2020-04-20,2020-04-20 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This serie introduces the possibility to set bus frequency other
than 100KHz, 400KHz and 1MHz.

Changelog:
v3: fix i2c: i2c-stm32f7: allows for any bus frequency patch
v2: fix i2c: i2c-stm32f7: allows for any bus frequency patch

Alain Volmat (2):
  dt-bindings: i2c: i2c-stm32f7: allow clock-frequency range
  i2c: i2c-stm32f7: allows for any bus frequency

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |   8 +-
 drivers/i2c/busses/i2c-stm32f7.c                   | 125 +++++++++++----------
 2 files changed, 68 insertions(+), 65 deletions(-)

