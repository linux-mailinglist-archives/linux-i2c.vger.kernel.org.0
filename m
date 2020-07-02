Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF20D2126CF
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 16:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730211AbgGBOr6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 10:47:58 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:2568 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730063AbgGBOrx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jul 2020 10:47:53 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 062EhC3O028153;
        Thu, 2 Jul 2020 16:47:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=WcS8twTIG5eRGz7Og3l5v3D19BLaLWfcJ+xCR6Mo4yE=;
 b=O7pej85UNCDZlwiv5nXnUmn4lKrz1yFPgwZlzPPtmOskPPw8jIaPcPt8IEz1wfw9agxH
 nnLYhQfTEjMGFaAtYY5Cs0BlBcRrgSN2MkSVGV3GqRgZRWUyDlmESP+l5YhZpnz+b2Rj
 HiKqCIv5JY6wY3WDuWtsTQRgfpJirGvfYXEbCGtF3eews9lZRa2mWzgpLuJ0YdmPVFTt
 hG5HymVbP5HCVpfMtGttl19tswvv6QRm92U3+QW9cOGKOLJeXQMitHo2JjZj51XNR9ZN
 bZWNWtI7vmf6e2smitlMgYkdtbDainju/iJN+cJ0to6CaaosnwREYrjEwzziGwRSV1XS 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wuvwgs7t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Jul 2020 16:47:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A9703100038;
        Thu,  2 Jul 2020 16:47:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 324C72BC7BE;
        Thu,  2 Jul 2020 16:47:39 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul 2020 16:47:38
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@st.com>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH 0/2] i2c: stm32: add host-notify support via i2c slave
Date:   Thu, 2 Jul 2020 16:47:03 +0200
Message-ID: <1593701225-13451-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-02_09:2020-07-02,2020-07-02 signatures=0
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
2.7.4


