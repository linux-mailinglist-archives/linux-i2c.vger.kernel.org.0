Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34275373C29
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 15:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbhEENSd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 09:18:33 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:5536 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229606AbhEENSc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 May 2021 09:18:32 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 145DHMeS022118;
        Wed, 5 May 2021 15:17:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=oKWdkh59xaWBXpAlbJc3K7xKwP0fD1UPO9YaA7JF6dk=;
 b=XELtC+voQP/UEhp6mOTj0IhYvZm9YYViaUf3ZgfQTviRfFHehe63ZMXfylx63UJuUsfm
 BY7/n9BK8VSY7PNM30BaZ3D+HFS3cbwW2ReDumx1M0yL+fRKDsCiYFsZnzX88TLRlM4J
 n3+x7gyjmmUmDuzuiJwUnk62sY8/CC5Ir2XVBd3q7HBpHMu91ExY7OvgjMCiK70HmVMs
 331yNAMJEeuy1F+kRhDNy9YO9dmgX2uGOW+w6EDRleFIL7b8TB0/4wkOdMGLZYWIKnIg
 MqToVwA4Cl6Tk2DXMTzSZO55v4TmsXrI70yzdVNlCi7QVJrQobnkHV3mc9JiwTucS4/S aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38bea3vd3u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 May 2021 15:17:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE7E510002A;
        Wed,  5 May 2021 15:17:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA7D22C4206;
        Wed,  5 May 2021 15:17:21 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 5 May 2021 15:17:21
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
Subject: [PATCH v4 0/2] i2c: stm32f7: add SMBus-Alert support
Date:   Wed, 5 May 2021 15:14:37 +0200
Message-ID: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-05_07:2021-05-05,2021-05-05 signatures=0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This serie adds support for SMBus Alert on the STM32F7.
A new binding smbus-alert is added in order to differenciate
with the existing smbus binding.

SMBus-Alert is an optional SMBus feature and SMBA alert control
and status logic must be enabled along with SMBALERT# pin
configured via pinctrl in the device tree. This is the
rational for adding "smbus-alert" property.

---
v4:
add a new generic smbus-alert property instead of st,smbus-alert
update driver to use smbus-alert instead of st,smbus-alert

v3:
use lore.kernel.org links instead of marc.info

v2:
When SMBUS alert isn't available on the board (SMBA unused), this
logic musn't be enabled. Enabling it unconditionally wrongly lead to get
SMBA interrupts.
So, add "st,smbus-alert" dedicated binding to have a smbus alert with a
consistent pin configuration in DT.

Alain Volmat (2):
  i2c: add binding to mark a bus as supporting SMBus-Alert
  i2c: stm32f7: add SMBus-Alert support

 Documentation/devicetree/bindings/i2c/i2c.txt |  7 ++-
 drivers/i2c/busses/i2c-stm32f7.c              | 73 +++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 2 deletions(-)

-- 
2.7.4

