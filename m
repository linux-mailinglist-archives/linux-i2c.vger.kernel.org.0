Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0BFF209AA8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jun 2020 09:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390295AbgFYHkG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jun 2020 03:40:06 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:16490 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390126AbgFYHkE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Jun 2020 03:40:04 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05P7RNI6002372;
        Thu, 25 Jun 2020 09:39:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=bHP02EBAOn+1XnI2EebWLmYBWJN6Wh587rzZXl9nQ8U=;
 b=tAnuXlL/Gzq4t7/ql/hJeEeUcZaqRnsyneb3xOB54hX60IJgqLVXbB2H1qj1TTDRLCtR
 hYdu0/cMLV9/SXZnKnvAoaDJLSjff1RJD1XyEq76cWYuP9yJV14HqZZWtmmZyPVdTKK4
 XtkOvU4Nj/HaPZBHbteN9U1MXagpgaBXZ2cdedxGI5mFbcw8U8UH9pHgyerYr09Aun0C
 vIH14NxV2oUv+Rbed+bT8Cb22/3W+B5HHB6mbv7ZrJmP5KSIfJA+S89pNDRCTSEkMblp
 gbhBl84qqcsQbD4bn58bAPt0IhG0Yx6v2qaCTPLLqVAayNnwItItsOWQGtk8Gd3XMqm6 cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31uuucgkpd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Jun 2020 09:39:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 82BEF10002A;
        Thu, 25 Jun 2020 09:39:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 525CE2A82E2;
        Thu, 25 Jun 2020 09:39:50 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 25 Jun 2020 09:39:49
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH v2 0/4] stm32-f7: Addition of SMBus Alert / Host-notify features
Date:   Thu, 25 Jun 2020 09:39:25 +0200
Message-ID: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-25_03:2020-06-25,2020-06-25 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This serie adds SMBus Alert and SMBus Host-Notify features for the i2c-stm32f7.

This serie v2 rework comments from the 1st serie and replace the very generic
reg_client / unreg_client callback with HOST_NOTIFY only reg_hnotify_cli
and unreg_hnotify_cli callbacks.

Alain Volmat (4):
  i2c: smbus: add core function handling SMBus host-notify
  i2c: addition of client hnotify reg/unreg callbacks
  dt-bindings: i2c-stm32: add SMBus Alert bindings
  i2c: stm32f7: Add SMBus-specific protocols support

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |   4 +
 drivers/i2c/busses/Kconfig                         |   1 +
 drivers/i2c/busses/i2c-stm32f7.c                   | 194 +++++++++++++++++++--
 drivers/i2c/i2c-core-base.c                        |  18 +-
 drivers/i2c/i2c-core-smbus.c                       | 110 ++++++++++++
 include/linux/i2c-smbus.h                          |   2 +
 include/linux/i2c.h                                |   8 +
 7 files changed, 325 insertions(+), 12 deletions(-)

