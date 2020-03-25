Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAB6193086
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Mar 2020 19:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgCYSg1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Mar 2020 14:36:27 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:14496 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727129AbgCYSg0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Mar 2020 14:36:26 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02PIMLoR009691;
        Wed, 25 Mar 2020 19:36:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=4smaSaGfx0ev3ozXhDm/hbuZrYNRElVuP+FA/ERuJiw=;
 b=ByJ3yaD+xINB9VaUHJ/PwlGxKeGleD3vbhjgasPCzJ8qEzXCFhY2U/N1P5DaDMa0wgop
 Yjm3ep8OrMG79/KbRe7bMxVXw5si2a9hVYZPhgNNKNzeVg+ONNRIuKoyvNRajrS7gB1P
 j0RXM2+Ih1W/F+Yu0Xz9LCJDpA5SdEtf17gSQ7uurKqEv3jCddjomxh4+kcTsm56kBVI
 kd52NyWwxGSu8C03L4WsyC/TML0d99vF30GTndQ6RY1+CT8E7CQhiMHmJe5J3nn7oTNw
 UE7cHLTb5cacry8+s9eakpmAIpUiS6QA5G73Vl8Bl6+wC36coRy1G8BFj3ZtaoTppf0r Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw8xe7eq5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 25 Mar 2020 19:36:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D9CAF10002A;
        Wed, 25 Mar 2020 19:36:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4C792AD2DB;
        Wed, 25 Mar 2020 19:36:10 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 25 Mar 2020 19:36:10
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
Subject: [PATCH 0/2] i2c: i2c-stm32f7: allow range of I2C bus frequency
Date:   Wed, 25 Mar 2020 19:35:59 +0100
Message-ID: <1585161361-3408-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-25_09:2020-03-24,2020-03-25 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This serie introduces the possibility to set bus frequency other
than 100KHz, 400KHz and 1MHz.

Alain Volmat (2):
  dt-bindings: i2c: i2c-stm32f7: allow clock-frequency range
  i2c: i2c-stm32f7: allows for any bus frequency

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |   8 +-
 drivers/i2c/busses/i2c-stm32f7.c              | 116 +++++++++---------
 2 files changed, 65 insertions(+), 59 deletions(-)

