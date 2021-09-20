Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CD3411817
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Sep 2021 17:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241350AbhITPX3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Sep 2021 11:23:29 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:56166 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235268AbhITPX1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Sep 2021 11:23:27 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KE21hV025229;
        Mon, 20 Sep 2021 17:21:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=11mbfnVg9/gdbNXUsMJb7eKBhQNTVHlQkqg8fvwjfGU=;
 b=WJ6oDJofyU26m/VP/7VK39oole1/vl5zzLvZM/wizVK31tVqajFFYRA0EdAnBNACRVmM
 IBU5bGEgskY8R6L4Gc0q0dQ6tsB4dEd0dzUuojIa/8/Qbpw5TEEAaaj2WqXV/l65N3ei
 TQ5Hvo/qlAT0wS0Wq0ntoBghhxhUHucS4wsobYdZQg6DmGc3OnSoTGbuqGl1DnI6UA9q
 lWHaz081LgxJdzZB4yYT2sQFnrQ1rxbkBhf6PDQ8L+iqFzGQhJEuGBAGn3DAWJS+4O2J
 MDQHdPUvJdDlf/FSES0GU+TJxChlbt3ZldhJEJs3PKU/99FbMTotJ2S72mJnZ+Dt06w5 DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3b6uq3rbag-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Sep 2021 17:21:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A896F10002A;
        Mon, 20 Sep 2021 17:21:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AF4722F7B7;
        Mon, 20 Sep 2021 17:21:45 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep 2021 17:21:45
 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
CC:     <alexandre.torgue@foss.st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <amelie.delaunay@foss.st.com>, <alain.volmat@foss.st.com>
Subject: [PATCH 0/4] i2c: stm32: various fixes & dmaengine updates
Date:   Mon, 20 Sep 2021 17:21:28 +0200
Message-ID: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This serie contains 3 fixes for I²C error handling cases.
It also includes a patch to get rid of the deprecated
dmaengine_terminate_all calls.

Alain Volmat (4):
  i2c: stm32f7: flush TX FIFO upon transfer errors
  i2c: stm32f7: recover the bus on access timeout
  i2c: stm32f7: stop dma transfer in case of NACK
  i2c: stm32f7: use proper DMAENGINE API for termination

 drivers/i2c/busses/i2c-stm32f7.c | 45 +++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 7 deletions(-)

-- 
2.25.1

