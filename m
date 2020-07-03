Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E775213966
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jul 2020 13:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgGCLgj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jul 2020 07:36:39 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:33145 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726183AbgGCLgi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jul 2020 07:36:38 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 063BZ4LD018169;
        Fri, 3 Jul 2020 13:36:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=KtTObkeOynAmSwV1CyKhfRhK9yNMSaVV5hsuMECA9uU=;
 b=LZgBpv4QmrhNoSpLNz7TfyWa+GWJBrIfZ0NKSyLS91We97IH+wAgfGhPJ2t4S+pYZauZ
 maXBEylWB5fgD6pnJoK+KQo/LEMgQ36FrV+qe58mOdnfUrOwSD+ysjJ3gwhsss/HPsQk
 jgDxYqieSW0msQDqHJU//OtPkvMfmCvnCzSY6aNYF4hdQHjCcPzq0YiV61MRwRCWn70a
 Oh7Jff0hPcq3DmJp9CePbE8UbtMspR+Wei3LJEz5JFbnD5G8MH6BqHpU70Bs4IxQilDx
 85Mc29D3p2o37XXYV9WqRlh/0QEgxtbLUV+Yd0YqbL/qd6FhSL/pKcy+R1zp3tpvH8n+ Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wuvwp84n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Jul 2020 13:36:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3B6310002A;
        Fri,  3 Jul 2020 13:36:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A19C32C750E;
        Fri,  3 Jul 2020 13:36:26 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 3 Jul 2020 13:36:26
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@st.com>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH v2 0/2] i2c: stm32: add host-notify support via i2c slave
Date:   Fri, 3 Jul 2020 13:36:06 +0200
Message-ID: <1593776168-17867-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-03_06:2020-07-02,2020-07-03 signatures=0
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
 drivers/i2c/busses/i2c-stm32f7.c | 110 +++++++++++++++++++++++++++++++------
 drivers/i2c/i2c-core-smbus.c     | 114 +++++++++++++++++++++++++++++++++++++++
 include/linux/i2c-smbus.h        |  12 +++++
 4 files changed, 222 insertions(+), 15 deletions(-)

-- 
v2: fix a bad test within the i2c-stm32f7 driver leading to decrease of
    available slave slot
