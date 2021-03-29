Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0DCE34C392
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Mar 2021 08:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhC2GKS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Mar 2021 02:10:18 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:23036 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229706AbhC2GJx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Mar 2021 02:09:53 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12T5t1kH017111;
        Mon, 29 Mar 2021 08:09:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=qep9y4/69l92YA1EjW2kQGKevET5+Foel7W2OczJ070=;
 b=johFUWX2y9lH9QYZYBRwzdER9y8NxfR5PUssJWLCbRewF3xTWju8M0HN66CQX93sNDfs
 G5kj0MIY50ExifSDKBbjKSP8Z35NuZzd0Ym/grgl0ySOouWQH8Uj8OUSZGknAmbVf+Zr
 HsoPs7qKjk7SNHOz8T/Ijm3B6SFbS78IrS/J7cCCKZY9n+7ngbiBIgqPSyxvmBVUzrHc
 rKQwNxITKXvU69j2iuoVLQwDXx6mLcq14Z3B5tP7JbRnaJ07q+NuzOVp0YmLLZh72zEz
 BQKHxiTTMUEzPcqGDu91+l2SwGZqYSXpOlUjsRSNjRJ1MtDvZZZH2FavtjbilqyCqJWC 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37jvdmjm9j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Mar 2021 08:09:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EB905100040;
        Mon, 29 Mar 2021 08:09:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B181D221772;
        Mon, 29 Mar 2021 08:09:08 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 29 Mar 2021 08:09:08
 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <alain.volmat@foss.st.com>
Subject: [PATCH v3 0/2] i2c: stm32f7: add SMBus-Alert support
Date:   Mon, 29 Mar 2021 08:09:03 +0200
Message-ID: <1616998145-28278-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-29_02:2021-03-26,2021-03-29 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This serie adds support for SMBus Alert on the STM32F7.
A new binding st,smbus-alert is added in order to differenciate
with the existing smbus binding.

SMBA alert control and status logic must be enabled along with
SMBALERT# pin configured via pinctrl in the device tree. This is the
rational for adding "st,smbus-alert" property.

---
v3:
use lore.kernel.org links instead of marc.info

v2:
When SMBUS alert isn't available on the board (SMBA unused), this
logic musn't be enabled. Enabling it unconditionally wrongly lead to get
SMBA interrupts.
So, add "st,smbus-alert" dedicated binding to have a smbus alert with a
consistent pin configuration in DT.

Alain Volmat (2):
  dt-bindings: i2c: stm32f7: add st,smbus-alert binding for SMBus Alert
  i2c: stm32f7: add SMBus-Alert support

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |  5 ++
 drivers/i2c/busses/i2c-stm32f7.c              | 73 +++++++++++++++++++
 2 files changed, 78 insertions(+)

-- 
2.17.1

