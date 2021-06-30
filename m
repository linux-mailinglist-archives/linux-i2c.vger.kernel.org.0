Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0CC83B84C8
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jun 2021 16:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234895AbhF3OPh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Jun 2021 10:15:37 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:38158 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234851AbhF3OPh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Jun 2021 10:15:37 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15UECm2J019682;
        Wed, 30 Jun 2021 16:12:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=IFFSjjhuK7hpbYhX8q4QMoe7AicReb+FwH97hXJauXY=;
 b=5q9nIbf7K4NP9X0nPNTUy8gm9GojwkOIMUSoH4buiTX3zc9a/8zbS8z/NjQca4TnRme+
 Ox8H5LW+L4z9+p/gCuKotG7vcQJpc47kspPvDjQ1KjrLCVlouFQzgIp/zPQBd2QEB3V4
 +vBMiVVHaN+dD6B2on/LSEDuEQISD1w0cpILzBU2vLiP9kryF6LT5Uhzm0FZblfkNS+J
 Yf8WqZE/jdXgXXhWvArbnesp8rwmTY4FiPrzgY4xHOA6rOfyJNezwR1d4JNMFwIMbx5W
 0U3A5KjNNWkun1Ye7fUMILYw+rBe+sFzz+5mdUqPx8w6/FDUINvosySikfHGfkP78gBU pQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39gnbpjpf1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 30 Jun 2021 16:12:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B637010003A;
        Wed, 30 Jun 2021 16:12:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A30DB23151C;
        Wed, 30 Jun 2021 16:12:56 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 30 Jun 2021 16:12:56
 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH 0/3] i2c: stm32f7: several fixes in error cases
Date:   Wed, 30 Jun 2021 16:11:40 +0200
Message-ID: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-30_06:2021-06-29,2021-06-30 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This serie provides several fixes needed for cases when communication
when a device is not behaving properly.

Alain Volmat (3):
  i2c: stm32f7: recover the bus on access timeout
  i2c: stm32f7: flush TX FIFO upon transfer errors
  i2c: stm32f7: prevent calling slave handling if no slave running

 drivers/i2c/busses/i2c-stm32f7.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

-- 
2.25.1

