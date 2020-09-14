Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE79268973
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 12:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgINKlx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 06:41:53 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:58465 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726484AbgINKlZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 06:41:25 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08EAbPc3022532;
        Mon, 14 Sep 2020 12:40:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=RNnrii00xxDfy5WSC9QOrCt+UuQkxyoFKEqKcUhEXMo=;
 b=r7kBF8twwK8B4KodrM+9KMrXviMEyE9WvUl1bXEuXdMBe0Raslk5oZf7Swm0BNWm/xIN
 okknJS6Fm7BUfTSnCKo81w/DxB0F1E1Z6n+7yBGKRODuS8l7Fk47oYRN+OIQ58BDurtJ
 97wc6iMQ3kW3klJl+fjaa3TGZcMmzd8PZXUBAvgU6Fi5WFisqUCvWBpc6ht2NHbK6u9X
 05b/dB0KKDJbIlLgLSm2EfsPozpI7sAt5jpURWFpPIMY/fI7F2OERx67bFRQF/eKk9Eh
 z5Is652Ud1cs8LaJEa3frs5aRqexI8sazuLckE3Zlfzc44K7NFwF4bcin6EeE1Os70iL 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33gkt09ppe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 14 Sep 2020 12:40:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A925B10002A;
        Mon, 14 Sep 2020 12:40:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 928E82ADA02;
        Mon, 14 Sep 2020 12:40:54 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 14 Sep 2020 12:40:54
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@st.com>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <krzk@kernel.org>, <h.assmann@pengutronix.de>,
        <alain.volmat@st.com>
Subject: [PATCH 0/2] Avoid meaningless DMA error print & use dev_err_probe
Date:   Mon, 14 Sep 2020 12:40:32 +0200
Message-ID: <1600080034-2050-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-14_02:2020-09-10,2020-09-14 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This serie replaces the patch from Holger Assmann [i2c: stm32: remove
unnecessary DMA kernel error log] (1) and the first version of [i2c: stm32:
do not display error when DMA is not requested] from myself (2).

A first patch is fixing useless error print when not being able to get
DMA channel (DMA is only optional) and also avoid printing twice an error
when a real DMA error is happening.

On top of that, dev_err_probe from Krzysztof has been rebased.

[1] https://marc.info/?l=linux-i2c&m=159741480608578&w=2
[2] https://marc.info/?l=linux-i2c&m=159973040314193&w=2

Alain Volmat (1):
  i2c: stm32: fix error message on upon dma_request_chan & defer
    handling

Krzysztof Kozlowski (1):
  i2c: stm32: Simplify with dev_err_probe()

 drivers/i2c/busses/i2c-stm32.c   | 12 ++++++------
 drivers/i2c/busses/i2c-stm32f4.c |  6 ++----
 drivers/i2c/busses/i2c-stm32f7.c | 27 +++++++++++----------------
 3 files changed, 19 insertions(+), 26 deletions(-)

-- 
2.7.4
