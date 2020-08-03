Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1041B239EE7
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 07:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgHCFS5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 01:18:57 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:4980 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728009AbgHCFS4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Aug 2020 01:18:56 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0735H2xv031305;
        Mon, 3 Aug 2020 07:18:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=I5RMLhsf+2H/+2z062Q7AViIP2i9l6KE48tTultTe6U=;
 b=GYuThUnhsjrsn76SrPD+b3L+9ncls2UMnhL9ISWU93U6rfo7esPs5BT8kEOVGYvvQ7Px
 kFjwEjIwzt15spHAjKg7893He7/zI59++FUy6xt7ZRxWmcA2lEnB6vrs9861/YvJRPiH
 SQNzvchTtQ60dks7lt8qasxEtGZo4+IYWWkPy7mIBCXY7kyVrgY0cq0tg7Wn72jXYwDV
 L4f7Qp0HTMMKerlRQsO8uqytmcWL/vntXQ6AARtaH6552vYnVzG4achPMtv/BtGGHbjA
 MHrghwmdjwfOGiwVZErWq40qaU0XbAdJkdl5xIhDcv7KwBXpZTDT8A1EdEms1QHUC3bk oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32n6th4vff-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 07:18:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA80910002A;
        Mon,  3 Aug 2020 07:18:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3184A20F450;
        Mon,  3 Aug 2020 07:18:43 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Aug 2020 07:18:42
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@st.com>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH v3 0/2] i2c: stm32: add host-notify support via i2c slave
Date:   Mon, 3 Aug 2020 07:17:54 +0200
Message-ID: <1596431876-24115-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-03_04:2020-07-31,2020-08-03 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This serie replaces the previous 'stm32-f7: Addition of SMBus Alert /
Host-notify features' serie to only focus on the SMBus Host-Notify feature.
It should be applied with "[PATCH] i2c: add binding to mark a bus as SMBus"
from Wolfram which defines the newly introduced "smbus" binding.

Alain Volmat (2):
  i2c: smbus: add core function handling SMBus host-notify
  i2c: stm32f7: Add SMBus Host-Notify protocol support

 drivers/i2c/busses/Kconfig       |   1 +
 drivers/i2c/busses/i2c-stm32f7.c | 110 +++++++++++++++++++++++++++++++++------
 drivers/i2c/i2c-smbus.c          | 107 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c-smbus.h        |  12 +++++
 4 files changed, 215 insertions(+), 15 deletions(-)

-- 
v3: move smbus host-notify slave code into i2c-smbus.c file
    rework slave callback index handling
    add sanity check in slave free function

v2: fix a bad test within the i2c-stm32f7 driver leading to decrease of
    available slave slot

