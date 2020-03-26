Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2AE6193F0B
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 13:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbgCZMot (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 08:44:49 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:10484 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727841AbgCZMot (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Mar 2020 08:44:49 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02QCcP4P019331;
        Thu, 26 Mar 2020 13:44:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=D+ohMog7QnAtbmnqjRFJ0GxJ7rXuyTtsJyMA4a9kqvM=;
 b=R90rYQ6bVoYY5AEf9v0VYmetKxb5EuGy0wPgsjbNWZxKDcw73aze4LJq4VqgO3rruyDI
 RTOGrsGpb4Bzzj6dFvHQps/fFG/FqKzWgowrsH8AA6qC7tjMTgSJ9lEvIcDeVuYP38VA
 qUum3Dku3mDeiqVNuOKQjqfRVlOjHCdqMVsIMZgqjDgCVrFawJPudkb+rcv7mXQQ8rT7
 bIql6OVjdiWm17U8vZFFBtOXT22HwBUhtSPpbGIF3FnUJmDZAuS66T6rlSJEgZm6syK+
 Kh3J3P/HCyQBdqx6EySixOyga6w7I/3DfcImcexfriOTCdS81cxdVgpt3vOB0ESEzS1E Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yw8xec2cj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Mar 2020 13:44:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 491A8100034;
        Thu, 26 Mar 2020 13:44:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FA0A2AC69C;
        Thu, 26 Mar 2020 13:44:38 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 26 Mar 2020 13:44:37
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
Subject: [PATCH v2 0/2] i2c: i2c-stm32f7: allow range of I2C bus frequency
Date:   Thu, 26 Mar 2020 13:44:19 +0100
Message-ID: <1585226661-26262-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-26_03:2020-03-26,2020-03-26 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This serie introduces the possibility to set bus frequency other
than 100KHz, 400KHz and 1MHz.

Changelog:
v2: fix i2c: i2c-stm32f7: allows for any bus frequency patch

Alain Volmat (2):
  dt-bindings: i2c: i2c-stm32f7: allow clock-frequency range
  i2c: i2c-stm32f7: allows for any bus frequency

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |   8 +-
 drivers/i2c/busses/i2c-stm32f7.c              | 116 +++++++++---------
 2 files changed, 65 insertions(+), 59 deletions(-)

