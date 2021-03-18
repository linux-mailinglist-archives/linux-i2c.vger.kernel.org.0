Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C2C340719
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 14:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhCRNpf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 09:45:35 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:18850 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230511AbhCRNpP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Mar 2021 09:45:15 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12IDg0xD011735;
        Thu, 18 Mar 2021 14:45:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=1cBACOkWwFgVHLV1t08H9i06ryZ+4fiD69xR3S9lcVw=;
 b=JchpHIeunO2KnBLqZHVTgCdLTG8myMSefqgkx+8OqFwdD8bTdBV07oHWUyzqr1S6RarE
 QiYIEgNeGjFRh6EVc09gZQ2HSjTJYCnQktPLssEoKXSpWEZkKP4Nr/iY/bBlqpV/SgOf
 /niu8H2IFaCH/ERHXbdMx3EzkubMXslJvJXVA4xhcWLIgRCHTj/kCJeTM0Glq8nUc+Xq
 Uo1YDAJPNC+UfoLcvsO6vTJjvB3w1h9kPdYgjxCtKyOvKE1yBUnuohpAGDAJKsdWxkjp
 MYrmWX8cjY9eDDXN8TgA6vJtIqM3I+JAomusxKmEu6cqMxCx9Dmw1xwpNWeroMzddARS Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 378pr65pu3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 18 Mar 2021 14:45:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72072100034;
        Thu, 18 Mar 2021 14:45:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56915226D15;
        Thu, 18 Mar 2021 14:45:02 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 14:45:02
 +0100
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@foss.st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@foss.st.com>,
        <alain.volmat@foss.st.com>
Subject: [PATCH v2 0/2] i2c: stm32f7: add SMBus-Alert support
Date:   Thu, 18 Mar 2021 14:44:47 +0100
Message-ID: <1616075089-28115-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-18_07:2021-03-17,2021-03-18 signatures=0
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

