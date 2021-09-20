Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739CE411819
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Sep 2021 17:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241389AbhITPXa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Sep 2021 11:23:30 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:41856 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235845AbhITPX2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Sep 2021 11:23:28 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18K8jYXh030008;
        Mon, 20 Sep 2021 17:21:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=37QNl9P5De/Y/cw7XinD/wLqFsoYqybLsQYdh8u8mXs=;
 b=UJaZ4mS1npHgpNWt5XpcM/g/IYpfQu0OrtJYgIHbpPd1lRiKEj8ZApFgc3+gM7jvUUYd
 1VeSVXLgwF/xcypXf+KW+ATjePSofgYn+FAWSjRBoR/QH4gfjnCbM4w02+qNwxy3MmP3
 1xjkfLR0Le5//wWPY5TGuErWwFUzsd5SFkRovuPEM0fkY8bCqSMBKiKrfh8E/5Tmdi1O
 fHiJehLUMX9Oy7D0lWFEFVPFKpU40Mx1YMLizrHTBn9V6xfZk4Paf3xn4blVpYIKHL73
 Oru/JmUIbyfjfVq+zSMKNGAEm+wuGCHCevWG+J6mD2PC7hfDNjL9JvZoPelAgYesgP8D BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3b6q2shv5y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Sep 2021 17:21:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7987F100038;
        Mon, 20 Sep 2021 17:21:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7233722F7B7;
        Mon, 20 Sep 2021 17:21:46 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep 2021 17:21:46
 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH 2/4] i2c: stm32f7: recover the bus on access timeout
Date:   Mon, 20 Sep 2021 17:21:30 +0200
Message-ID: <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When getting an access timeout, ensure that the bus is in a proper
state prior to returning the error.

Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index ed977b6f7ab6..ad3459a3bc5e 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1712,6 +1712,7 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 			i2c_dev->msg->addr);
 		if (i2c_dev->use_dma)
 			dmaengine_terminate_all(dma->chan_using);
+		stm32f7_i2c_wait_free_bus(i2c_dev);
 		ret = -ETIMEDOUT;
 	}
 
@@ -1769,6 +1770,7 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 		dev_dbg(dev, "Access to slave 0x%x timed out\n", f7_msg->addr);
 		if (i2c_dev->use_dma)
 			dmaengine_terminate_all(dma->chan_using);
+		stm32f7_i2c_wait_free_bus(i2c_dev);
 		ret = -ETIMEDOUT;
 		goto pm_free;
 	}
-- 
2.25.1

